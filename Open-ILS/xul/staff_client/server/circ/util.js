dump('entering circ/util.js\n');

if (typeof circ == 'undefined') var circ = {};
circ.util = {};

circ.util.EXPORT_OK	= [ 
	'offline_checkout_columns', 'offline_checkin_columns', 'offline_renew_columns', 'offline_inhouse_use_columns', 
	'columns', 'hold_columns', 'checkin_via_barcode', 'std_map_row_to_column', 'hold_capture_via_copy_barcode',
	'show_last_few_circs', 'abort_transits'
];
circ.util.EXPORT_TAGS	= { ':all' : circ.util.EXPORT_OK };

circ.util.abort_transits = function(selection_list) {
	var obj = {};
	JSAN.use('util.error'); obj.error = new util.error();
	JSAN.use('util.network'); obj.network = new util.network();
	JSAN.use('OpenILS.data'); obj.data = new OpenILS.data(); obj.data.init({'via':'stash'});
	JSAN.use('util.functional');
	var msg = 'Are you sure you would like to abort transits for copies:' + util.functional.map_list( selection_list, function(o){return o.copy_id;}).join(', ') + '?';
	var r = obj.error.yns_alert(msg,'Aborting Transits','Yes','No',null,'Check here to confirm this action');
	if (r == 0) {
		try {
			for (var i = 0; i < selection_list.length; i++) {
				var copy_id = selection_list[i].copy_id;
				var robj = obj.network.simple_request('FM_ATC_VOID',[ ses(), { 'copyid' : copy_id } ]);
				if (typeof robj.ilsevent != 'undefined') throw(robj);
			}
		} catch(E) {
			obj.error.standard_unexpected_error_alert('Transit not likely aborted.',E);
		}
	}
}

circ.util.show_last_few_circs = function(selection_list,count) {
	var obj = {};
	JSAN.use('util.error'); obj.error = new util.error();
	JSAN.use('util.network'); obj.network = new util.network();
	JSAN.use('OpenILS.data'); obj.data = new OpenILS.data(); obj.data.init({'via':'stash'});

	for (var i = 0; i < selection_list.length; i++) {
		try {
			var circs = obj.network.simple_request('FM_CIRC_RETRIEVE_VIA_COPY',
				[ ses(), selection_list[i].copy_id, count ]);
			if (circs == null || typeof circs.ilsevent != 'undefined') throw(circs);
			if (circs.length == 0) { alert('There are no circs for item with barcode ' + selection_list[i].barcode); continue; }
			netscape.security.PrivilegeManager.enablePrivilege('UniversalXPConnect UniversalBrowserWrite');
			var top_xml = '<description xmlns="http://www.mozilla.org/keymaster/gatekeeper/there.is.only.xul" flex="1" style="overflow: auto">';
			top_xml += 'These are the last ' + circs.length + ' circulations for item ';
			top_xml += selection_list[i].barcode + '</description>';

			var xml = '<vbox xmlns="http://www.mozilla.org/keymaster/gatekeeper/there.is.only.xul" flex="1" style="overflow: vertical">';
			for (var j = 0; j < circs.length; j++) {
				xml += '<iframe style="min-height: 100px" flex="1" src="' + xulG.url_prefix( urls.XUL_CIRC_BRIEF );
				xml += '?circ_id=' + circs[j].id() + '"/>';
			}
			xml += '</vbox>';
			
			var bot_xml = '<vbox xmlns="http://www.mozilla.org/keymaster/gatekeeper/there.is.only.xul" flex="1" style="overflow: auto"><hbox>';
			bot_xml += '<button id="retrieve_last" value="last" label="Retrieve Last Patron" accesskey="L" name="fancy_submit"/>';
			bot_xml += '<button id="retrieve_all" value="all" label="Retrieve All Patrons" accesskey="A" name="fancy_submit"/>';
			bot_xml += '<button label="Done" accesskey="D" name="fancy_cancel"/></hbox></vbox>';

			obj.data.temp_top = top_xml; obj.data.stash('temp_top');
			obj.data.temp_mid = xml; obj.data.stash('temp_mid');
			obj.data.temp_bot = bot_xml; obj.data.stash('temp_bot');
			window.open(
				urls.XUL_FANCY_PROMPT
				+ '?xml_in_stash=temp_mid'
				+ '&top_xml_in_stash=temp_top'
				+ '&bottom_xml_in_stash=temp_bot'
				+ '&title=' + window.escape('Brief Circulation History'),
				'fancy_prompt', 'chrome,resizable,modal,width=700,height=500'
			);
			JSAN.use('OpenILS.data');
			var data = new OpenILS.data(); data.init({'via':'stash'});
			if (data.fancy_prompt_data == '') { continue; }
			var patron_hash = {};
			for (var j = 0; j < (data.fancy_prompt_data.fancy_submit == 'all' ? circs.length : 1); j++) {
				if (typeof patron_hash[circs[j].usr()] != 'undefined') {
					continue;
				} else {
					patron_hash[circs[j].usr()] = true;
				}
				if (typeof window.xulG == 'object' && typeof window.xulG.new_tab == 'function') {
					try {
						var url = urls.XUL_PATRON_DISPLAY 
							+ '?id=' + window.escape( circs[j].usr() );
						window.xulG.new_tab( url );
					} catch(E) {
						obj.error.standard_unexpected_error_alert('Problem retrieving patron.',E);
					}
				}

			}

		} catch(E) {
			obj.error.standard_unexpected_error_alert('Problem retrieving circulations.',E);
		}
	}
	//FM_CIRC_RETRIEVE_VIA_COPY
}

circ.util.offline_checkout_columns = function(modify,params) {
	
	var c = [
		{ 
			'id' : 'timestamp', 
			'label' : 'Timestamp', 
			'flex' : 1, 'primary' : false, 'hidden' : true, 
			'render' : 'my.timestamp' 
		},
		{ 
			'id' : 'checkout_time', 
			'label' : 'Check Out Time', 
			'flex' : 1, 'primary' : false, 'hidden' : true, 
			'render' : 'my.checkout_time' 
		},
		{ 
			'id' : 'type', 
			'label' : 'Transaction Type', 
			'flex' : 1, 'primary' : false, 'hidden' : true, 
			'render' : 'my.type' 
		},
		{
			'id' : 'noncat',
			'label' : 'Non-Cataloged?',
			'flex' : 1, 'primary' : false, 'hidden' : true, 
			'render' : 'my.noncat'
		},
		{
			'id' : 'noncat_type',
			'label' : 'Non-Cat Type ID',
			'flex' : 1, 'primary' : false, 'hidden' : true,
			'render' : 'my.noncat_type'
		},
		{
			'id' : 'noncat_count',
			'label' : 'Count',
			'flex' : 1, 'primary' : false, 'hidden' : false,
			'render' : 'my.noncat_count'
		},
		{ 
			'id' : 'patron_barcode', 
			'label' : 'Patron Barcode', 
			'flex' : 1, 'primary' : false, 'hidden' : true, 
			'render' : 'my.patron_barcode' 
		},
		{ 
			'id' : 'barcode', 
			'label' : 'Item Barcode', 
			'flex' : 2, 'primary' : true, 'hidden' : false, 
			'render' : 'my.barcode' 
		},
		{ 
			'id' : 'due_date', 
			'label' : 'Due Date', 
			'flex' : 1, 'primary' : false, 'hidden' : false, 
			'render' : 'my.due_date' 
		},
	];
	if (modify) for (var i = 0; i < c.length; i++) {
		if (modify[ c[i].id ]) {
			for (var j in modify[ c[i].id ]) {
				c[i][j] = modify[ c[i].id ][j];
			}
		}
	}
	if (params) {
		if (params.just_these) {
			JSAN.use('util.functional');
			var new_c = [];
			for (var i = 0; i < params.just_these.length; i++) {
				var x = util.functional.find_list(c,function(d){return(d.id==params.just_these[i]);});
				new_c.push( function(y){ return y; }( x ) );
			}
			return new_c;
		}
	}
	return c;
}

circ.util.offline_checkin_columns = function(modify,params) {
	
	var c = [
		{ 
			'id' : 'timestamp', 
			'label' : 'Timestamp', 
			'flex' : 1, 'primary' : false, 'hidden' : true, 
			'render' : 'my.timestamp' 
		},
		{ 
			'id' : 'backdate', 
			'label' : 'Back Date', 
			'flex' : 1, 'primary' : false, 'hidden' : true, 
			'render' : 'my.backdate' 
		},
		{ 
			'id' : 'type', 
			'label' : 'Transaction Type', 
			'flex' : 1, 'primary' : false, 'hidden' : true, 
			'render' : 'my.type' 
		},
		{ 
			'id' : 'barcode', 
			'label' : 'Item Barcode', 
			'flex' : 2, 'primary' : true, 'hidden' : false, 
			'render' : 'my.barcode' 
		},
	];
	if (modify) for (var i = 0; i < c.length; i++) {
		if (modify[ c[i].id ]) {
			for (var j in modify[ c[i].id ]) {
				c[i][j] = modify[ c[i].id ][j];
			}
		}
	}
	if (params) {
		if (params.just_these) {
			JSAN.use('util.functional');
			var new_c = [];
			for (var i = 0; i < params.just_these.length; i++) {
				var x = util.functional.find_list(c,function(d){return(d.id==params.just_these[i]);});
				new_c.push( function(y){ return y; }( x ) );
			}
			return new_c;
		}
	}
	return c;
}

circ.util.offline_renew_columns = function(modify,params) {
	
	var c = [
		{ 
			'id' : 'timestamp', 
			'label' : 'Timestamp', 
			'flex' : 1, 'primary' : false, 'hidden' : true, 
			'render' : 'my.timestamp' 
		},
		{ 
			'id' : 'checkout_time', 
			'label' : 'Check Out Time', 
			'flex' : 1, 'primary' : false, 'hidden' : true, 
			'render' : 'my.checkout_time' 
		},
		{ 
			'id' : 'type', 
			'label' : 'Transaction Type', 
			'flex' : 1, 'primary' : false, 'hidden' : true, 
			'render' : 'my.type' 
		},
		{ 
			'id' : 'patron_barcode', 
			'label' : 'Patron Barcode', 
			'flex' : 1, 'primary' : false, 'hidden' : true, 
			'render' : 'my.patron_barcode' 
		},
		{ 
			'id' : 'barcode', 
			'label' : 'Item Barcode', 
			'flex' : 2, 'primary' : true, 'hidden' : false, 
			'render' : 'my.barcode' 
		},
		{ 
			'id' : 'due_date', 
			'label' : 'Due Date', 
			'flex' : 1, 'primary' : false, 'hidden' : false, 
			'render' : 'my.due_date' 
		},
	];
	if (modify) for (var i = 0; i < c.length; i++) {
		if (modify[ c[i].id ]) {
			for (var j in modify[ c[i].id ]) {
				c[i][j] = modify[ c[i].id ][j];
			}
		}
	}
	if (params) {
		if (params.just_these) {
			JSAN.use('util.functional');
			var new_c = [];
			for (var i = 0; i < params.just_these.length; i++) {
				var x = util.functional.find_list(c,function(d){return(d.id==params.just_these[i]);});
				new_c.push( function(y){ return y; }( x ) );
			}
			return new_c;
		}
	}
	return c;
}

circ.util.offline_inhouse_use_columns = function(modify,params) {
	
	var c = [
		{ 
			'id' : 'timestamp', 
			'label' : 'Timestamp', 
			'flex' : 1, 'primary' : false, 'hidden' : true, 
			'render' : 'my.timestamp' 
		},
		{ 
			'id' : 'use_time', 
			'label' : 'Use Time', 
			'flex' : 1, 'primary' : false, 'hidden' : true, 
			'render' : 'my.use_time' 
		},
		{ 
			'id' : 'type', 
			'label' : 'Transaction Type', 
			'flex' : 1, 'primary' : false, 'hidden' : true, 
			'render' : 'my.type' 
		},
		{
			'id' : 'count',
			'label' : 'Count',
			'flex' : 1, 'primary' : false, 'hidden' : false,
			'render' : 'my.count'
		},
		{ 
			'id' : 'barcode', 
			'label' : 'Item Barcode', 
			'flex' : 2, 'primary' : true, 'hidden' : false, 
			'render' : 'my.barcode' 
		},
	];
	if (modify) for (var i = 0; i < c.length; i++) {
		if (modify[ c[i].id ]) {
			for (var j in modify[ c[i].id ]) {
				c[i][j] = modify[ c[i].id ][j];
			}
		}
	}
	if (params) {
		if (params.just_these) {
			JSAN.use('util.functional');
			var new_c = [];
			for (var i = 0; i < params.just_these.length; i++) {
				var x = util.functional.find_list(c,function(d){return(d.id==params.just_these[i]);});
				new_c.push( function(y){ return y; }( x ) );
			}
			return new_c;
		}
	}
	return c;
}



circ.util.columns = function(modify,params) {
	
	JSAN.use('OpenILS.data'); var data = new OpenILS.data(); data.init({'via':'stash'});

	function getString(s) { return data.entities[s]; }

	var c = [
		{
			'id' : 'acp_id', 'label' : getString('staff.acp_label_id'), 'flex' : 1,
			'primary' : false, 'hidden' : true, 'render' : 'my.acp.id()', 'persist' : 'hidden width',
		},
		{
			'id' : 'circ_id', 'label' : getString('staff.circ_label_id'), 'flex' : 1,
			'primary' : false, 'hidden' : true, 'render' : 'my.circ.id()', 'persist' : 'hidden width',
		},
		{
			'id' : 'mvr_doc_id', 'label' : getString('staff.mvr_label_doc_id'), 'flex' : 1,
			'primary' : false, 'hidden' : true, 'render' : 'my.mvr.doc_id()', 'persist' : 'hidden width',
		},
		{
			'id' : 'barcode', 'label' : getString('staff.acp_label_barcode'), 'flex' : 1,
			'primary' : false, 'hidden' : true, 'render' : 'my.acp.barcode()', 'persist' : 'hidden width',
		},
		{
			'id' : 'call_number', 'label' : getString('staff.acp_label_call_number'), 'flex' : 1,
			'primary' : false, 'hidden' : true, 'render' : ' if (my.acp && my.acp.call_number() == -1) { "Not Cataloged"; } else { if (!my.acn) { var x = obj.network.simple_request("FM_ACN_RETRIEVE",[ my.acp.call_number() ]); if (x.ilsevent) { "Not Cataloged"; } else { my.acn = x; x.label(); } } else { my.acn.label(); } } ' , 'persist' : 'hidden width',
		},
		{
			'id' : 'owning_lib', 'label' : 'Owning Lib', 'flex' : 1,
			'primary' : false, 'hidden' : true,
			'render' : 'if (Number(my.acn.owning_lib())>=0) obj.data.hash.aou[ my.acn.owning_lib() ].shortname(); else my.acn.owning_lib().shortname();', 'persist' : 'hidden width',
		},
		{
			'id' : 'copy_number', 'label' : getString('staff.acp_label_copy_number'), 'flex' : 1,
			'primary' : false, 'hidden' : true, 'render' : 'my.acp.copy_number()', 'persist' : 'hidden width',
		},
		{
			'id' : 'location', 'label' : getString('staff.acp_label_location'), 'flex' : 1,
			'primary' : false, 'hidden' : true, 'render' : 'if (Number(my.acp.location())>=0) obj.data.hash.acpl[ my.acp.location() ].name(); else my.acp.location().name();', 'persist' : 'hidden width',
		},
		{
			'id' : 'loan_duration', 'label' : getString('staff.acp_label_loan_duration'), 'flex' : 1,
			'primary' : false, 'hidden' : true, 
			'render' : 'switch(my.acp.loan_duration()){ case 1: "Short"; break; case 2: "Normal"; break; case 3: "Long"; break; }', 'persist' : 'hidden width',
		},
		{
			'id' : 'circ_lib', 'label' : getString('staff.acp_label_circ_lib'), 'flex' : 1,
			'primary' : false, 'hidden' : true, 'render' : 'if (Number(my.acp.circ_lib())>=0) obj.data.hash.aou[ my.acp.circ_lib() ].shortname(); else my.acp.circ_lib().shortname();', 'persist' : 'hidden width',
		},
		{
			'id' : 'fine_level', 'label' : getString('staff.acp_label_fine_level'), 'flex' : 1,
			'primary' : false, 'hidden' : true,
			'render' : 'switch(my.acp.fine_level()){ case 1: "Low"; break; case 2: "Normal"; break; case 3: "High"; break; }', 'persist' : 'hidden width',
		},
		{
			'id' : 'circulate', 'label' : 'Circulate?', 'flex' : 1,
			'primary' : false, 'hidden' : true, 'render' : 'my.acp.circulate() == 1 ? "Yes" : "No"', 'persist' : 'hidden width',
		},
		{
			'id' : 'holdable', 'label' : 'Holdable?', 'flex' : 1,
			'primary' : false, 'hidden' : true, 'render' : 'my.acp.holdable() == 1 ? "Yes" : "No"', 'persist' : 'hidden width',
		},
		{
			'id' : 'opac_visible', 'label' : 'OPAC Visible?', 'flex' : 1,
			'primary' : false, 'hidden' : true, 'render' : 'my.acp.opac_visible() == 1 ? "Yes" : "No"', 'persist' : 'hidden width',
		},
		{
			'persist' : 'hidden width', 'id' : 'ref', 'label' : 'Reference?', 'flex' : 1,
			'primary' : false, 'hidden' : true, 'render' : 'my.acp.ref() == 1 ? "Yes" : "No"'
		},
		{
			'persist' : 'hidden width', 'id' : 'deposit', 'label' : 'Deposit?', 'flex' : 1,
			'primary' : false, 'hidden' : true, 'render' : 'my.acp.deposit() == 1 ? "Yes" : "No"'
		},
		{
			'persist' : 'hidden width', 'id' : 'deposit_amount', 'label' : getString('staff.acp_label_deposit_amount'), 'flex' : 1,
			'primary' : false, 'hidden' : true, 'render' : 'my.acp.deposit_amount()'
		},
		{
			'persist' : 'hidden width', 'id' : 'price', 'label' : getString('staff.acp_label_price'), 'flex' : 1,
			'primary' : false, 'hidden' : true, 'render' : 'my.acp.price()'
		},
		{
			'persist' : 'hidden width', 'id' : 'circ_as_type', 'label' : getString('staff.acp_label_circ_as_type'), 'flex' : 1,
			'primary' : false, 'hidden' : true, 'render' : 'my.acp.circ_as_type()'
		},
		{
			'persist' : 'hidden width', 'id' : 'circ_modifier', 'label' : getString('staff.acp_label_circ_modifier'), 'flex' : 1,
			'primary' : false, 'hidden' : true, 'render' : 'my.acp.circ_modifier()'
		},
		{
			'persist' : 'hidden width', 'id' : 'xact_start', 'label' : getString('staff.circ_label_xact_start'), 'flex' : 1,
			'primary' : false, 'hidden' : true, 'render' : 'my.circ.xact_start()'
		},
		{
			'persist' : 'hidden width', 'id' : 'xact_finish', 'label' : getString('staff.circ_label_xact_finish'), 'flex' : 1,
			'primary' : false, 'hidden' : true, 'render' : 'my.circ.xact_finish()'
		},
		{
			'persist' : 'hidden width', 'id' : 'due_date', 'label' : getString('staff.circ_label_due_date'), 'flex' : 1,
			'primary' : false, 'hidden' : true, 'render' : 'my.circ.due_date().substr(0,10)'
		},
		{
			'persist' : 'hidden width', 'id' : 'title', 'label' : getString('staff.mvr_label_title'), 'flex' : 2,
			'primary' : false, 'hidden' : true, 'render' : 'try { my.mvr.title(); } catch(E) { my.acp.dummy_title(); }'
		},
		{
			'persist' : 'hidden width', 'id' : 'author', 'label' : getString('staff.mvr_label_author'), 'flex' : 1,
			'primary' : false, 'hidden' : true, 'render' : 'try { my.mvr.author(); } catch(E) { my.acp.dummy_author(); }'
		},
		{
			'persist' : 'hidden width', 'id' : 'edition', 'label' : 'Edition', 'flex' : 1,
			'primary' : false, 'hidden' : true, 'render' : 'my.mvr.edition();'
		},
		{
			'persist' : 'hidden width', 'id' : 'isbn', 'label' : 'ISBN', 'flex' : 1,
			'primary' : false, 'hidden' : true, 'render' : 'my.mvr.isbn();'
		},
		{
			'persist' : 'hidden width', 'id' : 'pubdate', 'label' : 'PubDate', 'flex' : 1,
			'primary' : false, 'hidden' : true, 'render' : 'my.mvr.pubdate();'
		},
		{
			'persist' : 'hidden width', 'id' : 'publisher', 'label' : 'Publisher', 'flex' : 1,
			'primary' : false, 'hidden' : true, 'render' : 'my.mvr.publisher();'
		},
		{
			'persist' : 'hidden width', 'id' : 'tcn', 'label' : 'TCN', 'flex' : 1,
			'primary' : false, 'hidden' : true, 'render' : 'my.mvr.tcn();'
		},
		{
			'persist' : 'hidden width', 'id' : 'renewal_remaining', 'label' : getString('staff.circ_label_renewal_remaining'), 'flex' : 0,
			'primary' : false, 'hidden' : true, 'render' : 'my.circ.renewal_remaining()'
		},
		{
			'persist' : 'hidden width', 'id' : 'stop_fines', 'label' : 'Fines Stopped', 'flex' : 0,
			'primary' : false, 'hidden' : true, 'render' : 'my.circ.stop_fines()'
		},
		{
			'persist' : 'hidden width', 'id' : 'status', 'label' : getString('staff.acp_label_status'), 'flex' : 1,
			'primary' : false, 'hidden' : true, 'render' : 'if (Number(my.acp.status())>=0) obj.data.hash.ccs[ my.acp.status() ].name(); else my.acp.status().name();'
		},
		{
			'persist' : 'hidden width', 'id' : 'route_to', 'label' : 'Route To', 'flex' : 1,
			'primary' : false, 'hidden' : true, 'render' : 'my.route_to.toString()'
		},
		{
			'persist' : 'hidden width', 'id' : 'message', 'label' : 'Message', 'flex' : 1,
			'primary' : false, 'hidden' : true, 'render' : 'my.message.toString()'
		},
		{
			'persist' : 'hidden width', 'id' : 'uses', 'label' : '# of Uses', 'flex' : 1,
			'primary' : false, 'hidden' : true, 'render' : 'my.uses'
		},
		{
			'persist' : 'hidden width', 'id' : 'alert_message', 'label' : 'Alert Message', 'flex' : 1,
			'primary' : false, 'hidden' : true, 'render' : 'my.acp.alert_message()'
		},
	];
	for (var i = 0; i < c.length; i++) {
		if (modify[ c[i].id ]) {
			for (var j in modify[ c[i].id ]) {
				c[i][j] = modify[ c[i].id ][j];
			}
		}
	}
	if (params) {
		if (params.just_these) {
			JSAN.use('util.functional');
			var new_c = [];
			for (var i = 0; i < params.just_these.length; i++) {
				var x = util.functional.find_list(c,function(d){return(d.id==params.just_these[i]);});
				new_c.push( function(y){ return y; }( x ) );
			}
			return new_c;
		}
	}
	return c;
}

circ.util.hold_columns = function(modify,params) {
	
	JSAN.use('OpenILS.data'); var data = new OpenILS.data(); data.init({'via':'stash'});

	function getString(s) { return data.entities[s]; }

	var c = [
		{
			'persist' : 'hidden width', 'id' : 'request_time', 'label' : getString('staff.ahr_request_time_label'), 'flex' : 0,
			'primary' : false, 'hidden' : true,  
			'render' : 'my.ahr.request_time().toString().substr(0,10)'
		},
		{
			'persist' : 'hidden width', 'id' : 'capture_time', 'label' : getString('staff.ahr_capture_time_label'), 'flex' : 1,
			'primary' : false, 'hidden' : true,  'render' : 'my.ahr.capture_time()'
		},
		{
			'persist' : 'hidden width', 'id' : 'status', 'label' : getString('staff.ahr_status_label'), 'flex' : 1,
			'primary' : false, 'hidden' : true,  'render' : 'my.ahr.status()'
		},
		{
			'persist' : 'hidden width', 'id' : 'hold_type', 'label' : getString('staff.ahr_hold_type_label'), 'flex' : 0,
			'primary' : false, 'hidden' : true,  'render' : 'my.ahr.hold_type()'
		},
		{
			'persist' : 'hidden width', 'id' : 'pickup_lib', 'label' : getString('staff.ahr_pickup_lib_label'), 'flex' : 1,
			'primary' : false, 'hidden' : true,  
			'render' : 'if (Number(my.ahr.pickup_lib())>=0) obj.data.hash.aou[ my.ahr.pickup_lib() ].name(); else my.ahr.pickup_lib().name();'
		},
		{
			'persist' : 'hidden width', 'id' : 'pickup_lib_shortname', 'label' : getString('staff.ahr_pickup_lib_label'), 'flex' : 0,
			'primary' : false, 'hidden' : true,  
			'render' : 'if (Number(my.ahr.pickup_lib())>=0) obj.data.hash.aou[ my.ahr.pickup_lib() ].shortname(); else my.ahr.pickup_lib().shortname();'
		},
		{
			'persist' : 'hidden width', 'id' : 'current_copy', 'label' : getString('staff.ahr_current_copy_label'), 'flex' : 1,
			'primary' : false, 'hidden' : true,  'render' : 'my.acp ? my.acp.barcode() : "No Copy"'
		},
		{
			'persist' : 'hidden width', 'id' : 'email_notify', 'label' : getString('staff.ahr_email_notify_label'), 'flex' : 1,
			'primary' : false, 'hidden' : true,  'render' : 'my.ahr.email_notify() == 1 ? "Yes" : "No"'
		},
		{
			'persist' : 'hidden width', 'id' : 'expire_time', 'label' : getString('staff.ahr_expire_time_label'), 'flex' : 1,
			'primary' : false, 'hidden' : true,  'render' : 'my.ahr.expire_time()'
		},
		{
			'persist' : 'hidden width', 'id' : 'fulfillment_time', 'label' : getString('staff.ahr_fulfillment_time_label'), 'flex' : 1,
			'primary' : false, 'hidden' : true,  'render' : 'my.ahr.fulfillment_time()'
		},
		{
			'persist' : 'hidden width', 'id' : 'holdable_formats', 'label' : getString('staff.ahr_holdable_formats_label'), 'flex' : 1,
			'primary' : false, 'hidden' : true,  'render' : 'my.ahr.holdable_formats()'
		},
		{
			'persist' : 'hidden width', 'id' : 'id', 'label' : getString('staff.ahr_id_label'), 'flex' : 1,
			'primary' : false, 'hidden' : true,  'render' : 'my.ahr.id()'
		},
		{
			'persist' : 'hidden width', 'id' : 'phone_notify', 'label' : getString('staff.ahr_phone_notify_label'), 'flex' : 1,
			'primary' : false, 'hidden' : true,  'render' : 'my.ahr.phone_notify()'
		},
		{
			'persist' : 'hidden width', 'id' : 'prev_check_time', 'label' : getString('staff.ahr_prev_check_time_label'), 'flex' : 1,
			'primary' : false, 'hidden' : true,  'render' : 'my.ahr.prev_check_time()'
		},
		{
			'persist' : 'hidden width', 'id' : 'requestor', 'label' : getString('staff.ahr_requestor_label'), 'flex' : 1,
			'primary' : false, 'hidden' : true,  'render' : 'my.ahr.requestor()'
		},
		{
			'persist' : 'hidden width', 'id' : 'selection_depth', 'label' : getString('staff.ahr_selection_depth_label'), 'flex' : 1,
			'primary' : false, 'hidden' : true,  'render' : 'my.ahr.selection_depth()'
		},
		{
			'persist' : 'hidden width', 'id' : 'target', 'label' : getString('staff.ahr_target_label'), 'flex' : 1,
			'primary' : false, 'hidden' : true,  'render' : 'my.ahr.target()'
		},
		{
			'persist' : 'hidden width', 'id' : 'usr', 'label' : getString('staff.ahr_usr_label'), 'flex' : 1,
			'primary' : false, 'hidden' : true,  'render' : 'my.ahr.usr()'
		},
		{
			'persist' : 'hidden width', 'id' : 'title', 'label' : getString('staff.mvr_label_title'), 'flex' : 1,
			'primary' : false, 'hidden' : true, 'render' : 'my.mvr ? my.mvr.title() : "No Title?"'
		},
		{
			'persist' : 'hidden width', 'id' : 'author', 'label' : getString('staff.mvr_label_author'), 'flex' : 1,
			'primary' : false, 'hidden' : true, 'render' : 'my.mvr ? my.mvr.author() : "No Author?"'
		},
		{
			'persist' : 'hidden width', 'id' : 'edition', 'label' : 'Edition', 'flex' : 1,
			'primary' : false, 'hidden' : true, 'render' : 'my.mvr.edition();'
		},
		{
			'persist' : 'hidden width', 'id' : 'isbn', 'label' : 'ISBN', 'flex' : 1,
			'primary' : false, 'hidden' : true, 'render' : 'my.mvr.isbn();'
		},
		{
			'persist' : 'hidden width', 'id' : 'pubdate', 'label' : 'PubDate', 'flex' : 1,
			'primary' : false, 'hidden' : true, 'render' : 'my.mvr.pubdate();'
		},
		{
			'persist' : 'hidden width', 'id' : 'publisher', 'label' : 'Publisher', 'flex' : 1,
			'primary' : false, 'hidden' : true, 'render' : 'my.mvr.publisher();'
		},
		{
			'persist' : 'hidden width', 'id' : 'tcn', 'label' : 'TCN', 'flex' : 1,
			'primary' : false, 'hidden' : true, 'render' : 'my.mvr.tcn();'
		},


	];
	for (var i = 0; i < c.length; i++) {
		if (modify[ c[i].id ]) {
			for (var j in modify[ c[i].id ]) {
				c[i][j] = modify[ c[i].id ][j];
			}
		}
	}
	if (params) {
		if (params.just_these) {
			JSAN.use('util.functional');
			var new_c = [];
			for (var i = 0; i < params.just_these.length; i++) {
				var x = util.functional.find_list(c,function(d){return(d.id==params.just_these[i]);});
				new_c.push( function(y){ return y; }( x ) );
			}
			return new_c;
		}
	}
	return c;
}

circ.util.std_map_row_to_column = function(error_value) {
	return function(row,col) {
		// row contains { 'my' : { 'acp' : {}, 'circ' : {}, 'mvr' : {} } }
		// col contains one of the objects listed above in columns
		
		// mimicking some of the obj in circ.checkin and circ.checkout where map_row_to_column is usually defined
		var obj = {}; 
		JSAN.use('util.error'); obj.error = new util.error();
		JSAN.use('OpenILS.data'); obj.data = new OpenILS.data(); obj.data.init({'via':'stash'});
		JSAN.use('util.network'); obj.network = new util.network();

		var my = row.my;
		var value;
		try { 
			value = eval( col.render );
		} catch(E) {
			obj.error.sdump('D_WARN','map_row_to_column: ' + E);
			if (error_value) value = error_value; else value = '???';
		}
		return value;
	}
}

circ.util.checkin_via_barcode = function(session,barcode,backdate,auto_print) {
	try {
		JSAN.use('util.error'); var error = new util.error();
		JSAN.use('util.network'); var network = new util.network();
		JSAN.use('OpenILS.data'); var data = new OpenILS.data(); data.init({'via':'stash'});
		JSAN.use('util.date');
		if (backdate && (backdate == util.date.formatted_date(new Date(),'%Y-%m-%d')) ) backdate = null;

		var params = { 'barcode' : barcode };
		if (backdate) params.backdate = backdate;

		var check = network.request(
			api.CHECKIN_VIA_BARCODE.app,
			api.CHECKIN_VIA_BARCODE.method,
			[ session, params ],
			null,
			{
				'title' : 'Override Checkin Failure?',
				'overridable_events' : [ 
					1203 /* COPY_BAD_STATUS */, 
					7009 /* CIRC_CLAIMS_RETURNED */,
					7010 /* COPY_ALERT_MESSAGE */, 
					7011 /* COPY_STATUS_LOST */, 
					7012 /* COPY_STATUS_MISSING */, 
				],
				'text' : {
					'1203' : function(r) {
						return data.hash.ccs[ r.payload.status() ].name();
					},
					'7010' : function(r) {
						return r.payload;
					},
				}
			}
		);

		check.message = check.textcode;

		if (check.payload && check.payload.copy) check.copy = check.payload.copy;
		if (check.payload && check.payload.record) check.record = check.payload.record;
		if (check.payload && check.payload.circ) check.circ = check.payload.circ;

		if (!check.route_to) check.route_to = '???';

		/* SUCCESS  /  NO_CHANGE  /  ITEM_NOT_CATALOGED */
		if (check.ilsevent == 0 || check.ilsevent == 3 || check.ilsevent == 1202) {
			check.route_to = data.hash.acpl[ check.copy.location() ].name();
			var msg = '';
			if (check.ilsevent == 3) msg = 'This item is already checked in.\n';
			if (check.ilsevent == 1202 && check.copy.status() != 11) {
				msg = 'FIXME -- ITEM_NOT_CATALOGED event but copy status is '
					+ data.hash.ccs[ check.copy.status() ].name() + '\n';
			}
			switch(check.copy.status()) {
				case 0: /* AVAILABLE */
				case 7: /* RESHELVING */
					if (msg) msg += 'This item needs to be routed to ' + check.route_to + '.';
				break;
				case 8: /* ON HOLDS SHELF */
					check.route_to = 'HOLDS SHELF';
					if (check.payload.hold) {
						if (check.payload.hold.pickup_lib() != data.list.au[0].ws_ou()) {
							msg += 'FIXME:  We should have received a ROUTE_ITEM\n';
						} else {
							msg += 'This item needs to be routed to ' + check.route_to + '.\n';
						}
					} else { 
						msg += 'FIXME: status of Holds Shelf, but no hold in payload';
					}
					if (check.payload.hold) {
						JSAN.use('patron.util');
						msg += '\nBarcode: ' + check.payload.copy.barcode() + '\n';
						msg += 'Title: ' + (check.payload.record ? check.payload.record.title() : check.payload.copy.dummy_title() ) + '\n';
						var au_obj = patron.util.retrieve_fleshed_au_via_id( session, check.payload.hold.usr() );
						msg += '\nHold for patron ' + au_obj.family_name() + ', ' + au_obj.first_given_name() + '\n';
						msg += 'Barcode: ' + au_obj.card().barcode() + '\n';
						if (check.payload.hold.phone_notify()) msg += 'Notify by phone: ' + check.payload.hold.phone_notify() + '\n';
						if (check.payload.hold.email_notify()) msg += 'Notify by email: ' + au_obj.email() + '\n';
					}
					var rv = 0;
					if (!auto_print) rv = error.yns_alert(
						msg,
						'Hold Slip',
						"Print",
						"Don't Print",
						null,
						"Check here to confirm this message"
					);
					if (rv == 0) {
						try {
							JSAN.use('util.print'); var print = new util.print();
							print.simple( msg, { 'no_prompt' : true, 'content_type' : 'text/plain' } );
						} catch(E) {
							dump('FIXME: ' + E + '\n');
							alert('FIXME: ' + E + '\n');
						}
					}
					msg = '';
				break;
				case 6: /* IN TRANSIT */
					check.route_to = 'TRANSIT SHELF??';
					msg += ("FIXME -- I didn't think we could get here.\n");
				break;
				case 11: /* CATALOGING */
					check.route_to = 'CATALOGING';
					msg += 'This item needs to be routed to ' + check.route_to + '.';
				break;
				default:
					msg += ('FIXME -- this case "' + data.hash.ccs[check.copy.status()].name() + '" is unhandled.\n');
					msg += 'This item needs to be routed to ' + check.route_to + '.';
				break;
			}
			if (msg) error.yns_alert(msg,'Alert',null,'OK',null,"Check here to confirm this message");
		}

		/* ROUTE_ITEM */
		if (check.ilsevent == 7000) {
			var lib = data.hash.aou[ check.org ];
			check.route_to = lib.shortname();
			var msg = 'This item is in transit to ' + check.route_to + '.\n';
			msg += '\n' + lib.name() + '\n';
			try {
				if (lib.holds_address() ) {
					var a = network.simple_request('FM_AOA_RETRIEVE',[ lib.holds_address() ]);
					if (typeof a.ilsevent != 'undefined') throw(a);
					if (a.street1()) msg += a.street1() + '\n';
					if (a.street2()) msg += a.street2() + '\n';
					msg += (a.city() ? a.city() + ', ' : '') + (a.state() ? a.state() + ' ' : '') + (a.post_code() ? a.post_code() : '') + '\n';
				} else {
					msg += "We do not have a holds address for this library.\n";
				}
			} catch(E) {
				msg += 'Unable to retrieve mailing address.\n';
				error.standard_unexpected_error_alert('Unable to retrieve mailing address.',E);
			}
			msg += '\nBarcode: ' + check.payload.copy.barcode() + '\n';
			msg += 'Title: ' + (check.payload.record ? check.payload.record.title() : check.payload.copy.dummy_title() ) + '\n';
			msg += 'Author: ' + (check.payload.record ? check.payload.record.author() :check.payload.copy.dummy_author()  ) + '\n';
			if (check.payload.hold) {
				JSAN.use('patron.util');
				var au_obj = patron.util.retrieve_fleshed_au_via_id( session, check.payload.hold.usr() );
				msg += '\nHold for patron ' + au_obj.family_name() + ', ' + au_obj.first_given_name() + '\n';
				msg += 'Barcode: ' + au_obj.card().barcode() + '\n';
				if (check.payload.hold.phone_notify()) msg += 'Notify by phone: ' + check.payload.hold.phone_notify() + '\n';
				if (check.payload.hold.email_notify()) msg += 'Notify by email: ' + au_obj.email() + '\n';
			}
			var rv = 0;
			if (!auto_print) rv = error.yns_alert(
				msg,
				'Transit Slip',
				"Print",
				"Don't Print",
				null,
				"Check here to confirm this message"
			);
			if (rv == 0) {
				try {
					JSAN.use('util.print'); var print = new util.print();
					print.simple( msg, { 'no_prompt' : true, 'content_type' : 'text/plain' } );
				} catch(E) {
					dump('FIXME: ' + E + '\n');
					alert('FIXME: ' + E + '\n');
				}
			}
		}

		/* ASSET_COPY_NOT_FOUND */
		if (check.ilsevent == 1502) {
			check.route_to = 'CATALOGING';
			error.yns_alert(
				'The barcode was either mis-scanned or the item needs to be cataloged.',
				'Alert',
				null,
				'OK',
				null,
				"Check here to confirm this message"
			);
		}

		/* NETWORK TIMEOUT */
		if (check.ilsevent == -1) {
			error.standard_network_error_alert('Check In Failed.  If you wish to use the offline interface, in the top menubar select Circulation -> Offline Interface');
		}

//				case '2': case 2: /* LOST??? */
//					JSAN.use('patron.util');
//					var au_obj = patron.util.retrieve_au_via_id( session, check.circ.usr() );
//					var msg = check.text + '\r\n' + 'Barcode: ' + barcode + '  Title: ' + 
//							check.record.title() + '  Author: ' + check.record.author() + '\r\n' +
//							'Patron: ' + au_obj.card().barcode() + ' ' + au_obj.family_name() + ', ' +
//							au_obj.first_given_name();
//					var pcheck = error.yns_alert(
//						msg,
//						'Lost Item',
//						'Edit Copy & Patron',
//						"Just Continue",
//						null,
//						"Check here to confirm this message"
//					); 
//					if (pcheck == 0) {
//						//FIXME//Re-implement
//						/*
//						var w = mw.spawn_main();
//						setTimeout(
//							function() {
//								mw.spawn_patron_display(w.document,'new_tab','main_tabbox',{'patron':au_obj});
//								mw.spawn_batch_copy_editor(w.document,'new_tab','main_tabbox',
//									{'copy_ids':[ check.copy.id() ]});
//							}, 0
//						);
//						*/
//					}
//				break;
		return check;
	} catch(E) {
		JSAN.use('util.error'); var error = new util.error();
		error.standard_unexpected_error_alert('Check In Failed (in circ.util.checkin): ',E);
		return null;
	}
}

circ.util.hold_capture_via_copy_barcode = function ( session, barcode, retrieve_flag ) {
	try {
		JSAN.use('util.network'); var network = new util.network();
		JSAN.use('OpenILS.data'); var data = new OpenILS.data(); data.init({'via':'stash'});
		var params = { barcode: barcode }
		if (retrieve_flag) { params.flesh_record = retrieve_flag; params.flesh_copy = retrieve_flag; }
		var robj = network.request(
			api.CAPTURE_COPY_FOR_HOLD_VIA_BARCODE.app,
			api.CAPTURE_COPY_FOR_HOLD_VIA_BARCODE.method,
			[ session, params ]
		);
		var check = robj.payload;
		if (!check) {
			check = {};
			check.status = robj.ilsevent;
			check.copy = new acp(); check.copy.barcode( barcode );
		}
		check.text = robj.textcode;
		check.route_to = robj.route_to;
		//check.text = 'Captured for Hold';
		if (parseInt(check.route_to)) check.route_to = data.hash.aou[ check.route_to ].shortname();
		return check;
	} catch(E) {
		JSAN.use('util.error'); var error = new util.error();
		error.standard_unexpected_error_alert('Hold Capture Failed',E);
		return null;
	}
}


dump('exiting circ/util.js\n');
