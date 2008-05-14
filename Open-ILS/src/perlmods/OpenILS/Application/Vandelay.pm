package OpenILS::Application::Vandelay;
use OpenILS::Application;
use base qw/OpenILS::Application/;

use Unicode::Normalize;
use OpenSRF::EX qw/:try/;

use OpenSRF::AppSession;
use OpenSRF::Utils::SettingsClient;
use OpenSRF::Utils::Cache;

use OpenILS::Utils::Fieldmapper;
use OpenILS::Utils::CStoreEditor qw/:funcs/;

use MARC::Batch;
use MARC::Record;
use MARC::File::XML;

use OpenILS::Utils::Fieldmapper;

use Time::HiRes qw(time);

use OpenSRF::Utils::Logger qw/:level/;
my $log = 'OpenSRF::Utils::Logger';

sub initialize {}
sub child_init {}

sub entityize {
	my $self = shift;
	my $stuff = shift;
	my $form = shift;

	if ($form eq 'D') {
		$stuff = NFD($stuff);
	} else {
		$stuff = NFC($stuff);
	}

	$stuff =~ s/([\x{0080}-\x{fffd}])/sprintf('&#x%X;',ord($1))/sgoe;
	return $stuff;
}

# --------------------------------------------------------------------------------
# Biblio ingest

sub create_bib_queue {
	my $self = shift;
	my $client = shift;
	my $auth = shift;
	my $name = shift;
	my $owner = shift;
	my $type = shift;
	my $purpose = shift;

	my $e = new_editor(authtoken => $auth, xact => 1);

	return $e->die_event unless $e->checkauth;
	return $e->die_event unless $e->allowed('CREATE_BIB_IMPORT_QUEUE', $owner);

	my $queue = new Fieldmapper::vandelay::bib_queue();
	$queue->name( $name );
	$queue->owner( $owner );
	$queue->queue_type( $type ) if ($type);
	$queue->queue_purpose( $purpose ) if ($purpose);

	my $new_id = $e->create_vandelay_bib_queue( $queue );
	$e->die_event unless ($new_id);
	$e->commit;

	$queue->id($new_id);
	return $queue;
}
__PACKAGE__->register_method(  
	api_name	=> "open-ils.vandelay.bib_queue.create",
	method		=> "create_bib_queue",
	api_level	=> 1,
	argc		=> 3,
);                      


sub create_auth_queue {
	my $self = shift;
	my $client = shift;
	my $auth = shift;
	my $name = shift;
	my $owner = shift;
	my $type = shift;
	my $purpose = shift;

	my $e = new_editor(authtoken => $auth, xact => 1);

	return $e->die_event unless $e->checkauth;
	return $e->die_event unless $e->allowed('CREATE_AUTHORITY_IMPORT_QUEUE', $owner);

	my $queue = new Fieldmapper::vandelay::authority_queue();
	$queue->name( $name );
	$queue->owner( $owner );
	$queue->queue_type( $type ) if ($type);
	$queue->queue_purpose( $purpose ) if ($purpose);

	my $new_id = $e->create_vandelay_authority_queue( $queue );
	$e->die_event unless ($new_id);
	$e->commit;

	$queue->id($new_id);
	return $queue;
}
__PACKAGE__->register_method(  
	api_name	=> "open-ils.vandelay.authority_queue.create",
	method		=> "create_auth_queue",
	api_level	=> 1,
	argc		=> 3,
);                      

sub add_record_to_bib_queue {
	my $self = shift;
	my $client = shift;
	my $auth = shift;
	my $queue = shift;
	my $marc = shift;

	my $e = new_editor(authtoken => $auth, xact => 1);

	$queue = $e->retrieve_vandelay_bib_queue($queue);

	return $e->die_event unless $e->checkauth;
	return $e->die_event unless
		($e->allowed('CREATE_BIB_IMPORT_QUEUE', undef, $queue) ||
		 $e->allowed('CREATE_BIB_IMPORT_QUEUE', $queue->owner));

	my $new_id = _add_auth_rec($e, $marc, $queue->id);

	$e->die_event unless ($new_id);
	$e->commit;

	$rec->id($new_id);
	return $rec;
}
__PACKAGE__->register_method(  
	api_name	=> "open-ils.vandelay.queued_bib_record.create",
	method		=> "add_record_to_bib_queue",
	api_level	=> 1,
	argc		=> 3,
);                      

sub _add_bib_rec {
	my $e = shift;
	my $marc = shift;
	my $queue = shift;

	my $rec = new Fieldmapper::vandelay::queued_bib_record();
	$rec->marc( $marc );
	$rec->queue( $queue );

	return $e->create_vandelay_queued_bib_record( $rec );
}

sub add_record_to_authority_queue {
	my $self = shift;
	my $client = shift;
	my $auth = shift;
	my $queue = shift;
	my $marc = shift;

	my $e = new_editor(authtoken => $auth, xact => 1);

	$queue = $e->retrieve_vandelay_authority_queue($queue);

	return $e->die_event unless $e->checkauth;
	return $e->die_event unless
		($e->allowed('CREATE_AUTHORITY_IMPORT_QUEUE', undef, $queue) ||
		 $e->allowed('CREATE_AUTHORITY_IMPORT_QUEUE', $queue->owner));

	my $new_id = _add_auth_rec($e, $marc, $queue->id);

	$e->die_event unless ($new_id);
	$e->commit;

	$rec->id($new_id);
	return $rec;
}
__PACKAGE__->register_method(
	api_name	=> "open-ils.vandelay.queued_authority_record.create",
	method		=> "add_record_to_authority_queue",
	api_level	=> 1,
	argc		=> 3,
);

sub _add_auth_rec {
	my $e = shift;
	my $marc = shift;
	my $queue = shift;

	my $rec = new Fieldmapper::vandelay::queued_authority_record();
	$rec->marc( $marc );
	$rec->queue( $queue );

	return $e->create_vandelay_queued_authority_record( $rec );
}

sub process_spool {
	my $self = shift;
	my $client = shift;
	my $auth = shift;
	my $fingerprint = shift;
	my $queue = shift;

	my $e = new_editor(authtoken => $auth, xact => 1);

	if ($self->{record_type} eq 'bib') {
		return $e->die_event unless $e->checkauth;
		return $e->die_event unless
			($e->allowed('CREATE_BIB_IMPORT_QUEUE', undef, $queue) ||
			 $e->allowed('CREATE_BIB_IMPORT_QUEUE', $queue->owner));
	} else {
		return $e->die_event unless $e->checkauth;
		return $e->die_event unless
			($e->allowed('CREATE_AUTHORITY_IMPORT_QUEUE', undef, $queue) ||
			 $e->allowed('CREATE_AUTHORITY_IMPORT_QUEUE', $queue->owner));
	}

	my $method = 'open-ils.vandelay.queued_'.$self->{record_type}.'_record.create';
	$method = $self->method_lookup( $method );

    my $cache = new OpenSRF::Utils::Cache();

    my $data = $cache->get_cache('vandelay_import_spool_' . $fingerprint);
    $data = decode_base64($data);

	my $fh = new IO::Scalar \$data;

	my $batch = new MARC::Batch ( $type, $fh );
	$batch->strict_off;

	my $count = 0;
	while (my $r = $batch->next) {
		try {
			(my $xml = $rec->as_xml_record()) =~ s/\n//sog;
			$xml =~ s/^<\?xml.+\?\s*>//go;
			$xml =~ s/>\s+</></go;
			$xml =~ s/\p{Cc}//go;
			$xml = $self->entityize($xml);
			$xml =~ s/[\x00-\x1f]//go;

			if ($self->{record_type} eq 'bib') {
				_add_bib_rec( $e, $xml, $queue );
			} else {
				_add_auth_rec( $e, $xml, $queue );
			}
			$count++;
			
			$client->respond( $count );
		} catch Error with {
			my $error = shift;
			$log->warn("Encountered a bad record at Vandelay ingest: ".$error);
		}
	}

	$e->commit;
	return undef;
}
__PACKAGE__->register_method(  
	api_name	=> "open-ils.vandelay.bib.process_spool",
	method		=> "process_spool",
	api_level	=> 1,
	argc		=> 3,
	record_type	=> 'bib'
);                      
__PACKAGE__->register_method(  
	api_name	=> "open-ils.vandelay.auth.process_spool",
	method		=> "process_spool",
	api_level	=> 1,
	argc		=> 3,
	record_type	=> 'auth'
);                      



1;

