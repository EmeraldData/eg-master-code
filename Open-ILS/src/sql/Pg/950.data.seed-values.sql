--002.schema.config.sql:
INSERT INTO config.bib_source (id, quality, source, transcendant, can_have_copies) VALUES 
    (1, 90, oils_i18n_gettext(1, 'oclc', 'cbs', 'source'), FALSE, TRUE);
INSERT INTO config.bib_source (id, quality, source, transcendant, can_have_copies) VALUES 
    (2, 10, oils_i18n_gettext(2, 'System Local', 'cbs', 'source'), FALSE, TRUE);
INSERT INTO config.bib_source (id, quality, source, transcendant, can_have_copies) VALUES 
    (3, 1, oils_i18n_gettext(3, 'Project Gutenberg', 'cbs', 'source'), TRUE, TRUE);
SELECT SETVAL('config.bib_source_id_seq'::TEXT, 100);

INSERT INTO biblio.peer_type (id,name) VALUES
    (1,oils_i18n_gettext(1,'Bound Volume','bpt','name')),
    (2,oils_i18n_gettext(2,'Bilingual','bpt','name')),
    (3,oils_i18n_gettext(3,'Back-to-back','bpt','name')),
    (4,oils_i18n_gettext(4,'Set','bpt','name')),
    (5,oils_i18n_gettext(5,'e-Reader Preload','bpt','name')); 
SELECT SETVAL('biblio.peer_type_id_seq'::TEXT, 100);

INSERT INTO config.standing (id, value) VALUES (1, oils_i18n_gettext(1, 'Good', 'cst', 'value'));
INSERT INTO config.standing (id, value) VALUES (2, oils_i18n_gettext(2, 'Barred', 'cst', 'value'));
SELECT SETVAL('config.standing_id_seq'::TEXT, 100);

INSERT INTO config.standing_penalty (id,name,label,block_list,staff_alert)
	VALUES (1,'PATRON_EXCEEDS_FINES',oils_i18n_gettext(1, 'Patron exceeds fine threshold', 'csp', 'label'),'CIRC|FULFILL|HOLD|CAPTURE|RENEW', TRUE);
INSERT INTO config.standing_penalty (id,name,label,block_list,staff_alert)
	VALUES (2,'PATRON_EXCEEDS_OVERDUE_COUNT',oils_i18n_gettext(2, 'Patron exceeds max overdue item threshold', 'csp', 'label'),'CIRC|FULFILL|HOLD|CAPTURE|RENEW', TRUE);
INSERT INTO config.standing_penalty (id,name,label,block_list,staff_alert)
	VALUES (3,'PATRON_EXCEEDS_CHECKOUT_COUNT',oils_i18n_gettext(3, 'Patron exceeds max checked out item threshold', 'csp', 'label'),'CIRC|FULFILL', TRUE);
INSERT INTO config.standing_penalty (id,name,label,block_list,staff_alert)
	VALUES (4,'PATRON_EXCEEDS_COLLECTIONS_WARNING',oils_i18n_gettext(4, 'Patron exceeds pre-collections warning fine threshold', 'csp', 'label'),'CIRC|FULFILL|HOLD|CAPTURE|RENEW', TRUE);
INSERT INTO config.standing_penalty (id,name,label,block_list,staff_alert)
	VALUES (5,'PATRON_EXCEEDS_LOST_COUNT',oils_i18n_gettext(5, 'Patron exceeds max lost item threshold', 'csp', 'label'),'CIRC|FULFILL|HOLD|CAPTURE|RENEW', TRUE);

INSERT INTO config.standing_penalty (id,name,label,staff_alert) VALUES (20,'ALERT_NOTE',oils_i18n_gettext(20, 'Alerting Note, no blocks', 'csp', 'label'),TRUE);
INSERT INTO config.standing_penalty (id,name,label) VALUES (21,'SILENT_NOTE',oils_i18n_gettext(21, 'Note, no blocks', 'csp', 'label'));
INSERT INTO config.standing_penalty (id,name,label,block_list,staff_alert) VALUES (22,'STAFF_C',oils_i18n_gettext(22, 'Alerting block on Circ', 'csp', 'label'),'CIRC', TRUE);
INSERT INTO config.standing_penalty (id,name,label,block_list,staff_alert) VALUES (23,'STAFF_CH',oils_i18n_gettext(23, 'Alerting block on Circ and Hold', 'csp', 'label'),'CIRC|HOLD', TRUE);
INSERT INTO config.standing_penalty (id,name,label,block_list,staff_alert) VALUES (24,'STAFF_CR',oils_i18n_gettext(24, 'Alerting block on Circ and Renew', 'csp', 'label'),'CIRC|RENEW', TRUE);
INSERT INTO config.standing_penalty (id,name,label,block_list,staff_alert) VALUES (25,'STAFF_CHR',oils_i18n_gettext(25, 'Alerting block on Circ, Hold and Renew', 'csp', 'label'),'CIRC|HOLD|RENEW', TRUE);
INSERT INTO config.standing_penalty (id,name,label,block_list,staff_alert) VALUES (26,'STAFF_HR',oils_i18n_gettext(26, 'Alerting block on Hold and Renew', 'csp', 'label'),'HOLD|RENEW', TRUE);
INSERT INTO config.standing_penalty (id,name,label,block_list,staff_alert) VALUES (27,'STAFF_H',oils_i18n_gettext(27, 'Alerting block on Hold', 'csp', 'label'),'HOLD', TRUE);
INSERT INTO config.standing_penalty (id,name,label,block_list,staff_alert) VALUES (28,'STAFF_R',oils_i18n_gettext(28, 'Alerting block on Renew', 'csp', 'label'),'RENEW', TRUE);
INSERT INTO config.standing_penalty (id,name,label) VALUES (29,'INVALID_PATRON_ADDRESS',oils_i18n_gettext(29, 'Patron has an invalid address', 'csp', 'label'));
INSERT INTO config.standing_penalty (id,name,label) VALUES (30,'PATRON_IN_COLLECTIONS',oils_i18n_gettext(30, 'Patron has been referred to a collections agency', 'csp', 'label'));
INSERT INTO config.standing_penalty (id, name, label, staff_alert, org_depth) VALUES
    (
        31,
        'INVALID_PATRON_EMAIL_ADDRESS',
        oils_i18n_gettext(
            31,
            'Patron had an invalid email address',
            'csp',
            'label'
        ),
        TRUE,
        0
    ),
    (
        32,
        'INVALID_PATRON_DAY_PHONE',
        oils_i18n_gettext(
            32,
            'Patron had an invalid daytime phone number',
            'csp',
            'label'
        ),
        TRUE,
        0
    ),
    (
        33,
        'INVALID_PATRON_EVENING_PHONE',
        oils_i18n_gettext(
            33,
            'Patron had an invalid evening phone number',
            'csp',
            'label'
        ),
        TRUE,
        0
    ),
    (
        34,
        'INVALID_PATRON_OTHER_PHONE',
        oils_i18n_gettext(
            34,
            'Patron had an invalid other phone number',
            'csp',
            'label'
        ),
        TRUE,
        0
    );


SELECT SETVAL('config.standing_penalty_id_seq', 100);

INSERT INTO config.metabib_class ( name, label ) VALUES ( 'identifier', oils_i18n_gettext('identifier', 'Identifier', 'cmc', 'label') );
INSERT INTO config.metabib_class ( name, label ) VALUES ( 'keyword', oils_i18n_gettext('keyword', 'Keyword', 'cmc', 'label') );
INSERT INTO config.metabib_class ( name, label ) VALUES ( 'title', oils_i18n_gettext('title', 'Title', 'cmc', 'label') );
INSERT INTO config.metabib_class ( name, label ) VALUES ( 'author', oils_i18n_gettext('author', 'Author', 'cmc', 'label') );
INSERT INTO config.metabib_class ( name, label ) VALUES ( 'subject', oils_i18n_gettext('subject', 'Subject', 'cmc', 'label') );
INSERT INTO config.metabib_class ( name, label ) VALUES ( 'series', oils_i18n_gettext('series', 'Series', 'cmc', 'label') );

-- enable combined search for only the subject class by default
UPDATE config.metabib_class SET combined = TRUE WHERE name = 'subject';

-- some more from 002.schema.config.sql:
INSERT INTO config.xml_transform VALUES ( 'marcxml', 'http://www.loc.gov/MARC21/slim', 'marc', '---' );
INSERT INTO config.xml_transform VALUES ( 'mods', 'http://www.loc.gov/mods/', 'mods', '');
INSERT INTO config.xml_transform VALUES ( 'mods3', 'http://www.loc.gov/mods/v3', 'mods3', '');
INSERT INTO config.xml_transform VALUES ( 'mods32', 'http://www.loc.gov/mods/v3', 'mods32', '');
INSERT INTO config.xml_transform VALUES ( 'mods33', 'http://www.loc.gov/mods/v3', 'mods33', '');
INSERT INTO config.xml_transform VALUES ( 'marc21expand880', 'http://www.loc.gov/MARC21/slim', 'marc', '' );

-- Index Definitions
INSERT INTO config.metabib_field ( id, field_class, name, label, format, xpath, facet_field, authority_xpath, browse_field ) VALUES
    (1, 'series', 'seriestitle', oils_i18n_gettext(1, 'Series Title', 'cmf', 'label'), 'mods32', $$//mods32:mods/mods32:relatedItem[@type="series"]/mods32:titleInfo[not(@type="nfi")]$$, TRUE, '//@xlink:href', FALSE );

INSERT INTO config.metabib_field ( id, field_class, name, label, format, xpath, authority_xpath ) VALUES 
    (2, 'title', 'abbreviated', oils_i18n_gettext(2, 'Abbreviated Title', 'cmf', 'label'), 'mods32', $$//mods32:mods/mods32:titleInfo[mods32:title and (@type='abbreviated')]$$, '//@xlink:href' );
INSERT INTO config.metabib_field ( id, field_class, name, label, format, xpath, authority_xpath, browse_sort_xpath ) VALUES 
    (3, 'title', 'translated', oils_i18n_gettext(3, 'Translated Title', 'cmf', 'label'), 'mods32', $$//mods32:mods/mods32:titleInfo[mods32:title and (@type='translated-nfi')]$$, '//@xlink:href', $$*[local-name() != "nonSort"]$$ );
INSERT INTO config.metabib_field ( id, field_class, name, label, format, xpath, authority_xpath, browse_sort_xpath ) VALUES 
    (4, 'title', 'alternative', oils_i18n_gettext(4, 'Alternate Title', 'cmf', 'label'), 'mods32', $$//mods32:mods/mods32:titleInfo[mods32:title and starts-with(@type,'alternative')]$$, '//@xlink:href', $$*[local-name() != "nonSort"]$$ );
INSERT INTO config.metabib_field ( id, field_class, name, label, format, xpath, authority_xpath, browse_sort_xpath ) VALUES 
    (5, 'title', 'uniform', oils_i18n_gettext(5, 'Uniform Title', 'cmf', 'label'), 'mods32', $$//mods32:mods/mods32:titleInfo[mods32:title and (@type='uniform-nfi')]$$, '//@xlink:href', $$*[local-name() != "nonSort"]$$ );
INSERT INTO config.metabib_field ( id, field_class, name, label, format, xpath, authority_xpath, browse_field ) VALUES
    (6, 'title', 'proper', oils_i18n_gettext(6, 'Title Proper', 'cmf', 'label'), 'mods32', $$//mods32:mods/mods32:titleNonfiling[mods32:title and not (@type)]$$, '//@xlink:href', FALSE );

INSERT INTO config.metabib_field ( id, field_class, name, label, format, xpath, facet_xpath, facet_field , authority_xpath, browse_xpath) VALUES 
    (7, 'author', 'corporate', oils_i18n_gettext(7, 'Corporate Author', 'cmf', 'label'), 'mods32', $$//mods32:mods/mods32:name[@type='corporate' and (mods32:role/mods32:roleTerm[text()='creator'] or mods32:role/mods32:roleTerm[text()='aut'] or mods32:role/mods32:roleTerm[text()='cre'])]$$, $$//*[local-name()='namePart']$$, TRUE, '//@xlink:href',$$//*[local-name()='namePart']$$ ); -- /* to fool vim */;
INSERT INTO config.metabib_field ( id, field_class, name, label, format, xpath, facet_xpath, facet_field, authority_xpath, browse_xpath ) VALUES 
    (8, 'author', 'personal', oils_i18n_gettext(8, 'Personal Author', 'cmf', 'label'), 'mods32', $$//mods32:mods/mods32:name[@type='personal' and mods32:role/mods32:roleTerm[text()='creator']]$$, $$//*[local-name()='namePart']$$, TRUE, '//@xlink:href',$$//*[local-name()='namePart']$$ ); -- /* to fool vim */;
INSERT INTO config.metabib_field ( id, field_class, name, label, format, xpath, facet_xpath, facet_field, authority_xpath, browse_xpath ) VALUES 
    (9, 'author', 'conference', oils_i18n_gettext(9, 'Conference Author', 'cmf', 'label'), 'mods32', $$//mods32:mods/mods32:name[@type='conference' and mods32:role/mods32:roleTerm[text()='creator']]$$, $$//*[local-name()='namePart']$$, TRUE, '//@xlink:href',$$//*[local-name()='namePart']$$ ); -- /* to fool vim */;
INSERT INTO config.metabib_field ( id, field_class, name, label, format, xpath, facet_xpath, facet_field, authority_xpath, browse_xpath ) VALUES 
    (10, 'author', 'other', oils_i18n_gettext(10, 'Other Author', 'cmf', 'label'), 'mods32', $$//mods32:mods/mods32:name[@type='personal' and not(mods32:role/mods32:roleTerm[text()='creator'])]$$, $$//*[local-name()='namePart']$$, TRUE, '//@xlink:href',$$//*[local-name()='namePart']$$ ); -- /* to fool vim */;

INSERT INTO config.metabib_field ( id, field_class, name, label, format, xpath, facet_field, authority_xpath ) VALUES 
    (11, 'subject', 'geographic', oils_i18n_gettext(11, 'Geographic Subject', 'cmf', 'label'), 'mods32', $$//mods32:mods/mods32:subject/mods32:geographic$$, TRUE, '//@xlink:href' );
INSERT INTO config.metabib_field ( id, field_class, name, label, format, xpath, facet_xpath, facet_field, authority_xpath ) VALUES 
    (12, 'subject', 'name', oils_i18n_gettext(12, 'Name Subject', 'cmf', 'label'), 'mods32', $$//mods32:mods/mods32:subject/mods32:name$$, $$//*[local-name()='namePart']$$, TRUE, '//@xlink:href' ); -- /* to fool vim */;
INSERT INTO config.metabib_field ( id, field_class, name, label, format, xpath, facet_field, authority_xpath ) VALUES 
    (13, 'subject', 'temporal', oils_i18n_gettext(13, 'Temporal Subject', 'cmf', 'label'), 'mods32', $$//mods32:mods/mods32:subject/mods32:temporal$$, TRUE, '//@xlink:href' );
INSERT INTO config.metabib_field ( id, field_class, name, label, format, xpath, facet_field, authority_xpath ) VALUES 
    (14, 'subject', 'topic', oils_i18n_gettext(14, 'Topic Subject', 'cmf', 'label'), 'mods32', $$//mods32:mods/mods32:subject/mods32:topic$$, TRUE, '//@xlink:href' );
--INSERT INTO config.metabib_field ( id, field_class, name, format, xpath ) VALUES 
--  ( id, field_class, name, xpath ) VALUES ( 'subject', 'genre', 'mods32', $$//mods32:mods/mods32:genre$$ );
INSERT INTO config.metabib_field ( id, field_class, name, label, format, xpath, browse_field ) VALUES 
    (15, 'keyword', 'keyword', oils_i18n_gettext(15, 'General Keywords', 'cmf', 'label'), 'mods32', $$//mods32:mods/*[not(local-name()='originInfo')]$$, FALSE ); -- /* to fool vim */;
INSERT INTO config.metabib_field ( id, field_class, name, label, format, xpath, browse_field ) VALUES
    (16, 'subject', 'complete', oils_i18n_gettext(16, 'All Subjects', 'cmf', 'label'), 'mods32', $$//mods32:mods/mods32:subject$$, FALSE );

INSERT INTO config.metabib_field ( id, field_class, name, label, format, xpath, browse_field ) VALUES
    (17, 'identifier', 'accession', oils_i18n_gettext(17, 'Accession Number', 'cmf', 'label'), 'marcxml', $$//marc:controlfield[@tag='001']$$, FALSE );
INSERT INTO config.metabib_field ( id, field_class, name, label, format, xpath, browse_field ) VALUES
    (18, 'identifier', 'isbn', oils_i18n_gettext(18, 'ISBN', 'cmf', 'label'), 'marcxml', $$//marc:datafield[@tag='020']/marc:subfield[@code='a' or @code='z']$$, FALSE );
INSERT INTO config.metabib_field ( id, field_class, name, label, format, xpath, browse_field ) VALUES
    (19, 'identifier', 'issn', oils_i18n_gettext(19, 'ISSN', 'cmf', 'label'), 'marcxml', $$//marc:datafield[@tag='022']/marc:subfield[@code='a' or @code='z']$$, FALSE );
INSERT INTO config.metabib_field ( id, field_class, name, label, format, xpath, browse_field ) VALUES
    (20, 'identifier', 'upc', oils_i18n_gettext(20, 'UPC', 'cmf', 'label'), 'marcxml', $$//marc:datafield[@tag='024' and @ind1='1']/marc:subfield[@code='a' or @code='z']$$, FALSE );
INSERT INTO config.metabib_field ( id, field_class, name, label, format, xpath, browse_field ) VALUES
    (21, 'identifier', 'ismn', oils_i18n_gettext(21, 'ISMN', 'cmf', 'label'), 'marcxml', $$//marc:datafield[@tag='024' and @ind1='2']/marc:subfield[@code='a' or @code='z']$$, FALSE );
INSERT INTO config.metabib_field ( id, field_class, name, label, format, xpath, browse_field ) VALUES
    (22, 'identifier', 'ean', oils_i18n_gettext(22, 'EAN', 'cmf', 'label'), 'marcxml', $$//marc:datafield[@tag='024' and @ind1='3']/marc:subfield[@code='a' or @code='z']$$, FALSE );
INSERT INTO config.metabib_field ( id, field_class, name, label, format, xpath, browse_field ) VALUES
    (23, 'identifier', 'isrc', oils_i18n_gettext(23, 'ISRC', 'cmf', 'label'), 'marcxml', $$//marc:datafield[@tag='024' and @ind1='0']/marc:subfield[@code='a' or @code='z']$$, FALSE );
INSERT INTO config.metabib_field ( id, field_class, name, label, format, xpath, browse_field ) VALUES
    (24, 'identifier', 'sici', oils_i18n_gettext(24, 'SICI', 'cmf', 'label'), 'marcxml', $$//marc:datafield[@tag='024' and @ind1='4']/marc:subfield[@code='a' or @code='z']$$, FALSE );
INSERT INTO config.metabib_field ( id, field_class, name, label, format, xpath, browse_field ) VALUES
    (25, 'identifier', 'bibcn', oils_i18n_gettext(25, 'Local Free-Text Call Number', 'cmf', 'label'), 'marcxml', $$//marc:datafield[@tag='099']$$, FALSE );
INSERT INTO config.metabib_field ( id, field_class, name, label, format, xpath, browse_field ) VALUES
    (26, 'identifier', 'tcn', oils_i18n_gettext(26, 'Title Control Number', 'cmf', 'label'), 'marcxml', $$//marc:datafield[@tag='901']/marc:subfield[@code='a']$$, FALSE );
INSERT INTO config.metabib_field ( id, field_class, name, label, format, xpath, browse_field ) VALUES
    (27, 'identifier', 'bibid', oils_i18n_gettext(27, 'Internal ID', 'cmf', 'label'), 'marcxml', $$//marc:datafield[@tag='901']/marc:subfield[@code='c']$$, FALSE );
INSERT INTO config.metabib_field ( id, field_class, name, label, format, xpath, search_field, facet_field, browse_field) VALUES
    (28, 'identifier', 'authority_id', oils_i18n_gettext(28, 'Authority Record ID', 'cmf', 'label'), 'marcxml', '//marc:datafield/marc:subfield[@code="0"]', FALSE, TRUE, FALSE);
INSERT INTO config.metabib_field ( id, field_class, name, label, format, xpath, browse_field) VALUES
    (29, 'identifier', 'scn', oils_i18n_gettext(29, 'System Control Number', 'cmf', 'label'), 'marcxml', $$//marc:datafield[@tag='035']/marc:subfield[@code="a"]$$, FALSE);
INSERT INTO config.metabib_field ( id, field_class, name, label, format, xpath, browse_field) VALUES
    (30, 'identifier', 'lccn', oils_i18n_gettext(30, 'LC Control Number', 'cmf', 'label'), 'marcxml', $$//marc:datafield[@tag='010']/marc:subfield[@code="a" or @code='z']$$, FALSE);
INSERT INTO config.metabib_field ( id, field_class, name, label, format, xpath, search_field, authority_xpath, browse_field, browse_sort_xpath ) VALUES
    (31, 'title', 'browse', oils_i18n_gettext(31, 'Title Proper (Browse)', 'cmf', 'label'), 'mods32', $$//mods32:mods/mods32:titleBrowse$$, FALSE, '//@xlink:href', TRUE, $$*[local-name() != "nonSort"]$$ );
INSERT INTO config.metabib_field ( id, field_class, name, label, format, xpath, search_field, authority_xpath, browse_field, browse_sort_xpath ) VALUES
    (32, 'series', 'browse', oils_i18n_gettext(32, 'Series Title (Browse)', 'cmf', 'label'), 'mods32', $$//mods32:mods/mods32:relatedItem[@type="series"]/mods32:titleInfo[@type="nfi"]$$, FALSE, '//@xlink:href', TRUE, $$*[local-name() != "nonSort"]$$ );

INSERT INTO config.metabib_field ( id, field_class, name, label, format, xpath, browse_field, facet_field, facet_xpath, joiner ) VALUES
    (33, 'identifier', 'genre', oils_i18n_gettext(33, 'Genre', 'cmf', 'label'), 'marcxml', $$//marc:datafield[@tag='655']$$, FALSE, TRUE, $$//*[local-name()='subfield' and contains('abvxyz',@code)]$$, ' -- ' ); -- /* to fool vim */;

UPDATE config.metabib_field SET joiner = ' -- ' WHERE field_class = 'subject' AND name NOT IN ('name', 'complete');

SELECT SETVAL('config.metabib_field_id_seq', GREATEST(1000, (SELECT MAX(id) FROM config.metabib_field)));

INSERT INTO config.metabib_search_alias (alias,field_class) VALUES ('kw','keyword');
INSERT INTO config.metabib_search_alias (alias,field_class) VALUES ('eg.keyword','keyword');
INSERT INTO config.metabib_search_alias (alias,field_class) VALUES ('dc.publisher','keyword');
INSERT INTO config.metabib_search_alias (alias,field_class) VALUES ('bib.subjecttitle','keyword');
INSERT INTO config.metabib_search_alias (alias,field_class) VALUES ('bib.genre','keyword');
INSERT INTO config.metabib_search_alias (alias,field_class) VALUES ('bib.edition','keyword');
INSERT INTO config.metabib_search_alias (alias,field_class) VALUES ('srw.serverchoice','keyword');

INSERT INTO config.metabib_search_alias (alias,field_class) VALUES ('id','identifier');
INSERT INTO config.metabib_search_alias (alias,field_class) VALUES ('dc.identifier','identifier');
INSERT INTO config.metabib_search_alias (alias,field_class,field) VALUES ('eg.isbn','identifier', 18);
INSERT INTO config.metabib_search_alias (alias,field_class,field) VALUES ('eg.issn','identifier', 19);
INSERT INTO config.metabib_search_alias (alias,field_class,field) VALUES ('eg.upc','identifier', 20);
INSERT INTO config.metabib_search_alias (alias,field_class,field) VALUES ('eg.callnumber','identifier', 25);
INSERT INTO config.metabib_search_alias (alias,field_class,field) VALUES ('eg.tcn','identifier', 26);
INSERT INTO config.metabib_search_alias (alias,field_class,field) VALUES ('eg.bibid','identifier', 27);

INSERT INTO config.metabib_search_alias (alias,field_class) VALUES ('au','author');
INSERT INTO config.metabib_search_alias (alias,field_class) VALUES ('name','author');
INSERT INTO config.metabib_search_alias (alias,field_class) VALUES ('creator','author');
INSERT INTO config.metabib_search_alias (alias,field_class) VALUES ('eg.author','author');
INSERT INTO config.metabib_search_alias (alias,field_class) VALUES ('eg.name','author');
INSERT INTO config.metabib_search_alias (alias,field_class) VALUES ('dc.creator','author');
INSERT INTO config.metabib_search_alias (alias,field_class) VALUES ('dc.contributor','author');
INSERT INTO config.metabib_search_alias (alias,field_class) VALUES ('bib.name','author');
INSERT INTO config.metabib_search_alias (alias,field_class,field) VALUES ('bib.namepersonal','author',8);
INSERT INTO config.metabib_search_alias (alias,field_class,field) VALUES ('bib.namepersonalfamily','author',8);
INSERT INTO config.metabib_search_alias (alias,field_class,field) VALUES ('bib.namepersonalgiven','author',8);
INSERT INTO config.metabib_search_alias (alias,field_class,field) VALUES ('bib.namecorporate','author',7);
INSERT INTO config.metabib_search_alias (alias,field_class,field) VALUES ('bib.nameconference','author',9);

INSERT INTO config.metabib_search_alias (alias,field_class) VALUES ('ti','title');
INSERT INTO config.metabib_search_alias (alias,field_class) VALUES ('eg.title','title');
INSERT INTO config.metabib_search_alias (alias,field_class) VALUES ('dc.title','title');
INSERT INTO config.metabib_search_alias (alias,field_class,field) VALUES ('bib.titleabbreviated','title',2);
INSERT INTO config.metabib_search_alias (alias,field_class,field) VALUES ('bib.titleuniform','title',5);
INSERT INTO config.metabib_search_alias (alias,field_class,field) VALUES ('bib.titletranslated','title',3);
INSERT INTO config.metabib_search_alias (alias,field_class,field) VALUES ('bib.titlealternative','title',4);
INSERT INTO config.metabib_search_alias (alias,field_class,field) VALUES ('bib.title','title',2);

INSERT INTO config.metabib_search_alias (alias,field_class) VALUES ('su','subject');
INSERT INTO config.metabib_search_alias (alias,field_class) VALUES ('eg.subject','subject');
INSERT INTO config.metabib_search_alias (alias,field_class) VALUES ('dc.subject','subject');
INSERT INTO config.metabib_search_alias (alias,field_class,field) VALUES ('bib.subjectplace','subject',11);
INSERT INTO config.metabib_search_alias (alias,field_class,field) VALUES ('bib.subjectname','subject',12);
INSERT INTO config.metabib_search_alias (alias,field_class,field) VALUES ('bib.subjectoccupation','subject',16);

INSERT INTO config.metabib_search_alias (alias,field_class) VALUES ('se','series');
INSERT INTO config.metabib_search_alias (alias,field_class) VALUES ('eg.series','series');
INSERT INTO config.metabib_search_alias (alias,field_class,field) VALUES ('bib.titleseries','series',1);


INSERT INTO config.non_cataloged_type ( id, owning_lib, name ) VALUES ( 1, 1, oils_i18n_gettext(1, 'Paperback Book', 'cnct', 'name') );
SELECT SETVAL('config.non_cataloged_type_id_seq'::TEXT, 100);

INSERT INTO config.identification_type ( id, name ) VALUES 
    ( 1, oils_i18n_gettext(1, 'Drivers License', 'cit', 'name') );
INSERT INTO config.identification_type ( id, name ) VALUES 
    ( 3, oils_i18n_gettext(3, 'Other', 'cit', 'name') );
SELECT SETVAL('config.identification_type_id_seq'::TEXT, 100);

INSERT INTO config.rule_circ_duration VALUES 
    (1, oils_i18n_gettext(1, '7_days_0_renew', 'crcd', 'name'), '7 days', '7 days', '7 days', 0);
INSERT INTO config.rule_circ_duration VALUES 
    (2, oils_i18n_gettext(2, '28_days_2_renew', 'crcd', 'name'), '28 days', '28 days', '28 days', 2);
INSERT INTO config.rule_circ_duration VALUES 
    (3, oils_i18n_gettext(3, '3_months_0_renew', 'crcd', 'name'), '3 months', '3 months', '3 months', 0);
INSERT INTO config.rule_circ_duration VALUES 
    (4, oils_i18n_gettext(4, '3_days_1_renew', 'crcd', 'name'), '3 days', '3 days', '3 days', 1);
INSERT INTO config.rule_circ_duration VALUES 
    (5, oils_i18n_gettext(5, '2_months_2_renew', 'crcd', 'name'), '2 months', '2 months', '2 months', 2);
INSERT INTO config.rule_circ_duration VALUES 
    (6, oils_i18n_gettext(6, '35_days_1_renew', 'crcd', 'name'), '35 days', '35 days', '35 days', 1);
INSERT INTO config.rule_circ_duration VALUES 
    (7, oils_i18n_gettext(7, '7_days_2_renew', 'crcd', 'name'), '7 days', '7 days', '7 days', 2);
INSERT INTO config.rule_circ_duration VALUES 
    (8, oils_i18n_gettext(8, '1_hour_2_renew', 'crcd', 'name'), '1 hour', '1 hour', '1 hour', 2);
INSERT INTO config.rule_circ_duration VALUES 
    (9, oils_i18n_gettext(9, '28_days_0_renew', 'crcd', 'name'), '28 days', '28 days', '28 days', 0);
INSERT INTO config.rule_circ_duration VALUES 
    (10, oils_i18n_gettext(10, '14_days_2_renew', 'crcd', 'name'), '14 days', '14 days', '14 days', 2);
INSERT INTO config.rule_circ_duration VALUES 
    (11, oils_i18n_gettext(11, 'default', 'crcd', 'name'), '21 days', '14 days', '7 days', 2);
SELECT SETVAL('config.rule_circ_duration_id_seq'::TEXT, 100);

INSERT INTO config.rule_max_fine VALUES 
    (1, oils_i18n_gettext(1, 'default', 'crmf', 'name'), 5.00);
INSERT INTO config.rule_max_fine VALUES 
    (2, oils_i18n_gettext(2, 'overdue_min', 'crmf', 'name'), 5.00);
INSERT INTO config.rule_max_fine VALUES 
    (3, oils_i18n_gettext(3, 'overdue_mid', 'crmf', 'name'), 10.00);
INSERT INTO config.rule_max_fine VALUES 
    (4, oils_i18n_gettext(4, 'overdue_max', 'crmf', 'name'), 100.00);
INSERT INTO config.rule_max_fine VALUES 
    (5, oils_i18n_gettext(5, 'overdue_equip_min', 'crmf', 'name'), 25.00);
INSERT INTO config.rule_max_fine VALUES 
    (6, oils_i18n_gettext(6, 'overdue_equip_mid', 'crmf', 'name'), 25.00);
INSERT INTO config.rule_max_fine VALUES 
    (7, oils_i18n_gettext(7, 'overdue_equip_max', 'crmf', 'name'), 100.00);
SELECT SETVAL('config.rule_max_fine_id_seq'::TEXT, 100);

INSERT INTO config.rule_recurring_fine VALUES 
    (1, oils_i18n_gettext(1, 'default', 'crrf', 'name'), 0.50, 0.10, 0.05, '1 day', '1 day');
INSERT INTO config.rule_recurring_fine VALUES 
    (2, oils_i18n_gettext(2, '10_cent_per_day', 'crrf', 'name'), 0.50, 0.10, 0.10, '1 day', '1 day');
INSERT INTO config.rule_recurring_fine VALUES 
    (3, oils_i18n_gettext(3, '50_cent_per_day', 'crrf', 'name'), 0.50, 0.50, 0.50, '1 day', '1 day');
SELECT SETVAL('config.rule_recurring_fine_id_seq'::TEXT, 100);

INSERT INTO config.rule_age_hold_protect VALUES
	(1, oils_i18n_gettext(1, '3month', 'crahp', 'name'), '3 months', 0);
INSERT INTO config.rule_age_hold_protect VALUES
	(2, oils_i18n_gettext(2, '6month', 'crahp', 'name'), '6 months', 2);
SELECT SETVAL('config.rule_age_hold_protect_id_seq'::TEXT, 100);

INSERT INTO config.copy_status (id,name,holdable,opac_visible,copy_active,is_available) VALUES (0,oils_i18n_gettext(0, 'Available', 'ccs', 'name'),'t','t','t','t');
INSERT INTO config.copy_status (id,name,holdable,opac_visible,copy_active,restrict_copy_delete) VALUES (1,oils_i18n_gettext(1, 'Checked out', 'ccs', 'name'),'t','t','t','t');
INSERT INTO config.copy_status (id,name) VALUES (2,oils_i18n_gettext(2, 'Bindery', 'ccs', 'name'));
INSERT INTO config.copy_status (id,name,restrict_copy_delete) VALUES (3,oils_i18n_gettext(3, 'Lost', 'ccs', 'name'),'t');
INSERT INTO config.copy_status (id,name) VALUES (4,oils_i18n_gettext(4, 'Missing', 'ccs', 'name'));
INSERT INTO config.copy_status (id,name,holdable,opac_visible) VALUES (5,oils_i18n_gettext(5, 'In process', 'ccs', 'name'),'t','t');
INSERT INTO config.copy_status (id,name,holdable,opac_visible,restrict_copy_delete) VALUES (6,oils_i18n_gettext(6, 'In transit', 'ccs', 'name'),'t','t','t');
INSERT INTO config.copy_status (id,name,holdable,opac_visible,copy_active,is_available) VALUES (7,oils_i18n_gettext(7, 'Reshelving', 'ccs', 'name'),'t','t','t','t');
INSERT INTO config.copy_status (id,name,holdable,opac_visible,copy_active,restrict_copy_delete) VALUES (8,oils_i18n_gettext(8, 'On holds shelf', 'ccs', 'name'),'t','t','t','t');
INSERT INTO config.copy_status (id,name,holdable,opac_visible) VALUES (9,oils_i18n_gettext(9, 'On order', 'ccs', 'name'),'t','t');
INSERT INTO config.copy_status (id,name,copy_active) VALUES (10,oils_i18n_gettext(10, 'ILL', 'ccs', 'name'),'t');
INSERT INTO config.copy_status (id,name) VALUES (11,oils_i18n_gettext(11, 'Cataloging', 'ccs', 'name'));
INSERT INTO config.copy_status (id,name,opac_visible,copy_active) VALUES (12,oils_i18n_gettext(12, 'Reserves', 'ccs', 'name'),'t','t');
INSERT INTO config.copy_status (id,name) VALUES (13,oils_i18n_gettext(13, 'Discard/Weed', 'ccs', 'name'));
INSERT INTO config.copy_status (id,name) VALUES (14,oils_i18n_gettext(14, 'Damaged', 'ccs', 'name'));
INSERT INTO config.copy_status (id,name,copy_active) VALUES (15,oils_i18n_gettext(15, 'On reservation shelf', 'ccs', 'name'),'t');
INSERT INTO config.copy_status
    (id, name, holdable, opac_visible, copy_active, restrict_copy_delete)
    VALUES (16, oils_i18n_gettext(16, 'Long Overdue', 'ccs', 'name'), 'f', 'f', 'f', 't');
INSERT INTO config.copy_status
(id, name, holdable, opac_visible, copy_active, restrict_copy_delete)
VALUES (17, 'Lost and Paid', FALSE, FALSE, FALSE, TRUE);
INSERT INTO config.copy_status(id,name,holdable,opac_visible) VALUES (18,oils_i18n_gettext(18, 'Canceled Transit', 'ccs', 'name'),'t','t');


SELECT SETVAL('config.copy_status_id_seq'::TEXT, 100);

INSERT INTO config.net_access_level (id, name) VALUES 
    (1, oils_i18n_gettext(1, 'Filtered', 'cnal', 'name'));
INSERT INTO config.net_access_level (id, name) VALUES 
    (2, oils_i18n_gettext(2, 'Unfiltered', 'cnal', 'name'));
INSERT INTO config.net_access_level (id, name) VALUES 
    (3, oils_i18n_gettext(3, 'No Access', 'cnal', 'name'));
SELECT SETVAL('config.net_access_level_id_seq'::TEXT, 100);

-- available locales
INSERT INTO config.i18n_locale (code,marc_code,name,description)
    VALUES ('en-US', 'eng', oils_i18n_gettext('en-US', 'English (US)', 'i18n_l', 'name'),
	oils_i18n_gettext('en-US', 'American English', 'i18n_l', 'description'));
INSERT INTO config.i18n_locale (code,marc_code,name,description)
    VALUES ('cs-CZ', 'cze', oils_i18n_gettext('cs-CZ', 'Czech', 'i18n_l', 'name'),
	oils_i18n_gettext('cs-CZ', 'Czech', 'i18n_l', 'description'));
INSERT INTO config.i18n_locale (code,marc_code,name,description)
    VALUES ('en-CA', 'eng', oils_i18n_gettext('en-CA', 'English (Canada)', 'i18n_l', 'name'),
	oils_i18n_gettext('en-CA', 'Canadian English', 'i18n_l', 'description'));
INSERT INTO config.i18n_locale (code,marc_code,name,description)
    VALUES ('fi-FI', 'fin', oils_i18n_gettext('fi-FI', 'Finnish', 'i18n_l', 'name'),
	oils_i18n_gettext('fi-FI', 'Finnish', 'i18n_l', 'description'));
INSERT INTO config.i18n_locale (code,marc_code,name,description)
    VALUES ('fr-CA', 'fre', oils_i18n_gettext('fr-CA', 'French (Canada)', 'i18n_l', 'name'),
	oils_i18n_gettext('fr-CA', 'Canadian French', 'i18n_l', 'description'));
INSERT INTO config.i18n_locale (code,marc_code,name,description)
    VALUES ('hy-AM', 'arm', oils_i18n_gettext('hy-AM', 'Armenian', 'i18n_l', 'name'),
	oils_i18n_gettext('hy-AM', 'Armenian', 'i18n_l', 'description'));
INSERT INTO config.i18n_locale (code,marc_code,name,description)
    VALUES ('es-ES', 'spa', oils_i18n_gettext('es-ES', 'Spanish', 'i18n_l', 'name'),
	oils_i18n_gettext('es-ES', 'Spanish', 'i18n_l', 'description'));
--INSERT INTO config.i18n_locale (code,marc_code,name,description)
--    VALUES ('es-US', 'spa', oils_i18n_gettext('es-US', 'Spanish (US)', 'i18n_l', 'name'),
--	oils_i18n_gettext('es-US', 'American Spanish', 'i18n_l', 'description'));
--INSERT INTO config.i18n_locale (code,marc_code,name,description)
--    VALUES ('es-MX', 'spa', oils_i18n_gettext('es-MX', 'Spanish (Mexico)', 'i18n_l', 'name'),
--	oils_i18n_gettext('es-MX', 'Mexican Spanish', 'i18n_l', 'description'));
INSERT INTO config.i18n_locale (code,marc_code,name,description)
    VALUES ('ru-RU', 'rus', oils_i18n_gettext('ru-RU', 'Russian', 'i18n_l', 'name'),
	oils_i18n_gettext('ru-RU', 'Russian', 'i18n_l', 'description'));

-- Z39.50 server attributes

INSERT INTO config.z3950_source (name, label, host, port, db, auth)
	VALUES ('loc', oils_i18n_gettext('loc', 'Library of Congress', 'czs', 'label'), 'lx2.loc.gov', 210, 'LCDB', FALSE);
INSERT INTO config.z3950_source (name, label, host, port, db, auth)
	VALUES ('oclc', oils_i18n_gettext('oclc', 'OCLC', 'czs', 'label'), 'zcat.oclc.org', 210, 'OLUCWorldCat', TRUE);

INSERT INTO config.z3950_attr (id, source, name, label, code, format)
	VALUES (1, 'loc','tcn', oils_i18n_gettext(1, 'Title Control Number', 'cza', 'label'), 12, 1);
INSERT INTO config.z3950_attr (id, source, name, label, code, format)
	VALUES (2, 'loc', 'isbn', oils_i18n_gettext(2, 'ISBN', 'cza', 'label'), 7, 6);
INSERT INTO config.z3950_attr (id, source, name, label, code, format)
	VALUES (3, 'loc', 'lccn', oils_i18n_gettext(3, 'LCCN', 'cza', 'label'), 9, 6);
INSERT INTO config.z3950_attr (id, source, name, label, code, format)
	VALUES (4, 'loc', 'author', oils_i18n_gettext(4, 'Author', 'cza', 'label'), 1003, 6);
INSERT INTO config.z3950_attr (id, source, name, label, code, format)
	VALUES (5, 'loc', 'title', oils_i18n_gettext(5, 'Title', 'cza', 'label'), 4, 6);
INSERT INTO config.z3950_attr (id, source, name, label, code, format)
	VALUES (6, 'loc', 'issn', oils_i18n_gettext(6, 'ISSN', 'cza', 'label'), 8, 1);
INSERT INTO config.z3950_attr (id, source, name, label, code, format)
	VALUES (7, 'loc', 'publisher', oils_i18n_gettext(7, 'Publisher', 'cza', 'label'), 1018, 6);
INSERT INTO config.z3950_attr (id, source, name, label, code, format)
	VALUES (8, 'loc', 'pubdate', oils_i18n_gettext(8, 'Publication Date', 'cza', 'label'), 31, 1);
INSERT INTO config.z3950_attr (id, source, name, label, code, format)
	VALUES (9, 'loc', 'item_type', oils_i18n_gettext(9, 'Item Type', 'cza', 'label'), 1001, 1);

UPDATE config.z3950_attr SET truncation = 1 WHERE source = 'loc';

INSERT INTO config.z3950_attr (id, source, name, label, code, format)
	VALUES (10, 'oclc', 'tcn', oils_i18n_gettext(10, 'Title Control Number', 'cza', 'label'), 12, 1);
INSERT INTO config.z3950_attr (id, source, name, label, code, format)
	VALUES (11, 'oclc', 'isbn', oils_i18n_gettext(11, 'ISBN', 'cza', 'label'), 7, 6);
INSERT INTO config.z3950_attr (id, source, name, label, code, format)
	VALUES (12, 'oclc', 'lccn', oils_i18n_gettext(12, 'LCCN', 'cza', 'label'), 9, 1);
INSERT INTO config.z3950_attr (id, source, name, label, code, format)
	VALUES (13, 'oclc', 'author', oils_i18n_gettext(13, 'Author', 'cza', 'label'), 1003, 6);
INSERT INTO config.z3950_attr (id, source, name, label, code, format)
	VALUES (14, 'oclc', 'title', oils_i18n_gettext(14, 'Title', 'cza', 'label'), 4, 6);
INSERT INTO config.z3950_attr (id, source, name, label, code, format)
	VALUES (15, 'oclc', 'issn', oils_i18n_gettext(15, 'ISSN', 'cza', 'label'), 8, 1);
INSERT INTO config.z3950_attr (id, source, name, label, code, format)
	VALUES (16, 'oclc', 'publisher', oils_i18n_gettext(16, 'Publisher', 'cza', 'label'), 1018, 6);
INSERT INTO config.z3950_attr (id, source, name, label, code, format)
	VALUES (17, 'oclc', 'pubdate', oils_i18n_gettext(17, 'Publication Date', 'cza', 'label'), 31, 1);
INSERT INTO config.z3950_attr (id, source, name, label, code, format)
	VALUES (18, 'oclc', 'item_type', oils_i18n_gettext(18, 'Item Type', 'cza', 'label'), 1001, 1);

SELECT SETVAL('config.z3950_attr_id_seq'::TEXT, 100);

--005.schema.actors.sql:

-- The PINES levels
INSERT INTO actor.org_unit_type (id, name, opac_label, depth, parent, can_have_users, can_have_vols) VALUES 
    ( 1, oils_i18n_gettext(1, 'Consortium', 'aout', 'name'),
	oils_i18n_gettext(1, 'Everywhere', 'aout', 'opac_label'), 0, NULL, FALSE, FALSE );
INSERT INTO actor.org_unit_type (id, name, opac_label, depth, parent, can_have_users, can_have_vols) VALUES 
    ( 2, oils_i18n_gettext(2, 'System', 'aout', 'name'),
	oils_i18n_gettext(2, 'Local Library System', 'aout', 'opac_label'), 1, 1, FALSE, FALSE );
INSERT INTO actor.org_unit_type (id, name, opac_label, depth, parent) VALUES 
    ( 3, oils_i18n_gettext(3, 'Branch', 'aout', 'name'),
	oils_i18n_gettext(3, 'This Branch', 'aout', 'opac_label'), 2, 2 );
INSERT INTO actor.org_unit_type (id, name, opac_label, depth, parent) VALUES 
    ( 4, oils_i18n_gettext(4, 'Sub-library', 'aout', 'name'),
	oils_i18n_gettext(4, 'This Specialized Library', 'aout', 'opac_label'), 3, 3 );
INSERT INTO actor.org_unit_type (id, name, opac_label, depth, parent) VALUES 
    ( 5, oils_i18n_gettext(5, 'Bookmobile', 'aout', 'name'),
	oils_i18n_gettext(5, 'Your Bookmobile', 'aout', 'opac_label'), 3, 3 );
SELECT SETVAL('actor.org_unit_type_id_seq'::TEXT, 100);

-- We need one actor.org_unit to own many things
INSERT INTO actor.org_unit (id, parent_ou, ou_type, shortname, name) VALUES 
    (1, NULL, 1, 'CONS', oils_i18n_gettext(1, 'Example Consortium', 'aou', 'name'));
SELECT SETVAL('actor.org_unit_id_seq'::TEXT, 100);

INSERT INTO config.billing_type (id, name, owner) VALUES
	( 1, oils_i18n_gettext(1, 'Overdue Materials', 'cbt', 'name'), 1);
INSERT INTO config.billing_type (id, name, owner) VALUES
	( 2, oils_i18n_gettext(2, 'Long Overdue Collection Fee', 'cbt', 'name'), 1);
INSERT INTO config.billing_type (id, name, owner) VALUES
	( 3, oils_i18n_gettext(3, 'Lost Materials', 'cbt', 'name'), 1);
INSERT INTO config.billing_type (id, name, owner) VALUES
	( 4, oils_i18n_gettext(4, 'Lost Materials Processing Fee', 'cbt', 'name'), 1);
INSERT INTO config.billing_type (id, name, owner) VALUES
	( 5, oils_i18n_gettext(5, 'System: Deposit', 'cbt', 'name'), 1);
INSERT INTO config.billing_type (id, name, owner) VALUES
	( 6, oils_i18n_gettext(6, 'System: Rental', 'cbt', 'name'), 1);
INSERT INTO config.billing_type (id, name, owner) VALUES
	( 7, oils_i18n_gettext(7, 'Damaged Item', 'cbt', 'name'), 1);
INSERT INTO config.billing_type (id, name, owner) VALUES
	( 8, oils_i18n_gettext(8, 'Damaged Item Processing Fee', 'cbt', 'name'), 1);
INSERT INTO config.billing_type (id, name, owner) VALUES
	( 9, oils_i18n_gettext(9, 'Notification Fee', 'cbt', 'name'), 1);
INSERT INTO config.billing_type (id, owner, name) VALUES
    (10, 1, oils_i18n_gettext(10, 'Long-Overdue Materials', 'cbt', 'name'));
INSERT INTO config.billing_type (id, owner, name) VALUES
    (11, 1, oils_i18n_gettext(11, 'Long-Overdue Materials Processing Fee', 'cbt', 'name'));


INSERT INTO config.billing_type (id, name, owner) VALUES ( 101, oils_i18n_gettext(101, 'Misc', 'cbt', 'name'), 1);

SELECT SETVAL('config.billing_type_id_seq'::TEXT, 101);

--006.data.permissions.sql:
INSERT INTO permission.perm_list ( id, code, description ) VALUES
 ( -1, 'EVERYTHING', oils_i18n_gettext( -1, 
    'EVERYTHING', 'ppl', 'description' )),
 ( 1, 'OPAC_LOGIN', oils_i18n_gettext( 1, 
    'Allow a user to log in to the OPAC', 'ppl', 'description' )),
 ( 2, 'STAFF_LOGIN', oils_i18n_gettext( 2, 
    'Allow a user to log in to the staff client', 'ppl', 'description' )),
 ( 3, 'MR_HOLDS', oils_i18n_gettext( 3, 
    'Allow a user to create a metarecord holds', 'ppl', 'description' )),
 ( 4, 'TITLE_HOLDS', oils_i18n_gettext( 4, 
    'Allow a user to place a hold at the title level', 'ppl', 'description' )),
 ( 5, 'VOLUME_HOLDS', oils_i18n_gettext( 5, 
    'Allow a user to place a volume level hold', 'ppl', 'description' )),
 ( 6, 'COPY_HOLDS', oils_i18n_gettext( 6, 
    'Allow a user to place a hold on a specific copy', 'ppl', 'description' )),
 ( 7, 'REQUEST_HOLDS', oils_i18n_gettext( 7, 
    'Allow a user to create holds for another user (if true, we still check to make sure they have permission to make the type of hold they are requesting, for example, COPY_HOLDS)', 'ppl', 'description' )),
 ( 8, 'REQUEST_HOLDS_OVERRIDE', oils_i18n_gettext( 8, 
    '* no longer applicable', 'ppl', 'description' )),
 ( 9, 'VIEW_HOLD', oils_i18n_gettext( 9, 
    'Allow a user to view another user''s holds', 'ppl', 'description' )),
 ( 10, 'DELETE_HOLDS', oils_i18n_gettext( 10, 
    '* no longer applicable', 'ppl', 'description' )),
 ( 11, 'UPDATE_HOLD', oils_i18n_gettext( 11, 
    'Allow a user to update another user''s hold', 'ppl', 'description' )),
 ( 12, 'RENEW_CIRC', oils_i18n_gettext( 12, 
    'Allow a user to renew items', 'ppl', 'description' )),
 ( 13, 'VIEW_USER_FINES_SUMMARY', oils_i18n_gettext( 13, 
    'Allow a user to view bill details', 'ppl', 'description' )),
 ( 14, 'VIEW_USER_TRANSACTIONS', oils_i18n_gettext( 14, 
    'Allow a user to see another user''s grocery or circulation transactions in the Bills Interface; duplicate of VIEW_TRANSACTION', 'ppl', 'description' )),
 ( 15, 'UPDATE_MARC', oils_i18n_gettext( 15, 
    'Allow a user to edit a MARC record', 'ppl', 'description' )),
 ( 16, 'CREATE_MARC', oils_i18n_gettext( 16, 
    'Allow a user to create new MARC records', 'ppl', 'description' )),
 ( 17, 'IMPORT_MARC', oils_i18n_gettext( 17, 
    'Allow a user to import a MARC record via the Z39.50 interface', 'ppl', 'description' )),
 ( 18, 'CREATE_VOLUME', oils_i18n_gettext( 18, 
    'Allow a user to create a volume', 'ppl', 'description' )),
 ( 19, 'UPDATE_VOLUME', oils_i18n_gettext( 19, 
    'Allow a user to edit volumes - needed for merging records. This is a duplicate of VOLUME_UPDATE; user must have both permissions at appropriate level to merge records.', 'ppl', 'description' )),
 ( 20, 'DELETE_VOLUME', oils_i18n_gettext( 20, 
    'Allow a user to delete a volume', 'ppl', 'description' )),
 ( 21, 'CREATE_COPY', oils_i18n_gettext( 21, 
    'Allow a user to create a new copy object', 'ppl', 'description' )),
 ( 22, 'UPDATE_COPY', oils_i18n_gettext( 22, 
    'Allow a user to edit a copy', 'ppl', 'description' )),
 ( 23, 'DELETE_COPY', oils_i18n_gettext( 23, 
    'Allow a user to delete a copy', 'ppl', 'description' )),
 ( 24, 'RENEW_HOLD_OVERRIDE', oils_i18n_gettext( 24, 
    'Allow a user to continue to renew an item even if it is required for a hold', 'ppl', 'description' )),
 ( 25, 'CREATE_USER', oils_i18n_gettext( 25, 
    'Allow a user to create another user', 'ppl', 'description' )),
 ( 26, 'UPDATE_USER', oils_i18n_gettext( 26, 
    'Allow a user to edit a user''s record', 'ppl', 'description' )),
 ( 27, 'DELETE_USER', oils_i18n_gettext( 27, 
    'Allow a user to mark a user as deleted', 'ppl', 'description' )),
 ( 28, 'VIEW_USER', oils_i18n_gettext( 28, 
    'Allow a user to view another user''s Patron Record', 'ppl', 'description' )),
 ( 29, 'COPY_CHECKIN', oils_i18n_gettext( 29, 
    'Allow a user to check in a copy', 'ppl', 'description' )),
 ( 30, 'CREATE_TRANSIT', oils_i18n_gettext( 30, 
    'Allow a user to place an item in transit', 'ppl', 'description' )),
 ( 31, 'VIEW_PERMISSION', oils_i18n_gettext( 31, 
    'Allow a user to view user permissions within the user permissions editor', 'ppl', 'description' )),
 ( 32, 'CHECKIN_BYPASS_HOLD_FULFILL', oils_i18n_gettext( 32, 
    '* no longer applicable', 'ppl', 'description' )),
 ( 33, 'CREATE_PAYMENT', oils_i18n_gettext( 33, 
    'Allow a user to record payments in the Billing Interface', 'ppl', 'description' )),
 ( 34, 'SET_CIRC_LOST', oils_i18n_gettext( 34, 
    'Allow a user to mark an item as ''lost''', 'ppl', 'description' )),
 ( 35, 'SET_CIRC_MISSING', oils_i18n_gettext( 35, 
    'Allow a user to mark an item as ''missing''', 'ppl', 'description' )),
 ( 36, 'SET_CIRC_CLAIMS_RETURNED', oils_i18n_gettext( 36, 
    'Allow a user to mark an item as ''claims returned''', 'ppl', 'description' )),
 ( 37, 'CREATE_TRANSACTION', oils_i18n_gettext( 37, 
    'Allow a user to create a new billable transaction', 'ppl', 'description' )),
 ( 38, 'VIEW_TRANSACTION', oils_i18n_gettext( 38, 
    'Allow a user may view another user''s transactions', 'ppl', 'description' )),
 ( 39, 'CREATE_BILL', oils_i18n_gettext( 39, 
    'Allow a user to create a new bill on a transaction', 'ppl', 'description' )),
 ( 40, 'VIEW_CONTAINER', oils_i18n_gettext( 40, 
    'Allow a user to view another user''s containers (buckets)', 'ppl', 'description' )),
 ( 41, 'CREATE_CONTAINER', oils_i18n_gettext( 41, 
    'Allow a user to create a new container for another user', 'ppl', 'description' )),
 ( 42, 'UPDATE_ORG_UNIT', oils_i18n_gettext( 42, 
    'Allow a user to change the settings for an organization unit', 'ppl', 'description' )),
 ( 43, 'VIEW_CIRCULATIONS', oils_i18n_gettext( 43, 
    'Allow a user to see what another user has checked out', 'ppl', 'description' )),
 ( 44, 'DELETE_CONTAINER', oils_i18n_gettext( 44, 
    'Allow a user to delete another user''s container', 'ppl', 'description' )),
 ( 45, 'CREATE_CONTAINER_ITEM', oils_i18n_gettext( 45, 
    'Allow a user to create a container item for another user', 'ppl', 'description' )),
 ( 46, 'CREATE_USER_GROUP_LINK', oils_i18n_gettext( 46, 
    'Allow a user to add other users to permission groups', 'ppl', 'description' )),
 ( 47, 'REMOVE_USER_GROUP_LINK', oils_i18n_gettext( 47, 
    'Allow a user to remove other users from permission groups', 'ppl', 'description' )),
 ( 48, 'VIEW_PERM_GROUPS', oils_i18n_gettext( 48, 
    'Allow a user to view other users'' permission groups', 'ppl', 'description' )),
 ( 49, 'VIEW_PERMIT_CHECKOUT', oils_i18n_gettext( 49, 
    'Allow a user to determine whether another user can check out an item', 'ppl', 'description' )),
 ( 50, 'UPDATE_BATCH_COPY', oils_i18n_gettext( 50, 
    'Allow a user to edit copies in batch', 'ppl', 'description' )),
 ( 51, 'CREATE_PATRON_STAT_CAT', oils_i18n_gettext( 51, 
    'User may create a new patron statistical category', 'ppl', 'description' )),
 ( 52, 'CREATE_COPY_STAT_CAT', oils_i18n_gettext( 52, 
    'User may create a copy statistical category', 'ppl', 'description' )),
 ( 53, 'CREATE_PATRON_STAT_CAT_ENTRY', oils_i18n_gettext( 53, 
    'User may create an entry in a patron statistical category', 'ppl', 'description' )),
 ( 54, 'CREATE_COPY_STAT_CAT_ENTRY', oils_i18n_gettext( 54, 
    'User may create an entry in a copy statistical category', 'ppl', 'description' )),
 ( 55, 'UPDATE_PATRON_STAT_CAT', oils_i18n_gettext( 55, 
    'User may update a patron statistical category', 'ppl', 'description' )),
 ( 56, 'UPDATE_COPY_STAT_CAT', oils_i18n_gettext( 56, 
    'User may update a copy statistical category', 'ppl', 'description' )),
 ( 57, 'UPDATE_PATRON_STAT_CAT_ENTRY', oils_i18n_gettext( 57, 
    'User may update an entry in a patron statistical category', 'ppl', 'description' )),
 ( 58, 'UPDATE_COPY_STAT_CAT_ENTRY', oils_i18n_gettext( 58, 
    'User may update an entry in a copy statistical category', 'ppl', 'description' )),
 ( 59, 'CREATE_PATRON_STAT_CAT_ENTRY_MAP', oils_i18n_gettext( 59, 
    'User may link another user to an entry in a statistical category', 'ppl', 'description' )),
 ( 60, 'CREATE_COPY_STAT_CAT_ENTRY_MAP', oils_i18n_gettext( 60, 
    'User may link a copy to an entry in a statistical category', 'ppl', 'description' )),
 ( 61, 'DELETE_PATRON_STAT_CAT', oils_i18n_gettext( 61, 
    'User may delete a patron statistical category', 'ppl', 'description' )),
 ( 62, 'DELETE_COPY_STAT_CAT', oils_i18n_gettext( 62, 
    'User may delete a copy statistical category', 'ppl', 'description' )),
 ( 63, 'DELETE_PATRON_STAT_CAT_ENTRY', oils_i18n_gettext( 63, 
    'User may delete an entry from a patron statistical category', 'ppl', 'description' )),
 ( 64, 'DELETE_COPY_STAT_CAT_ENTRY', oils_i18n_gettext( 64, 
    'User may delete an entry from a copy statistical category', 'ppl', 'description' )),
 ( 65, 'DELETE_PATRON_STAT_CAT_ENTRY_MAP', oils_i18n_gettext( 65, 
    'User may delete a patron statistical category entry map', 'ppl', 'description' )),
 ( 66, 'DELETE_COPY_STAT_CAT_ENTRY_MAP', oils_i18n_gettext( 66, 
    'User may delete a copy statistical category entry map', 'ppl', 'description' )),
 ( 67, 'CREATE_NON_CAT_TYPE', oils_i18n_gettext( 67, 
    'Allow a user to create a new non-cataloged item type', 'ppl', 'description' )),
 ( 68, 'UPDATE_NON_CAT_TYPE', oils_i18n_gettext( 68, 
    'Allow a user to update a non-cataloged item type', 'ppl', 'description' )),
 ( 69, 'CREATE_IN_HOUSE_USE', oils_i18n_gettext( 69, 
    'Allow a user to create a new in-house-use ', 'ppl', 'description' )),
 ( 70, 'COPY_CHECKOUT', oils_i18n_gettext( 70, 
    'Allow a user to check out a copy', 'ppl', 'description' )),
 ( 71, 'CREATE_COPY_LOCATION', oils_i18n_gettext( 71, 
    'Allow a user to create a new copy location', 'ppl', 'description' )),
 ( 72, 'UPDATE_COPY_LOCATION', oils_i18n_gettext( 72, 
    'Allow a user to update a copy location', 'ppl', 'description' )),
 ( 73, 'DELETE_COPY_LOCATION', oils_i18n_gettext( 73, 
    'Allow a user to delete a copy location', 'ppl', 'description' )),
 ( 74, 'CREATE_COPY_TRANSIT', oils_i18n_gettext( 74, 
    'Allow a user to create a transit_copy object for transiting a copy', 'ppl', 'description' )),
 ( 75, 'COPY_TRANSIT_RECEIVE', oils_i18n_gettext( 75, 
    'Allow a user to close out a transit on a copy', 'ppl', 'description' )),
 ( 76, 'VIEW_HOLD_PERMIT', oils_i18n_gettext( 76, 
    'Allow a user to see if another user has permission to place a hold on a given copy', 'ppl', 'description' )),
 ( 77, 'VIEW_COPY_CHECKOUT_HISTORY', oils_i18n_gettext( 77, 
    'Allow a user to view which users have checked out a given copy', 'ppl', 'description' )),
 ( 78, 'REMOTE_Z3950_QUERY', oils_i18n_gettext( 78, 
    'Allow a user to perform Z39.50 queries against remote servers', 'ppl', 'description' )),
 ( 79, 'REGISTER_WORKSTATION', oils_i18n_gettext( 79, 
    'Allow a user to register a new workstation', 'ppl', 'description' )),
 ( 80, 'VIEW_COPY_NOTES', oils_i18n_gettext( 80, 
    'Allow a user to view all notes attached to a copy', 'ppl', 'description' )),
 ( 81, 'VIEW_VOLUME_NOTES', oils_i18n_gettext( 81, 
    'Allow a user to view all notes attached to a volume', 'ppl', 'description' )),
 ( 82, 'VIEW_TITLE_NOTES', oils_i18n_gettext( 82, 
    'Allow a user to view all notes attached to a title', 'ppl', 'description' )),
 ( 83, 'CREATE_COPY_NOTE', oils_i18n_gettext( 83, 
    'Allow a user to create a new copy note', 'ppl', 'description' )),
 ( 84, 'CREATE_VOLUME_NOTE', oils_i18n_gettext( 84, 
    'Allow a user to create a new volume note', 'ppl', 'description' )),
 ( 85, 'CREATE_TITLE_NOTE', oils_i18n_gettext( 85, 
    'Allow a user to create a new title note', 'ppl', 'description' )),
 ( 86, 'DELETE_COPY_NOTE', oils_i18n_gettext( 86, 
    'Allow a user to delete another user''s copy notes', 'ppl', 'description' )),
 ( 87, 'DELETE_VOLUME_NOTE', oils_i18n_gettext( 87, 
    'Allow a user to delete another user''s volume note', 'ppl', 'description' )),
 ( 88, 'DELETE_TITLE_NOTE', oils_i18n_gettext( 88, 
    'Allow a user to delete another user''s title note', 'ppl', 'description' )),
 ( 89, 'UPDATE_CONTAINER', oils_i18n_gettext( 89, 
    'Allow a user to update another user''s container', 'ppl', 'description' )),
 ( 90, 'CREATE_MY_CONTAINER', oils_i18n_gettext( 90, 
    'Allow a user to create a container for themselves', 'ppl', 'description' )),
 ( 91, 'VIEW_HOLD_NOTIFICATION', oils_i18n_gettext( 91, 
    'Allow a user to view notifications attached to a hold', 'ppl', 'description' )),
 ( 92, 'CREATE_HOLD_NOTIFICATION', oils_i18n_gettext( 92, 
    'Allow a user to create new hold notifications', 'ppl', 'description' )),
 ( 93, 'UPDATE_ORG_SETTING', oils_i18n_gettext( 93, 
    'Allow a user to update an organization unit setting', 'ppl', 'description' )),
 ( 94, 'OFFLINE_UPLOAD', oils_i18n_gettext( 94, 
    'Allow a user to upload an offline script', 'ppl', 'description' )),
 ( 95, 'OFFLINE_VIEW', oils_i18n_gettext( 95, 
    'Allow a user to view uploaded offline script information', 'ppl', 'description' )),
 ( 96, 'OFFLINE_EXECUTE', oils_i18n_gettext( 96, 
    'Allow a user to execute an offline script batch', 'ppl', 'description' )),
 ( 97, 'CIRC_OVERRIDE_DUE_DATE', oils_i18n_gettext( 97, 
    'Allow a user to change the due date on an item to any date', 'ppl', 'description' )),
 ( 98, 'CIRC_PERMIT_OVERRIDE', oils_i18n_gettext( 98, 
    'Allow a user to bypass the circulation permit call for check out', 'ppl', 'description' )),
 ( 99, 'COPY_IS_REFERENCE.override', oils_i18n_gettext( 99, 
    'Allow a user to override the copy_is_reference event', 'ppl', 'description' )),
 ( 100, 'VOID_BILLING', oils_i18n_gettext( 100, 
    'Allow a user to void a bill', 'ppl', 'description' )),
 ( 101, 'CIRC_CLAIMS_RETURNED.override', oils_i18n_gettext( 101, 
    'Allow a user to check in or check out an item that has a status of ''claims returned''', 'ppl', 'description' )),
 ( 102, 'COPY_BAD_STATUS.override', oils_i18n_gettext( 102, 
    'Allow a user to check out an item in a non-circulatable status', 'ppl', 'description' )),
 ( 103, 'COPY_ALERT_MESSAGE.override', oils_i18n_gettext( 103, 
    'Allow a user to check in/out an item that has an alert message', 'ppl', 'description' )),
 ( 104, 'COPY_STATUS_LOST.override', oils_i18n_gettext( 104, 
    'Allow a user to remove the lost status from a copy', 'ppl', 'description' )),
 ( 105, 'COPY_STATUS_MISSING.override', oils_i18n_gettext( 105, 
    'Allow a user to change the missing status on a copy', 'ppl', 'description' )),
 ( 106, 'ABORT_TRANSIT', oils_i18n_gettext( 106, 
    'Allow a user to abort a copy transit if the user is at the transit destination or source', 'ppl', 'description' )),
 ( 107, 'ABORT_REMOTE_TRANSIT', oils_i18n_gettext( 107, 
    'Allow a user to abort a copy transit if the user is not at the transit source or dest', 'ppl', 'description' )),
 ( 108, 'VIEW_ZIP_DATA', oils_i18n_gettext( 108, 
    'Allow a user to query the ZIP code data method', 'ppl', 'description' )),
 ( 109, 'CANCEL_HOLDS', oils_i18n_gettext( 109, 
    'Allow a user to cancel holds', 'ppl', 'description' )),
 ( 110, 'CREATE_DUPLICATE_HOLDS', oils_i18n_gettext( 110, 
    'Allow a user to create duplicate holds (two or more holds on the same title)', 'ppl', 'description' )),
 ( 111, 'actor.org_unit.closed_date.delete', oils_i18n_gettext( 111, 
    'Allow a user to remove a closed date interval for a given location', 'ppl', 'description' )),
 ( 112, 'actor.org_unit.closed_date.update', oils_i18n_gettext( 112, 
    'Allow a user to update a closed date interval for a given location', 'ppl', 'description' )),
 ( 113, 'actor.org_unit.closed_date.create', oils_i18n_gettext( 113, 
    'Allow a user to create a new closed date for a location', 'ppl', 'description' )),
 ( 114, 'DELETE_NON_CAT_TYPE', oils_i18n_gettext( 114, 
    'Allow a user to delete a non cataloged type', 'ppl', 'description' )),
 ( 115, 'money.collections_tracker.create', oils_i18n_gettext( 115, 
    'Allow a user to put someone into collections', 'ppl', 'description' )),
 ( 116, 'money.collections_tracker.delete', oils_i18n_gettext( 116, 
    'Allow a user to remove someone from collections', 'ppl', 'description' )),
 ( 117, 'BAR_PATRON', oils_i18n_gettext( 117, 
    'Allow a user to bar a patron', 'ppl', 'description' )),
 ( 118, 'UNBAR_PATRON', oils_i18n_gettext( 118, 
    'Allow a user to un-bar a patron', 'ppl', 'description' )),
 ( 119, 'DELETE_WORKSTATION', oils_i18n_gettext( 119, 
    'Allow a user to remove an existing workstation so a new one can replace it', 'ppl', 'description' )),
 ( 120, 'group_application.user', oils_i18n_gettext( 120, 
    'Allow a user to add/remove users to/from the "User" group', 'ppl', 'description' )),
 ( 121, 'group_application.user.patron', oils_i18n_gettext( 121, 
    'Allow a user to add/remove users to/from the "Patron" group', 'ppl', 'description' )),
 ( 122, 'group_application.user.staff', oils_i18n_gettext( 122, 
    'Allow a user to add/remove users to/from the "Staff" group', 'ppl', 'description' )),
 ( 123, 'group_application.user.staff.circ', oils_i18n_gettext( 123, 
    'Allow a user to add/remove users to/from the "Circulator" group', 'ppl', 'description' )),
 ( 124, 'group_application.user.staff.cat', oils_i18n_gettext( 124, 
    'Allow a user to add/remove users to/from the "Cataloger" group', 'ppl', 'description' )),
 ( 125, 'group_application.user.staff.admin.global_admin', oils_i18n_gettext( 125, 
    'Allow a user to add/remove users to/from the "GlobalAdmin" group', 'ppl', 'description' )),
 ( 126, 'group_application.user.staff.admin.local_admin', oils_i18n_gettext( 126, 
    'Allow a user to add/remove users to/from the "LocalAdmin" group', 'ppl', 'description' )),
 ( 127, 'group_application.user.staff.admin.lib_manager', oils_i18n_gettext( 127, 
    'Allow a user to add/remove users to/from the "LibraryManager" group', 'ppl', 'description' )),
 ( 128, 'group_application.user.staff.cat.cat1', oils_i18n_gettext( 128, 
    'Allow a user to add/remove users to/from the "Cat1" group', 'ppl', 'description' )),
 ( 129, 'group_application.user.staff.supercat', oils_i18n_gettext( 129, 
    'Allow a user to add/remove users to/from the "Supercat" group', 'ppl', 'description' )),
 ( 130, 'group_application.user.sip_client', oils_i18n_gettext( 130, 
    'Allow a user to add/remove users to/from the "SIP-Client" group', 'ppl', 'description' )),
 ( 131, 'group_application.user.vendor', oils_i18n_gettext( 131, 
    'Allow a user to add/remove users to/from the "Vendor" group', 'ppl', 'description' )),
 ( 132, 'ITEM_AGE_PROTECTED.override', oils_i18n_gettext( 132, 
    'Allow a user to place a hold on an age-protected item', 'ppl', 'description' )),
 ( 133, 'MAX_RENEWALS_REACHED.override', oils_i18n_gettext( 133, 
    'Allow a user to renew an item past the maximum renewal count', 'ppl', 'description' )),
 ( 134, 'PATRON_EXCEEDS_CHECKOUT_COUNT.override', oils_i18n_gettext( 134, 
    'Allow staff to override checkout count failure', 'ppl', 'description' )),
 ( 135, 'PATRON_EXCEEDS_OVERDUE_COUNT.override', oils_i18n_gettext( 135, 
    'Allow staff to override overdue count failure', 'ppl', 'description' )),
 ( 136, 'PATRON_EXCEEDS_FINES.override', oils_i18n_gettext( 136, 
    'Allow staff to override fine amount checkout failure', 'ppl', 'description' )),
 ( 137, 'CIRC_EXCEEDS_COPY_RANGE.override', oils_i18n_gettext( 137, 
    'Allow staff to override circulation copy range failure', 'ppl', 'description' )),
 ( 138, 'ITEM_ON_HOLDS_SHELF.override', oils_i18n_gettext( 138, 
    'Allow staff to override item on holds shelf failure', 'ppl', 'description' )),
 ( 139, 'COPY_NOT_AVAILABLE.override', oils_i18n_gettext( 139, 
    'Allow staff to force checkout of Missing/Lost type items', 'ppl', 'description' )),
 ( 140, 'HOLD_EXISTS.override', oils_i18n_gettext( 140, 
    'Allow a user to place multiple holds on a single title', 'ppl', 'description' )),
 ( 141, 'RUN_REPORTS', oils_i18n_gettext( 141, 
    'Allow a user to run reports', 'ppl', 'description' )),
 ( 142, 'SHARE_REPORT_FOLDER', oils_i18n_gettext( 142, 
    'Allow a user to share report his own folders', 'ppl', 'description' )),
 ( 143, 'VIEW_REPORT_OUTPUT', oils_i18n_gettext( 143, 
    'Allow a user to view report output', 'ppl', 'description' )),
 ( 144, 'COPY_CIRC_NOT_ALLOWED.override', oils_i18n_gettext( 144, 
    'Allow a user to checkout an item that is marked as non-circ', 'ppl', 'description' )),
 ( 145, 'DELETE_CONTAINER_ITEM', oils_i18n_gettext( 145, 
    'Allow a user to delete an item out of another user''s container', 'ppl', 'description' )),
 ( 146, 'ASSIGN_WORK_ORG_UNIT', oils_i18n_gettext( 146, 
    'Allow a staff member to define where another staff member has their permissions', 'ppl', 'description' )),
 ( 147, 'CREATE_FUNDING_SOURCE', oils_i18n_gettext( 147, 
    'Allow a user to create a new funding source', 'ppl', 'description' )),
 ( 148, 'DELETE_FUNDING_SOURCE', oils_i18n_gettext( 148, 
    'Allow a user to delete a funding source', 'ppl', 'description' )),
 ( 149, 'VIEW_FUNDING_SOURCE', oils_i18n_gettext( 149, 
    'Allow a user to view a funding source', 'ppl', 'description' )),
 ( 150, 'UPDATE_FUNDING_SOURCE', oils_i18n_gettext( 150, 
    'Allow a user to update a funding source', 'ppl', 'description' )),
 ( 151, 'CREATE_FUND', oils_i18n_gettext( 151, 
    'Allow a user to create a new fund', 'ppl', 'description' )),
 ( 152, 'DELETE_FUND', oils_i18n_gettext( 152, 
    'Allow a user to delete a fund', 'ppl', 'description' )),
 ( 153, 'VIEW_FUND', oils_i18n_gettext( 153, 
    'Allow a user to view a fund', 'ppl', 'description' )),
 ( 154, 'UPDATE_FUND', oils_i18n_gettext( 154, 
    'Allow a user to update a fund', 'ppl', 'description' )),
 ( 155, 'CREATE_FUND_ALLOCATION', oils_i18n_gettext( 155, 
    'Allow a user to create a new fund allocation', 'ppl', 'description' )),
 ( 156, 'DELETE_FUND_ALLOCATION', oils_i18n_gettext( 156, 
    'Allow a user to delete a fund allocation', 'ppl', 'description' )),
 ( 157, 'VIEW_FUND_ALLOCATION', oils_i18n_gettext( 157, 
    'Allow a user to view a fund allocation', 'ppl', 'description' )),
 ( 158, 'UPDATE_FUND_ALLOCATION', oils_i18n_gettext( 158, 
    'Allow a user to update a fund allocation', 'ppl', 'description' )),
 ( 159, 'GENERAL_ACQ', oils_i18n_gettext( 159, 
    'Lowest level permission required to access the ACQ interface', 'ppl', 'description' )),
 ( 160, 'CREATE_PROVIDER', oils_i18n_gettext( 160, 
    'Allow a user to create a new provider', 'ppl', 'description' )),
 ( 161, 'DELETE_PROVIDER', oils_i18n_gettext( 161, 
    'Allow a user to delete a provider', 'ppl', 'description' )),
 ( 162, 'VIEW_PROVIDER', oils_i18n_gettext( 162, 
    'Allow a user to view a provider', 'ppl', 'description' )),
 ( 163, 'UPDATE_PROVIDER', oils_i18n_gettext( 163, 
    'Allow a user to update a provider', 'ppl', 'description' )),
 ( 164, 'ADMIN_FUNDING_SOURCE', oils_i18n_gettext( 164, 
    'Allow a user to create/view/update/delete a funding source', 'ppl', 'description' )),
 ( 165, 'ADMIN_FUND', oils_i18n_gettext( 165, 
    '(Deprecated) Allow a user to create/view/update/delete a fund', 'ppl', 'description' )),
 ( 166, 'MANAGE_FUNDING_SOURCE', oils_i18n_gettext( 166, 
    'Allow a user to view/credit/debit a funding source', 'ppl', 'description' )),
 ( 167, 'MANAGE_FUND', oils_i18n_gettext( 167, 
    'Allow a user to view/credit/debit a fund', 'ppl', 'description' )),
 ( 168, 'CREATE_PICKLIST', oils_i18n_gettext( 168, 
    'Allows a user to create a picklist', 'ppl', 'description' )),
 ( 169, 'ADMIN_PROVIDER', oils_i18n_gettext( 169, 
    'Allow a user to create/view/update/delete a provider', 'ppl', 'description' )),
 ( 170, 'MANAGE_PROVIDER', oils_i18n_gettext( 170, 
    'Allow a user to view and purchase from a provider', 'ppl', 'description' )),
 ( 171, 'VIEW_PICKLIST', oils_i18n_gettext( 171, 
    'Allow a user to view another users picklist', 'ppl', 'description' )),
 ( 172, 'DELETE_RECORD', oils_i18n_gettext( 172, 
    'Allow a staff member to directly remove a bibliographic record', 'ppl', 'description' )),
 ( 173, 'ADMIN_CURRENCY_TYPE', oils_i18n_gettext( 173, 
    'Allow a user to create/view/update/delete a currency_type', 'ppl', 'description' )),
 ( 174, 'MARK_BAD_DEBT', oils_i18n_gettext( 174, 
    'Allow a user to mark a transaction as bad (unrecoverable) debt', 'ppl', 'description' )),
 ( 175, 'VIEW_BILLING_TYPE', oils_i18n_gettext( 175, 
    'Allow a user to view billing types', 'ppl', 'description' )),
 ( 176, 'MARK_ITEM_AVAILABLE', oils_i18n_gettext( 176, 
    'Allow a user to mark an item status as ''available''', 'ppl', 'description' )),
 ( 177, 'MARK_ITEM_CHECKED_OUT', oils_i18n_gettext( 177, 
    'Allow a user to mark an item status as ''checked out''', 'ppl', 'description' )),
 ( 178, 'MARK_ITEM_BINDERY', oils_i18n_gettext( 178, 
    'Allow a user to mark an item status as ''bindery''', 'ppl', 'description' )),
 ( 179, 'MARK_ITEM_LOST', oils_i18n_gettext( 179, 
    'Allow a user to mark an item status as ''lost''', 'ppl', 'description' )),
 ( 180, 'MARK_ITEM_MISSING', oils_i18n_gettext( 180, 
    'Allow a user to mark an item status as ''missing''', 'ppl', 'description' )),
 ( 181, 'MARK_ITEM_IN_PROCESS', oils_i18n_gettext( 181, 
    'Allow a user to mark an item status as ''in process''', 'ppl', 'description' )),
 ( 182, 'MARK_ITEM_IN_TRANSIT', oils_i18n_gettext( 182, 
    'Allow a user to mark an item status as ''in transit''', 'ppl', 'description' )),
 ( 183, 'MARK_ITEM_RESHELVING', oils_i18n_gettext( 183, 
    'Allow a user to mark an item status as ''reshelving''', 'ppl', 'description' )),
 ( 184, 'MARK_ITEM_ON_HOLDS_SHELF', oils_i18n_gettext( 184, 
    'Allow a user to mark an item status as ''on holds shelf''', 'ppl', 'description' )),
 ( 185, 'MARK_ITEM_ON_ORDER', oils_i18n_gettext( 185, 
    'Allow a user to mark an item status as ''on order''', 'ppl', 'description' )),
 ( 186, 'MARK_ITEM_ILL', oils_i18n_gettext( 186, 
    'Allow a user to mark an item status as ''inter-library loan''', 'ppl', 'description' )),
 ( 187, 'group_application.user.staff.acq', oils_i18n_gettext( 187, 
    'Allows a user to add/remove/edit users in the "ACQ" group', 'ppl', 'description' )),
 ( 188, 'CREATE_PURCHASE_ORDER', oils_i18n_gettext( 188, 
    'Allows a user to create a purchase order', 'ppl', 'description' )),
 ( 189, 'VIEW_PURCHASE_ORDER', oils_i18n_gettext( 189, 
    'Allows a user to view a purchase order', 'ppl', 'description' )),
 ( 190, 'IMPORT_ACQ_LINEITEM_BIB_RECORD', oils_i18n_gettext( 190, 
    'Allows a user to import a bib record from the acq staging area (on-order record) into the ILS bib data set', 'ppl', 'description' )),
 ( 191, 'RECEIVE_PURCHASE_ORDER', oils_i18n_gettext( 191, 
    'Allows a user to mark a purchase order, lineitem, or individual copy as received', 'ppl', 'description' )),
 ( 192, 'VIEW_ORG_SETTINGS', oils_i18n_gettext( 192, 
    'Allows a user to view all org settings at the specified level', 'ppl', 'description' )),
 ( 193, 'CREATE_MFHD_RECORD', oils_i18n_gettext( 193, 
    'Allows a user to create a new MFHD record', 'ppl', 'description' )),
 ( 194, 'UPDATE_MFHD_RECORD', oils_i18n_gettext( 194, 
    'Allows a user to update an MFHD record', 'ppl', 'description' )),
 ( 195, 'DELETE_MFHD_RECORD', oils_i18n_gettext( 195, 
    'Allows a user to delete an MFHD record', 'ppl', 'description' )),
 ( 196, 'ADMIN_ACQ_FUND', oils_i18n_gettext( 196, 
    'Allow a user to create/view/update/delete a fund', 'ppl', 'description' )),
 ( 197, 'group_application.user.staff.acq_admin', oils_i18n_gettext( 197, 
    'Allows a user to add/remove/edit users in the "Acquisitions Administrators" group', 'ppl', 'description' )),
 ( 198, 'SET_CIRC_CLAIMS_RETURNED.override', oils_i18n_gettext( 198, 
    'Allows staff to override the max claims returned value for a patron', 'ppl', 'description' )),
 ( 199, 'UPDATE_PATRON_CLAIM_RETURN_COUNT', oils_i18n_gettext( 199, 
    'Allows staff to manually change a patron''s claims returned count', 'ppl', 'description' )),
 ( 200, 'UPDATE_BILL_NOTE', oils_i18n_gettext( 200, 
    'Allows staff to edit the note for a bill on a transaction', 'ppl', 'description' )),
 ( 201, 'UPDATE_PAYMENT_NOTE', oils_i18n_gettext( 201, 
    'Allows staff to edit the note for a payment on a transaction', 'ppl', 'description' )),
 ( 202, 'UPDATE_PATRON_CLAIM_NEVER_CHECKED_OUT_COUNT', oils_i18n_gettext( 202, 
    'Allows staff to manually change a patron''s claims never checkout out count', 'ppl', 'description' )),
 ( 203, 'ADMIN_COPY_LOCATION_ORDER', oils_i18n_gettext( 203, 
    'Allow a user to create/view/update/delete a copy location order', 'ppl', 'description' )),
 ( 204, 'ASSIGN_GROUP_PERM', oils_i18n_gettext( 204, 
    'ASSIGN_GROUP_PERM', 'ppl', 'description' )),
 ( 205, 'CREATE_AUDIENCE', oils_i18n_gettext( 205, 
    'CREATE_AUDIENCE', 'ppl', 'description' )),
 ( 206, 'CREATE_BIB_LEVEL', oils_i18n_gettext( 206, 
    'CREATE_BIB_LEVEL', 'ppl', 'description' )),
 ( 207, 'CREATE_CIRC_DURATION', oils_i18n_gettext( 207, 
    'CREATE_CIRC_DURATION', 'ppl', 'description' )),
 ( 208, 'CREATE_CIRC_MOD', oils_i18n_gettext( 208, 
    'CREATE_CIRC_MOD', 'ppl', 'description' )),
 ( 209, 'CREATE_COPY_STATUS', oils_i18n_gettext( 209, 
    'CREATE_COPY_STATUS', 'ppl', 'description' )),
 ( 210, 'CREATE_HOURS_OF_OPERATION', oils_i18n_gettext( 210, 
    'CREATE_HOURS_OF_OPERATION', 'ppl', 'description' )),
 ( 211, 'CREATE_ITEM_FORM', oils_i18n_gettext( 211, 
    'CREATE_ITEM_FORM', 'ppl', 'description' )),
 ( 212, 'CREATE_ITEM_TYPE', oils_i18n_gettext( 212, 
    'CREATE_ITEM_TYPE', 'ppl', 'description' )),
 ( 213, 'CREATE_LANGUAGE', oils_i18n_gettext( 213, 
    'CREATE_LANGUAGE', 'ppl', 'description' )),
 ( 214, 'CREATE_LASSO', oils_i18n_gettext( 214, 
    'CREATE_LASSO', 'ppl', 'description' )),
 ( 215, 'CREATE_LASSO_MAP', oils_i18n_gettext( 215, 
    'CREATE_LASSO_MAP', 'ppl', 'description' )),
 ( 216, 'CREATE_LIT_FORM', oils_i18n_gettext( 216, 
    'CREATE_LIT_FORM', 'ppl', 'description' )),
 ( 217, 'CREATE_METABIB_FIELD', oils_i18n_gettext( 217, 
    'CREATE_METABIB_FIELD', 'ppl', 'description' )),
 ( 218, 'CREATE_NET_ACCESS_LEVEL', oils_i18n_gettext( 218, 
    'CREATE_NET_ACCESS_LEVEL', 'ppl', 'description' )),
 ( 219, 'CREATE_ORG_ADDRESS', oils_i18n_gettext( 219, 
    'CREATE_ORG_ADDRESS', 'ppl', 'description' )),
 ( 220, 'CREATE_ORG_TYPE', oils_i18n_gettext( 220, 
    'CREATE_ORG_TYPE', 'ppl', 'description' )),
 ( 221, 'CREATE_ORG_UNIT', oils_i18n_gettext( 221, 
    'CREATE_ORG_UNIT', 'ppl', 'description' )),
 ( 222, 'CREATE_ORG_UNIT_CLOSING', oils_i18n_gettext( 222, 
    'CREATE_ORG_UNIT_CLOSING', 'ppl', 'description' )),
 ( 223, 'CREATE_PERM', oils_i18n_gettext( 223, 
    'CREATE_PERM', 'ppl', 'description' )),
 ( 224, 'CREATE_RELEVANCE_ADJUSTMENT', oils_i18n_gettext( 224, 
    'CREATE_RELEVANCE_ADJUSTMENT', 'ppl', 'description' )),
 ( 225, 'CREATE_SURVEY', oils_i18n_gettext( 225, 
    'CREATE_SURVEY', 'ppl', 'description' )),
 ( 226, 'CREATE_VR_FORMAT', oils_i18n_gettext( 226, 
    'CREATE_VR_FORMAT', 'ppl', 'description' )),
 ( 227, 'CREATE_XML_TRANSFORM', oils_i18n_gettext( 227, 
    'CREATE_XML_TRANSFORM', 'ppl', 'description' )),
 ( 228, 'DELETE_AUDIENCE', oils_i18n_gettext( 228, 
    'DELETE_AUDIENCE', 'ppl', 'description' )),
 ( 229, 'DELETE_BIB_LEVEL', oils_i18n_gettext( 229, 
    'DELETE_BIB_LEVEL', 'ppl', 'description' )),
 ( 230, 'DELETE_CIRC_DURATION', oils_i18n_gettext( 230, 
    'DELETE_CIRC_DURATION', 'ppl', 'description' )),
 ( 231, 'DELETE_CIRC_MOD', oils_i18n_gettext( 231, 
    'DELETE_CIRC_MOD', 'ppl', 'description' )),
 ( 232, 'DELETE_COPY_STATUS', oils_i18n_gettext( 232, 
    'DELETE_COPY_STATUS', 'ppl', 'description' )),
 ( 233, 'DELETE_HOURS_OF_OPERATION', oils_i18n_gettext( 233, 
    'DELETE_HOURS_OF_OPERATION', 'ppl', 'description' )),
 ( 234, 'DELETE_ITEM_FORM', oils_i18n_gettext( 234, 
    'DELETE_ITEM_FORM', 'ppl', 'description' )),
 ( 235, 'DELETE_ITEM_TYPE', oils_i18n_gettext( 235, 
    'DELETE_ITEM_TYPE', 'ppl', 'description' )),
 ( 236, 'DELETE_LANGUAGE', oils_i18n_gettext( 236, 
    'DELETE_LANGUAGE', 'ppl', 'description' )),
 ( 237, 'DELETE_LASSO', oils_i18n_gettext( 237, 
    'DELETE_LASSO', 'ppl', 'description' )),
 ( 238, 'DELETE_LASSO_MAP', oils_i18n_gettext( 238, 
    'DELETE_LASSO_MAP', 'ppl', 'description' )),
 ( 239, 'DELETE_LIT_FORM', oils_i18n_gettext( 239, 
    'DELETE_LIT_FORM', 'ppl', 'description' )),
 ( 240, 'DELETE_METABIB_FIELD', oils_i18n_gettext( 240, 
    'DELETE_METABIB_FIELD', 'ppl', 'description' )),
 ( 241, 'DELETE_NET_ACCESS_LEVEL', oils_i18n_gettext( 241, 
    'DELETE_NET_ACCESS_LEVEL', 'ppl', 'description' )),
 ( 242, 'DELETE_ORG_ADDRESS', oils_i18n_gettext( 242, 
    'DELETE_ORG_ADDRESS', 'ppl', 'description' )),
 ( 243, 'DELETE_ORG_TYPE', oils_i18n_gettext( 243, 
    'DELETE_ORG_TYPE', 'ppl', 'description' )),
 ( 244, 'DELETE_ORG_UNIT', oils_i18n_gettext( 244, 
    'DELETE_ORG_UNIT', 'ppl', 'description' )),
 ( 245, 'DELETE_ORG_UNIT_CLOSING', oils_i18n_gettext( 245, 
    'DELETE_ORG_UNIT_CLOSING', 'ppl', 'description' )),
 ( 246, 'DELETE_PERM', oils_i18n_gettext( 246, 
    'DELETE_PERM', 'ppl', 'description' )),
 ( 247, 'DELETE_RELEVANCE_ADJUSTMENT', oils_i18n_gettext( 247, 
    'DELETE_RELEVANCE_ADJUSTMENT', 'ppl', 'description' )),
 ( 248, 'DELETE_SURVEY', oils_i18n_gettext( 248, 
    'DELETE_SURVEY', 'ppl', 'description' )),
 ( 249, 'DELETE_TRANSIT', oils_i18n_gettext( 249, 
    'DELETE_TRANSIT', 'ppl', 'description' )),
 ( 250, 'DELETE_VR_FORMAT', oils_i18n_gettext( 250, 
    'DELETE_VR_FORMAT', 'ppl', 'description' )),
 ( 251, 'DELETE_XML_TRANSFORM', oils_i18n_gettext( 251, 
    'DELETE_XML_TRANSFORM', 'ppl', 'description' )),
 ( 252, 'REMOVE_GROUP_PERM', oils_i18n_gettext( 252, 
    'REMOVE_GROUP_PERM', 'ppl', 'description' )),
 ( 253, 'TRANSIT_COPY', oils_i18n_gettext( 253, 
    'TRANSIT_COPY', 'ppl', 'description' )),
 ( 254, 'UPDATE_AUDIENCE', oils_i18n_gettext( 254, 
    'UPDATE_AUDIENCE', 'ppl', 'description' )),
 ( 255, 'UPDATE_BIB_LEVEL', oils_i18n_gettext( 255, 
    'UPDATE_BIB_LEVEL', 'ppl', 'description' )),
 ( 256, 'UPDATE_CIRC_DURATION', oils_i18n_gettext( 256, 
    'UPDATE_CIRC_DURATION', 'ppl', 'description' )),
 ( 257, 'UPDATE_CIRC_MOD', oils_i18n_gettext( 257, 
    'UPDATE_CIRC_MOD', 'ppl', 'description' )),
 ( 258, 'UPDATE_COPY_NOTE', oils_i18n_gettext( 258, 
    'UPDATE_COPY_NOTE', 'ppl', 'description' )),
 ( 259, 'UPDATE_COPY_STATUS', oils_i18n_gettext( 259, 
    'UPDATE_COPY_STATUS', 'ppl', 'description' )),
 ( 260, 'UPDATE_GROUP_PERM', oils_i18n_gettext( 260, 
    'UPDATE_GROUP_PERM', 'ppl', 'description' )),
 ( 261, 'UPDATE_HOURS_OF_OPERATION', oils_i18n_gettext( 261, 
    'UPDATE_HOURS_OF_OPERATION', 'ppl', 'description' )),
 ( 262, 'UPDATE_ITEM_FORM', oils_i18n_gettext( 262, 
    'UPDATE_ITEM_FORM', 'ppl', 'description' )),
 ( 263, 'UPDATE_ITEM_TYPE', oils_i18n_gettext( 263, 
    'UPDATE_ITEM_TYPE', 'ppl', 'description' )),
 ( 264, 'UPDATE_LANGUAGE', oils_i18n_gettext( 264, 
    'UPDATE_LANGUAGE', 'ppl', 'description' )),
 ( 265, 'UPDATE_LASSO', oils_i18n_gettext( 265, 
    'UPDATE_LASSO', 'ppl', 'description' )),
 ( 266, 'UPDATE_LASSO_MAP', oils_i18n_gettext( 266, 
    'UPDATE_LASSO_MAP', 'ppl', 'description' )),
 ( 267, 'UPDATE_LIT_FORM', oils_i18n_gettext( 267, 
    'UPDATE_LIT_FORM', 'ppl', 'description' )),
 ( 268, 'UPDATE_METABIB_FIELD', oils_i18n_gettext( 268, 
    'UPDATE_METABIB_FIELD', 'ppl', 'description' )),
 ( 269, 'UPDATE_NET_ACCESS_LEVEL', oils_i18n_gettext( 269, 
    'UPDATE_NET_ACCESS_LEVEL', 'ppl', 'description' )),
 ( 270, 'UPDATE_ORG_ADDRESS', oils_i18n_gettext( 270, 
    'UPDATE_ORG_ADDRESS', 'ppl', 'description' )),
 ( 271, 'UPDATE_ORG_TYPE', oils_i18n_gettext( 271, 
    'UPDATE_ORG_TYPE', 'ppl', 'description' )),
 ( 272, 'UPDATE_ORG_UNIT_CLOSING', oils_i18n_gettext( 272, 
    'UPDATE_ORG_UNIT_CLOSING', 'ppl', 'description' )),
 ( 273, 'UPDATE_PERM', oils_i18n_gettext( 273, 
    'UPDATE_PERM', 'ppl', 'description' )),
 ( 274, 'UPDATE_RELEVANCE_ADJUSTMENT', oils_i18n_gettext( 274, 
    'UPDATE_RELEVANCE_ADJUSTMENT', 'ppl', 'description' )),
 ( 275, 'UPDATE_SURVEY', oils_i18n_gettext( 275, 
    'UPDATE_SURVEY', 'ppl', 'description' )),
 ( 276, 'UPDATE_TRANSIT', oils_i18n_gettext( 276, 
    'UPDATE_TRANSIT', 'ppl', 'description' )),
 ( 277, 'UPDATE_VOLUME_NOTE', oils_i18n_gettext( 277, 
    'UPDATE_VOLUME_NOTE', 'ppl', 'description' )),
 ( 278, 'UPDATE_VR_FORMAT', oils_i18n_gettext( 278, 
    'UPDATE_VR_FORMAT', 'ppl', 'description' )),
 ( 279, 'UPDATE_XML_TRANSFORM', oils_i18n_gettext( 279, 
    'UPDATE_XML_TRANSFORM', 'ppl', 'description' )),
 ( 280, 'MERGE_BIB_RECORDS', oils_i18n_gettext( 280, 
    'MERGE_BIB_RECORDS', 'ppl', 'description' )),
 ( 281, 'UPDATE_PICKUP_LIB_FROM_HOLDS_SHELF', oils_i18n_gettext( 281, 
    'UPDATE_PICKUP_LIB_FROM_HOLDS_SHELF', 'ppl', 'description' )),
 ( 282, 'CREATE_ACQ_FUNDING_SOURCE', oils_i18n_gettext( 282, 
    'CREATE_ACQ_FUNDING_SOURCE', 'ppl', 'description' )),
 ( 283, 'CREATE_AUTHORITY_IMPORT_IMPORT_FIELD_DEF', oils_i18n_gettext( 283, 
    'CREATE_AUTHORITY_IMPORT_IMPORT_FIELD_DEF', 'ppl', 'description' )),
 ( 284, 'CREATE_AUTHORITY_IMPORT_QUEUE', oils_i18n_gettext( 284, 
    'CREATE_AUTHORITY_IMPORT_QUEUE', 'ppl', 'description' )),
 ( 285, 'CREATE_AUTHORITY_RECORD_NOTE', oils_i18n_gettext( 285, 
    'CREATE_AUTHORITY_RECORD_NOTE', 'ppl', 'description' )),
 ( 286, 'CREATE_BIB_IMPORT_FIELD_DEF', oils_i18n_gettext( 286, 
    'CREATE_BIB_IMPORT_FIELD_DEF', 'ppl', 'description' )),
 ( 287, 'CREATE_BIB_IMPORT_QUEUE', oils_i18n_gettext( 287, 
    'CREATE_BIB_IMPORT_QUEUE', 'ppl', 'description' )),
 ( 288, 'CREATE_LOCALE', oils_i18n_gettext( 288, 
    'CREATE_LOCALE', 'ppl', 'description' )),
 ( 289, 'CREATE_MARC_CODE', oils_i18n_gettext( 289, 
    'CREATE_MARC_CODE', 'ppl', 'description' )),
 ( 290, 'CREATE_TRANSLATION', oils_i18n_gettext( 290, 
    'CREATE_TRANSLATION', 'ppl', 'description' )),
 ( 291, 'DELETE_ACQ_FUNDING_SOURCE', oils_i18n_gettext( 291, 
    'DELETE_ACQ_FUNDING_SOURCE', 'ppl', 'description' )),
 ( 292, 'DELETE_AUTHORITY_IMPORT_IMPORT_FIELD_DEF', oils_i18n_gettext( 292, 
    'DELETE_AUTHORITY_IMPORT_IMPORT_FIELD_DEF', 'ppl', 'description' )),
 ( 293, 'DELETE_AUTHORITY_IMPORT_QUEUE', oils_i18n_gettext( 293, 
    'DELETE_AUTHORITY_IMPORT_QUEUE', 'ppl', 'description' )),
 ( 294, 'DELETE_AUTHORITY_RECORD_NOTE', oils_i18n_gettext( 294, 
    'DELETE_AUTHORITY_RECORD_NOTE', 'ppl', 'description' )),
 ( 295, 'DELETE_BIB_IMPORT_IMPORT_FIELD_DEF', oils_i18n_gettext( 295, 
    'DELETE_BIB_IMPORT_IMPORT_FIELD_DEF', 'ppl', 'description' )),
 ( 296, 'DELETE_BIB_IMPORT_QUEUE', oils_i18n_gettext( 296, 
    'DELETE_BIB_IMPORT_QUEUE', 'ppl', 'description' )),
 ( 297, 'DELETE_LOCALE', oils_i18n_gettext( 297, 
    'DELETE_LOCALE', 'ppl', 'description' )),
 ( 298, 'DELETE_MARC_CODE', oils_i18n_gettext( 298, 
    'DELETE_MARC_CODE', 'ppl', 'description' )),
 ( 299, 'DELETE_TRANSLATION', oils_i18n_gettext( 299, 
    'DELETE_TRANSLATION', 'ppl', 'description' )),
 ( 300, 'UPDATE_ACQ_FUNDING_SOURCE', oils_i18n_gettext( 300, 
    'UPDATE_ACQ_FUNDING_SOURCE', 'ppl', 'description' )),
 ( 301, 'UPDATE_AUTHORITY_IMPORT_IMPORT_FIELD_DEF', oils_i18n_gettext( 301, 
    'UPDATE_AUTHORITY_IMPORT_IMPORT_FIELD_DEF', 'ppl', 'description' )),
 ( 302, 'UPDATE_AUTHORITY_IMPORT_QUEUE', oils_i18n_gettext( 302, 
    'UPDATE_AUTHORITY_IMPORT_QUEUE', 'ppl', 'description' )),
 ( 303, 'UPDATE_AUTHORITY_RECORD_NOTE', oils_i18n_gettext( 303, 
    'UPDATE_AUTHORITY_RECORD_NOTE', 'ppl', 'description' )),
 ( 304, 'UPDATE_BIB_IMPORT_IMPORT_FIELD_DEF', oils_i18n_gettext( 304, 
    'UPDATE_BIB_IMPORT_IMPORT_FIELD_DEF', 'ppl', 'description' )),
 ( 305, 'UPDATE_BIB_IMPORT_QUEUE', oils_i18n_gettext( 305, 
    'UPDATE_BIB_IMPORT_QUEUE', 'ppl', 'description' )),
 ( 306, 'UPDATE_LOCALE', oils_i18n_gettext( 306, 
    'UPDATE_LOCALE', 'ppl', 'description' )),
 ( 307, 'UPDATE_MARC_CODE', oils_i18n_gettext( 307, 
    'UPDATE_MARC_CODE', 'ppl', 'description' )),
 ( 308, 'UPDATE_TRANSLATION', oils_i18n_gettext( 308, 
    'UPDATE_TRANSLATION', 'ppl', 'description' )),
 ( 309, 'VIEW_ACQ_FUNDING_SOURCE', oils_i18n_gettext( 309, 
    'VIEW_ACQ_FUNDING_SOURCE', 'ppl', 'description' )),
 ( 310, 'VIEW_AUTHORITY_RECORD_NOTES', oils_i18n_gettext( 310, 
    'VIEW_AUTHORITY_RECORD_NOTES', 'ppl', 'description' )),
 ( 311, 'CREATE_IMPORT_ITEM', oils_i18n_gettext( 311, 
    'CREATE_IMPORT_ITEM', 'ppl', 'description' )),
 ( 312, 'CREATE_IMPORT_ITEM_ATTR_DEF', oils_i18n_gettext( 312, 
    'CREATE_IMPORT_ITEM_ATTR_DEF', 'ppl', 'description' )),
 ( 313, 'CREATE_IMPORT_TRASH_FIELD', oils_i18n_gettext( 313, 
    'CREATE_IMPORT_TRASH_FIELD', 'ppl', 'description' )),
 ( 314, 'DELETE_IMPORT_ITEM', oils_i18n_gettext( 314, 
    'DELETE_IMPORT_ITEM', 'ppl', 'description' )),
 ( 315, 'DELETE_IMPORT_ITEM_ATTR_DEF', oils_i18n_gettext( 315, 
    'DELETE_IMPORT_ITEM_ATTR_DEF', 'ppl', 'description' )),
 ( 316, 'DELETE_IMPORT_TRASH_FIELD', oils_i18n_gettext( 316, 
    'DELETE_IMPORT_TRASH_FIELD', 'ppl', 'description' )),
 ( 317, 'UPDATE_IMPORT_ITEM', oils_i18n_gettext( 317, 
    'UPDATE_IMPORT_ITEM', 'ppl', 'description' )),
 ( 318, 'UPDATE_IMPORT_ITEM_ATTR_DEF', oils_i18n_gettext( 318, 
    'UPDATE_IMPORT_ITEM_ATTR_DEF', 'ppl', 'description' )),
 ( 319, 'UPDATE_IMPORT_TRASH_FIELD', oils_i18n_gettext( 319, 
    'UPDATE_IMPORT_TRASH_FIELD', 'ppl', 'description' )),
 ( 320, 'UPDATE_ORG_UNIT_SETTING_ALL', oils_i18n_gettext( 320, 
    'UPDATE_ORG_UNIT_SETTING_ALL', 'ppl', 'description' )),
 ( 321, 'UPDATE_ORG_UNIT_SETTING.circ.lost_materials_processing_fee', oils_i18n_gettext( 321, 
    'UPDATE_ORG_UNIT_SETTING.circ.lost_materials_processing_fee', 'ppl', 'description' )),
 ( 322, 'UPDATE_ORG_UNIT_SETTING.cat.default_item_price', oils_i18n_gettext( 322, 
    'UPDATE_ORG_UNIT_SETTING.cat.default_item_price', 'ppl', 'description' )),
 ( 323, 'UPDATE_ORG_UNIT_SETTING.auth.opac_timeout', oils_i18n_gettext( 323, 
    'UPDATE_ORG_UNIT_SETTING.auth.opac_timeout', 'ppl', 'description' )),
 ( 324, 'UPDATE_ORG_UNIT_SETTING.auth.staff_timeout', oils_i18n_gettext( 324, 
    'UPDATE_ORG_UNIT_SETTING.auth.staff_timeout', 'ppl', 'description' )),
 ( 325, 'UPDATE_ORG_UNIT_SETTING.org.bounced_emails', oils_i18n_gettext( 325, 
    'UPDATE_ORG_UNIT_SETTING.org.bounced_emails', 'ppl', 'description' )),
 ( 326, 'UPDATE_ORG_UNIT_SETTING.circ.hold_expire_alert_interval', oils_i18n_gettext( 326, 
    'UPDATE_ORG_UNIT_SETTING.circ.hold_expire_alert_interval', 'ppl', 'description' )),
 ( 327, 'UPDATE_ORG_UNIT_SETTING.circ.hold_expire_interval', oils_i18n_gettext( 327, 
    'UPDATE_ORG_UNIT_SETTING.circ.hold_expire_interval', 'ppl', 'description' )),
 ( 328, 'UPDATE_ORG_UNIT_SETTING.credit.payments.allow', oils_i18n_gettext( 328, 
    'UPDATE_ORG_UNIT_SETTING.credit.payments.allow', 'ppl', 'description' )),
 ( 329, 'UPDATE_ORG_UNIT_SETTING.circ.void_overdue_on_lost', oils_i18n_gettext( 329, 
    'UPDATE_ORG_UNIT_SETTING.circ.void_overdue_on_lost', 'ppl', 'description' )),
 ( 330, 'UPDATE_ORG_UNIT_SETTING.circ.hold_stalling.soft', oils_i18n_gettext( 330, 
    'UPDATE_ORG_UNIT_SETTING.circ.hold_stalling.soft', 'ppl', 'description' )),
 ( 331, 'UPDATE_ORG_UNIT_SETTING.circ.hold_boundary.hard', oils_i18n_gettext( 331, 
    'UPDATE_ORG_UNIT_SETTING.circ.hold_boundary.hard', 'ppl', 'description' )),
 ( 332, 'UPDATE_ORG_UNIT_SETTING.circ.hold_boundary.soft', oils_i18n_gettext( 332, 
    'UPDATE_ORG_UNIT_SETTING.circ.hold_boundary.soft', 'ppl', 'description' )),
 ( 333, 'UPDATE_ORG_UNIT_SETTING.opac.barcode_regex', oils_i18n_gettext( 333, 
    'UPDATE_ORG_UNIT_SETTING.opac.barcode_regex', 'ppl', 'description' )),
 ( 334, 'UPDATE_ORG_UNIT_SETTING.global.password_regex', oils_i18n_gettext( 334, 
    'UPDATE_ORG_UNIT_SETTING.global.password_regex', 'ppl', 'description' )),
 ( 335, 'UPDATE_ORG_UNIT_SETTING.circ.item_checkout_history.max', oils_i18n_gettext( 335, 
    'UPDATE_ORG_UNIT_SETTING.circ.item_checkout_history.max', 'ppl', 'description' )),
 ( 336, 'UPDATE_ORG_UNIT_SETTING.circ.reshelving_complete.interval', oils_i18n_gettext( 336, 
    'UPDATE_ORG_UNIT_SETTING.circ.reshelving_complete.interval', 'ppl', 'description' )),
 ( 337, 'UPDATE_ORG_UNIT_SETTING.circ.selfcheck.patron_login_timeout', oils_i18n_gettext( 337, 
    'UPDATE_ORG_UNIT_SETTING.circ.selfcheck.patron_login_timeout', 'ppl', 'description' )),
 ( 338, 'UPDATE_ORG_UNIT_SETTING.circ.selfcheck.alert_on_checkout_event', oils_i18n_gettext( 338, 
    'UPDATE_ORG_UNIT_SETTING.circ.selfcheck.alert_on_checkout_event', 'ppl', 'description' )),
 ( 340, 'UPDATE_ORG_UNIT_SETTING.global.juvenile_age_threshold', oils_i18n_gettext( 340, 
    'UPDATE_ORG_UNIT_SETTING.global.juvenile_age_threshold', 'ppl', 'description' )),
 ( 341, 'UPDATE_ORG_UNIT_SETTING.cat.bib.keep_on_empty', oils_i18n_gettext( 341, 
    'UPDATE_ORG_UNIT_SETTING.cat.bib.keep_on_empty', 'ppl', 'description' )),
 ( 342, 'UPDATE_ORG_UNIT_SETTING.cat.bib.alert_on_empty', oils_i18n_gettext( 342, 
    'UPDATE_ORG_UNIT_SETTING.cat.bib.alert_on_empty', 'ppl', 'description' )),
 ( 343, 'UPDATE_ORG_UNIT_SETTING.patron.password.use_phone', oils_i18n_gettext( 343, 
    'UPDATE_ORG_UNIT_SETTING.patron.password.use_phone', 'ppl', 'description' )),
 ( 344, 'HOLD_ITEM_CHECKED_OUT.override', oils_i18n_gettext( 344, 
    'Allows a user to place a hold on an item that they already have checked out', 'ppl', 'description' )),
 ( 345, 'ADMIN_ACQ_CANCEL_CAUSE', oils_i18n_gettext( 345, 
    'Allow a user to create/update/delete reasons for order cancellations', 'ppl', 'description' )),
 ( 346, 'ACQ_XFER_MANUAL_DFUND_AMOUNT', oils_i18n_gettext( 346, 
    'Allow a user to transfer different amounts of money out of one fund and into another', 'ppl', 'description' )),
 ( 347, 'OVERRIDE_HOLD_HAS_LOCAL_COPY', oils_i18n_gettext( 347, 
    'Allow a user to override the circ.holds.hold_has_copy_at.block setting', 'ppl', 'description' )),
 ( 348, 'UPDATE_PICKUP_LIB_FROM_TRANSIT', oils_i18n_gettext( 348, 
    'Allow a user to change the pickup and transit destination for a captured hold item already in transit', 'ppl', 'description' )),
 ( 349, 'COPY_NEEDED_FOR_HOLD.override', oils_i18n_gettext( 349, 
    'Allow a user to force renewal of an item that could fulfill a hold request', 'ppl', 'description' )),
 ( 350, 'MERGE_AUTH_RECORDS', oils_i18n_gettext( 350, 
    'Allow a user to merge authority records together', 'ppl', 'description' )),
 ( 351, 'ALLOW_ALT_TCN', oils_i18n_gettext( 351, 
    'Allows staff to import a record using an alternate TCN to avoid conflicts', 'ppl', 'description' )),
 ( 352, 'ADMIN_TRIGGER_EVENT_DEF', oils_i18n_gettext( 352, 
    'Allow a user to administer trigger event definitions', 'ppl', 'description' )),
 ( 353, 'ADMIN_TRIGGER_CLEANUP', oils_i18n_gettext( 353, 
    'Allow a user to create, delete, and update trigger cleanup entries', 'ppl', 'description' )),
 ( 354, 'CREATE_TRIGGER_CLEANUP', oils_i18n_gettext( 354, 
    'Allow a user to create trigger cleanup entries', 'ppl', 'description' )),
 ( 355, 'DELETE_TRIGGER_CLEANUP', oils_i18n_gettext( 355, 
    'Allow a user to delete trigger cleanup entries', 'ppl', 'description' )),
 ( 356, 'UPDATE_TRIGGER_CLEANUP', oils_i18n_gettext( 356, 
    'Allow a user to update trigger cleanup entries', 'ppl', 'description' )),
 ( 357, 'CREATE_TRIGGER_EVENT_DEF', oils_i18n_gettext( 357, 
    'Allow a user to create trigger event definitions', 'ppl', 'description' )),
 ( 358, 'DELETE_TRIGGER_EVENT_DEF', oils_i18n_gettext( 358, 
    'Allow a user to delete trigger event definitions', 'ppl', 'description' )),
 ( 359, 'UPDATE_TRIGGER_EVENT_DEF', oils_i18n_gettext( 359, 
    'Allow a user to update trigger event definitions', 'ppl', 'description' )),
 ( 360, 'VIEW_TRIGGER_EVENT_DEF', oils_i18n_gettext( 360, 
    'Allow a user to view trigger event definitions', 'ppl', 'description' )),
 ( 361, 'ADMIN_TRIGGER_HOOK', oils_i18n_gettext( 361, 
    'Allow a user to create, update, and delete trigger hooks', 'ppl', 'description' )),
 ( 362, 'CREATE_TRIGGER_HOOK', oils_i18n_gettext( 362, 
    'Allow a user to create trigger hooks', 'ppl', 'description' )),
 ( 363, 'DELETE_TRIGGER_HOOK', oils_i18n_gettext( 363, 
    'Allow a user to delete trigger hooks', 'ppl', 'description' )),
 ( 364, 'UPDATE_TRIGGER_HOOK', oils_i18n_gettext( 364, 
    'Allow a user to update trigger hooks', 'ppl', 'description' )),
 ( 365, 'ADMIN_TRIGGER_REACTOR', oils_i18n_gettext( 365, 
    'Allow a user to create, update, and delete trigger reactors', 'ppl', 'description' )),
 ( 366, 'CREATE_TRIGGER_REACTOR', oils_i18n_gettext( 366, 
    'Allow a user to create trigger reactors', 'ppl', 'description' )),
 ( 367, 'DELETE_TRIGGER_REACTOR', oils_i18n_gettext( 367, 
    'Allow a user to delete trigger reactors', 'ppl', 'description' )),
 ( 368, 'UPDATE_TRIGGER_REACTOR', oils_i18n_gettext( 368, 
    'Allow a user to update trigger reactors', 'ppl', 'description' )),
 ( 369, 'ADMIN_TRIGGER_TEMPLATE_OUTPUT', oils_i18n_gettext( 369, 
    'Allow a user to delete trigger template output', 'ppl', 'description' )),
 ( 370, 'DELETE_TRIGGER_TEMPLATE_OUTPUT', oils_i18n_gettext( 370, 
    'Allow a user to delete trigger template output', 'ppl', 'description' )),
 ( 371, 'ADMIN_TRIGGER_VALIDATOR', oils_i18n_gettext( 371, 
    'Allow a user to create, update, and delete trigger validators', 'ppl', 'description' )),
 ( 372, 'CREATE_TRIGGER_VALIDATOR', oils_i18n_gettext( 372, 
    'Allow a user to create trigger validators', 'ppl', 'description' )),
 ( 373, 'DELETE_TRIGGER_VALIDATOR', oils_i18n_gettext( 373, 
    'Allow a user to delete trigger validators', 'ppl', 'description' )),
 ( 374, 'UPDATE_TRIGGER_VALIDATOR', oils_i18n_gettext( 374, 
    'Allow a user to update trigger validators', 'ppl', 'description' )),
 ( 376, 'ADMIN_BOOKING_RESOURCE', oils_i18n_gettext( 376, 
    'Enables the user to create/update/delete booking resources', 'ppl', 'description' )),
 ( 377, 'ADMIN_BOOKING_RESOURCE_TYPE', oils_i18n_gettext( 377, 
    'Enables the user to create/update/delete booking resource types', 'ppl', 'description' )),
 ( 378, 'ADMIN_BOOKING_RESOURCE_ATTR', oils_i18n_gettext( 378, 
    'Enables the user to create/update/delete booking resource attributes', 'ppl', 'description' )),
 ( 379, 'ADMIN_BOOKING_RESOURCE_ATTR_MAP', oils_i18n_gettext( 379, 
    'Enables the user to create/update/delete booking resource attribute maps', 'ppl', 'description' )),
 ( 380, 'ADMIN_BOOKING_RESOURCE_ATTR_VALUE', oils_i18n_gettext( 380, 
    'Enables the user to create/update/delete booking resource attribute values', 'ppl', 'description' )),
 ( 381, 'ADMIN_BOOKING_RESERVATION', oils_i18n_gettext( 381, 
    'Enables the user to create/update/delete booking reservations', 'ppl', 'description' )),
 ( 382, 'ADMIN_BOOKING_RESERVATION_ATTR_VALUE_MAP', oils_i18n_gettext( 382, 
    'Enables the user to create/update/delete booking reservation attribute value maps', 'ppl', 'description' )),
 ( 383, 'RETRIEVE_RESERVATION_PULL_LIST', oils_i18n_gettext( 383, 
    'Allows a user to retrieve a booking reservation pull list', 'ppl', 'description' )),
 ( 384, 'CAPTURE_RESERVATION', oils_i18n_gettext( 384, 
    'Allows a user to capture booking reservations', 'ppl', 'description' )),
 ( 385, 'UPDATE_RECORD', oils_i18n_gettext( 385, 
    'UPDATE_RECORD', 'ppl', 'description' )),
 ( 386, 'UPDATE_ORG_UNIT_SETTING.circ.block_renews_for_holds', oils_i18n_gettext( 386, 
    'UPDATE_ORG_UNIT_SETTING.circ.block_renews_for_holds', 'ppl', 'description' )),
 ( 387, 'MERGE_USERS', oils_i18n_gettext( 387, 
    'Allows user records to be merged', 'ppl', 'description' )),
 ( 388, 'ISSUANCE_HOLDS', oils_i18n_gettext( 388, 
    'Allow a user to place holds on serials issuances', 'ppl', 'description' )),
 ( 389, 'VIEW_CREDIT_CARD_PROCESSING', oils_i18n_gettext( 389, 
    'View org unit settings related to credit card processing', 'ppl', 'description' )),
 ( 390, 'ADMIN_CREDIT_CARD_PROCESSING', oils_i18n_gettext( 390, 
    'Update org unit settings related to credit card processing', 'ppl', 'description' )),
 ( 391, 'ADMIN_ACQ_CLAIM', oils_i18n_gettext( 391, 
    'ADMIN_ACQ_CLAIM', 'ppl', 'description' )),
 ( 392, 'ADMIN_ACQ_CLAIM_EVENT_TYPE', oils_i18n_gettext( 392, 
    'ADMIN_ACQ_CLAIM_EVENT_TYPE', 'ppl', 'description' )),
 ( 393, 'ADMIN_ACQ_CLAIM_TYPE', oils_i18n_gettext( 393, 
    'ADMIN_ACQ_CLAIM_TYPE', 'ppl', 'description' )),
 ( 394, 'ADMIN_ACQ_DISTRIB_FORMULA', oils_i18n_gettext( 394, 
    'ADMIN_ACQ_DISTRIB_FORMULA', 'ppl', 'description' )),
 ( 395, 'ADMIN_ACQ_FISCAL_YEAR', oils_i18n_gettext( 395, 
    'ADMIN_ACQ_FISCAL_YEAR', 'ppl', 'description' )),
 ( 396, 'ADMIN_ACQ_FUND_ALLOCATION_PERCENT', oils_i18n_gettext( 396, 
    'ADMIN_ACQ_FUND_ALLOCATION_PERCENT', 'ppl', 'description' )),
 ( 397, 'ADMIN_ACQ_FUND_TAG', oils_i18n_gettext( 397, 
    'ADMIN_ACQ_FUND_TAG', 'ppl', 'description' )),
 ( 398, 'ADMIN_ACQ_LINEITEM_ALERT_TEXT', oils_i18n_gettext( 398, 
    'ADMIN_ACQ_LINEITEM_ALERT_TEXT', 'ppl', 'description' )),
 ( 399, 'ADMIN_AGE_PROTECT_RULE', oils_i18n_gettext( 399, 
    'ADMIN_AGE_PROTECT_RULE', 'ppl', 'description' )),
 ( 400, 'ADMIN_ASSET_COPY_TEMPLATE', oils_i18n_gettext( 400, 
    'ADMIN_ASSET_COPY_TEMPLATE', 'ppl', 'description' )),
 ( 401, 'ADMIN_BOOKING_RESERVATION_ATTR_MAP', oils_i18n_gettext( 401, 
    'ADMIN_BOOKING_RESERVATION_ATTR_MAP', 'ppl', 'description' )),
 ( 402, 'ADMIN_CIRC_MATRIX_MATCHPOINT', oils_i18n_gettext( 402, 
    'ADMIN_CIRC_MATRIX_MATCHPOINT', 'ppl', 'description' )),
 ( 403, 'ADMIN_CIRC_MOD', oils_i18n_gettext( 403, 
    'ADMIN_CIRC_MOD', 'ppl', 'description' )),
 ( 404, 'ADMIN_CLAIM_POLICY', oils_i18n_gettext( 404, 
    'ADMIN_CLAIM_POLICY', 'ppl', 'description' )),
 ( 405, 'ADMIN_CONFIG_REMOTE_ACCOUNT', oils_i18n_gettext( 405, 
    'ADMIN_CONFIG_REMOTE_ACCOUNT', 'ppl', 'description' )),
 ( 406, 'ADMIN_FIELD_DOC', oils_i18n_gettext( 406, 
    'ADMIN_FIELD_DOC', 'ppl', 'description' )),
 ( 407, 'ADMIN_GLOBAL_FLAG', oils_i18n_gettext( 407, 
    'ADMIN_GLOBAL_FLAG', 'ppl', 'description' )),
 ( 408, 'ADMIN_GROUP_PENALTY_THRESHOLD', oils_i18n_gettext( 408, 
    'ADMIN_GROUP_PENALTY_THRESHOLD', 'ppl', 'description' )),
 ( 409, 'ADMIN_HOLD_CANCEL_CAUSE', oils_i18n_gettext( 409, 
    'ADMIN_HOLD_CANCEL_CAUSE', 'ppl', 'description' )),
 ( 410, 'ADMIN_HOLD_MATRIX_MATCHPOINT', oils_i18n_gettext( 410, 
    'ADMIN_HOLD_MATRIX_MATCHPOINT', 'ppl', 'description' )),
 ( 411, 'ADMIN_IDENT_TYPE', oils_i18n_gettext( 411, 
    'ADMIN_IDENT_TYPE', 'ppl', 'description' )),
 ( 412, 'ADMIN_IMPORT_ITEM_ATTR_DEF', oils_i18n_gettext( 412, 
    'ADMIN_IMPORT_ITEM_ATTR_DEF', 'ppl', 'description' )),
 ( 413, 'ADMIN_INDEX_NORMALIZER', oils_i18n_gettext( 413, 
    'ADMIN_INDEX_NORMALIZER', 'ppl', 'description' )),
 ( 414, 'ADMIN_INVOICE', oils_i18n_gettext( 414, 
    'ADMIN_INVOICE', 'ppl', 'description' )),
 ( 415, 'ADMIN_INVOICE_METHOD', oils_i18n_gettext( 415, 
    'ADMIN_INVOICE_METHOD', 'ppl', 'description' )),
 ( 416, 'ADMIN_INVOICE_PAYMENT_METHOD', oils_i18n_gettext( 416, 
    'ADMIN_INVOICE_PAYMENT_METHOD', 'ppl', 'description' )),
 ( 417, 'ADMIN_LINEITEM_MARC_ATTR_DEF', oils_i18n_gettext( 417, 
    'ADMIN_LINEITEM_MARC_ATTR_DEF', 'ppl', 'description' )),
 ( 418, 'ADMIN_MARC_CODE', oils_i18n_gettext( 418, 
    'ADMIN_MARC_CODE', 'ppl', 'description' )),
 ( 419, 'ADMIN_MAX_FINE_RULE', oils_i18n_gettext( 419, 
    'ADMIN_MAX_FINE_RULE', 'ppl', 'description' )),
 ( 420, 'ADMIN_MERGE_PROFILE', oils_i18n_gettext( 420, 
    'ADMIN_MERGE_PROFILE', 'ppl', 'description' )),
 ( 421, 'ADMIN_ORG_UNIT_SETTING_TYPE', oils_i18n_gettext( 421, 
    'ADMIN_ORG_UNIT_SETTING_TYPE', 'ppl', 'description' )),
 ( 422, 'ADMIN_RECURRING_FINE_RULE', oils_i18n_gettext( 422, 
    'ADMIN_RECURRING_FINE_RULE', 'ppl', 'description' )),
 ( 423, 'ADMIN_SERIAL_SUBSCRIPTION', oils_i18n_gettext( 423, 
    'ADMIN_SERIAL_SUBSCRIPTION', 'ppl', 'description' )),
 ( 424, 'ADMIN_STANDING_PENALTY', oils_i18n_gettext( 424, 
    'ADMIN_STANDING_PENALTY', 'ppl', 'description' )),
 ( 425, 'ADMIN_SURVEY', oils_i18n_gettext( 425, 
    'ADMIN_SURVEY', 'ppl', 'description' )),
 ( 426, 'ADMIN_USER_REQUEST_TYPE', oils_i18n_gettext( 426, 
    'ADMIN_USER_REQUEST_TYPE', 'ppl', 'description' )),
 ( 427, 'ADMIN_USER_SETTING_GROUP', oils_i18n_gettext( 427, 
    'ADMIN_USER_SETTING_GROUP', 'ppl', 'description' )),
 ( 428, 'ADMIN_USER_SETTING_TYPE', oils_i18n_gettext( 428, 
    'ADMIN_USER_SETTING_TYPE', 'ppl', 'description' )),
 ( 429, 'ADMIN_Z3950_SOURCE', oils_i18n_gettext( 429, 
    'ADMIN_Z3950_SOURCE', 'ppl', 'description' )),
 ( 430, 'CREATE_BIB_BTYPE', oils_i18n_gettext( 430, 
    'CREATE_BIB_BTYPE', 'ppl', 'description' )),
 ( 431, 'CREATE_BIBLIO_FINGERPRINT', oils_i18n_gettext( 431, 
    'CREATE_BIBLIO_FINGERPRINT', 'ppl', 'description' )),
 ( 432, 'CREATE_BIB_SOURCE', oils_i18n_gettext( 432, 
    'CREATE_BIB_SOURCE', 'ppl', 'description' )),
 ( 433, 'CREATE_BILLING_TYPE', oils_i18n_gettext( 433, 
    'CREATE_BILLING_TYPE', 'ppl', 'description' )),
 ( 434, 'CREATE_CN_BTYPE', oils_i18n_gettext( 434, 
    'CREATE_CN_BTYPE', 'ppl', 'description' )),
 ( 435, 'CREATE_COPY_BTYPE', oils_i18n_gettext( 435, 
    'CREATE_COPY_BTYPE', 'ppl', 'description' )),
 ( 436, 'CREATE_INVOICE', oils_i18n_gettext( 436, 
    'CREATE_INVOICE', 'ppl', 'description' )),
 ( 437, 'CREATE_INVOICE_ITEM_TYPE', oils_i18n_gettext( 437, 
    'CREATE_INVOICE_ITEM_TYPE', 'ppl', 'description' )),
 ( 438, 'CREATE_INVOICE_METHOD', oils_i18n_gettext( 438, 
    'CREATE_INVOICE_METHOD', 'ppl', 'description' )),
 ( 439, 'CREATE_MERGE_PROFILE', oils_i18n_gettext( 439, 
    'CREATE_MERGE_PROFILE', 'ppl', 'description' )),
 ( 440, 'CREATE_METABIB_CLASS', oils_i18n_gettext( 440, 
    'CREATE_METABIB_CLASS', 'ppl', 'description' )),
 ( 441, 'CREATE_METABIB_SEARCH_ALIAS', oils_i18n_gettext( 441, 
    'CREATE_METABIB_SEARCH_ALIAS', 'ppl', 'description' )),
 ( 442, 'CREATE_USER_BTYPE', oils_i18n_gettext( 442, 
    'CREATE_USER_BTYPE', 'ppl', 'description' )),
 ( 443, 'DELETE_BIB_BTYPE', oils_i18n_gettext( 443, 
    'DELETE_BIB_BTYPE', 'ppl', 'description' )),
 ( 444, 'DELETE_BIBLIO_FINGERPRINT', oils_i18n_gettext( 444, 
    'DELETE_BIBLIO_FINGERPRINT', 'ppl', 'description' )),
 ( 445, 'DELETE_BIB_SOURCE', oils_i18n_gettext( 445, 
    'DELETE_BIB_SOURCE', 'ppl', 'description' )),
 ( 446, 'DELETE_BILLING_TYPE', oils_i18n_gettext( 446, 
    'DELETE_BILLING_TYPE', 'ppl', 'description' )),
 ( 447, 'DELETE_CN_BTYPE', oils_i18n_gettext( 447, 
    'DELETE_CN_BTYPE', 'ppl', 'description' )),
 ( 448, 'DELETE_COPY_BTYPE', oils_i18n_gettext( 448, 
    'DELETE_COPY_BTYPE', 'ppl', 'description' )),
 ( 449, 'DELETE_INVOICE_ITEM_TYPE', oils_i18n_gettext( 449, 
    'DELETE_INVOICE_ITEM_TYPE', 'ppl', 'description' )),
 ( 450, 'DELETE_INVOICE_METHOD', oils_i18n_gettext( 450, 
    'DELETE_INVOICE_METHOD', 'ppl', 'description' )),
 ( 451, 'DELETE_MERGE_PROFILE', oils_i18n_gettext( 451, 
    'DELETE_MERGE_PROFILE', 'ppl', 'description' )),
 ( 452, 'DELETE_METABIB_CLASS', oils_i18n_gettext( 452, 
    'DELETE_METABIB_CLASS', 'ppl', 'description' )),
 ( 453, 'DELETE_METABIB_SEARCH_ALIAS', oils_i18n_gettext( 453, 
    'DELETE_METABIB_SEARCH_ALIAS', 'ppl', 'description' )),
 ( 454, 'DELETE_USER_BTYPE', oils_i18n_gettext( 454, 
    'DELETE_USER_BTYPE', 'ppl', 'description' )),
 ( 455, 'MANAGE_CLAIM', oils_i18n_gettext( 455, 
    'MANAGE_CLAIM', 'ppl', 'description' )),
 ( 456, 'UPDATE_BIB_BTYPE', oils_i18n_gettext( 456, 
    'UPDATE_BIB_BTYPE', 'ppl', 'description' )),
 ( 457, 'UPDATE_BIBLIO_FINGERPRINT', oils_i18n_gettext( 457, 
    'UPDATE_BIBLIO_FINGERPRINT', 'ppl', 'description' )),
 ( 458, 'UPDATE_BIB_SOURCE', oils_i18n_gettext( 458, 
    'UPDATE_BIB_SOURCE', 'ppl', 'description' )),
 ( 459, 'UPDATE_BILLING_TYPE', oils_i18n_gettext( 459, 
    'UPDATE_BILLING_TYPE', 'ppl', 'description' )),
 ( 460, 'UPDATE_CN_BTYPE', oils_i18n_gettext( 460, 
    'UPDATE_CN_BTYPE', 'ppl', 'description' )),
 ( 461, 'UPDATE_COPY_BTYPE', oils_i18n_gettext( 461, 
    'UPDATE_COPY_BTYPE', 'ppl', 'description' )),
 ( 462, 'UPDATE_INVOICE_ITEM_TYPE', oils_i18n_gettext( 462, 
    'UPDATE_INVOICE_ITEM_TYPE', 'ppl', 'description' )),
 ( 463, 'UPDATE_INVOICE_METHOD', oils_i18n_gettext( 463, 
    'UPDATE_INVOICE_METHOD', 'ppl', 'description' )),
 ( 464, 'UPDATE_MERGE_PROFILE', oils_i18n_gettext( 464, 
    'UPDATE_MERGE_PROFILE', 'ppl', 'description' )),
 ( 465, 'UPDATE_METABIB_CLASS', oils_i18n_gettext( 465, 
    'UPDATE_METABIB_CLASS', 'ppl', 'description' )),
 ( 466, 'UPDATE_METABIB_SEARCH_ALIAS', oils_i18n_gettext( 466, 
    'UPDATE_METABIB_SEARCH_ALIAS', 'ppl', 'description' )),
 ( 467, 'UPDATE_USER_BTYPE', oils_i18n_gettext( 467, 
    'UPDATE_USER_BTYPE', 'ppl', 'description' )),
 ( 468, 'user_request.create', oils_i18n_gettext( 468, 
    'user_request.create', 'ppl', 'description' )),
 ( 469, 'user_request.delete', oils_i18n_gettext( 469, 
    'user_request.delete', 'ppl', 'description' )),
 ( 470, 'user_request.update', oils_i18n_gettext( 470, 
    'user_request.update', 'ppl', 'description' )),
 ( 471, 'user_request.view', oils_i18n_gettext( 471, 
    'user_request.view', 'ppl', 'description' )),
 ( 472, 'VIEW_ACQ_FUND_ALLOCATION_PERCENT', oils_i18n_gettext( 472, 
    'VIEW_ACQ_FUND_ALLOCATION_PERCENT', 'ppl', 'description' )),
 ( 473, 'VIEW_CIRC_MATRIX_MATCHPOINT', oils_i18n_gettext( 473, 
    'VIEW_CIRC_MATRIX_MATCHPOINT', 'ppl', 'description' )),
 ( 474, 'VIEW_CLAIM', oils_i18n_gettext( 474, 
    'VIEW_CLAIM', 'ppl', 'description' )),
 ( 475, 'VIEW_GROUP_PENALTY_THRESHOLD', oils_i18n_gettext( 475, 
    'VIEW_GROUP_PENALTY_THRESHOLD', 'ppl', 'description' )),
 ( 476, 'VIEW_HOLD_MATRIX_MATCHPOINT', oils_i18n_gettext( 476, 
    'VIEW_HOLD_MATRIX_MATCHPOINT', 'ppl', 'description' )),
 ( 477, 'VIEW_INVOICE', oils_i18n_gettext( 477, 
    'VIEW_INVOICE', 'ppl', 'description' )),
 ( 478, 'VIEW_MERGE_PROFILE', oils_i18n_gettext( 478, 
    'VIEW_MERGE_PROFILE', 'ppl', 'description' )),
 ( 479, 'VIEW_SERIAL_SUBSCRIPTION', oils_i18n_gettext( 479, 
    'VIEW_SERIAL_SUBSCRIPTION', 'ppl', 'description' )),
 ( 480, 'VIEW_STANDING_PENALTY', oils_i18n_gettext( 480, 
    'VIEW_STANDING_PENALTY', 'ppl', 'description' )),
 ( 481, 'ADMIN_SERIAL_CAPTION_PATTERN', oils_i18n_gettext( 481, 
    'ADMIN_SERIAL_CAPTION_PATTERN', 'ppl', 'description' )),
 ( 482, 'ADMIN_SERIAL_DISTRIBUTION', oils_i18n_gettext( 482, 
    'ADMIN_SERIAL_DISTRIBUTION', 'ppl', 'description' )),
 ( 483, 'ADMIN_SERIAL_STREAM', oils_i18n_gettext( 483, 
    'ADMIN_SERIAL_STREAM', 'ppl', 'description' )),
 ( 484, 'RECEIVE_SERIAL', oils_i18n_gettext(484,
	'Receive serial items', 'ppl', 'description')),
 ( 485, 'CREATE_VOLUME_SUFFIX', oils_i18n_gettext(485,
    'Create suffix label definition.', 'ppl', 'description')),
 ( 486, 'UPDATE_VOLUME_SUFFIX', oils_i18n_gettext(486,
    'Update suffix label definition.', 'ppl', 'description')),
 ( 487, 'DELETE_VOLUME_SUFFIX', oils_i18n_gettext(487,
    'Delete suffix label definition.', 'ppl', 'description')),
 ( 488, 'CREATE_VOLUME_PREFIX', oils_i18n_gettext(488,
    'Create prefix label definition.', 'ppl', 'description')),
 ( 489, 'UPDATE_VOLUME_PREFIX', oils_i18n_gettext(489,
    'Update prefix label definition.', 'ppl', 'description')),
 ( 490, 'DELETE_VOLUME_PREFIX', oils_i18n_gettext(490,
    'Delete prefix label definition.', 'ppl', 'description')),
 ( 491, 'CREATE_MONOGRAPH_PART', oils_i18n_gettext(491,
    'Create monograph part definition.', 'ppl', 'description')),
 ( 492, 'UPDATE_MONOGRAPH_PART', oils_i18n_gettext(492,
    'Update monograph part definition.', 'ppl', 'description')),
 ( 493, 'DELETE_MONOGRAPH_PART', oils_i18n_gettext(493,
    'Delete monograph part definition.', 'ppl', 'description')),
 ( 494, 'ADMIN_CODED_VALUE', oils_i18n_gettext(494,
    'Create/Update/Delete SVF Record Attribute Coded Value Map', 'ppl', 'description')),
 ( 495, 'ADMIN_SERIAL_ITEM', oils_i18n_gettext(495,
    'Create/Retrieve/Update/Delete Serial Item', 'ppl', 'description')),
 ( 496, 'ADMIN_SVF', oils_i18n_gettext(496,
    'Create/Update/Delete SVF Record Attribute Defintion', 'ppl', 'description')),
 ( 497, 'CREATE_BIB_PTYPE', oils_i18n_gettext(497,
    'Create Bibliographic Record Peer Type', 'ppl', 'description')),
 ( 498, 'CREATE_PURCHASE_REQUEST', oils_i18n_gettext(498,
    'Create User Purchase Request', 'ppl', 'description')),
 ( 499, 'DELETE_BIB_PTYPE', oils_i18n_gettext(499,
    'Delete Bibliographic Record Peer Type', 'ppl', 'description')),
 ( 500, 'MAP_MONOGRAPH_PART', oils_i18n_gettext(500,
    'Create/Update/Delete Copy Monograph Part Map', 'ppl', 'description')),
 ( 501, 'MARK_ITEM_MISSING_PIECES', oils_i18n_gettext(501,
    'Allows the Mark Item Missing Pieces action.', 'ppl', 'description')),
 ( 502, 'UPDATE_BIB_PTYPE', oils_i18n_gettext(502,
    'Update Bibliographic Record Peer Type', 'ppl', 'description')),
 ( 503, 'UPDATE_HOLD_REQUEST_TIME', oils_i18n_gettext(503,
    'Allows editing of a hold''s request time, and/or its Cut-in-line/Top-of-queue flag.', 'ppl', 'description')),
 ( 504, 'UPDATE_PICKLIST', oils_i18n_gettext(504,
    'Allows update/re-use of an acquisitions pick/selection list.', 'ppl', 'description')),
 ( 505, 'UPDATE_WORKSTATION', oils_i18n_gettext(505,
    'Allows update of a workstation during workstation registration override.', 'ppl', 'description')),
 ( 506, 'VIEW_USER_SETTING_TYPE', oils_i18n_gettext(506,
    'Allows viewing of configurable user setting types.', 'ppl', 'description')),
 ( 507, 'ABORT_TRANSIT_ON_LOST', oils_i18n_gettext(507,
    'Allows a user to abort a transit on a copy with status of LOST', 'ppl', 'description')),
 ( 508, 'ABORT_TRANSIT_ON_MISSING', oils_i18n_gettext(508,
    'Allows a user to abort a transit on a copy with status of MISSING', 'ppl', 'description')),
 ( 509, 'TRANSIT_CHECKIN_INTERVAL_BLOCK.override', oils_i18n_gettext(509,
    'Allows a user to override the TRANSIT_CHECKIN_INTERVAL_BLOCK event', 'ppl', 'description')),
 ( 510, 'UPDATE_PATRON_COLLECTIONS_EXEMPT', oils_i18n_gettext(510,
    'Allows a user to indicate that a patron is exempt from collections processing', 'ppl', 'description')),
 ( 511, 'PERSISTENT_LOGIN', oils_i18n_gettext( 511,
    'Allows a user to authenticate and get a long-lived session (length configured in opensrf.xml)', 'ppl', 'description' )),
 ( 512, 'ACQ_INVOICE_REOPEN', oils_i18n_gettext( 512,
    'Allows a user to reopen an Acquisitions invoice', 'ppl', 'description' )),
 ( 513, 'DEBUG_CLIENT', oils_i18n_gettext( 513,
    'Allows a user to use debug functions in the staff client', 'ppl', 'description' )),
 ( 514, 'UPDATE_PATRON_ACTIVE_CARD', oils_i18n_gettext( 514,
    'Allows a user to manually adjust a patron''s active cards', 'ppl', 'description')),
 ( 515, 'UPDATE_PATRON_PRIMARY_CARD', oils_i18n_gettext( 515,
    'Allows a user to manually adjust a patron''s primary card', 'ppl', 'description')),
 ( 516, 'CREATE_REPORT_TEMPLATE', oils_i18n_gettext( 516,
    'Allows a user to create report templates', 'ppl', 'description' )),
 ( 517, 'COPY_HOLDS_FORCE', oils_i18n_gettext( 517, 
    'Allow a user to place a force hold on a specific copy', 'ppl', 'description' )),
 ( 518, 'COPY_HOLDS_RECALL', oils_i18n_gettext( 518, 
    'Allow a user to place a cataloging recall on a specific copy', 'ppl', 'description' )),
 ( 519, 'ADMIN_SMS_CARRIER', oils_i18n_gettext( 519,
    'Allows a user to add/create/delete SMS Carrier entries.', 'ppl', 'description' )),
 ( 520, 'COPY_DELETE_WARNING.override', oils_i18n_gettext( 520,
    'Allow a user to override warnings about deleting copies in problematic situations.', 'ppl', 'description' )),
 ( 521, 'IMPORT_ACQ_LINEITEM_BIB_RECORD_UPLOAD', oils_i18n_gettext( 521,
    'Allows a user to create new bibs directly from an ACQ MARC file upload', 'ppl', 'description' )),
 ( 522, 'IMPORT_AUTHORITY_MARC', oils_i18n_gettext( 522,
    'Allows a user to create new authority records', 'ppl', 'description' )),
 ( 523, 'ADMIN_TOOLBAR', oils_i18n_gettext( 523,
    'Allows a user to create, edit, and delete custom toolbars', 'ppl', 'description' )),
 ( 524, 'PLACE_UNFILLABLE_HOLD', oils_i18n_gettext( 524,
    'Allows a user to place a hold that cannot currently be filled.', 'ppl', 'description' )),
 ( 525, 'CREATE_PATRON_STAT_CAT_ENTRY_DEFAULT', oils_i18n_gettext( 525, 
    'User may set a default entry in a patron statistical category', 'ppl', 'description' )),
 ( 526, 'UPDATE_PATRON_STAT_CAT_ENTRY_DEFAULT', oils_i18n_gettext( 526, 
    'User may reset a default entry in a patron statistical category', 'ppl', 'description' )),
 ( 527, 'DELETE_PATRON_STAT_CAT_ENTRY_DEFAULT', oils_i18n_gettext( 527, 
    'User may unset a default entry in a patron statistical category', 'ppl', 'description' )),
 ( 528, 'ADMIN_ORG_UNIT_CUSTOM_TREE', oils_i18n_gettext( 528, 
    'User may update custom org unit trees', 'ppl', 'description' )),
 ( 529, 'ADMIN_IMPORT_MATCH_SET', oils_i18n_gettext( 529,
    'Allows a user to create/retrieve/update/delete vandelay match sets', 'ppl', 'description' )),
 ( 530, 'VIEW_IMPORT_MATCH_SET', oils_i18n_gettext( 530,
    'Allows a user to view vandelay match sets', 'ppl', 'description' )),
 ( 531, 'ADMIN_ADDRESS_ALERT', oils_i18n_gettext( 531,
    'Allows a user to create/retrieve/update/delete address alerts', 'ppl', 'description' )), 
 ( 532, 'VIEW_ADDRESS_ALERT', oils_i18n_gettext( 532,
    'Allows a user to view address alerts', 'ppl', 'description' )), 
 ( 533, 'ADMIN_COPY_LOCATION_GROUP', oils_i18n_gettext( 533,
    'Allows a user to create/retrieve/update/delete copy location groups', 'ppl', 'description' )), 
 ( 534, 'ADMIN_USER_ACTIVITY_TYPE', oils_i18n_gettext( 534,
    'Allows a user to create/retrieve/update/delete user activity types', 'ppl', 'description' )),
( 535, 'VIEW_TRIGGER_EVENT', oils_i18n_gettext( 535,
    'Allows a user to view circ- and hold-related action/trigger events', 'ppl', 'description')),
( 536, 'IMPORT_OVERLAY_COPY', oils_i18n_gettext( 536,
    'Allows a user to overlay copy data in MARC import', 'ppl', 'description')),
 ( 537, 'ADMIN_SEARCH_FILTER_GROUP', oils_i18n_gettext( 537,
    'Allows staff to manage search filter groups and entries', 'ppl', 'description' )),
 ( 538, 'VIEW_SEARCH_FILTER_GROUP', oils_i18n_gettext( 538,
    'Allows staff to view search filter groups and entries', 'ppl', 'description' )),
 ( 539, 'UPDATE_ORG_UNIT_SETTING.ui.hide_copy_editor_fields', oils_i18n_gettext( 539,
    'Allows staff to edit displayed copy editor fields', 'ppl', 'description' )),
 ( 540, 'ADMIN_TOOLBAR_FOR_ORG', oils_i18n_gettext( 540,
        'Allows a user to create, edit, and delete custom toolbars for org units', 'ppl', 'description')),
 ( 541, 'ADMIN_TOOLBAR_FOR_WORKSTATION', oils_i18n_gettext( 541,
        'Allows a user to create, edit, and delete custom toolbars for workstations', 'ppl', 'description')),
 ( 542, 'ADMIN_TOOLBAR_FOR_USER', oils_i18n_gettext( 542,
        'Allows a user to create, edit, and delete custom toolbars for users', 'ppl', 'description')),
 ( 543, 'URL_VERIFY', oils_i18n_gettext( 543, 
    'Allows a user to process and verify URLs', 'ppl', 'description')),
 ( 544, 'URL_VERIFY_UPDATE_SETTINGS', oils_i18n_gettext( 544, 
    'Allows a user to configure URL verification org unit settings', 'ppl', 'description')),
 ( 545, 'SAVED_FILTER_DIALOG_FILTERS', oils_i18n_gettext( 545,
    'Allows users to save and load sets of filters for filter dialogs, available in certain staff interfaces', 'ppl', 'description')),
 ( 546, 'ADMIN_HOLD_CAPTURE_SORT', oils_i18n_gettext( 546,
        'Allows a user to make changes to best-hold selection sort order', 'ppl', 'description')),
 ( 547, 'ACQ_ADD_LINEITEM_IDENTIFIER', oils_i18n_gettext(547,
        'When granted, newly added lineitem identifiers will propagate to linked bib records', 'ppl', 'description')),
 ( 548, 'ACQ_SET_LINEITEM_IDENTIFIER', oils_i18n_gettext(548,
        'Allows staff to change the lineitem identifier', 'ppl', 'description')),
 ( 549, 'COPY_STATUS_LONGOVERDUE.override', oils_i18n_gettext(549,
        'Allows the user to check-in long-overdue items, prompting ' ||
            'long-overdue check-in processing', 'ppl', 'code')), 
 ( 550, 'SET_CIRC_LONG_OVERDUE', oils_i18n_gettext(550,
        'Allows the user to mark a circulation as long-overdue', 'ppl', 'code')),
 ( 551, 'ADMIN_SERVER_ADDON_FOR_WORKSTATION', oils_i18n_gettext( 551,
        'Allows a user to specify which Server Add-ons get invoked at the current workstation', 'ppl', 'description')),
 ( 552, 'ADMIN_FLOAT_GROUPS', oils_i18n_gettext( 552,
    'Allows administration of floating groups', 'ppl', 'description' )),
 ( 553, 'UPDATE_ORG_UNIT_SETTING.circ.min_item_price', oils_i18n_gettext( 553,
    'UPDATE_ORG_UNIT_SETTING.circ.min_item_price', 'ppl', 'description' )),
 ( 554, 'UPDATE_ORG_UNIT_SETTING.circ.max_item_price', oils_i18n_gettext( 554,
    'UPDATE_ORG_UNIT_SETTING.circ.max_item_price', 'ppl', 'description' )),
 ( 555, 'group_application.user.staff.admin.system_admin', oils_i18n_gettext( 555, 
    'Allow a user to add/remove users to/from the "System Administrator" group', 'ppl', 'description' )),
 ( 556, 'group_application.user.staff.cat_admin', oils_i18n_gettext( 556, 
    'Allow a user to add/remove users to/from the "Cataloging Administrator" group', 'ppl', 'description' )),
 ( 557, 'group_application.user.staff.circ_admin', oils_i18n_gettext( 557, 
    'Allow a user to add/remove users to/from the "Circulation Administrator" group', 'ppl', 'description' )),
 ( 558, 'group_application.user.staff.data_review', oils_i18n_gettext( 558, 
    'Allow a user to add/remove users to/from the "Data Review" group', 'ppl', 'description' )),
 ( 559, 'group_application.user.staff.volunteers', oils_i18n_gettext( 559, 
    'Allow a user to add/remove users to/from the "Volunteers" group', 'ppl', 'description' )),
 (  560, 'TOTAL_HOLD_COPY_RATIO_EXCEEDED.override', oils_i18n_gettext( 560,
    'Override the TOTAL_HOLD_COPY_RATIO_EXCEEDED event', 'ppl', 'description')),
 (  561, 'AVAIL_HOLD_COPY_RATIO_EXCEEDED.override', oils_i18n_gettext( 561,
    'Override the AVAIL_HOLD_COPY_RATIO_EXCEEDED event', 'ppl', 'description')),
 ( 562, 'ADMIN_TAG_TABLE', oils_i18n_gettext( 562, 
    'Allow administration of MARC tag tables', 'ppl', 'description' )),
 ( 563, 'ADJUST_BILLS', oils_i18n_gettext( 563,
    'Allow a user to adjust a bill (generally to zero)', 'ppl', 'description' ))
;

SELECT SETVAL('permission.perm_list_id_seq'::TEXT, 1000);

INSERT INTO permission.grp_tree (id, name, parent, description, perm_interval, usergroup, application_perm) VALUES
	(1, oils_i18n_gettext(1, 'Users', 'pgt', 'name'), NULL, NULL, '3 years', FALSE, 'group_application.user');
INSERT INTO permission.grp_tree (id, name, parent, description, perm_interval, usergroup, application_perm) VALUES
	(2, oils_i18n_gettext(2, 'Patrons', 'pgt', 'name'), 1, NULL, '3 years', TRUE, 'group_application.user.patron');
INSERT INTO permission.grp_tree (id, name, parent, description, perm_interval, usergroup, application_perm) VALUES
	(3, oils_i18n_gettext(3, 'Staff', 'pgt', 'name'), 1, NULL, '3 years', FALSE, 'group_application.user.staff');
INSERT INTO permission.grp_tree (id, name, parent, description, perm_interval, usergroup, application_perm) VALUES
	(4, oils_i18n_gettext(4, 'Catalogers', 'pgt', 'name'), 3, NULL, '3 years', TRUE, 'group_application.user.staff.cat');
INSERT INTO permission.grp_tree (id, name, parent, description, perm_interval, usergroup, application_perm) VALUES
	(5, oils_i18n_gettext(5, 'Circulators', 'pgt', 'name'), 3, NULL, '3 years', TRUE, 'group_application.user.staff.circ');
INSERT INTO permission.grp_tree (id, name, parent, description, perm_interval, usergroup, application_perm) VALUES
	(6, oils_i18n_gettext(6, 'Acquisitions', 'pgt', 'name'), 3, NULL, '3 years', TRUE, 'group_application.user.staff.acq');
INSERT INTO permission.grp_tree (id, name, parent, description, perm_interval, usergroup, application_perm) VALUES
	(7, oils_i18n_gettext(7, 'Acquisitions Administrator', 'pgt', 'name'), 3, NULL, '3 years', TRUE, 'group_application.user.staff.acq_admin');
INSERT INTO permission.grp_tree (id, name, parent, description, perm_interval, usergroup, application_perm) VALUES
	(8, oils_i18n_gettext(8, 'Cataloging Administrator', 'pgt', 'name'), 3, NULL, '3 years', TRUE, 'group_application.user.staff.cat_admin');
INSERT INTO permission.grp_tree (id, name, parent, description, perm_interval, usergroup, application_perm) VALUES
	(9, oils_i18n_gettext(9, 'Circulation Administrator', 'pgt', 'name'), 3, NULL, '3 years', TRUE, 'group_application.user.staff.circ_admin');
INSERT INTO permission.grp_tree (id, name, parent, description, perm_interval, usergroup, application_perm) VALUES
	(10, oils_i18n_gettext(10, 'Local Administrator', 'pgt', 'name'), 3, 
	oils_i18n_gettext(10, 'Can do anything at the Branch level', 'pgt', 'description'), '3 years', TRUE, 'group_application.user.staff.admin.local_admin');
INSERT INTO permission.grp_tree (id, name, parent, description, perm_interval, usergroup, application_perm) VALUES
	(11, oils_i18n_gettext(11, 'Serials', 'pgt', 'name'), 3, 
	oils_i18n_gettext(11, 'Serials (includes admin features)', 'pgt', 'description'), '3 years', TRUE, 'group_application.user.staff.serials');
INSERT INTO permission.grp_tree (id, name, parent, description, perm_interval, usergroup, application_perm) VALUES
	(12, oils_i18n_gettext(12, 'System Administrator', 'pgt', 'name'), 3, 
	oils_i18n_gettext(12, 'Can do anything at the System level', 'pgt', 'description'), '3 years', TRUE, 'group_application.user.staff.admin.system_admin');
INSERT INTO permission.grp_tree (id, name, parent, description, perm_interval, usergroup, application_perm) VALUES
	(13, oils_i18n_gettext(13, 'Global Administrator', 'pgt', 'name'), 3, 
	oils_i18n_gettext(13, 'Can do anything at the Consortium level', 'pgt', 'description'), '3 years', TRUE, 'group_application.user.staff.admin.global_admin');
INSERT INTO permission.grp_tree (id, name, parent, description, perm_interval, usergroup, application_perm) VALUES
	(14, oils_i18n_gettext(14, 'Data Review', 'pgt', 'name'), 3, NULL, '3 years', TRUE, 'group_application.user.staff.data_review');
INSERT INTO permission.grp_tree (id, name, parent, description, perm_interval, usergroup, application_perm) VALUES
	(15, oils_i18n_gettext(15, 'Volunteers', 'pgt', 'name'), 3, NULL, '3 years', TRUE, 'group_application.user.staff.volunteers');

SELECT SETVAL('permission.grp_tree_id_seq'::TEXT, (SELECT MAX(id) FROM permission.grp_tree));

INSERT INTO permission.grp_penalty_threshold (grp,org_unit,penalty,threshold)
    VALUES (1,1,1,10.0);
INSERT INTO permission.grp_penalty_threshold (grp,org_unit,penalty,threshold)
    VALUES (1,1,2,10.0);
INSERT INTO permission.grp_penalty_threshold (grp,org_unit,penalty,threshold)
    VALUES (1,1,3,10.0);
INSERT INTO permission.grp_penalty_threshold (grp,org_unit,penalty,threshold)
    VALUES (1,1,5,10.0);

SELECT SETVAL('permission.grp_penalty_threshold_id_seq'::TEXT, (SELECT MAX(id) FROM permission.grp_penalty_threshold));


-- Add basic user permissions to the Users group

INSERT INTO permission.grp_perm_map (grp, perm, depth, grantable)
	SELECT
		pgt.id, perm.id, aout.depth, FALSE
	FROM
		permission.grp_tree pgt,
		permission.perm_list perm,
		actor.org_unit_type aout
	WHERE
		pgt.name = 'Users' AND
		aout.name = 'Consortium' AND
		perm.code IN (
			'COPY_CHECKIN',
			'CREATE_MY_CONTAINER',
			'CREATE_PURCHASE_REQUEST',
			'MR_HOLDS',
			'OPAC_LOGIN',
			'PERSISTENT_LOGIN',
			'RENEW_CIRC',
			'TITLE_HOLDS',
			'user_request.create'
		);


-- Add basic user permissions to the Data Review group

INSERT INTO permission.grp_perm_map (grp, perm, depth, grantable)
	SELECT
		pgt.id, perm.id, aout.depth, FALSE
	FROM
		permission.grp_tree pgt,
		permission.perm_list perm,
		actor.org_unit_type aout
	WHERE
		pgt.name = 'Data Review' AND
		aout.name = 'Consortium' AND
		perm.code IN (
			'CREATE_COPY_TRANSIT',
			'VIEW_BILLING_TYPE',
			'VIEW_CIRCULATIONS',
			'VIEW_COPY_NOTES',
			'VIEW_HOLD',
			'VIEW_ORG_SETTINGS',
			'VIEW_TITLE_NOTES',
			'VIEW_TRANSACTION',
			'VIEW_USER',
			'VIEW_USER_FINES_SUMMARY',
			'VIEW_USER_TRANSACTIONS',
			'VIEW_VOLUME_NOTES',
			'VIEW_ZIP_DATA');

INSERT INTO permission.grp_perm_map (grp, perm, depth, grantable)
	SELECT
		pgt.id, perm.id, aout.depth, FALSE
	FROM
		permission.grp_tree pgt,
		permission.perm_list perm,
		actor.org_unit_type aout
	WHERE
		pgt.name = 'Data Review' AND
		aout.name = 'System' AND
		perm.code IN (
			'COPY_CHECKOUT',
			'COPY_HOLDS',
			'CREATE_IN_HOUSE_USE',
			'CREATE_TRANSACTION',
			'OFFLINE_EXECUTE',
			'OFFLINE_VIEW',
			'STAFF_LOGIN',
			'VOLUME_HOLDS');


-- Add basic staff permissions to the Staff group

INSERT INTO permission.grp_perm_map (grp, perm, depth, grantable)
	SELECT
		pgt.id, perm.id, aout.depth, FALSE
	FROM
		permission.grp_tree pgt,
		permission.perm_list perm,
		actor.org_unit_type aout
	WHERE
		pgt.name = 'Staff' AND
		aout.name = 'Consortium' AND
		perm.code IN (
			'CREATE_CONTAINER',
			'CREATE_CONTAINER_ITEM',
			'CREATE_COPY_TRANSIT',
			'CREATE_HOLD_NOTIFICATION',
			'CREATE_TRANSACTION',
			'CREATE_TRANSIT',
			'DELETE_CONTAINER',
			'DELETE_CONTAINER_ITEM',
			'group_application.user',
			'group_application.user.patron',
			'REGISTER_WORKSTATION',
			'REMOTE_Z3950_QUERY',
			'REQUEST_HOLDS',
			'STAFF_LOGIN',
			'TRANSIT_COPY',
			'UPDATE_CONTAINER',
			'VIEW_CONTAINER',
			'VIEW_COPY_CHECKOUT_HISTORY',
			'VIEW_COPY_NOTES',
			'VIEW_HOLD',
			'VIEW_HOLD_NOTIFICATION',
			'VIEW_HOLD_PERMIT',
			'VIEW_PERM_GROUPS',
			'VIEW_PERMISSION',
			'VIEW_TITLE_NOTES',
			'VIEW_TRANSACTION',
			'VIEW_USER_SETTING_TYPE',
			'VIEW_VOLUME_NOTES'
		);

INSERT INTO permission.grp_perm_map (grp, perm, depth, grantable)
	SELECT
		pgt.id, perm.id, aout.depth, FALSE
	FROM
		permission.grp_tree pgt,
		permission.perm_list perm,
		actor.org_unit_type aout
	WHERE
		pgt.name = 'Staff' AND
		aout.name = 'System' AND
		perm.code IN (
			'CREATE_USER',
			'UPDATE_USER',
			'VIEW_BILLING_TYPE',
			'VIEW_CIRCULATIONS',
			'VIEW_ORG_SETTINGS',
			'VIEW_PERMIT_CHECKOUT',
			'VIEW_USER',
			'VIEW_USER_FINES_SUMMARY',
			'VIEW_USER_TRANSACTIONS');

INSERT INTO permission.grp_perm_map (grp, perm, depth, grantable)
	SELECT
		pgt.id, perm.id, aout.depth, FALSE
	FROM
		permission.grp_tree pgt,
		permission.perm_list perm,
		actor.org_unit_type aout
	WHERE
		pgt.name = 'Staff' AND
		aout.name = 'Branch' AND
		perm.code IN (
			'CANCEL_HOLDS',
			'COPY_CHECKOUT',
			'COPY_HOLDS',
			'COPY_TRANSIT_RECEIVE',
			'CREATE_BILL',
			'CREATE_IN_HOUSE_USE',
			'CREATE_PAYMENT',
			'RENEW_HOLD_OVERRIDE',
			'UPDATE_COPY',
			'UPDATE_VOLUME',
			'ADMIN_TOOLBAR',
			'VOLUME_HOLDS');


-- Add basic cataloguing permissions to the Catalogers group

INSERT INTO permission.grp_perm_map (grp, perm, depth, grantable)
	SELECT
		pgt.id, perm.id, aout.depth, FALSE
	FROM
		permission.grp_tree pgt,
		permission.perm_list perm,
		actor.org_unit_type aout
	WHERE
		pgt.name = 'Catalogers' AND
		aout.name = 'Consortium' AND
		perm.code IN (
			'ALLOW_ALT_TCN',
			'CREATE_BIB_IMPORT_QUEUE',
			'CREATE_IMPORT_ITEM',
			'CREATE_MARC',
			'CREATE_TITLE_NOTE',
			'DELETE_BIB_IMPORT_QUEUE',
			'DELETE_IMPORT_ITEM',
			'DELETE_RECORD',
			'DELETE_TITLE_NOTE',
			'IMPORT_ACQ_LINEITEM_BIB_RECORD',
			'IMPORT_MARC',
            'IMPORT_AUTHORITY_MARC',
			'MERGE_AUTH_RECORDS',
			'MERGE_BIB_RECORDS',
			'UPDATE_AUTHORITY_IMPORT_QUEUE',
			'UPDATE_AUTHORITY_RECORD_NOTE',
			'UPDATE_BIB_IMPORT_QUEUE',
			'UPDATE_MARC',
			'UPDATE_RECORD',
			'user_request.view',
			'VIEW_AUTHORITY_RECORD_NOTES');

INSERT INTO permission.grp_perm_map (grp, perm, depth, grantable)
	SELECT
		pgt.id, perm.id, aout.depth, FALSE
	FROM
		permission.grp_tree pgt,
		permission.perm_list perm,
		actor.org_unit_type aout
	WHERE
		pgt.name = 'Catalogers' AND
		aout.name = 'System' AND
		perm.code IN (
			'CREATE_COPY',
			'CREATE_COPY_NOTE',
			'CREATE_MFHD_RECORD',
			'CREATE_VOLUME',
			'CREATE_VOLUME_NOTE',
			'DELETE_COPY',
			'DELETE_COPY_NOTE',
			'DELETE_MFHD_RECORD',
			'DELETE_VOLUME',
			'DELETE_VOLUME_NOTE',
			'MAP_MONOGRAPH_PART',
			'MARK_ITEM_AVAILABLE',
			'MARK_ITEM_BINDERY',
			'MARK_ITEM_CHECKED_OUT',
			'MARK_ITEM_ILL',
			'MARK_ITEM_IN_PROCESS',
			'MARK_ITEM_IN_TRANSIT',
			'MARK_ITEM_LOST',
			'MARK_ITEM_MISSING',
			'MARK_ITEM_ON_HOLDS_SHELF',
			'MARK_ITEM_ON_ORDER',
			'MARK_ITEM_RESHELVING',
			'UPDATE_COPY',
			'UPDATE_COPY_NOTE',
			'UPDATE_IMPORT_ITEM',
			'UPDATE_MFHD_RECORD',
			'UPDATE_VOLUME',
			'UPDATE_VOLUME_NOTE',
			'VIEW_SERIAL_SUBSCRIPTION');


-- Add advanced cataloguing permissions to the Cataloging Admin group

INSERT INTO permission.grp_perm_map (grp, perm, depth, grantable)
	SELECT
		pgt.id, perm.id, aout.depth, TRUE
	FROM
		permission.grp_tree pgt,
		permission.perm_list perm,
		actor.org_unit_type aout
	WHERE
		pgt.name = 'Cataloging Administrator' AND
		aout.name = 'Consortium' AND
		perm.code IN (
			'ADMIN_IMPORT_ITEM_ATTR_DEF',
			'ADMIN_MERGE_PROFILE',
			'CREATE_AUTHORITY_IMPORT_IMPORT_DEF',
			'CREATE_BIB_IMPORT_FIELD_DEF',
			'CREATE_BIB_PTYPE',
			'CREATE_BIB_SOURCE',
			'CREATE_IMPORT_ITEM_ATTR_DEF',
			'CREATE_IMPORT_TRASH_FIELD',
			'CREATE_MERGE_PROFILE',
			'CREATE_MONOGRAPH_PART',
			'CREATE_VOLUME_PREFIX',
			'CREATE_VOLUME_SUFFIX',
			'DELETE_AUTHORITY_IMPORT_IMPORT_FIELD_DEF',
			'DELETE_BIB_PTYPE',
			'DELETE_BIB_SOURCE',
			'DELETE_IMPORT_ITEM_ATTR_DEF',
			'DELETE_IMPORT_TRASH_FIELD',
			'DELETE_MERGE_PROFILE',
			'DELETE_MONOGRAPH_PART',
			'DELETE_VOLUME_PREFIX',
			'DELETE_VOLUME_SUFFIX',
			'MAP_MONOGRAPH_PART',
			'UPDATE_AUTHORITY_IMPORT_IMPORT_FIELD_DEF',
			'UPDATE_BIB_IMPORT_IMPORT_FIELD_DEF',
			'UPDATE_BIB_PTYPE',
			'UPDATE_IMPORT_ITEM_ATTR_DEF',
			'UPDATE_IMPORT_TRASH_FIELD',
			'UPDATE_MERGE_PROFILE',
			'UPDATE_MONOGRAPH_PART',
			'UPDATE_VOLUME_PREFIX',
			'UPDATE_VOLUME_SUFFIX'
		);

INSERT INTO permission.grp_perm_map (grp, perm, depth, grantable)
	SELECT
		pgt.id, perm.id, aout.depth, TRUE
	FROM
		permission.grp_tree pgt,
		permission.perm_list perm,
		actor.org_unit_type aout
	WHERE
		pgt.name = 'Cataloging Administrator' AND
		aout.name = 'System' AND
		perm.code IN (
			'CREATE_COPY_STAT_CAT',
			'CREATE_COPY_STAT_CAT_ENTRY',
			'CREATE_COPY_STAT_CAT_ENTRY_MAP',
			'RUN_REPORTS',
			'CREATE_REPORT_TEMPLATE',
			'SHARE_REPORT_FOLDER',
			'UPDATE_COPY_LOCATION',
			'UPDATE_COPY_STAT_CAT',
			'UPDATE_COPY_STAT_CAT_ENTRY',
			'VIEW_REPORT_OUTPUT');


-- Add basic circulation permissions to the Circulators group

INSERT INTO permission.grp_perm_map (grp, perm, depth, grantable)
	SELECT
		pgt.id, perm.id, aout.depth, FALSE
	FROM
		permission.grp_tree pgt,
		permission.perm_list perm,
		actor.org_unit_type aout
	WHERE
		pgt.name = 'Circulators' AND
		aout.name = 'Branch' AND
		perm.code IN (
			'ADJUST_BILLS',
			'ADMIN_BOOKING_RESERVATION',
			'ADMIN_BOOKING_RESOURCE',
			'ADMIN_BOOKING_RESOURCE_ATTR',
			'ADMIN_BOOKING_RESOURCE_ATTR_MAP',
			'ADMIN_BOOKING_RESOURCE_ATTR_VALUE',
			'ADMIN_BOOKING_RESOURCE_TYPE',
			'ASSIGN_GROUP_PERM',
			'MARK_ITEM_AVAILABLE',
			'MARK_ITEM_BINDERY',
			'MARK_ITEM_CHECKED_OUT',
			'MARK_ITEM_ILL',
			'MARK_ITEM_IN_PROCESS',
			'MARK_ITEM_IN_TRANSIT',
			'MARK_ITEM_LOST',
			'MARK_ITEM_MISSING',
			'MARK_ITEM_MISSING_PIECES',
			'MARK_ITEM_ON_HOLDS_SHELF',
			'MARK_ITEM_ON_ORDER',
			'MARK_ITEM_RESHELVING',
			'OFFLINE_UPLOAD',
			'OFFLINE_VIEW',
			'REMOVE_USER_GROUP_LINK',
			'SET_CIRC_CLAIMS_RETURNED',
			'SET_CIRC_CLAIMS_RETURNED.override',
			'SET_CIRC_LOST',
			'SET_CIRC_MISSING',
			'UPDATE_BILL_NOTE',
			'UPDATE_PATRON_CLAIM_NEVER_CHECKED_OUT_COUNT',
			'UPDATE_PATRON_CLAIM_RETURN_COUNT',
			'UPDATE_PAYMENT_NOTE',
			'UPDATE_PICKUP_LIB FROM_TRANSIT',
			'UPDATE_PICKUP_LIB_FROM_HOLDS_SHELF',
			'VIEW_GROUP_PENALTY_THRESHOLD',
			'VIEW_STANDING_PENALTY',
			'VOID_BILLING',
			'VOLUME_HOLDS');

INSERT INTO permission.grp_perm_map (grp, perm, depth, grantable)
	SELECT
		pgt.id, perm.id, aout.depth, FALSE
	FROM
		permission.grp_tree pgt,
		permission.perm_list perm,
		actor.org_unit_type aout
	WHERE
		pgt.name = 'Circulators' AND
		aout.name = 'System' AND
		perm.code IN (
			'ABORT_REMOTE_TRANSIT',
			'ABORT_TRANSIT',
			'CAPTURE_RESERVATION',
			'CIRC_CLAIMS_RETURNED.override',
			'CIRC_EXCEEDS_COPY_RANGE.override',
			'CIRC_OVERRIDE_DUE_DATE',
			'CIRC_PERMIT_OVERRIDE',
			'COPY_ALERT_MESSAGE.override',
			'COPY_BAD_STATUS.override',
			'COPY_CIRC_NOT_ALLOWED.override',
			'COPY_IS_REFERENCE.override',
			'COPY_NEEDED_FOR_HOLD.override',
			'COPY_NOT_AVAILABLE.override',
			'COPY_STATUS_LOST.override',
			'COPY_STATUS_MISSING.override',
			'CREATE_DUPLICATE_HOLDS',
			'CREATE_USER_GROUP_LINK',
			'DELETE_TRANSIT',
			'HOLD_EXISTS.override',
			'HOLD_ITEM_CHECKED_OUT.override',
			'ISSUANCE_HOLDS',
			'ITEM_AGE_PROTECTED.override',
			'ITEM_ON_HOLDS_SHELF.override',
			'MAX_RENEWALS_REACHED.override',
			'OVERRIDE_HOLD_HAS_LOCAL_COPY',
			'PATRON_EXCEEDS_CHECKOUT_COUNT.override',
			'PATRON_EXCEEDS_FINES.override',
			'PATRON_EXCEEDS_OVERDUE_COUNT.override',
			'RETRIEVE_RESERVATION_PULL_LIST',
			'UPDATE_HOLD');


-- Add advanced circulation permissions to the Circulation Admin group

INSERT INTO permission.grp_perm_map (grp, perm, depth, grantable)
	SELECT
		pgt.id, perm.id, aout.depth, TRUE
	FROM
		permission.grp_tree pgt,
		permission.perm_list perm,
		actor.org_unit_type aout
	WHERE
		pgt.name = 'Circulation Administrator' AND
		aout.name = 'Branch' AND
		perm.code IN (
			'DELETE_USER');

INSERT INTO permission.grp_perm_map (grp, perm, depth, grantable)
	SELECT
		pgt.id, perm.id, aout.depth, TRUE
	FROM
		permission.grp_tree pgt,
		permission.perm_list perm,
		actor.org_unit_type aout
	WHERE
		pgt.name = 'Circulation Administrator' AND
		aout.name = 'Consortium' AND
		perm.code IN (
			'ADMIN_MAX_FINE_RULE',
			'CREATE_CIRC_DURATION',
			'DELETE_CIRC_DURATION',
			'MARK_ITEM_MISSING_PIECES',
			'UPDATE_CIRC_DURATION',
			'UPDATE_HOLD_REQUEST_TIME',
			'UPDATE_NET_ACCESS_LEVEL',
			'VIEW_CIRC_MATRIX_MATCHPOINT',
            'ABORT_TRANSIT_ON_LOST', 
            'ABORT_TRANSIT_ON_MISSING',
            'UPDATE_PATRON_COLLECTIONS_EXEMPT',
			'VIEW_HOLD_MATRIX_MATCHPOINT');

INSERT INTO permission.grp_perm_map (grp, perm, depth, grantable)
	SELECT
		pgt.id, perm.id, aout.depth, TRUE
	FROM
		permission.grp_tree pgt,
		permission.perm_list perm,
		actor.org_unit_type aout
	WHERE
		pgt.name = 'Circulation Administrator' AND
		aout.name = 'System' AND
		perm.code IN (
			'ADJUST_BILLS',
			'ADMIN_BOOKING_RESERVATION',
			'ADMIN_BOOKING_RESERVATION_ATTR_MAP',
			'ADMIN_BOOKING_RESERVATION_ATTR_VALUE_MAP',
			'ADMIN_BOOKING_RESOURCE',
			'ADMIN_BOOKING_RESOURCE_ATTR',
			'ADMIN_BOOKING_RESOURCE_ATTR_MAP',
			'ADMIN_BOOKING_RESOURCE_ATTR_VALUE',
			'ADMIN_BOOKING_RESOURCE_TYPE',
			'ADMIN_COPY_LOCATION_ORDER',
			'ADMIN_HOLD_CANCEL_CAUSE',
			'ASSIGN_GROUP_PERM',
			'BAR_PATRON',
			'COPY_HOLDS',
			'COPY_TRANSIT_RECEIVE',
			'CREATE_BILL',
			'CREATE_BILLING_TYPE',
			'CREATE_NON_CAT_TYPE',
			'CREATE_PATRON_STAT_CAT',
			'CREATE_PATRON_STAT_CAT_ENTRY',
			'CREATE_PATRON_STAT_CAT_ENTRY_DEFAULT',
			'CREATE_PATRON_STAT_CAT_ENTRY_MAP',
			'CREATE_USER_GROUP_LINK',
			'DELETE_BILLING_TYPE',
			'DELETE_NON_CAT_TYPE',
			'DELETE_PATRON_STAT_CAT',
			'DELETE_PATRON_STAT_CAT_ENTRY',
			'DELETE_PATRON_STAT_CAT_ENTRY_DEFAULT',
			'DELETE_PATRON_STAT_CAT_ENTRY_MAP',
			'DELETE_TRANSIT',
			'group_application.user.staff',
			'MANAGE_BAD_DEBT',
			'MARK_ITEM_AVAILABLE',
			'MARK_ITEM_BINDERY',
			'MARK_ITEM_CHECKED_OUT',
			'MARK_ITEM_ILL',
			'MARK_ITEM_IN_PROCESS',
			'MARK_ITEM_IN_TRANSIT',
			'MARK_ITEM_LOST',
			'MARK_ITEM_MISSING',
			'MARK_ITEM_ON_HOLDS_SHELF',
			'MARK_ITEM_ON_ORDER',
			'MARK_ITEM_RESHELVING',
			'MERGE_USERS',
			'money.collections_tracker.create',
			'money.collections_tracker.delete',
			'OFFLINE_EXECUTE',
			'OFFLINE_UPLOAD',
			'OFFLINE_VIEW',
			'REMOVE_USER_GROUP_LINK',
			'SET_CIRC_CLAIMS_RETURNED',
			'SET_CIRC_CLAIMS_RETURNED.override',
			'SET_CIRC_LOST',
			'SET_CIRC_MISSING',
			'UNBAR_PATRON',
			'UPDATE_BILL_NOTE',
			'UPDATE_NON_CAT_TYPE',
			'UPDATE_PATRON_CLAIM_NEVER_CHECKED_OUT_COUNT',
			'UPDATE_PATRON_CLAIM_RETURN_COUNT',
			'UPDATE_PICKUP_LIB_FROM_HOLDS_SHELF',
			'UPDATE_PICKUP_LIB_FROM_TRANSIT',
			'UPDATE_USER',
			'VIEW_REPORT_OUTPUT',
			'VIEW_STANDING_PENALTY',
			'VOID_BILLING',
            'TRANSIT_CHECKIN_INTERVAL_BLOCK.override',
			'VOLUME_HOLDS');


-- Add basic sys admin permissions to the Local Administrator group

INSERT INTO permission.grp_perm_map (grp, perm, depth, grantable)
	SELECT
		pgt.id, perm.id, aout.depth, TRUE
	FROM
		permission.grp_tree pgt,
		permission.perm_list perm,
		actor.org_unit_type aout
	WHERE
		pgt.name = 'Local Administrator' AND
		aout.name = 'Branch' AND
		perm.code IN (
			'EVERYTHING');


-- Add administration permissions to the System Administrator group

INSERT INTO permission.grp_perm_map (grp, perm, depth, grantable)
	SELECT
		pgt.id, perm.id, aout.depth, TRUE
	FROM
		permission.grp_tree pgt,
		permission.perm_list perm,
		actor.org_unit_type aout
	WHERE
		pgt.name = 'System Administrator' AND
		aout.name = 'System' AND
		perm.code IN (
			'EVERYTHING');

INSERT INTO permission.grp_perm_map (grp, perm, depth, grantable)
	SELECT
		pgt.id, perm.id, aout.depth, FALSE
	FROM
		permission.grp_tree pgt,
		permission.perm_list perm,
		actor.org_unit_type aout
	WHERE
		pgt.name = 'System Administrator' AND
		aout.name = 'Consortium' AND
		perm.code ~ '^VIEW_TRIGGER';


-- Add administration permissions to the Global Administrator group

INSERT INTO permission.grp_perm_map (grp, perm, depth, grantable)
	SELECT
		pgt.id, perm.id, aout.depth, TRUE
	FROM
		permission.grp_tree pgt,
		permission.perm_list perm,
		actor.org_unit_type aout
	WHERE
		pgt.name = 'Global Administrator' AND
		aout.name = 'Consortium' AND
		perm.code IN (
			'EVERYTHING');


-- Add basic acquisitions permissions to the Acquisitions group

SELECT SETVAL('permission.grp_perm_map_id_seq'::TEXT, (SELECT MAX(id) FROM permission.grp_perm_map));

INSERT INTO permission.grp_perm_map (grp, perm, depth, grantable)
	SELECT
		pgt.id, perm.id, aout.depth, FALSE
	FROM
		permission.grp_tree pgt,
		permission.perm_list perm,
		actor.org_unit_type aout
	WHERE
		pgt.name = 'Acquisitions' AND
		aout.name = 'Consortium' AND
		perm.code IN (
			'ALLOW_ALT_TCN',
			'CREATE_BIB_IMPORT_QUEUE',
			'CREATE_IMPORT_ITEM',
			'CREATE_INVOICE',
			'CREATE_MARC',
			'CREATE_PICKLIST',
			'CREATE_PURCHASE_ORDER',
			'DELETE_BIB_IMPORT_QUEUE',
			'DELETE_IMPORT_ITEM',
			'DELETE_RECORD',
			'DELETE_VOLUME',
			'DELETE_VOLUME_NOTE',
			'GENERAL_ACQ',
			'IMPORT_ACQ_LINEITEM_BIB_RECORD',
			'IMPORT_MARC',
			'MANAGE_CLAIM',
			'MANAGE_FUND',
			'MANAGE_FUNDING_SOURCE',
			'MANAGE_PROVIDER',
			'MARK_ITEM_AVAILABLE',
			'MARK_ITEM_BINDERY',
			'MARK_ITEM_CHECKED_OUT',
			'MARK_ITEM_ILL',
			'MARK_ITEM_IN_PROCESS',
			'MARK_ITEM_IN_TRANSIT',
			'MARK_ITEM_LOST',
			'MARK_ITEM_MISSING',
			'MARK_ITEM_ON_HOLDS_SHELF',
			'MARK_ITEM_ON_ORDER',
			'MARK_ITEM_RESHELVING',
			'RECEIVE_PURCHASE_ORDER',
			'UPDATE_BATCH_COPY',
			'UPDATE_BIB_IMPORT_QUEUE',
			'UPDATE_COPY',
			'UPDATE_FUND',
			'UPDATE_FUND_ALLOCATION',
			'UPDATE_FUNDING_SOURCE',
			'UPDATE_IMPORT_ITEM',
			'UPDATE_MARC',
			'UPDATE_PICKLIST',
			'UPDATE_RECORD',
			'UPDATE_VOLUME',
			'user_request.delete',
			'user_request.update',
			'user_request.view',
			'VIEW_ACQ_FUND_ALLOCATION_PERCENT',
			'VIEW_ACQ_FUNDING_SOURCE',
			'VIEW_FUND',
			'VIEW_FUND_ALLOCATION',
			'VIEW_FUNDING_SOURCE',
			'VIEW_HOLDS',
			'VIEW_INVOICE',
			'VIEW_ORG_SETTINGS',
			'VIEW_PICKLIST',
			'VIEW_PROVIDER',
			'VIEW_PURCHASE_ORDER',
			'VIEW_REPORT_OUTPUT');


-- Add acquisitions administration permissions to the Acquisitions Admin group

INSERT INTO permission.grp_perm_map (grp, perm, depth, grantable)
	SELECT
		pgt.id, perm.id, aout.depth, TRUE
	FROM
		permission.grp_tree pgt,
		permission.perm_list perm,
		actor.org_unit_type aout
	WHERE
		pgt.name = 'Acquisitions Administrator' AND
		aout.name = 'Consortium' AND
		perm.code IN (
			'ACQ_INVOICE_REOPEN',
			'ACQ_XFER_MANUAL_DFUND_AMOUNT',
			'ADMIN_ACQ_CANCEL_CAUSE',
			'ADMIN_ACQ_CLAIM',
			'ADMIN_ACQ_CLAIM_EVENT_TYPE',
			'ADMIN_ACQ_CLAIM_TYPE',
			'ADMIN_ACQ_DISTRIB_FORMULA',
			'ADMIN_ACQ_FISCAL_YEAR',
			'ADMIN_ACQ_FUND',
			'ADMIN_ACQ_FUND_ALLOCATION_PERCENT',
			'ADMIN_ACQ_FUND_TAG',
			'ADMIN_ACQ_LINE_ITEM_ALERT_TEXT',
			'ADMIN_CLAIM_POLICY',
			'ADMIN_CURRENCY_TYPE',
			'ADMIN_FUND',
			'ADMIN_FUNDING_SOURCE',
			'ADMIN_INVOICE',
			'ADMIN_INVOICE_METHOD',
			'ADMIN_INVOICE_PAYMENT_METHOD',
			'ADMIN_LINEITEM_MARC_ATTR_DEF',
			'ADMIN_PROVIDER',
			'ADMIN_USER_REQUEST_TYPE',
			'CREATE_ACQ_FUNDING_SOURCE',
			'CREATE_FUND',
			'CREATE_FUND_ALLOCATION',
			'CREATE_FUNDING_SOURCE',
			'CREATE_INVOICE_ITEM_TYPE',
			'CREATE_INVOICE_METHOD',
			'CREATE_PROVIDER',
			'DELETE_ACQ_FUNDING_SOURCE',
			'DELETE_FUND',
			'DELETE_FUND_ALLOCATION',
			'DELETE_FUNDING_SOURCE',
			'DELETE_INVOICE_ITEM_TYPE',
			'DELETE_INVOICE_METHOD',
			'DELETE_PROVIDER',
			'RUN_REPORTS',
			'CREATE_REPORT_TEMPLATE',
			'SHARE_REPORT_FOLDER',
			'UPDATE_ACQ_FUNDING_SOURCE',
			'UPDATE_INVOICE_ITEM_TYPE',
			'UPDATE_INVOICE_METHOD',
			'UPDATE_PICKLIST'
		);

-- Add serials permissions to the Serials group

INSERT INTO permission.grp_perm_map (grp, perm, depth, grantable)
	SELECT
		pgt.id, perm.id, aout.depth, FALSE
	FROM
		permission.grp_tree pgt,
		permission.perm_list perm,
		actor.org_unit_type aout
	WHERE
		pgt.name = 'Serials' AND
		aout.name = 'System' AND
		perm.code IN (
			'ADMIN_ASSET_COPY_TEMPLATE',
			'ADMIN_SERIAL_CAPTION_PATTERN',
			'ADMIN_SERIAL_DISTRIBUTION',
			'ADMIN_SERIAL_ITEM',
			'ADMIN_SERIAL_STREAM',
			'ADMIN_SERIAL_SUBSCRIPTION',
			'ISSUANCE_HOLDS',
			'RECEIVE_SERIAL');


-- Add basic staff permissions to the Volunteers group

INSERT INTO permission.grp_perm_map (grp, perm, depth, grantable)
	SELECT
		pgt.id, perm.id, aout.depth, FALSE
	FROM
		permission.grp_tree pgt,
		permission.perm_list perm,
		actor.org_unit_type aout
	WHERE
		pgt.name = 'Volunteers' AND
		aout.name = 'Branch' AND
		perm.code IN (
			'COPY_CHECKOUT',
			'CREATE_BILL',
			'CREATE_IN_HOUSE_USE',
			'CREATE_PAYMENT',
			'VIEW_BILLING_TYPE',
			'VIEW_CIRCS',
			'VIEW_COPY_CHECKOUT',
			'VIEW_HOLD',
			'VIEW_TITLE_HOLDS',
			'VIEW_TRANSACTION',
			'VIEW_USER',
			'VIEW_USER_FINES_SUMMARY',
			'VIEW_USER_TRANSACTIONS');

INSERT INTO permission.grp_perm_map (grp, perm, depth, grantable)
	SELECT
		pgt.id, perm.id, aout.depth, FALSE
	FROM
		permission.grp_tree pgt,
		permission.perm_list perm,
		actor.org_unit_type aout
	WHERE
		pgt.name = 'Volunteers' AND
		aout.name = 'Consortium' AND
		perm.code IN (
			'CREATE_COPY_TRANSIT',
			'CREATE_TRANSACTION',
			'CREATE_TRANSIT',
			'STAFF_LOGIN',
			'TRANSIT_COPY',
			'VIEW_ORG_SETTINGS');


-- Admin user account
INSERT INTO actor.passwd_type 
    (code, name, login, crypt_algo, iter_count) 
    VALUES ('main', 'Main Login Password', TRUE, 'bf', 10);

INSERT INTO actor.usr ( profile, card, usrname, passwd, first_given_name, family_name, dob, master_account, super_user, ident_type, ident_value, home_ou ) VALUES ( 1, 1, md5(random()::text), md5(random()::text), 'Administrator', 'System Account', '1979-01-22', TRUE, TRUE, 1, 'identification', 1 );

-- Admin user barcode
INSERT INTO actor.card (usr, barcode) VALUES (1,md5(random()::text));
UPDATE actor.usr SET card = (SELECT currval('actor.card_id_seq')) WHERE id = 1;

-- Admin user permissions
INSERT INTO permission.usr_perm_map (usr,perm,depth) VALUES (1,-1,0);

-- Set a work_ou for the Administrator user
INSERT INTO permission.usr_work_ou_map (usr, work_ou) VALUES (1, 1);

--010.schema.biblio.sql:
INSERT INTO biblio.record_entry VALUES (-1,1,1,1,-1,NOW(),NOW(),FALSE,FALSE,'','AUTOGEN','-1','<record xmlns="http://www.loc.gov/MARC21/slim"/>','FOO');

--040.schema.asset.sql:
INSERT INTO asset.copy_location (id, name,owning_lib) VALUES (1, oils_i18n_gettext(1, 'Stacks', 'acpl', 'name'),1);
SELECT SETVAL('asset.copy_location_id_seq'::TEXT, 100);

INSERT INTO asset.call_number_suffix (id, owning_lib, label) VALUES (-1, 1, '');
INSERT INTO asset.call_number_prefix (id, owning_lib, label) VALUES (-1, 1, '');
INSERT INTO asset.call_number VALUES (-1,1,NOW(),1,NOW(),-1,1,'UNCATALOGED');

--090.schema.action.sql
INSERT INTO action.hold_request_cancel_cause (id,label) VALUES (1, oils_i18n_gettext(1, 'Untargeted expiration', 'ahrcc', 'label'));
INSERT INTO action.hold_request_cancel_cause (id,label) VALUES (2, oils_i18n_gettext(2, 'Hold Shelf expiration', 'ahrcc', 'label'));
INSERT INTO action.hold_request_cancel_cause (id,label) VALUES (3, oils_i18n_gettext(3, 'Patron via phone', 'ahrcc', 'label'));
INSERT INTO action.hold_request_cancel_cause (id,label) VALUES (4, oils_i18n_gettext(4, 'Patron in person', 'ahrcc', 'label'));
INSERT INTO action.hold_request_cancel_cause (id,label) VALUES (5, oils_i18n_gettext(5, 'Staff forced', 'ahrcc', 'label'));
INSERT INTO action.hold_request_cancel_cause (id,label) VALUES (6, oils_i18n_gettext(6, 'Patron via OPAC', 'ahrcc', 'label'));
INSERT INTO action.hold_request_cancel_cause (id,label) VALUES (7, oils_i18n_gettext(7, 'Patron via SIP', 'ahrcc', 'label'));
SELECT SETVAL('action.hold_request_cancel_cause_id_seq', 100);


-- circ matrix
INSERT INTO config.circ_matrix_matchpoint (org_unit,grp,circulate,duration_rule,recurring_fine_rule,max_fine_rule) VALUES (1,1,true,11,1,1);

INSERT INTO config.circ_matrix_weights(name, org_unit, grp, circ_modifier, copy_location, marc_type, marc_form, marc_bib_level, marc_vr_format, copy_circ_lib, copy_owning_lib, user_home_ou, ref_flag, juvenile_flag, is_renewal, usr_age_upper_bound, usr_age_lower_bound, item_age) VALUES 
    ('Default', 10.0, 11.0, 5.0, 5.0, 4.0, 3.0, 2.0, 2.0, 8.0, 8.0, 8.0, 1.0, 6.0, 7.0, 0.0, 0.0, 0.0),
    ('Org_Unit_First', 11.0, 10.0, 5.0, 5.0, 4.0, 3.0, 2.0, 2.0, 8.0, 8.0, 8.0, 1.0, 6.0, 7.0, 0.0, 0.0, 0.0),
    ('Item_Owner_First', 8.0, 8.0, 5.0, 5.0, 4.0, 3.0, 2.0, 2.0, 10.0, 11.0, 8.0, 1.0, 6.0, 7.0, 0.0, 0.0, 0.0),
    ('All_Equal', 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);

-- hold matrix - 110.hold_matrix.sql:
INSERT INTO config.hold_matrix_matchpoint (requestor_grp) VALUES (1);

INSERT INTO config.hold_matrix_weights(name, user_home_ou, request_ou, pickup_ou, item_owning_ou, item_circ_ou, usr_grp, requestor_grp, circ_modifier, marc_type, marc_form, marc_bib_level, marc_vr_format, juvenile_flag, ref_flag, item_age) VALUES
    ('Default', 5.0, 5.0, 5.0, 5.0, 5.0, 7.0, 8.0, 4.0, 3.0, 2.0, 1.0, 1.0, 4.0, 0.0, 0.0),
    ('Item_Owner_First', 5.0, 5.0, 5.0, 8.0, 7.0, 5.0, 5.0, 4.0, 3.0, 2.0, 1.0, 1.0, 4.0, 0.0, 0.0),
    ('User_Before_Requestor', 5.0, 5.0, 5.0, 5.0, 5.0, 8.0, 7.0, 4.0, 3.0, 2.0, 1.0, 1.0, 4.0, 0.0, 0.0),
    ('All_Equal', 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);

-- dynamic weight associations
INSERT INTO config.weight_assoc(active, org_unit, circ_weights, hold_weights) VALUES
    (true, 1, 1, 1);

-- User setting types
INSERT INTO config.usr_setting_type (name,opac_visible,label,description,datatype)
    VALUES ('opac.default_font', TRUE,
    oils_i18n_gettext('opac.default_font', 'OPAC Font Size', 'cust', 'label'),
    oils_i18n_gettext('opac.default_font', 'OPAC Font Size', 'cust', 'description'),
    'string');

INSERT INTO config.usr_setting_type (name,opac_visible,label,description,datatype)
    VALUES ('opac.default_search_depth', TRUE,
    oils_i18n_gettext('opac.default_search_depth', 'OPAC Search Depth', 'cust', 'label'),
    oils_i18n_gettext('opac.default_search_depth', 'OPAC Search Depth', 'cust', 'description'),
    'integer');

INSERT INTO config.usr_setting_type (name,opac_visible,label,description,datatype)
    VALUES ('opac.default_search_location', TRUE,
    oils_i18n_gettext('opac.default_search_location', 'OPAC Search Location', 'cust', 'label'),
    oils_i18n_gettext('opac.default_search_location', 'OPAC Search Location', 'cust', 'description'),
    'integer');

INSERT INTO config.usr_setting_type (name,opac_visible,label,description,datatype)
    VALUES ('opac.hits_per_page', TRUE,
    oils_i18n_gettext('opac.hits_per_page', 'Hits per Page', 'cust', 'label'),
    oils_i18n_gettext('opac.hits_per_page', 'Hits per Page', 'cust', 'description'),
    'string');

INSERT INTO config.usr_setting_type (name,opac_visible,label,description,datatype)
    VALUES ('opac.hold_notify', TRUE,
    oils_i18n_gettext('opac.hold_notify', 'Hold Notification Format', 'cust', 'label'),
    oils_i18n_gettext('opac.hold_notify', 'Hold Notification Format', 'cust', 'description'),
    'string');

INSERT INTO config.usr_setting_type (name,opac_visible,label,description,datatype)
    VALUES ('staff_client.catalog.record_view.default', TRUE,
    oils_i18n_gettext('staff_client.catalog.record_view.default', 'Default Record View', 'cust', 'label'),
    oils_i18n_gettext('staff_client.catalog.record_view.default', 'Default Record View', 'cust', 'description'),
    'string');

INSERT INTO config.usr_setting_type (name,opac_visible,label,description,datatype)
    VALUES ('staff_client.copy_editor.templates', TRUE,
    oils_i18n_gettext('staff_client.copy_editor.templates', 'Copy Editor Template', 'cust', 'label'),
    oils_i18n_gettext('staff_client.copy_editor.templates', 'Copy Editor Template', 'cust', 'description'),
    'object');

INSERT INTO config.usr_setting_type (name,opac_visible,label,description,datatype)
    VALUES ('circ.holds_behind_desk', FALSE,
    oils_i18n_gettext('circ.holds_behind_desk', 'Hold is behind Circ Desk', 'cust', 'label'),
    oils_i18n_gettext('circ.holds_behind_desk', 'Hold is behind Circ Desk', 'cust', 'description'),
    'bool');

INSERT INTO config.usr_setting_type (name,opac_visible,label,description,datatype)
    VALUES ('opac.default_pickup_location', TRUE,
    oils_i18n_gettext('opac.default_pickup_location', 'Default Hold Pickup Location', 'cust', 'label'),
    oils_i18n_gettext('opac.default_pickup_location', 'Default location for holds pickup', 'cust', 'description'),
    'integer');

INSERT INTO config.usr_setting_type (name,opac_visible,label,description,datatype)
    VALUES (
        'opac.lists_per_page',
        TRUE,
        oils_i18n_gettext(
            'opac.lists_per_page',
            'Lists per Page',
            'cust',
            'label'
        ),
        oils_i18n_gettext(
            'opac.lists_per_page',
            'A number designating the amount of lists displayed per page.',
            'cust',
            'description'
        ),
        'string'
    );

INSERT INTO config.usr_setting_type (name,opac_visible,label,description,datatype)
    VALUES (
        'opac.list_items_per_page',
        TRUE,
        oils_i18n_gettext(
            'opac.list_items_per_page',
            'List Items per Page',
            'cust',
            'label'
        ),
        oils_i18n_gettext(
            'opac.list_items_per_page',
            'A number designating the amount of list items displayed per page of a selected list.',
            'cust',
            'description'
        ),
        'string'
    );

-- Add groups for org_unit settings
INSERT INTO config.settings_group (name, label) VALUES
('acq', oils_i18n_gettext('config.settings_group.system', 'Acquisitions', 'coust', 'label')),
('sys', oils_i18n_gettext('config.settings_group.system', 'System', 'coust', 'label')),
('gui', oils_i18n_gettext('config.settings_group.gui', 'GUI', 'coust', 'label')),
('lib', oils_i18n_gettext('config.settings_group.lib', 'Library', 'coust', 'label')),
('sec', oils_i18n_gettext('config.settings_group.sec', 'Security', 'coust', 'label')),
('cat', oils_i18n_gettext('config.settings_group.cat', 'Cataloging', 'coust', 'label')),
('holds', oils_i18n_gettext('config.settings_group.holds', 'Holds', 'coust', 'label')),
('circ', oils_i18n_gettext('config.settings_group.circulation', 'Circulation', 'coust', 'label')),
('self', oils_i18n_gettext('config.settings_group.self', 'Self Check', 'coust', 'label')),
('opac', oils_i18n_gettext('config.settings_group.opac', 'OPAC', 'coust', 'label')),
('prog', oils_i18n_gettext('config.settings_group.program', 'Program', 'coust', 'label')),
('glob', oils_i18n_gettext('config.settings_group.global', 'Global', 'coust', 'label')),
('finance', oils_i18n_gettext('config.settings_group.finances', 'Finances', 'coust', 'label')),
('credit', oils_i18n_gettext('config.settings_group.ccp', 'Credit Card Processing', 'coust', 'label')),
('serial', oils_i18n_gettext('config.settings_group.serial', 'Serials', 'coust', 'label')),
('recall', oils_i18n_gettext('config.settings_group.recall', 'Recalls', 'coust', 'label')),
('booking', oils_i18n_gettext('config.settings_group.booking', 'Booking', 'coust', 'label')),
('offline', oils_i18n_gettext('config.settings_group.offline', 'Offline', 'coust', 'label')),
('receipt_template', oils_i18n_gettext('config.settings_group.receipt_template', 'Receipt Template', 'coust', 'label')),
('sms', oils_i18n_gettext('sms','SMS Text Messages','csg','label')),
('vandelay', oils_i18n_gettext('vandelay','Vandelay','coust','label'))
;


INSERT INTO acq.user_request_type (id,label) VALUES (1, oils_i18n_gettext('1', 'Books', 'aurt', 'label'));
INSERT INTO acq.user_request_type (id,label) VALUES (2, oils_i18n_gettext('2', 'Journal/Magazine & Newspaper Articles', 'aurt', 'label'));
INSERT INTO acq.user_request_type (id,label) VALUES (3, oils_i18n_gettext('3', 'Audiobooks', 'aurt', 'label'));
INSERT INTO acq.user_request_type (id,label) VALUES (4, oils_i18n_gettext('4', 'Music', 'aurt', 'label'));
INSERT INTO acq.user_request_type (id,label) VALUES (5, oils_i18n_gettext('5', 'DVDs', 'aurt', 'label'));

SELECT SETVAL('acq.user_request_type_id_seq'::TEXT, 6);


-- org_unit setting types
INSERT into config.org_unit_setting_type
( name, grp, label, description, datatype, fm_class ) VALUES

( 'acq.copy_creator_uses_receiver', 'acq',
    oils_i18n_gettext('acq.copy_creator_uses_receiver',
        'Set copy creator as receiver',
        'coust', 'label'),
    oils_i18n_gettext('acq.copy_creator_uses_receiver',
        'When receiving a copy in acquisitions, set the copy "creator" to be the staff that received the copy',
        'coust', 'description'),
    'bool', null)
,( 'acq.copy_status_on_receiving', 'acq',
    oils_i18n_gettext('acq.copy_status_on_receiving',
        'Initial status for received items',
        'coust', 'label'),
    oils_i18n_gettext('acq.copy_status_on_receiving',
        'Allows staff to designate a custom copy status on received lineitems.  Default status is "In Process".',
        'coust', 'description'),
    'link', 'ccs')
,( 'acq.default_circ_modifier', 'acq',
    oils_i18n_gettext('acq.default_circ_modifier',
        'Default circulation modifier',
        'coust', 'label'),
    oils_i18n_gettext('acq.default_circ_modifier',
        'Default circulation modifier',
        'coust', 'description'),
    'string', null)

,( 'acq.default_copy_location', 'acq',
    oils_i18n_gettext('acq.default_copy_location',
        'Default copy location',
        'coust', 'label'),
    oils_i18n_gettext('acq.default_copy_location',
        'Default copy location',
        'coust', 'description'),
    'link', 'acpl')

,( 'acq.fund.balance_limit.block', 'acq',
    oils_i18n_gettext('acq.fund.balance_limit.block',
        'Fund Spending Limit for Block',
        'coust', 'label'),
    oils_i18n_gettext('acq.fund.balance_limit.block',
        'When the amount remaining in the fund, including spent money and encumbrances, goes below this percentage, attempts to spend from the fund will be blocked.',
        'coust', 'description'),
    'integer', null)

,( 'acq.fund.balance_limit.warn', 'acq',
    oils_i18n_gettext('acq.fund.balance_limit.warn',
        'Fund Spending Limit for Warning',
        'coust', 'label'),
    oils_i18n_gettext('acq.fund.balance_limit.warn',
        'When the amount remaining in the fund, including spent money and encumbrances, goes below this percentage, attempts to spend from the fund will result in a warning to the staff.',
        'coust', 'description'),
    'integer', null)

,( 'acq.holds.allow_holds_from_purchase_request', 'acq',
    oils_i18n_gettext('acq.holds.allow_holds_from_purchase_request',
        'Allows patrons to create automatic holds from purchase requests.',
        'coust', 'label'),
    oils_i18n_gettext('acq.holds.allow_holds_from_purchase_request',
        'Allows patrons to create automatic holds from purchase requests.',
        'coust', 'description'),
    'bool', null)

,( 'acq.tmp_barcode_prefix', 'acq',
    oils_i18n_gettext('acq.tmp_barcode_prefix',
        'Temporary barcode prefix',
        'coust', 'label'),
    oils_i18n_gettext('acq.tmp_barcode_prefix',
        'Temporary barcode prefix',
        'coust', 'description'),
    'string', null)

,( 'acq.tmp_callnumber_prefix', 'acq',
    oils_i18n_gettext('acq.tmp_callnumber_prefix',
        'Temporary call number prefix',
        'coust', 'label'),
    oils_i18n_gettext('acq.tmp_callnumber_prefix',
        'Temporary call number prefix',
        'coust', 'description'),
    'string', null)

,( 'auth.opac_timeout', 'sec',
    oils_i18n_gettext('auth.opac_timeout',
        'OPAC Inactivity Timeout (in seconds)',
        'coust', 'label'),
    oils_i18n_gettext('auth.opac_timeout',
        'OPAC Inactivity Timeout (in seconds)',
        'coust', 'description'),
    'integer', null)

,( 'auth.persistent_login_interval', 'sec',
    oils_i18n_gettext('auth.persistent_login_interval',
        'Persistent Login Duration',
        'coust', 'label'),
    oils_i18n_gettext('auth.persistent_login_interval',
        'How long a persistent login lasts.  E.g. ''2 weeks''',
        'coust', 'description'),
    'interval', null)

,( 'auth.staff_timeout', 'sec',
    oils_i18n_gettext('auth.staff_timeout',
        'Staff Login Inactivity Timeout (in seconds)',
        'coust', 'label'),
    oils_i18n_gettext('auth.staff_timeout',
        'Staff Login Inactivity Timeout (in seconds)',
        'coust', 'description'),
    'integer', null)

,( 'booking.allow_email_notify', 'booking',
    oils_i18n_gettext('booking.allow_email_notify',
        'Allow Email Notify',
        'coust', 'label'),
    oils_i18n_gettext('booking.allow_email_notify',
        'Permit email notification when a reservation is ready for pickup.',
        'coust', 'description'),
    'bool', null)

,( 'cat.bib.alert_on_empty', 'gui',
    oils_i18n_gettext('cat.bib.alert_on_empty',
        'Alert on empty bib records',
        'coust', 'label'),
    oils_i18n_gettext('cat.bib.alert_on_empty',
        'Alert staff when the last copy for a record is being deleted',
        'coust', 'description'),
    'bool', null)

,( 'cat.bib.delete_on_no_copy_via_acq_lineitem_cancel', 'cat',
    oils_i18n_gettext('cat.bib.delete_on_no_copy_via_acq_lineitem_cancel',
        'Delete bib if all copies are deleted via Acquisitions lineitem cancellation.',
        'coust', 'label'),
    oils_i18n_gettext('cat.bib.delete_on_no_copy_via_acq_lineitem_cancel',
        'Delete bib if all copies are deleted via Acquisitions lineitem cancellation.',
        'coust', 'description'),
    'bool', null)

,( 'cat.bib.keep_on_empty', 'prog',
    oils_i18n_gettext('cat.bib.keep_on_empty',
        'Retain empty bib records',
        'coust', 'label'),
    oils_i18n_gettext('cat.bib.keep_on_empty',
        'Retain a bib record even when all attached copies are deleted',
        'coust', 'description'),
    'bool', null)

,( 'cat.default_classification_scheme', 'cat',
    oils_i18n_gettext('cat.default_classification_scheme',
        'Default Classification Scheme',
        'coust', 'label'),
    oils_i18n_gettext('cat.default_classification_scheme',
        'Defines the default classification scheme for new call numbers: 1 = Generic; 2 = Dewey; 3 = LC',
        'coust', 'description'),
    'link', 'acnc')

,( 'cat.default_copy_status_fast', 'cat',
    oils_i18n_gettext('cat.default_copy_status_fast',
        'Default copy status (fast add)',
        'coust', 'label'),
    oils_i18n_gettext('cat.default_copy_status_fast',
        'Default status when a copy is created using the "Fast Add" interface.',
        'coust', 'description'),
    'link', 'ccs')

,( 'cat.default_copy_status_normal', 'cat',
    oils_i18n_gettext('cat.default_copy_status_normal',
        'Default copy status (normal)',
        'coust', 'label'),
    oils_i18n_gettext('cat.default_copy_status_normal',
        'Default status when a copy is created using the normal volume/copy creator interface.',
        'coust', 'description'),
    'link', 'ccs')

,( 'cat.default_item_price', 'finance',
    oils_i18n_gettext('cat.default_item_price',
        'Default Item Price',
        'coust', 'label'),
    oils_i18n_gettext('cat.default_item_price',
        'Default Item Price',
        'coust', 'description'),
    'currency', null)

,( 'circ.min_item_price', 'finance',
    oils_i18n_gettext('circ.min_item_price',
        'Minimum Item Price',
        'coust', 'label'),
    oils_i18n_gettext('circ.min_item_price',
        'When charging for lost items, charge this amount as a minimum.',
        'coust', 'description'),
    'currency', null)

,( 'circ.max_item_price', 'finance',
    oils_i18n_gettext('circ.max_item_price',
        'Maximum Item Price',
        'coust', 'label'),
    oils_i18n_gettext('circ.max_item_price',
        'When charging for lost items, limit the charge to this as a maximum.',
        'coust', 'description'),
    'currency', null)

,( 'cat.label.font.family', 'cat',
    oils_i18n_gettext('cat.label.font.family',
        'Spine and pocket label font family',
        'coust', 'label'),
    oils_i18n_gettext('cat.label.font.family',
        'Set the preferred font family for spine and pocket labels. You can specify a list of fonts, separated by commas, in order of preference; the system will use the first font it finds with a matching name. For example, "Arial, Helvetica, serif".',
        'coust', 'description'),
    'string', null)

,( 'cat.label.font.size', 'cat',
    oils_i18n_gettext('cat.label.font.size',
        'Spine and pocket label font size',
        'coust', 'label'),
    oils_i18n_gettext('cat.label.font.size',
        'Set the default font size for spine and pocket labels',
        'coust', 'description'),
    'integer', null)

,( 'cat.label.font.weight', 'cat',
    oils_i18n_gettext('cat.label.font.weight',
        'Spine and pocket label font weight',
        'coust', 'label'),
    oils_i18n_gettext('cat.label.font.weight',
        'Set the preferred font weight for spine and pocket labels. You can specify "normal", "bold", "bolder", or "lighter".',
        'coust', 'description'),
    'string', null)

,( 'cat.marc_control_number_identifier', 'cat',
    oils_i18n_gettext('cat.marc_control_number_identifier',
        'Defines the control number identifier used in 003 and 035 fields.',
        'coust', 'label'),
    oils_i18n_gettext('cat.marc_control_number_identifier',
        'Cat: Defines the control number identifier used in 003 and 035 fields.',
        'coust', 'description'),
    'string', null)

,( 'cat.spine.line.height', 'cat',
    oils_i18n_gettext('cat.spine.line.height',
        'Spine label maximum lines',
        'coust', 'label'),
    oils_i18n_gettext('cat.spine.line.height',
        'Set the default maximum number of lines for spine labels.',
        'coust', 'description'),
    'integer', null)

,( 'cat.spine.line.margin', 'cat',
    oils_i18n_gettext('cat.spine.line.margin',
        'Spine label left margin',
        'coust', 'label'),
    oils_i18n_gettext('cat.spine.line.margin',
        'Set the left margin for spine labels in number of characters.',
        'coust', 'description'),
    'integer', null)

,( 'cat.spine.line.width', 'cat',
    oils_i18n_gettext('cat.spine.line.width',
        'Spine label line width',
        'coust', 'label'),
    oils_i18n_gettext('cat.spine.line.width',
        'Set the default line width for spine labels in number of characters. This specifies the boundary at which lines must be wrapped.',
        'coust', 'description'),
    'integer', null)

,( 'cat.volume.delete_on_empty', 'cat',
    oils_i18n_gettext('cat.volume.delete_on_empty',
        'Delete volume with last copy',
        'coust', 'label'),
    oils_i18n_gettext('cat.volume.delete_on_empty',
        'Automatically delete a volume when the last linked copy is deleted',
        'coust', 'description'),
    'bool', null)

,( 'circ.auto_hide_patron_summary', 'gui',
    oils_i18n_gettext('circ.auto_hide_patron_summary',
        'Toggle off the patron summary sidebar after first view.',
        'coust', 'label'),
    oils_i18n_gettext('circ.auto_hide_patron_summary',
        'When true, the patron summary sidebar will collapse after a new patron sub-interface is selected.',
        'coust', 'description'),
    'bool', null)

,( 'circ.block_renews_for_holds', 'holds',
    oils_i18n_gettext('circ.block_renews_for_holds',
        'Block Renewal of Items Needed for Holds',
        'coust', 'label'),
    oils_i18n_gettext('circ.block_renews_for_holds',
        'When an item could fulfill a hold, do not allow the current patron to renew',
        'coust', 'description'),
    'bool', null)

,( 'circ.booking_reservation.default_elbow_room', 'booking',
    oils_i18n_gettext('circ.booking_reservation.default_elbow_room',
        'Booking elbow room',
        'coust', 'label'),
    oils_i18n_gettext('circ.booking_reservation.default_elbow_room',
        'Elbow room specifies how far in the future you must make a reservation on an item if that item will have to transit to reach its pickup location.  It secondarily defines how soon a reservation on a given item must start before the check-in process will opportunistically capture it for the reservation shelf.',
        'coust', 'description'),
    'interval', null)

,( 'circ.charge_lost_on_zero', 'finance',
    oils_i18n_gettext('circ.charge_lost_on_zero',
        'Charge lost on zero',
        'coust', 'label'),
    oils_i18n_gettext('circ.charge_lost_on_zero',
        'Charge lost on zero',
        'coust', 'description'),
    'bool', null)

,( 'circ.charge_on_damaged', 'finance',
    oils_i18n_gettext('circ.charge_on_damaged',
        'Charge item price when marked damaged',
        'coust', 'label'),
    oils_i18n_gettext('circ.charge_on_damaged',
        'Charge item price when marked damaged',
        'coust', 'description'),
    'bool', null)

,( 'circ.checkout_auto_renew_age', 'circ',
    oils_i18n_gettext('circ.checkout_auto_renew_age',
        'Checkout auto renew age',
        'coust', 'label'),
    oils_i18n_gettext('circ.checkout_auto_renew_age',
        'When an item has been checked out for at least this amount of time, an attempt to check out the item to the patron that it is already checked out to will simply renew the circulation',
        'coust', 'description'),
    'interval', null)

,( 'circ.checkout_fills_related_hold', 'circ',
    oils_i18n_gettext('circ.checkout_fills_related_hold',
        'Checkout Fills Related Hold',
        'coust', 'label'),
    oils_i18n_gettext('circ.checkout_fills_related_hold',
        'When a patron checks out an item and they have no holds that directly target the item, the system will attempt to find a hold for the patron that could be fulfilled by the checked out item and fulfills it',
        'coust', 'description'),
    'bool', null)

,( 'circ.checkout_fills_related_hold_exact_match_only', 'circ',
    oils_i18n_gettext('circ.checkout_fills_related_hold_exact_match_only',
        'Checkout Fills Related Hold On Valid Copy Only',
        'coust', 'label'),
    oils_i18n_gettext('circ.checkout_fills_related_hold_exact_match_only',
        'When filling related holds on checkout only match on items that are valid for opportunistic capture for the hold. Without this set a Title or Volume hold could match when the item is not holdable. With this set only holdable items will match.',
        'coust', 'description'),
    'bool', null)

,( 'circ.claim_never_checked_out.mark_missing', 'lib',
    oils_i18n_gettext('circ.claim_never_checked_out.mark_missing',
        'Claim Never Checked Out: Mark copy as missing',
        'coust', 'label'),
    oils_i18n_gettext('circ.claim_never_checked_out.mark_missing',
        'When a circ is marked as claims-never-checked-out, mark the copy as missing',
        'coust', 'description'),
    'bool', null)

,( 'circ.claim_return.copy_status', 'lib',
    oils_i18n_gettext('circ.claim_return.copy_status',
        'Claim Return Copy Status',
        'coust', 'label'),
    oils_i18n_gettext('circ.claim_return.copy_status',
        'Claims returned copies are put into this status.  Default is to leave the copy in the Checked Out status',
        'coust', 'description'),
    'link', 'ccs')

,( 'circ.damaged.void_ovedue', 'lib',
    oils_i18n_gettext('circ.damaged.void_ovedue',
        'Mark item damaged voids overdues',
        'coust', 'label'),
    oils_i18n_gettext('circ.damaged.void_ovedue',
        'When an item is marked damaged, overdue fines on the most recent circulation are voided.',
        'coust', 'description'),
    'bool', null)

,( 'circ.damaged_item_processing_fee', 'finance',
    oils_i18n_gettext('circ.damaged_item_processing_fee',
        'Charge processing fee for damaged items',
        'coust', 'label'),
    oils_i18n_gettext('circ.damaged_item_processing_fee',
        'Charge processing fee for damaged items',
        'coust', 'description'),
    'currency', null)

,( 'circ.do_not_tally_claims_returned', 'circ',
    oils_i18n_gettext('circ.do_not_tally_claims_returned',
        'Do not include outstanding Claims Returned circulations in lump sum tallies in Patron Display.',
        'coust', 'label'),
    oils_i18n_gettext('circ.do_not_tally_claims_returned',
        'In the Patron Display interface, the number of total active circulations for a given patron is presented in the Summary sidebar and underneath the Items Out navigation button.  This setting will prevent Claims Returned circulations from counting toward these tallies.',
        'coust', 'description'),
    'bool', null)

,('circ.tally_lost', 'circ',
    oils_i18n_gettext(
        'circ.tally_lost',
        'Include Lost circulations in lump sum tallies in Patron Display.',
        'coust',
        'label'),
    oils_i18n_gettext(
        'circ.tally_lost',
        'In the Patron Display interface, the number of total active circulations for a given patron is presented in the Summary sidebar and underneath the Items Out navigation button.  This setting will include Lost circulations as counting toward these tallies.',
        'coust',
        'description'),
    'bool', null)

,( 'circ.grace.extend', 'circ',
    oils_i18n_gettext('circ.grace.extend',
        'Auto-Extend Grace Periods',
        'coust', 'label'),
    oils_i18n_gettext('circ.grace.extend',
        'When enabled grace periods will auto-extend. By default this will be only when they are a full day or more and end on a closed date, though other options can alter this.',
        'coust', 'description'),
    'bool', null)

,( 'circ.grace.extend.all', 'circ',
    oils_i18n_gettext('circ.grace.extend.all',
        'Auto-Extending Grace Periods extend for all closed dates',
        'coust', 'label'),
    oils_i18n_gettext('circ.grace.extend.all',
        'If enabled and Grace Periods auto-extending is turned on grace periods will extend past all closed dates they intersect, within hard-coded limits. This basically becomes "grace periods can only be consumed by closed dates".',
        'coust', 'description'),
    'bool', null)

,( 'circ.grace.extend.into_closed', 'circ',
    oils_i18n_gettext('circ.grace.extend.into_closed',
        'Auto-Extending Grace Periods include trailing closed dates',
        'coust', 'label'),
    oils_i18n_gettext('circ.grace.extend.into_closed',
         'If enabled and Grace Periods auto-extending is turned on grace periods will include closed dates that directly follow the last day of the grace period, to allow a backdate into the closed dates to assume "returned after hours on the last day of the grace period, and thus still within it" automatically.',
        'coust', 'description'),
    'bool', null)

,( 'circ.hold_boundary.hard', 'holds',
    oils_i18n_gettext('circ.hold_boundary.hard',
        'Hard boundary',
        'coust', 'label'),
    oils_i18n_gettext('circ.hold_boundary.hard',
        'Holds: Hard boundary',
        'coust', 'description'),
    'integer', null)

,( 'circ.hold_boundary.soft', 'holds',
    oils_i18n_gettext('circ.hold_boundary.soft',
        'Soft boundary',
        'coust', 'label'),
    oils_i18n_gettext('circ.hold_boundary.soft',
        'Holds: Soft boundary',
        'coust', 'description'),
    'integer', null)

,( 'circ.hold_expire_alert_interval', 'holds',
    oils_i18n_gettext('circ.hold_expire_alert_interval',
        'Expire Alert Interval',
        'coust', 'label'),
    oils_i18n_gettext('circ.hold_expire_alert_interval',
        'Amount of time before a hold expires at which point the patron should be alerted. Examples: "5 days", "1 hour"',
        'coust', 'description'),
    'interval', null)

,( 'circ.hold_expire_interval', 'holds',
    oils_i18n_gettext('circ.hold_expire_interval',
        'Expire Interval',
        'coust', 'label'),
    oils_i18n_gettext('circ.hold_expire_interval',
        'Amount of time after a hold is placed before the hold expires.  Example "100 days"',
        'coust', 'description'),
    'interval', null)

,( 'circ.hold_shelf_status_delay', 'circ',
    oils_i18n_gettext('circ.hold_shelf_status_delay',
        'Hold Shelf Status Delay',
        'coust', 'label'),
    oils_i18n_gettext('circ.hold_shelf_status_delay',
        'The purpose is to provide an interval of time after an item goes into the on-holds-shelf status before it appears to patrons that it is actually on the holds shelf.  This gives staff time to process the item before it shows as ready-for-pickup. Examples: "5 days", "1 hour"',
        'coust', 'description'),
    'interval', null)

,( 'circ.hold_stalling.soft', 'holds',
    oils_i18n_gettext('circ.hold_stalling.soft',
        'Soft stalling interval',
        'coust', 'label'),
    oils_i18n_gettext('circ.hold_stalling.soft',
        'How long to wait before allowing remote items to be opportunistically captured for a hold.  Example "5 days"',
        'coust', 'description'),
    'interval', null)

,( 'circ.hold_stalling_hard', 'holds',
    oils_i18n_gettext('circ.hold_stalling_hard',
        'Hard stalling interval',
        'coust', 'label'),
    oils_i18n_gettext('circ.hold_stalling_hard',
        'Holds: Hard stalling interval',
        'coust', 'description'),
    'interval', null)

,( 'circ.holds.age_protect.active_date', 'holds',
    oils_i18n_gettext('circ.holds.age_protect.active_date',
        'Use Active Date for Age Protection',
        'coust', 'label'),
    oils_i18n_gettext('circ.holds.age_protect.active_date',
        'When calculating age protection rules use the active date instead of the creation date.',
        'coust', 'description'),
    'bool', null)

,( 'circ.holds.behind_desk_pickup_supported', 'holds',
    oils_i18n_gettext('circ.holds.behind_desk_pickup_supported',
        'Behind Desk Pickup Supported',
        'coust', 'label'),
    oils_i18n_gettext('circ.holds.behind_desk_pickup_supported',
        'If a branch supports both a public holds shelf and behind-the-desk pickups, set this value to true.  This gives the patron the option to enable behind-the-desk pickups for their holds',
        'coust', 'description'),
    'bool', null)

,( 'circ.holds.canceled.display_age', 'holds',
    oils_i18n_gettext('circ.holds.canceled.display_age',
        'Canceled holds display age',
        'coust', 'label'),
    oils_i18n_gettext('circ.holds.canceled.display_age',
        'Show all canceled holds that were canceled within this amount of time',
        'coust', 'description'),
    'interval', null)

,( 'circ.holds.canceled.display_count', 'holds',
    oils_i18n_gettext('circ.holds.canceled.display_count',
        'Canceled holds display count',
        'coust', 'label'),
    oils_i18n_gettext('circ.holds.canceled.display_count',
        'How many canceled holds to show in patron holds interfaces',
        'coust', 'description'),
    'integer', null)

,( 'circ.holds.clear_shelf.copy_status', 'holds',
    oils_i18n_gettext('circ.holds.clear_shelf.copy_status',
        'Clear shelf copy status',
        'coust', 'label'),
    oils_i18n_gettext('circ.holds.clear_shelf.copy_status',
        'Any copies that have not been put into reshelving, in-transit, or on-holds-shelf (for a new hold) during the clear shelf process will be put into this status.  This is basically a purgatory status for copies waiting to be pulled from the shelf and processed by hand',
        'coust', 'description'),
    'link', 'ccs')

,( 'circ.holds.default_estimated_wait_interval', 'holds',
    oils_i18n_gettext('circ.holds.default_estimated_wait_interval',
        'Default Estimated Wait',
        'coust', 'label'),
    oils_i18n_gettext('circ.holds.default_estimated_wait_interval',
        'When predicting the amount of time a patron will be waiting for a hold to be fulfilled, this is the default estimated length of time to assume an item will be checked out. Examples: "3 weeks", "7 days"',
        'coust', 'description'),
    'interval', null)

,( 'circ.holds.default_shelf_expire_interval', 'holds',
    oils_i18n_gettext('circ.holds.default_shelf_expire_interval',
        'Default hold shelf expire interval',
        'coust', 'label'),
    oils_i18n_gettext('circ.holds.default_shelf_expire_interval',
        'The amount of time an item will be held on the shelf before the hold expires. For example: "2 weeks" or "5 days"',
        'coust', 'description'),
    'interval', null)

,( 'circ.holds.expired_patron_block', 'circ',
    oils_i18n_gettext('circ.holds.expired_patron_block',
        'Block hold request if hold recipient privileges have expired',
        'coust', 'label'),
    oils_i18n_gettext('circ.holds.expired_patron_block',
        'Block hold request if hold recipient privileges have expired',
        'coust', 'description'),
    'bool', null)

,( 'circ.holds.hold_has_copy_at.alert', 'holds',
    oils_i18n_gettext('circ.holds.hold_has_copy_at.alert',
        'Has Local Copy Alert',
        'coust', 'label'),
    oils_i18n_gettext('circ.holds.hold_has_copy_at.alert',
        'If there is an available copy at the requesting library that could fulfill a hold during hold placement time, alert the patron',
        'coust', 'description'),
    'bool', null)

,( 'circ.holds.hold_has_copy_at.block', 'holds',
    oils_i18n_gettext('circ.holds.hold_has_copy_at.block',
        'Has Local Copy Block',
        'coust', 'label'),
    oils_i18n_gettext('circ.holds.hold_has_copy_at.block',
        'If there is an available copy at the requesting library that could fulfill a hold during hold placement time, do not allow the hold to be placed',
        'coust', 'description'),
    'bool', null)

,( 'circ.holds.max_org_unit_target_loops', 'holds',
    oils_i18n_gettext('circ.holds.max_org_unit_target_loops',
        'Maximum library target attempts',
        'coust', 'label'),
    oils_i18n_gettext('circ.holds.max_org_unit_target_loops',
        'When this value is set and greater than 0, the system will only attempt to find a copy at each possible branch the configured number of times',
        'coust', 'description'),
    'integer', null)

,( 'circ.holds.min_estimated_wait_interval', 'holds',
    oils_i18n_gettext('circ.holds.min_estimated_wait_interval',
        'Minimum Estimated Wait',
        'coust', 'label'),
    oils_i18n_gettext('circ.holds.min_estimated_wait_interval',
        'When predicting the amount of time a patron will be waiting for a hold to be fulfilled, this is the minimum estimated length of time to assume an item will be checked out. Examples: "2 weeks", "5 days"',
        'coust', 'description'),
    'interval', null)

,( 'circ.holds.org_unit_target_weight', 'holds',
    oils_i18n_gettext('circ.holds.org_unit_target_weight',
        'Org Unit Target Weight',
        'coust', 'label'),
    oils_i18n_gettext('circ.holds.org_unit_target_weight',
        'Org Units can be organized into hold target groups based on a weight.  Potential copies from org units with the same weight are chosen at random.',
        'coust', 'description'),
    'integer', null)

,( 'circ.holds.recall_fine_rules', 'recall',
    oils_i18n_gettext('circ.holds.recall_fine_rules',
        'An array of fine amount, fine interval, and maximum fine.',
        'coust', 'label'),
    oils_i18n_gettext('circ.holds.recall_fine_rules',
        'Recalls: An array of fine amount, fine interval, and maximum fine. For example, to specify a new fine rule of $5.00 per day, with a maximum fine of $50.00, use: [5.00,"1 day",50.00]',
        'coust', 'description'),
    'array', null)

,( 'circ.holds.recall_return_interval', 'recall',
    oils_i18n_gettext('circ.holds.recall_return_interval',
        'Truncated loan period.',
        'coust', 'label'),
    oils_i18n_gettext('circ.holds.recall_return_interval',
        'Recalls: When a recall is triggered, this defines the adjusted loan period for the item. For example, "4 days" or "1 week".',
        'coust', 'description'),
    'interval', null)

,( 'circ.holds.recall_threshold', 'recall',
    oils_i18n_gettext('circ.holds.recall_threshold',
        'Circulation duration that triggers a recall.',
        'coust', 'label'),
    oils_i18n_gettext('circ.holds.recall_threshold',
        'Recalls: A hold placed on an item with a circulation duration longer than this will trigger a recall. For example, "14 days" or "3 weeks".',
        'coust', 'description'),
    'interval', null)

,( 'circ.holds.target_holds_by_org_unit_weight', 'holds',
    oils_i18n_gettext('circ.holds.target_holds_by_org_unit_weight',
        'Use weight-based hold targeting',
        'coust', 'label'),
    oils_i18n_gettext('circ.holds.target_holds_by_org_unit_weight',
        'Use library weight based hold targeting',
        'coust', 'description'),
    'bool', null)

,( 'circ.holds.target_skip_me', 'holds',
    oils_i18n_gettext('circ.holds.target_skip_me',
        'Skip For Hold Targeting',
        'coust', 'label'),
    oils_i18n_gettext('circ.holds.target_skip_me',
        'When true, don''t target any copies at this org unit for holds',
        'coust', 'description'),
    'bool', null)

,( 'circ.holds.uncancel.reset_request_time', 'holds',
    oils_i18n_gettext('circ.holds.uncancel.reset_request_time',
        'Reset request time on un-cancel',
        'coust', 'label'),
    oils_i18n_gettext('circ.holds.uncancel.reset_request_time',
        'When a hold is uncanceled, reset the request time to push it to the end of the queue',
        'coust', 'description'),
    'bool', null)

,( 'circ.holds_fifo', 'holds',
    oils_i18n_gettext('circ.holds_fifo',
        'FIFO',
        'coust', 'label'),
    oils_i18n_gettext('circ.holds_fifo',
        'Force holds to a more strict First-In, First-Out capture',
        'coust', 'description'),
    'bool', null)

,( 'circ.item_checkout_history.max', 'gui',
    oils_i18n_gettext('circ.item_checkout_history.max',
        'Maximum previous checkouts displayed',
        'coust', 'label'),
    oils_i18n_gettext('circ.item_checkout_history.max',
        'This is the maximum number of previous circulations the staff client will display when investigating item details',
        'coust', 'description'),
    'integer', null)

,( 'circ.lost.generate_overdue_on_checkin', 'circ',
    oils_i18n_gettext('circ.lost.generate_overdue_on_checkin',
        'Lost Checkin Generates New Overdues',
        'coust', 'label'),
    oils_i18n_gettext('circ.lost.generate_overdue_on_checkin',
        'Enabling this setting causes retroactive creation of not-yet-existing overdue fines on lost item checkin, up to the point of checkin time (or max fines is reached).  This is different than "restore overdue on lost", because it only creates new overdue fines.  Use both settings together to get the full complement of overdue fines for a lost item',
        'coust', 'description'),
    'bool', null)

,( 'circ.lost_immediately_available', 'circ',
    oils_i18n_gettext('circ.lost_immediately_available',
        'Lost items usable on checkin',
        'coust', 'label'),
    oils_i18n_gettext('circ.lost_immediately_available',
        'Lost items are usable on checkin instead of going ''home'' first',
        'coust', 'description'),
    'bool', null)

,( 'circ.lost_materials_processing_fee', 'finance',
    oils_i18n_gettext('circ.lost_materials_processing_fee',
        'Lost Materials Processing Fee',
        'coust', 'label'),
    oils_i18n_gettext('circ.lost_materials_processing_fee',
        'Lost Materials Processing Fee',
        'coust', 'description'),
    'currency', null)

,( 'circ.max_accept_return_of_lost', 'circ',
    oils_i18n_gettext('circ.max_accept_return_of_lost',
        'Void lost max interval',
        'coust', 'label'),
    oils_i18n_gettext('circ.max_accept_return_of_lost',
        'Items that have been lost this long will not result in voided billings when returned.  E.g. ''6 months''',
        'coust', 'description'),
    'interval', null)

,( 'circ.max_fine.cap_at_price', 'circ',
    oils_i18n_gettext('circ.max_fine.cap_at_price',
        'Cap Max Fine at Item Price',
        'coust', 'label'),
    oils_i18n_gettext('circ.max_fine.cap_at_price',
        'This prevents the system from charging more than the item price in overdue fines',
        'coust', 'description'),
    'bool', null)

,( 'circ.max_patron_claim_return_count', 'circ',
    oils_i18n_gettext('circ.max_patron_claim_return_count',
        'Max Patron Claims Returned Count',
        'coust', 'label'),
    oils_i18n_gettext('circ.max_patron_claim_return_count',
        'When this count is exceeded, a staff override is required to mark the item as claims returned',
        'coust', 'description'),
    'integer', null)

,( 'circ.missing_pieces.copy_status', 'circ',
    oils_i18n_gettext('circ.missing_pieces.copy_status',
        'Item Status for Missing Pieces',
        'coust', 'label'),
    oils_i18n_gettext('circ.missing_pieces.copy_status',
        'This is the Item Status to use for items that have been marked or scanned as having Missing Pieces.  In the absence of this setting, the Damaged status is used.',
        'coust', 'description'),
    'link', 'ccs')

,( 'circ.obscure_dob', 'sec',
    oils_i18n_gettext('circ.obscure_dob',
        'Obscure the Date of Birth field',
        'coust', 'label'),
    oils_i18n_gettext('circ.obscure_dob',
        'When true, the Date of Birth column in patron lists will default to Not Visible, and in the Patron Summary sidebar the value will display as <Hidden> unless the field label is clicked.',
        'coust', 'description'),
    'bool', null)

,( 'circ.offline.skip_checkin_if_newer_status_changed_time', 'offline',
    oils_i18n_gettext('circ.offline.skip_checkin_if_newer_status_changed_time',
        'Skip offline checkin if newer item Status Changed Time.',
        'coust', 'label'),
    oils_i18n_gettext('circ.offline.skip_checkin_if_newer_status_changed_time',
        'Skip offline checkin transaction (raise exception when processing) if item Status Changed Time is newer than the recorded transaction time.  WARNING: The Reshelving to Available status rollover will trigger this.',
        'coust', 'description'),
    'bool', null)

,( 'circ.offline.skip_checkout_if_newer_status_changed_time', 'offline',
    oils_i18n_gettext('circ.offline.skip_checkout_if_newer_status_changed_time',
        'Skip offline checkout if newer item Status Changed Time.',
        'coust', 'label'),
    oils_i18n_gettext('circ.offline.skip_checkout_if_newer_status_changed_time',
        'Skip offline checkout transaction (raise exception when processing) if item Status Changed Time is newer than the recorded transaction time.  WARNING: The Reshelving to Available status rollover will trigger this.',
        'coust', 'description'),
    'bool', null)

,( 'circ.offline.skip_renew_if_newer_status_changed_time', 'offline',
    oils_i18n_gettext('circ.offline.skip_renew_if_newer_status_changed_time',
        'Skip offline renewal if newer item Status Changed Time.',
        'coust', 'label'),
    oils_i18n_gettext('circ.offline.skip_renew_if_newer_status_changed_time',
        'Skip offline renewal transaction (raise exception when processing) if item Status Changed Time is newer than the recorded transaction time.  WARNING: The Reshelving to Available status rollover will trigger this.',
        'coust', 'description'),
    'bool', null)

,( 'circ.offline.username_allowed', 'sec',
    oils_i18n_gettext('circ.offline.username_allowed',
        'Offline: Patron Usernames Allowed',
        'coust', 'label'),
    oils_i18n_gettext('circ.offline.username_allowed',
        'During offline circulations, allow patrons to identify themselves with usernames in addition to barcode.  For this setting to work, a barcode format must also be defined',
        'coust', 'description'),
    'bool', null)

,( 'circ.password_reset_request_per_user_limit', 'sec',
    oils_i18n_gettext('circ.password_reset_request_per_user_limit',
        'Maximum concurrently active self-serve password reset requests per user',
        'coust', 'label'),
    oils_i18n_gettext('circ.password_reset_request_per_user_limit',
        'When a user has more than this number of concurrently active self-serve password reset requests for their account, prevent the user from creating any new self-serve password reset requests until the number of active requests for the user drops back below this number.',
        'coust', 'description'),
    'string', null)

,( 'circ.password_reset_request_requires_matching_email', 'circ',
    oils_i18n_gettext('circ.password_reset_request_requires_matching_email',
        'Require matching email address for password reset requests',
        'coust', 'label'),
    oils_i18n_gettext('circ.password_reset_request_requires_matching_email',
        'Require matching email address for password reset requests',
        'coust', 'description'),
    'bool', null)

,( 'circ.password_reset_request_throttle', 'sec',
    oils_i18n_gettext('circ.password_reset_request_throttle',
        'Maximum concurrently active self-serve password reset requests',
        'coust', 'label'),
    oils_i18n_gettext('circ.password_reset_request_throttle',
        'Prevent the creation of new self-serve password reset requests until the number of active requests drops back below this number.',
        'coust', 'description'),
    'string', null)

,( 'circ.password_reset_request_time_to_live', 'sec',
    oils_i18n_gettext('circ.password_reset_request_time_to_live',
        'Self-serve password reset request time-to-live',
        'coust', 'label'),
    oils_i18n_gettext('circ.password_reset_request_time_to_live',
        'Length of time (in seconds) a self-serve password reset request should remain active.',
        'coust', 'description'),
    'string', null)

,( 'circ.patron_edit.clone.copy_address', 'circ',
    oils_i18n_gettext('circ.patron_edit.clone.copy_address',
        'Patron Registration: Cloned patrons get address copy',
        'coust', 'label'),
    oils_i18n_gettext('circ.patron_edit.clone.copy_address',
        'In the Patron editor, copy addresses from the cloned user instead of linking directly to the address',
        'coust', 'description'),
    'bool', null)

,( 'circ.patron_invalid_address_apply_penalty', 'circ',
    oils_i18n_gettext('circ.patron_invalid_address_apply_penalty',
        'Invalid patron address penalty',
        'coust', 'label'),
    oils_i18n_gettext('circ.patron_invalid_address_apply_penalty',
        'When set, if a patron address is set to invalid, a penalty is applied.',
        'coust', 'description'),
    'bool', null)

,( 'circ.pre_cat_copy_circ_lib', 'lib',
    oils_i18n_gettext('circ.pre_cat_copy_circ_lib',
        'Pre-cat Item Circ Lib',
        'coust', 'label'),
    oils_i18n_gettext('circ.pre_cat_copy_circ_lib',
        'Override the default circ lib of "here" with a pre-configured circ lib for pre-cat items.  The value should be the "shortname" (aka policy name) of the org unit',
        'coust', 'description'),
    'string', null)

,( 'circ.reshelving_complete.interval', 'lib',
    oils_i18n_gettext('circ.reshelving_complete.interval',
        'Change reshelving status interval',
        'coust', 'label'),
    oils_i18n_gettext('circ.reshelving_complete.interval',
        'Amount of time to wait before changing an item from "reshelving" status to "available".  Examples: "1 day", "6 hours"',
        'coust', 'description'),
    'interval', null)

,( 'circ.restore_overdue_on_lost_return', 'circ',
    oils_i18n_gettext('circ.restore_overdue_on_lost_return',
        'Restore overdues on lost item return',
        'coust', 'label'),
    oils_i18n_gettext('circ.restore_overdue_on_lost_return',
        'Restore overdue fines on lost item return',
        'coust', 'description'),
    'bool', null)

,( 'circ.selfcheck.alert.popup', 'self',
    oils_i18n_gettext('circ.selfcheck.alert.popup',
        'Pop-up alert for errors',
        'coust', 'label'),
    oils_i18n_gettext('circ.selfcheck.alert.popup',
        'If true, checkout/renewal errors will cause a pop-up window in addition to the on-screen message',
        'coust', 'description'),
    'bool', null)

,( 'circ.selfcheck.alert.sound', 'self',
    oils_i18n_gettext('circ.selfcheck.alert.sound',
        'Audio Alerts',
        'coust', 'label'),
    oils_i18n_gettext('circ.selfcheck.alert.sound',
        'Use audio alerts for selfcheck events',
        'coust', 'description'),
    'bool', null)

,( 'circ.selfcheck.auto_override_checkout_events', 'self',
    oils_i18n_gettext('circ.selfcheck.auto_override_checkout_events',
        'Selfcheck override events list',
        'coust', 'label'),
    oils_i18n_gettext('circ.selfcheck.auto_override_checkout_events',
        'List of checkout/renewal events that the selfcheck interface should automatically override instead instead of alerting and stopping the transaction',
        'coust', 'description'),
    'array', null)

,( 'circ.selfcheck.block_checkout_on_copy_status', 'self',
    oils_i18n_gettext('circ.selfcheck.block_checkout_on_copy_status',
        'Block copy checkout status',
        'coust', 'label'),
    oils_i18n_gettext('circ.selfcheck.block_checkout_on_copy_status',
        'List of copy status IDs that will block checkout even if the generic COPY_NOT_AVAILABLE event is overridden',
        'coust', 'description'),
    'array', null)

,( 'circ.selfcheck.patron_login_timeout', 'self',
    oils_i18n_gettext('circ.selfcheck.patron_login_timeout',
        'Patron Login Timeout (in seconds)',
        'coust', 'label'),
    oils_i18n_gettext('circ.selfcheck.patron_login_timeout',
        'Number of seconds of inactivity before the patron is logged out of the selfcheck interface',
        'coust', 'description'),
    'integer', null)

,( 'circ.selfcheck.patron_password_required', 'self',
    oils_i18n_gettext('circ.selfcheck.patron_password_required',
        'Require Patron Password',
        'coust', 'label'),
    oils_i18n_gettext('circ.selfcheck.patron_password_required',
        'Patron must log in with barcode and password at selfcheck station',
        'coust', 'description'),
    'bool', null)

,( 'circ.selfcheck.workstation_required', 'self',
    oils_i18n_gettext('circ.selfcheck.workstation_required',
        'Workstation Required',
        'coust', 'label'),
    oils_i18n_gettext('circ.selfcheck.workstation_required',
        'All selfcheck stations must use a workstation',
        'coust', 'description'),
    'bool', null)

,( 'circ.staff_client.actor_on_checkout', 'circ',
    oils_i18n_gettext('circ.staff_client.actor_on_checkout',
        'Load patron from Checkout',
        'coust', 'label'),
    oils_i18n_gettext('circ.staff_client.actor_on_checkout',
        'When scanning barcodes into Checkout auto-detect if a new patron barcode is scanned and auto-load the new patron.',
        'coust', 'description'),
    'bool', null)

,( 'circ.staff_client.do_not_auto_attempt_print', 'prog',
    oils_i18n_gettext('circ.staff_client.do_not_auto_attempt_print',
        'Disable Automatic Print Attempt Type List',
        'coust', 'label'),
    oils_i18n_gettext('circ.staff_client.do_not_auto_attempt_print',
        'Disable automatic print attempts from staff client interfaces for the receipt types in this list.  Possible values: "Checkout", "Bill Pay", "Hold Slip", "Transit Slip", and "Hold/Transit Slip".  This is different from the Auto-Print checkbox in the pertinent interfaces in that it disables automatic print attempts altogether, rather than encouraging silent printing by suppressing the print dialog.  The Auto-Print checkbox in these interfaces have no effect on the behavior for this setting.  In the case of the Hold, Transit, and Hold/Transit slips, this also suppresses the alert dialogs that precede the print dialog (the ones that offer Print and Do Not Print as options).',
        'coust', 'description'),
    'array', null)

,( 'circ.staff_client.receipt.alert_text', 'receipt_template',
    oils_i18n_gettext('circ.staff_client.receipt.alert_text',
        'Content of alert_text include',
        'coust', 'label'),
    oils_i18n_gettext('circ.staff_client.receipt.alert_text',
        'Text/HTML/Macros to be inserted into receipt templates in place of %INCLUDE(alert_text)%',
        'coust', 'description'),
    'string', null)

,( 'circ.staff_client.receipt.event_text', 'receipt_template',
    oils_i18n_gettext('circ.staff_client.receipt.event_text',
        'Content of event_text include',
        'coust', 'label'),
    oils_i18n_gettext('circ.staff_client.receipt.event_text',
        'Text/HTML/Macros to be inserted into receipt templates in place of %INCLUDE(event_text)%',
        'coust', 'description'),
    'string', null)

,( 'circ.staff_client.receipt.footer_text', 'receipt_template',
    oils_i18n_gettext('circ.staff_client.receipt.footer_text',
        'Content of footer_text include',
        'coust', 'label'),
    oils_i18n_gettext('circ.staff_client.receipt.footer_text',
        'Text/HTML/Macros to be inserted into receipt templates in place of %INCLUDE(footer_text)%',
        'coust', 'description'),
    'string', null)

,( 'circ.staff_client.receipt.header_text', 'receipt_template',
    oils_i18n_gettext('circ.staff_client.receipt.header_text',
        'Content of header_text include',
        'coust', 'label'),
    oils_i18n_gettext('circ.staff_client.receipt.header_text',
        'Text/HTML/Macros to be inserted into receipt templates in place of %INCLUDE(header_text)%',
        'coust', 'description'),
    'string', null)

,( 'circ.staff_client.receipt.notice_text', 'receipt_template',
    oils_i18n_gettext('circ.staff_client.receipt.notice_text',
        'Content of notice_text include',
        'coust', 'label'),
    oils_i18n_gettext('circ.staff_client.receipt.notice_text',
        'Text/HTML/Macros to be inserted into receipt templates in place of %INCLUDE(notice_text)%',
        'coust', 'description'),
    'string', null)

,( 'circ.transit.min_checkin_interval', 'circ',
    oils_i18n_gettext('circ.transit.min_checkin_interval',
        'Minimum Transit Checkin Interval',
        'coust', 'label'),
    oils_i18n_gettext('circ.transit.min_checkin_interval',
        'In-Transit items checked in this close to the transit start time will be prevented from checking in',
        'coust', 'description'),
    'interval', null)

,( 'circ.transit.suppress_hold', 'circ',
    oils_i18n_gettext('circ.transit.suppress_hold',
        'Suppress Hold Transits Group',
        'coust', 'label'),
    oils_i18n_gettext('circ.transit.suppress_hold',
        'If set to a non-empty value, Hold Transits will be suppressed between this OU and others with the same value. If set to an empty value, transits will not be suppressed.',
        'coust', 'description'),
    'string', null)

,( 'circ.transit.suppress_non_hold', 'circ',
    oils_i18n_gettext('circ.transit.suppress_non_hold',
        'Suppress Non-Hold Transits Group',
        'coust', 'label'),
    oils_i18n_gettext('circ.transit.suppress_non_hold',
        'If set to a non-empty value, Non-Hold Transits will be suppressed between this OU and others with the same value. If set to an empty value, transits will not be suppressed.',
        'coust', 'description'),
    'string', null)

,( 'circ.user_merge.deactivate_cards', 'circ',
    oils_i18n_gettext('circ.user_merge.deactivate_cards',
        'Patron Merge Deactivate Card',
        'coust', 'label'),
    oils_i18n_gettext('circ.user_merge.deactivate_cards',
        'Mark barcode(s) of subordinate user(s) in a patron merge as inactive',
        'coust', 'description'),
    'bool', null)

,( 'circ.user_merge.delete_addresses', 'circ',
    oils_i18n_gettext('circ.user_merge.delete_addresses',
        'Patron Merge Address Delete',
        'coust', 'label'),
    oils_i18n_gettext('circ.user_merge.delete_addresses',
        'Delete address(es) of subordinate user(s) in a patron merge',
        'coust', 'description'),
    'bool', null)

,( 'circ.user_merge.delete_cards', 'circ',
    oils_i18n_gettext('circ.user_merge.delete_cards',
        'Patron Merge Barcode Delete',
        'coust', 'label'),
    oils_i18n_gettext('circ.user_merge.delete_cards',
        'Delete barcode(s) of subordinate user(s) in a patron merge',
        'coust', 'description'),
    'bool', null)

,( 'circ.void_lost_on_checkin', 'circ',
    oils_i18n_gettext('circ.void_lost_on_checkin',
        'Void lost item billing when returned',
        'coust', 'label'),
    oils_i18n_gettext('circ.void_lost_on_checkin',
        'Void lost item billing when returned',
        'coust', 'description'),
    'bool', null)

,( 'circ.void_lost_proc_fee_on_checkin', 'circ',
    oils_i18n_gettext('circ.void_lost_proc_fee_on_checkin',
        'Void processing fee on lost item return',
        'coust', 'label'),
    oils_i18n_gettext('circ.void_lost_proc_fee_on_checkin',
        'Void processing fee when lost item returned',
        'coust', 'description'),
    'bool', null)

,( 'circ.void_overdue_on_lost', 'finance',
    oils_i18n_gettext('circ.void_overdue_on_lost',
        'Void overdue fines when items are marked lost',
        'coust', 'label'),
    oils_i18n_gettext('circ.void_overdue_on_lost',
        'Void overdue fines when items are marked lost',
        'coust', 'description'),
    'bool', null)

,( 'credit.payments.allow', 'finance',
    oils_i18n_gettext('credit.payments.allow',
        'Allow Credit Card Payments',
        'coust', 'label'),
    oils_i18n_gettext('credit.payments.allow',
        'If enabled, patrons will be able to pay fines accrued at this location via credit card',
        'coust', 'description'),
    'bool', null)

,( 'credit.processor.authorizenet.enabled', 'credit',
    oils_i18n_gettext('credit.processor.authorizenet.enabled',
        'Enable AuthorizeNet payments',
        'coust', 'label'),
    oils_i18n_gettext('credit.processor.authorizenet.enabled',
        'Enable AuthorizeNet payments',
        'coust', 'description'),
    'bool', null)

,( 'credit.processor.authorizenet.login', 'credit',
    oils_i18n_gettext('credit.processor.authorizenet.login',
        'AuthorizeNet login',
        'coust', 'label'),
    oils_i18n_gettext('credit.processor.authorizenet.login',
        'AuthorizeNet login',
        'coust', 'description'),
    'string', null)

,( 'credit.processor.authorizenet.password', 'credit',
    oils_i18n_gettext('credit.processor.authorizenet.password',
        'AuthorizeNet password',
        'coust', 'label'),
    oils_i18n_gettext('credit.processor.authorizenet.password',
        'AuthorizeNet password',
        'coust', 'description'),
    'string', null)

,( 'credit.processor.authorizenet.server', 'credit',
    oils_i18n_gettext('credit.processor.authorizenet.server',
        'AuthorizeNet server',
        'coust', 'label'),
    oils_i18n_gettext('credit.processor.authorizenet.server',
        'Required if using a developer/test account with AuthorizeNet',
        'coust', 'description'),
    'string', null)

,( 'credit.processor.authorizenet.testmode', 'credit',
    oils_i18n_gettext('credit.processor.authorizenet.testmode',
        'AuthorizeNet test mode',
        'coust', 'label'),
    oils_i18n_gettext('credit.processor.authorizenet.testmode',
        'AuthorizeNet test mode',
        'coust', 'description'),
    'bool', null)

,( 'credit.processor.default', 'credit',
    oils_i18n_gettext('credit.processor.default',
        'Name default credit processor',
        'coust', 'label'),
    oils_i18n_gettext('credit.processor.default',
        'This might be "AuthorizeNet", "PayPal", "PayflowPro", or "Stripe".',
        'coust', 'description'),
    'string', null)

,( 'credit.processor.payflowpro.enabled', 'credit',
    oils_i18n_gettext('credit.processor.payflowpro.enabled',
        'Enable PayflowPro payments',
        'coust', 'label'),
    oils_i18n_gettext('credit.processor.payflowpro.enabled',
        'This is NOT the same thing as the settings labeled with just "PayPal."',
        'coust', 'description'),
    'bool', null)

,( 'credit.processor.payflowpro.login', 'credit',
    oils_i18n_gettext('credit.processor.payflowpro.login',
        'PayflowPro login/merchant ID',
        'coust', 'label'),
    oils_i18n_gettext('credit.processor.payflowpro.login',
        'Often the same thing as the PayPal manager login',
        'coust', 'description'),
    'string', null)

,( 'credit.processor.payflowpro.partner', 'credit',
    oils_i18n_gettext('credit.processor.payflowpro.partner',
        'PayflowPro partner',
        'coust', 'label'),
    oils_i18n_gettext('credit.processor.payflowpro.partner',
        'Often "PayPal" or "VeriSign", sometimes others',
        'coust', 'description'),
    'string', null)

,( 'credit.processor.payflowpro.password', 'credit',
    oils_i18n_gettext('credit.processor.payflowpro.password',
        'PayflowPro password',
        'coust', 'label'),
    oils_i18n_gettext('credit.processor.payflowpro.password',
        'PayflowPro password',
        'coust', 'description'),
    'string', null)

,( 'credit.processor.payflowpro.testmode', 'credit',
    oils_i18n_gettext('credit.processor.payflowpro.testmode',
        'PayflowPro test mode',
        'coust', 'label'),
    oils_i18n_gettext('credit.processor.payflowpro.testmode',
        'Do not really process transactions, but stay in test mode - uses pilot-payflowpro.paypal.com instead of the usual host',
        'coust', 'description'),
    'bool', null)

,( 'credit.processor.payflowpro.vendor', 'credit',
    oils_i18n_gettext('credit.processor.payflowpro.vendor',
        'PayflowPro vendor',
        'coust', 'label'),
    oils_i18n_gettext('credit.processor.payflowpro.vendor',
        'Often the same thing as the login',
        'coust', 'description'),
    'string', null)

,( 'credit.processor.paypal.enabled', 'credit',
    oils_i18n_gettext('credit.processor.paypal.enabled',
        'Enable PayPal payments',
        'coust', 'label'),
    oils_i18n_gettext('credit.processor.paypal.enabled',
        'Enable PayPal payments',
        'coust', 'description'),
    'bool', null)

,( 'credit.processor.paypal.login', 'credit',
    oils_i18n_gettext('credit.processor.paypal.login',
        'PayPal login',
        'coust', 'label'),
    oils_i18n_gettext('credit.processor.paypal.login',
        'PayPal login',
        'coust', 'description'),
    'string', null)

,( 'credit.processor.paypal.password', 'credit',
    oils_i18n_gettext('credit.processor.paypal.password',
        'PayPal password',
        'coust', 'label'),
    oils_i18n_gettext('credit.processor.paypal.password',
        'PayPal password',
        'coust', 'description'),
    'string', null)

,( 'credit.processor.paypal.signature', 'credit',
    oils_i18n_gettext('credit.processor.paypal.signature',
        'PayPal signature',
        'coust', 'label'),
    oils_i18n_gettext('credit.processor.paypal.signature',
        'PayPal signature',
        'coust', 'description'),
    'string', null)

,( 'credit.processor.paypal.testmode', 'credit',
    oils_i18n_gettext('credit.processor.paypal.testmode',
        'PayPal test mode',
        'coust', 'label'),
    oils_i18n_gettext('credit.processor.paypal.testmode',
        'PayPal test mode',
        'coust', 'description'),
    'bool', null)

,( 'credit.processor.stripe.enabled', 'credit',
    oils_i18n_gettext('credit.processor.stripe.enabled',
        'Enable Stripe payments',
        'coust', 'label'),
    oils_i18n_gettext('credit.processor.stripe.enabled',
        'Enable Stripe payments',
        'coust', 'description'),
    'bool', null)

,( 'credit.processor.stripe.pubkey', 'credit',
    oils_i18n_gettext('credit.processor.stripe.pubkey',
        'Stripe publishable key',
        'coust', 'label'),
    oils_i18n_gettext('credit.processor.stripe.pubkey',
        'Stripe publishable key',
        'coust', 'description'),
    'string', null)

,( 'credit.processor.stripe.secretkey', 'credit',
    oils_i18n_gettext('credit.processor.stripe.secretkey',
        'Stripe secret key',
        'coust', 'label'),
    oils_i18n_gettext('credit.processor.stripe.secretkey',
        'Stripe secret key',
        'coust', 'description'),
    'string', null)

,( 'format.date', 'gui',
    oils_i18n_gettext('format.date',
        'Format Dates with this pattern.',
        'coust', 'label'),
    oils_i18n_gettext('format.date',
        'Format Dates with this pattern (examples: "yyyy-MM-dd" for "2010-04-26", "MMM d, yyyy" for "Apr 26, 2010")',
        'coust', 'description'),
    'string', null)

,( 'format.time', 'gui',
    oils_i18n_gettext('format.time',
        'Format Times with this pattern.',
        'coust', 'label'),
    oils_i18n_gettext('format.time',
        'Format Times with this pattern (examples: "h:m:s.SSS a z" for "2:07:20.666 PM Eastern Daylight Time", "HH:mm" for "14:07")',
        'coust', 'description'),
    'string', null)

,( 'global.default_locale', 'glob',
    oils_i18n_gettext('global.default_locale',
        'Global Default Locale',
        'coust', 'label'),
    oils_i18n_gettext('global.default_locale',
        'Global Default Locale',
        'coust', 'description'),
    'string', null)

,( 'global.juvenile_age_threshold', 'lib',
    oils_i18n_gettext('global.juvenile_age_threshold',
        'Juvenile Age Threshold',
        'coust', 'label'),
    oils_i18n_gettext('global.juvenile_age_threshold',
        'The age at which a user is no long considered a juvenile.  For example, "18 years".',
        'coust', 'description'),
    'interval', null)

,( 'global.password_regex', 'glob',
    oils_i18n_gettext('global.password_regex',
        'Password format',
        'coust', 'label'),
    oils_i18n_gettext('global.password_regex',
        'Regular expression defining the password format.  Note: Be sure to update the update_password_msg.tt2 TPAC template with a user-friendly description of your password strength requirements.',
        'coust', 'description'),
    'string', null)

,( 'gui.disable_local_save_columns', 'gui',
    oils_i18n_gettext('gui.disable_local_save_columns',
        'Disable the ability to save list column configurations locally.',
        'coust', 'label'),
    oils_i18n_gettext('gui.disable_local_save_columns',
        'Disable the ability to save list column configurations locally.  If set, columns may still be manipulated, however, the changes do not persist.  Also, existing local configurations are ignored if this setting is true.',
        'coust', 'description'),
    'bool', null)

,( 'lib.courier_code', 'lib',
    oils_i18n_gettext('lib.courier_code',
        'Courier Code',
        'coust', 'label'),
    oils_i18n_gettext('lib.courier_code',
        'Courier Code for the library.  Available in transit slip templates as the %courier_code% macro.',
        'coust', 'description'),
    'string', null)

,( 'lib.info_url', 'lib',
    oils_i18n_gettext('lib.info_url',
        'Library information URL (such as "http://example.com/about.html")',
        'coust', 'label'),
    oils_i18n_gettext('lib.info_url',
        'URL for information on this library, such as contact information, hours of operation, and directions. Use a complete URL, such as "http://example.com/hours.html".',
        'coust', 'description'),
    'string', null)

,( 'lib.prefer_external_url', 'lib',
    oils_i18n_gettext('lib.prefer_external_url',
        'Use external "library information URL" in copy table, if available',
        'coust', 'label'),
    oils_i18n_gettext('lib.prefer_external_url',
        'If set to true, the library name in the copy details section will link to the URL associated with the "Library information URL" library setting rather than the library information page generated by Evergreen.',
        'coust', 'description'),
    'bool', null)

,( 'notice.telephony.callfile_lines', 'lib',
    oils_i18n_gettext('notice.telephony.callfile_lines',
        'Telephony: Arbitrary line(s) to include in each notice callfile',
        'coust', 'label'),
    oils_i18n_gettext('notice.telephony.callfile_lines',
        '
        This overrides lines from opensrf.xml.
        Line(s) must be valid for your target server and platform
        (e.g. Asterisk 1.4).
        ',
        'coust', 'description'),
    'string', null)

,( 'opac.allow_pending_address', 'opac',
    oils_i18n_gettext('opac.allow_pending_address',
        'Allow pending addresses',
        'coust', 'label'),
    oils_i18n_gettext('opac.allow_pending_address',
        'If enabled, patrons can create and edit existing addresses.  Addresses are kept in a pending state until staff approves the changes',
        'coust', 'description'),
    'bool', null)

,( 'opac.barcode_regex', 'glob',
    oils_i18n_gettext('opac.barcode_regex',
        'Patron barcode format',
        'coust', 'label'),
    oils_i18n_gettext('opac.barcode_regex',
        'Regular expression defining the patron barcode format',
        'coust', 'description'),
    'string', null)

,( 'opac.fully_compressed_serial_holdings', 'opac',
    oils_i18n_gettext('opac.fully_compressed_serial_holdings',
        'Use fully compressed serial holdings',
        'coust', 'label'),
    oils_i18n_gettext('opac.fully_compressed_serial_holdings',
        'Show fully compressed serial holdings for all libraries at and below the current context unit',
        'coust', 'description'),
    'bool', null)

,( 'opac.lock_usernames', 'glob',
    oils_i18n_gettext('opac.lock_usernames',
        'Lock Usernames',
        'coust', 'label'),
    oils_i18n_gettext('opac.lock_usernames',
        'If enabled username changing via the OPAC will be disabled',
        'coust', 'description'),
    'bool', null)

,( 'opac.org_unit_hiding.depth', 'opac',
    oils_i18n_gettext('opac.org_unit_hiding.depth',
        'Org Unit Hiding Depth',
        'coust', 'label'),
    oils_i18n_gettext('opac.org_unit_hiding.depth',
        'This will hide certain org units in the public OPAC if the Physical Location (url param "physical_loc") for the OPAC inherits this setting.  This setting specifies an org unit depth, that together with the OPAC Physical Location determines which section of the Org Hierarchy should be visible in the OPAC.  For example, a stock Evergreen installation will have a 3-tier hierarchy (Consortium/System/Branch), where System has a depth of 1 and Branch has a depth of 2.  If this setting contains a depth of 1 in such an installation, then every library in the System in which the Physical Location belongs will be visible, and everything else will be hidden.  A depth of 0 will effectively make every org visible.  The embedded OPAC in the staff client ignores this setting.',
        'coust', 'description'),
    'integer', null)

,( 'opac.payment_history_age_limit', 'opac',
    oils_i18n_gettext('opac.payment_history_age_limit',
        'Payment History Age Limit',
        'coust', 'label'),
    oils_i18n_gettext('opac.payment_history_age_limit',
        'The OPAC should not display payments by patrons that are older than any interval defined here.',
        'coust', 'description'),
    'interval', null)

,( 'opac.unlimit_usernames', 'glob',
    oils_i18n_gettext('opac.unlimit_usernames',
        'Allow multiple username changes',
        'coust', 'label'),
    oils_i18n_gettext('opac.unlimit_usernames',
        'If enabled (and Lock Usernames is not set) patrons will be allowed to change their username when it does not look like a barcode. Otherwise username changing in the OPAC will only be allowed when the patron''s username looks like a barcode.',
        'coust', 'description'),
    'bool', null)

,( 'opac.username_regex', 'glob',
    oils_i18n_gettext('opac.username_regex',
        'Patron username format',
        'coust', 'label'),
    oils_i18n_gettext('opac.username_regex',
        'Regular expression defining the patron username format, used for patron registration and self-service username changing only',
        'coust', 'description'),
    'string', null)

,( 'org.bounced_emails', 'prog',
    oils_i18n_gettext('org.bounced_emails',
        'Sending email address for patron notices',
        'coust', 'label'),
    oils_i18n_gettext('org.bounced_emails',
        'Sending email address for patron notices',
        'coust', 'description'),
    'string', null)

,( 'org.patron_opt_boundary', 'sec',
    oils_i18n_gettext('org.patron_opt_boundary',
        'Patron Opt-In Boundary',
        'coust', 'label'),
    oils_i18n_gettext('org.patron_opt_boundary',
        'This determines at which depth above which patrons must be opted in, and below which patrons will be assumed to be opted in.',
        'coust', 'description'),
    'integer', null)

,( 'org.patron_opt_default', 'sec',
    oils_i18n_gettext('org.patron_opt_default',
        'Patron Opt-In Default',
        'coust', 'label'),
    oils_i18n_gettext('org.patron_opt_default',
        'This is the default depth at which a patron is opted in; it is calculated as an org unit relative to the current workstation.',
        'coust', 'description'),
    'integer', null)

,( 'patron.password.use_phone', 'sec',
    oils_i18n_gettext('patron.password.use_phone',
        'Patron: password from phone #',
        'coust', 'label'),
    oils_i18n_gettext('patron.password.use_phone',
        'By default, use the last 4 alphanumeric characters of the patrons phone number as the default password when creating new users.  The exact characters used may be configured via the "GUI: Regex for day_phone field on patron registration" setting.',
        'coust', 'description'),
    'bool', null)

,( 'print.custom_js_file', 'circ',
    oils_i18n_gettext('print.custom_js_file',
        'Printing: Custom Javascript File',
        'coust', 'label'),
    oils_i18n_gettext('print.custom_js_file',
        'Full URL path to a Javascript File to be loaded when printing. Should'
        || ' implement a print_custom function for DOM manipulation. Can change'
        || ' the value of the do_print variable to false to cancel printing.',
        'coust', 'description'),
    'string', null)

,( 'serial.prev_issuance_copy_location', 'serial',
    oils_i18n_gettext('serial.prev_issuance_copy_location',
        'Previous Issuance Copy Location',
        'coust', 'label'),
    oils_i18n_gettext('serial.prev_issuance_copy_location',
        'When a serial issuance is received, copies (units) of the previous issuance will be automatically moved into the configured shelving location',
        'coust', 'description'),
    'link', 'acpl')

,( 'ui.admin.patron_log.max_entries', 'gui',
    oils_i18n_gettext('ui.admin.patron_log.max_entries',
        'Work Log: Maximum Patrons Logged',
        'coust', 'label'),
    oils_i18n_gettext('ui.admin.patron_log.max_entries',
        'Maximum entries for "Most Recently Affected Patrons..." section of the Work Log interface.',
        'coust', 'description'),
    'interval', null)

,( 'ui.admin.work_log.max_entries', 'gui',
    oils_i18n_gettext('ui.admin.work_log.max_entries',
        'Work Log: Maximum Actions Logged',
        'coust', 'label'),
    oils_i18n_gettext('ui.admin.work_log.max_entries',
        'Maximum entries for "Most Recent Staff Actions" section of the Work Log interface.',
        'coust', 'description'),
    'interval', null)

,( 'ui.cat.volume_copy_editor.horizontal', 'gui',
    oils_i18n_gettext('ui.cat.volume_copy_editor.horizontal',
        'Horizontal layout for Volume/Copy Creator/Editor.',
        'coust', 'label'),
    oils_i18n_gettext('ui.cat.volume_copy_editor.horizontal',
        'The main entry point for this interface is in Holdings Maintenance, Actions for Selected Rows, Edit Item Attributes / Call Numbers / Replace Barcodes.  This setting changes the top and bottom panes for that interface into left and right panes.',
        'coust', 'description'),
    'bool', null)

,( 'ui.circ.billing.uncheck_bills_and_unfocus_payment_box', 'gui',
    oils_i18n_gettext('ui.circ.billing.uncheck_bills_and_unfocus_payment_box',
        'Uncheck bills by default in the patron billing interface',
        'coust', 'label'),
    oils_i18n_gettext('ui.circ.billing.uncheck_bills_and_unfocus_payment_box',
        'Uncheck bills by default in the patron billing interface, and focus on the Uncheck All button instead of the Payment Received field.',
        'coust', 'description'),
    'bool', null)

,( 'ui.circ.in_house_use.entry_cap', 'gui',
    oils_i18n_gettext('ui.circ.in_house_use.entry_cap',
        'Record In-House Use: Maximum # of uses allowed per entry.',
        'coust', 'label'),
    oils_i18n_gettext('ui.circ.in_house_use.entry_cap',
        'The # of uses entry in the Record In-House Use interface may not exceed the value of this setting.',
        'coust', 'description'),
    'integer', null)

,( 'ui.circ.in_house_use.entry_warn', 'gui',
    oils_i18n_gettext('ui.circ.in_house_use.entry_warn',
        'Record In-House Use: # of uses threshold for Are You Sure? dialog.',
        'coust', 'label'),
    oils_i18n_gettext('ui.circ.in_house_use.entry_warn',
        'In the Record In-House Use interface, a submission attempt will warn if the # of uses field exceeds the value of this setting.',
        'coust', 'description'),
    'integer', null)

,( 'ui.circ.patron_summary.horizontal', 'gui',
    oils_i18n_gettext('ui.circ.patron_summary.horizontal',
        'Patron circulation summary is horizontal',
        'coust', 'label'),
    oils_i18n_gettext('ui.circ.patron_summary.horizontal',
        'Patron circulation summary is horizontal',
        'coust', 'description'),
    'bool', null)

,( 'ui.circ.show_billing_tab_on_bills', 'gui',
    oils_i18n_gettext('ui.circ.show_billing_tab_on_bills',
        'Show billing tab first when bills are present',
        'coust', 'label'),
    oils_i18n_gettext('ui.circ.show_billing_tab_on_bills',
        'If enabled and a patron has outstanding bills and the alert page is not required, show the billing tab by default, instead of the checkout tab, when a patron is loaded',
        'coust', 'description'),
    'bool', null)

,( 'ui.circ.suppress_checkin_popups', 'circ',
    oils_i18n_gettext('ui.circ.suppress_checkin_popups',
        'Suppress popup-dialogs during check-in.',
        'coust', 'label'),
    oils_i18n_gettext('ui.circ.suppress_checkin_popups',
        'Suppress popup-dialogs during check-in.',
        'coust', 'description'),
    'bool', null)

,( 'ui.general.button_bar', 'gui',
    oils_i18n_gettext('ui.general.button_bar',
        'Button bar',
        'coust', 'label'),
    oils_i18n_gettext('ui.general.button_bar',
        'Set to "circ" or "cat" for stock circulator or cataloger toolbar, respectively.',
        'coust', 'description'),
    'string', null)

,( 'ui.general.hotkeyset', 'gui',
    oils_i18n_gettext('ui.general.hotkeyset',
        'Default Hotkeyset',
        'coust', 'label'),
    oils_i18n_gettext('ui.general.hotkeyset',
        'Default Hotkeyset for clients (filename without the .keyset).  Examples: Default, Minimal, and None',
        'coust', 'description'),
    'string', null)

,( 'ui.general.idle_timeout', 'gui',
    oils_i18n_gettext('ui.general.idle_timeout',
        'Idle timeout',
        'coust', 'label'),
    oils_i18n_gettext('ui.general.idle_timeout',
        'If you want staff client windows to be minimized after a certain amount of system idle time, set this to the number of seconds of idle time that you want to allow before minimizing (requires staff client restart).',
        'coust', 'description'),
    'integer', null)

,( 'ui.patron.default_country', 'gui',
    oils_i18n_gettext('ui.patron.default_country',
        'Default Country for New Addresses in Patron Editor',
        'coust', 'label'),
    oils_i18n_gettext('ui.patron.default_country',
        'This is the default Country for new addresses in the patron editor.',
        'coust', 'description'),
    'string', null)

,( 'ui.patron.default_ident_type', 'gui',
    oils_i18n_gettext('ui.patron.default_ident_type',
        'Default Ident Type for Patron Registration',
        'coust', 'label'),
    oils_i18n_gettext('ui.patron.default_ident_type',
        'This is the default Ident Type for new users in the patron editor.',
        'coust', 'description'),
    'link', 'cit')

,( 'ui.patron.default_inet_access_level', 'sec',
    oils_i18n_gettext('ui.patron.default_inet_access_level',
        'Default level of patrons'' internet access',
        'coust', 'label'),
    oils_i18n_gettext('ui.patron.default_inet_access_level',
        'Default level of patrons'' internet access',
        'coust', 'description'),
    'integer', null)

,( 'ui.patron.edit.au.active.show', 'gui',
    oils_i18n_gettext('ui.patron.edit.au.active.show',
        'Show active field on patron registration',
        'coust', 'label'),
    oils_i18n_gettext('ui.patron.edit.au.active.show',
        'The active field will be shown on the patron registration screen. Showing a field makes it appear with required fields even when not required. If the field is required this setting is ignored.',
        'coust', 'description'),
    'bool', null)

,( 'ui.patron.edit.au.active.suggest', 'gui',
    oils_i18n_gettext('ui.patron.edit.au.active.suggest',
        'Suggest active field on patron registration',
        'coust', 'label'),
    oils_i18n_gettext('ui.patron.edit.au.active.suggest',
        'The active field will be suggested on the patron registration screen. Suggesting a field makes it appear when suggested fields are shown. If the field is shown or required this setting is ignored.',
        'coust', 'description'),
    'bool', null)

,( 'ui.patron.edit.au.alert_message.show', 'gui',
    oils_i18n_gettext('ui.patron.edit.au.alert_message.show',
        'Show alert_message field on patron registration',
        'coust', 'label'),
    oils_i18n_gettext('ui.patron.edit.au.alert_message.show',
        'The alert_message field will be shown on the patron registration screen. Showing a field makes it appear with required fields even when not required. If the field is required this setting is ignored.',
        'coust', 'description'),
    'bool', null)

,( 'ui.patron.edit.au.alert_message.suggest', 'gui',
    oils_i18n_gettext('ui.patron.edit.au.alert_message.suggest',
        'Suggest alert_message field on patron registration',
        'coust', 'label'),
    oils_i18n_gettext('ui.patron.edit.au.alert_message.suggest',
        'The alert_message field will be suggested on the patron registration screen. Suggesting a field makes it appear when suggested fields are shown. If the field is shown or required this setting is ignored.',
        'coust', 'description'),
    'bool', null)

,( 'ui.patron.edit.au.alias.show', 'gui',
    oils_i18n_gettext('ui.patron.edit.au.alias.show',
        'Show alias field on patron registration',
        'coust', 'label'),
    oils_i18n_gettext('ui.patron.edit.au.alias.show',
        'The alias field will be shown on the patron registration screen. Showing a field makes it appear with required fields even when not required. If the field is required this setting is ignored.',
        'coust', 'description'),
    'bool', null)

,( 'ui.patron.edit.au.alias.suggest', 'gui',
    oils_i18n_gettext('ui.patron.edit.au.alias.suggest',
        'Suggest alias field on patron registration',
        'coust', 'label'),
    oils_i18n_gettext('ui.patron.edit.au.alias.suggest',
        'The alias field will be suggested on the patron registration screen. Suggesting a field makes it appear when suggested fields are shown. If the field is shown or required this setting is ignored.',
        'coust', 'description'),
    'bool', null)

,( 'ui.patron.edit.au.barred.show', 'gui',
    oils_i18n_gettext('ui.patron.edit.au.barred.show',
        'Show barred field on patron registration',
        'coust', 'label'),
    oils_i18n_gettext('ui.patron.edit.au.barred.show',
        'The barred field will be shown on the patron registration screen. Showing a field makes it appear with required fields even when not required. If the field is required this setting is ignored.',
        'coust', 'description'),
    'bool', null)

,( 'ui.patron.edit.au.barred.suggest', 'gui',
    oils_i18n_gettext('ui.patron.edit.au.barred.suggest',
        'Suggest barred field on patron registration',
        'coust', 'label'),
    oils_i18n_gettext('ui.patron.edit.au.barred.suggest',
        'The barred field will be suggested on the patron registration screen. Suggesting a field makes it appear when suggested fields are shown. If the field is shown or required this setting is ignored.',
        'coust', 'description'),
    'bool', null)

,( 'ui.patron.edit.au.claims_never_checked_out_count.show', 'gui',
    oils_i18n_gettext('ui.patron.edit.au.claims_never_checked_out_count.show',
        'Show claims_never_checked_out_count field on patron registration',
        'coust', 'label'),
    oils_i18n_gettext('ui.patron.edit.au.claims_never_checked_out_count.show',
        'The claims_never_checked_out_count field will be shown on the patron registration screen. Showing a field makes it appear with required fields even when not required. If the field is required this setting is ignored.',
        'coust', 'description'),
    'bool', null)

,( 'ui.patron.edit.au.claims_never_checked_out_count.suggest', 'gui',
    oils_i18n_gettext('ui.patron.edit.au.claims_never_checked_out_count.suggest',
        'Suggest claims_never_checked_out_count field on patron registration',
        'coust', 'label'),
    oils_i18n_gettext('ui.patron.edit.au.claims_never_checked_out_count.suggest',
        'The claims_never_checked_out_count field will be suggested on the patron registration screen. Suggesting a field makes it appear when suggested fields are shown. If the field is shown or required this setting is ignored.',
        'coust', 'description'),
    'bool', null)

,( 'ui.patron.edit.au.claims_returned_count.show', 'gui',
    oils_i18n_gettext('ui.patron.edit.au.claims_returned_count.show',
        'Show claims_returned_count field on patron registration',
        'coust', 'label'),
    oils_i18n_gettext('ui.patron.edit.au.claims_returned_count.show',
        'The claims_returned_count field will be shown on the patron registration screen. Showing a field makes it appear with required fields even when not required. If the field is required this setting is ignored.',
        'coust', 'description'),
    'bool', null)

,( 'ui.patron.edit.au.claims_returned_count.suggest', 'gui',
    oils_i18n_gettext('ui.patron.edit.au.claims_returned_count.suggest',
        'Suggest claims_returned_count field on patron registration',
        'coust', 'label'),
    oils_i18n_gettext('ui.patron.edit.au.claims_returned_count.suggest',
        'The claims_returned_count field will be suggested on the patron registration screen. Suggesting a field makes it appear when suggested fields are shown. If the field is shown or required this setting is ignored.',
        'coust', 'description'),
    'bool', null)

,( 'ui.patron.edit.ac.barcode.regex', 'gui',
    oils_i18n_gettext('ui.patron.edit.ac.barcode.regex',
        'Regex for barcodes on patron registration',
        'coust', 'label'),
    oils_i18n_gettext('ui.patron.edit.ac.barcode.regex',
        'The Regular Expression for validation on barcodes in patron registration.',
        'coust', 'description'),
    'string', null)

,( 'ui.patron.edit.au.day_phone.example', 'gui',
    oils_i18n_gettext('ui.patron.edit.au.day_phone.example',
        'Example for day_phone field on patron registration',
        'coust', 'label'),
    oils_i18n_gettext('ui.patron.edit.au.day_phone.example',
        'The Example for validation on the day_phone field in patron registration.',
        'coust', 'description'),
    'string', null)

,( 'ui.patron.edit.au.day_phone.regex', 'gui',
    oils_i18n_gettext('ui.patron.edit.au.day_phone.regex',
        'Regex for day_phone field on patron registration',
        'coust', 'label'),
    oils_i18n_gettext('ui.patron.edit.au.day_phone.regex',
        E'The Regular Expression for validation on the day_phone field in patron registration. Note: The first capture group will be used for the "last 4 digits of phone number" feature, if enabled. Ex: "[2-9]\\d{2}-\\d{3}-(\\d{4})( x\\d+)?" will ignore the extension on a NANP number.',
        'coust', 'description'),
    'string', null)

,( 'ui.patron.edit.au.day_phone.require', 'gui',
    oils_i18n_gettext('ui.patron.edit.au.day_phone.require',
        'Require day_phone field on patron registration',
        'coust', 'label'),
    oils_i18n_gettext('ui.patron.edit.au.day_phone.require',
        'The day_phone field will be required on the patron registration screen.',
        'coust', 'description'),
    'bool', null)

,( 'ui.patron.edit.au.day_phone.show', 'gui',
    oils_i18n_gettext('ui.patron.edit.au.day_phone.show',
        'Show day_phone field on patron registration',
        'coust', 'label'),
    oils_i18n_gettext('ui.patron.edit.au.day_phone.show',
        'The day_phone field will be shown on the patron registration screen. Showing a field makes it appear with required fields even when not required. If the field is required this setting is ignored.',
        'coust', 'description'),
    'bool', null)

,( 'ui.patron.edit.au.day_phone.suggest', 'gui',
    oils_i18n_gettext('ui.patron.edit.au.day_phone.suggest',
        'Suggest day_phone field on patron registration',
        'coust', 'label'),
    oils_i18n_gettext('ui.patron.edit.au.day_phone.suggest',
        'The day_phone field will be suggested on the patron registration screen. Suggesting a field makes it appear when suggested fields are shown. If the field is shown or required this setting is ignored.',
        'coust', 'description'),
    'bool', null)

,( 'ui.patron.edit.au.dob.calendar', 'gui',
    oils_i18n_gettext('ui.patron.edit.au.dob.calendar',
        'Show calendar widget for dob field on patron registration',
        'coust', 'label'),
    oils_i18n_gettext('ui.patron.edit.au.dob.calendar',
        'If set the calendar widget will appear when editing the dob field on the patron registration form.',
        'coust', 'description'),
    'bool', null)

,( 'ui.patron.edit.au.dob.require', 'gui',
    oils_i18n_gettext('ui.patron.edit.au.dob.require',
        'Require dob field on patron registration',
        'coust', 'label'),
    oils_i18n_gettext('ui.patron.edit.au.dob.require',
        'The dob field will be required on the patron registration screen.',
        'coust', 'description'),
    'bool', null)

,( 'ui.patron.edit.au.dob.show', 'gui',
    oils_i18n_gettext('ui.patron.edit.au.dob.show',
        'Show dob field on patron registration',
        'coust', 'label'),
    oils_i18n_gettext('ui.patron.edit.au.dob.show',
        'The dob field will be shown on the patron registration screen. Showing a field makes it appear with required fields even when not required. If the field is required this setting is ignored.',
        'coust', 'description'),
    'bool', null)

,( 'ui.patron.edit.au.dob.suggest', 'gui',
    oils_i18n_gettext('ui.patron.edit.au.dob.suggest',
        'Suggest dob field on patron registration',
        'coust', 'label'),
    oils_i18n_gettext('ui.patron.edit.au.dob.suggest',
        'The dob field will be suggested on the patron registration screen. Suggesting a field makes it appear when suggested fields are shown. If the field is shown or required this setting is ignored.',
        'coust', 'description'),
    'bool', null)

,( 'ui.patron.edit.au.email.example', 'gui',
    oils_i18n_gettext('ui.patron.edit.au.email.example',
        'Example for email field on patron registration',
        'coust', 'label'),
    oils_i18n_gettext('ui.patron.edit.au.email.example',
        'The Example for validation on the email field in patron registration.',
        'coust', 'description'),
    'string', null)

,( 'ui.patron.edit.au.email.regex', 'gui',
    oils_i18n_gettext('ui.patron.edit.au.email.regex',
        'Regex for email field on patron registration',
        'coust', 'label'),
    oils_i18n_gettext('ui.patron.edit.au.email.regex',
        'The Regular Expression for validation on the email field in patron registration.',
        'coust', 'description'),
    'string', null)

,( 'ui.patron.edit.au.email.require', 'gui',
    oils_i18n_gettext('ui.patron.edit.au.email.require',
        'Require email field on patron registration',
        'coust', 'label'),
    oils_i18n_gettext('ui.patron.edit.au.email.require',
        'The email field will be required on the patron registration screen.',
        'coust', 'description'),
    'bool', null)

,( 'ui.patron.edit.au.email.show', 'gui',
    oils_i18n_gettext('ui.patron.edit.au.email.show',
        'Show email field on patron registration',
        'coust', 'label'),
    oils_i18n_gettext('ui.patron.edit.au.email.show',
        'The email field will be shown on the patron registration screen. Showing a field makes it appear with required fields even when not required. If the field is required this setting is ignored.',
        'coust', 'description'),
    'bool', null)

,( 'ui.patron.edit.au.email.suggest', 'gui',
    oils_i18n_gettext('ui.patron.edit.au.email.suggest',
        'Suggest email field on patron registration',
        'coust', 'label'),
    oils_i18n_gettext('ui.patron.edit.au.email.suggest',
        'The email field will be suggested on the patron registration screen. Suggesting a field makes it appear when suggested fields are shown. If the field is shown or required this setting is ignored.',
        'coust', 'description'),
    'bool', null)

,( 'ui.patron.edit.au.evening_phone.example', 'gui',
    oils_i18n_gettext('ui.patron.edit.au.evening_phone.example',
        'Example for evening_phone field on patron registration',
        'coust', 'label'),
    oils_i18n_gettext('ui.patron.edit.au.evening_phone.example',
        'The Example for validation on the evening_phone field in patron registration.',
        'coust', 'description'),
    'string', null)

,( 'ui.patron.edit.au.evening_phone.regex', 'gui',
    oils_i18n_gettext('ui.patron.edit.au.evening_phone.regex',
        'Regex for evening_phone field on patron registration',
        'coust', 'label'),
    oils_i18n_gettext('ui.patron.edit.au.evening_phone.regex',
        'The Regular Expression for validation on the evening_phone field in patron registration.',
        'coust', 'description'),
    'string', null)

,( 'ui.patron.edit.au.evening_phone.require', 'gui',
    oils_i18n_gettext('ui.patron.edit.au.evening_phone.require',
        'Require evening_phone field on patron registration',
        'coust', 'label'),
    oils_i18n_gettext('ui.patron.edit.au.evening_phone.require',
        'The evening_phone field will be required on the patron registration screen.',
        'coust', 'description'),
    'bool', null)

,( 'ui.patron.edit.au.evening_phone.show', 'gui',
    oils_i18n_gettext('ui.patron.edit.au.evening_phone.show',
        'Show evening_phone field on patron registration',
        'coust', 'label'),
    oils_i18n_gettext('ui.patron.edit.au.evening_phone.show',
        'The evening_phone field will be shown on the patron registration screen. Showing a field makes it appear with required fields even when not required. If the field is required this setting is ignored.',
        'coust', 'description'),
    'bool', null)

,( 'ui.patron.edit.au.evening_phone.suggest', 'gui',
    oils_i18n_gettext('ui.patron.edit.au.evening_phone.suggest',
        'Suggest evening_phone field on patron registration',
        'coust', 'label'),
    oils_i18n_gettext('ui.patron.edit.au.evening_phone.suggest',
        'The evening_phone field will be suggested on the patron registration screen. Suggesting a field makes it appear when suggested fields are shown. If the field is shown or required this setting is ignored.',
        'coust', 'description'),
    'bool', null)

,( 'ui.patron.edit.au.ident_value.show', 'gui',
    oils_i18n_gettext('ui.patron.edit.au.ident_value.show',
        'Show ident_value field on patron registration',
        'coust', 'label'),
    oils_i18n_gettext('ui.patron.edit.au.ident_value.show',
        'The ident_value field will be shown on the patron registration screen. Showing a field makes it appear with required fields even when not required. If the field is required this setting is ignored.',
        'coust', 'description'),
    'bool', null)

,( 'ui.patron.edit.au.ident_value.suggest', 'gui',
    oils_i18n_gettext('ui.patron.edit.au.ident_value.suggest',
        'Suggest ident_value field on patron registration',
        'coust', 'label'),
    oils_i18n_gettext('ui.patron.edit.au.ident_value.suggest',
        'The ident_value field will be suggested on the patron registration screen. Suggesting a field makes it appear when suggested fields are shown. If the field is shown or required this setting is ignored.',
        'coust', 'description'),
    'bool', null)

,( 'ui.patron.edit.au.ident_value2.show', 'gui',
    oils_i18n_gettext('ui.patron.edit.au.ident_value2.show',
        'Show ident_value2 field on patron registration',
        'coust', 'label'),
    oils_i18n_gettext('ui.patron.edit.au.ident_value2.show',
        'The ident_value2 field will be shown on the patron registration screen. Showing a field makes it appear with required fields even when not required. If the field is required this setting is ignored.',
        'coust', 'description'),
    'bool', null)

,( 'ui.patron.edit.au.ident_value2.suggest', 'gui',
    oils_i18n_gettext('ui.patron.edit.au.ident_value2.suggest',
        'Suggest ident_value2 field on patron registration',
        'coust', 'label'),
    oils_i18n_gettext('ui.patron.edit.au.ident_value2.suggest',
        'The ident_value2 field will be suggested on the patron registration screen. Suggesting a field makes it appear when suggested fields are shown. If the field is shown or required this setting is ignored.',
        'coust', 'description'),
    'bool', null)

,( 'ui.patron.edit.au.juvenile.show', 'gui',
    oils_i18n_gettext('ui.patron.edit.au.juvenile.show',
        'Show juvenile field on patron registration',
        'coust', 'label'),
    oils_i18n_gettext('ui.patron.edit.au.juvenile.show',
        'The juvenile field will be shown on the patron registration screen. Showing a field makes it appear with required fields even when not required. If the field is required this setting is ignored.',
        'coust', 'description'),
    'bool', null)

,( 'ui.patron.edit.au.juvenile.suggest', 'gui',
    oils_i18n_gettext('ui.patron.edit.au.juvenile.suggest',
        'Suggest juvenile field on patron registration',
        'coust', 'label'),
    oils_i18n_gettext('ui.patron.edit.au.juvenile.suggest',
        'The juvenile field will be suggested on the patron registration screen. Suggesting a field makes it appear when suggested fields are shown. If the field is shown or required this setting is ignored.',
        'coust', 'description'),
    'bool', null)

,( 'ui.patron.edit.au.master_account.show', 'gui',
    oils_i18n_gettext('ui.patron.edit.au.master_account.show',
        'Show master_account field on patron registration',
        'coust', 'label'),
    oils_i18n_gettext('ui.patron.edit.au.master_account.show',
        'The master_account field will be shown on the patron registration screen. Showing a field makes it appear with required fields even when not required. If the field is required this setting is ignored.',
        'coust', 'description'),
    'bool', null)

,( 'ui.patron.edit.au.master_account.suggest', 'gui',
    oils_i18n_gettext('ui.patron.edit.au.master_account.suggest',
        'Suggest master_account field on patron registration',
        'coust', 'label'),
    oils_i18n_gettext('ui.patron.edit.au.master_account.suggest',
        'The master_account field will be suggested on the patron registration screen. Suggesting a field makes it appear when suggested fields are shown. If the field is shown or required this setting is ignored.',
        'coust', 'description'),
    'bool', null)

,( 'ui.patron.edit.au.other_phone.example', 'gui',
    oils_i18n_gettext('ui.patron.edit.au.other_phone.example',
        'Example for other_phone field on patron registration',
        'coust', 'label'),
    oils_i18n_gettext('ui.patron.edit.au.other_phone.example',
        'The Example for validation on the other_phone field in patron registration.',
        'coust', 'description'),
    'string', null)

,( 'ui.patron.edit.au.other_phone.regex', 'gui',
    oils_i18n_gettext('ui.patron.edit.au.other_phone.regex',
        'Regex for other_phone field on patron registration',
        'coust', 'label'),
    oils_i18n_gettext('ui.patron.edit.au.other_phone.regex',
        'The Regular Expression for validation on the other_phone field in patron registration.',
        'coust', 'description'),
    'string', null)

,( 'ui.patron.edit.au.other_phone.require', 'gui',
    oils_i18n_gettext('ui.patron.edit.au.other_phone.require',
        'Require other_phone field on patron registration',
        'coust', 'label'),
    oils_i18n_gettext('ui.patron.edit.au.other_phone.require',
        'The other_phone field will be required on the patron registration screen.',
        'coust', 'description'),
    'bool', null)

,( 'ui.patron.edit.au.other_phone.show', 'gui',
    oils_i18n_gettext('ui.patron.edit.au.other_phone.show',
        'Show other_phone field on patron registration',
        'coust', 'label'),
    oils_i18n_gettext('ui.patron.edit.au.other_phone.show',
        'The other_phone field will be shown on the patron registration screen. Showing a field makes it appear with required fields even when not required. If the field is required this setting is ignored.',
        'coust', 'description'),
    'bool', null)

,( 'ui.patron.edit.au.other_phone.suggest', 'gui',
    oils_i18n_gettext('ui.patron.edit.au.other_phone.suggest',
        'Suggest other_phone field on patron registration',
        'coust', 'label'),
    oils_i18n_gettext('ui.patron.edit.au.other_phone.suggest',
        'The other_phone field will be suggested on the patron registration screen. Suggesting a field makes it appear when suggested fields are shown. If the field is shown or required this setting is ignored.',
        'coust', 'description'),
    'bool', null)

,( 'ui.patron.edit.au.prefix.require', 'gui',
    oils_i18n_gettext('ui.patron.edit.au.prefix.require',
        'Require prefix field on patron registration',
        'coust', 'label'),
    oils_i18n_gettext('ui.patron.edit.au.prefix.require',
        'The prefix field will be required on the patron registration screen.',
        'coust', 'description'),
    'bool', null)
	
,( 'ui.patron.edit.au.prefix.show', 'gui',
    oils_i18n_gettext('ui.patron.edit.au.prefix.show',
        'Show prefix field on patron registration',
        'coust', 'label'),
    oils_i18n_gettext('ui.patron.edit.au.prefix.show',
        'The prefix field will be shown on the patron registration screen. Showing a field makes it appear with required fields even when not required. If the field is required this setting is ignored.',
        'coust', 'description'),
    'bool', null)

,( 'ui.patron.edit.au.prefix.suggest', 'gui',
    oils_i18n_gettext('ui.patron.edit.au.prefix.suggest',
        'Suggest prefix field on patron registration',
        'coust', 'label'),
    oils_i18n_gettext('ui.patron.edit.au.prefix.suggest',
        'The prefix field will be shown on the patron registration screen. Showing a field makes it appear with required fields even when not required. If the field is required this setting is ignored.',
        'coust', 'description'),
    'bool', null)

,( 'ui.patron.edit.au.second_given_name.show', 'gui',
    oils_i18n_gettext('ui.patron.edit.au.second_given_name.show',
        'Show second_given_name field on patron registration',
        'coust', 'label'),
    oils_i18n_gettext('ui.patron.edit.au.second_given_name.show',
        'The second_given_name field will be shown on the patron registration screen. Showing a field makes it appear with required fields even when not required. If the field is required this setting is ignored.',
        'coust', 'description'),
    'bool', null)

,( 'ui.patron.edit.au.second_given_name.suggest', 'gui',
    oils_i18n_gettext('ui.patron.edit.au.second_given_name.suggest',
        'Suggest second_given_name field on patron registration',
        'coust', 'label'),
    oils_i18n_gettext('ui.patron.edit.au.second_given_name.suggest',
        'The second_given_name field will be suggested on the patron registration screen. Suggesting a field makes it appear when suggested fields are shown. If the field is shown or required this setting is ignored.',
        'coust', 'description'),
    'bool', null)

,( 'ui.patron.edit.au.suffix.show', 'gui',
    oils_i18n_gettext('ui.patron.edit.au.suffix.show',
        'Show suffix field on patron registration',
        'coust', 'label'),
    oils_i18n_gettext('ui.patron.edit.au.suffix.show',
        'The suffix field will be shown on the patron registration screen. Showing a field makes it appear with required fields even when not required. If the field is required this setting is ignored.',
        'coust', 'description'),
    'bool', null)

,( 'ui.patron.edit.au.suffix.suggest', 'gui',
    oils_i18n_gettext('ui.patron.edit.au.suffix.suggest',
        'Suggest suffix field on patron registration',
        'coust', 'label'),
    oils_i18n_gettext('ui.patron.edit.au.suffix.suggest',
        'The suffix field will be suggested on the patron registration screen. Suggesting a field makes it appear when suggested fields are shown. If the field is shown or required this setting is ignored.',
        'coust', 'description'),
    'bool', null)

,( 'ui.patron.edit.aua.county.require', 'gui',
    oils_i18n_gettext('ui.patron.edit.aua.county.require',
        'Require county field on patron registration',
        'coust', 'label'),
    oils_i18n_gettext('ui.patron.edit.aua.county.require',
        'The county field will be required on the patron registration screen.',
        'coust', 'description'),
    'bool', null)

,( 'ui.patron.edit.aua.state.require', 'gui',
    oils_i18n_gettext('ui.patron.edit.aua.state.require',
        'Require State field on patron registration',
        'coust', 'label'),
    oils_i18n_gettext('ui.patron.edit.aua.state.require',
        'The State field will be required on the patron registration screen.',
        'coust', 'description'),
    'bool', null)

,( 'ui.patron.edit.aua.state.show', 'gui',
    oils_i18n_gettext('ui.patron.edit.aua.state.show',
        'Show State field on patron registration',
        'coust', 'label'),
    oils_i18n_gettext('ui.patron.edit.aua.state.show',
        'The State field will be shown on the patron registration screen. Showing a field makes it appear with required fields even when not required. If the field is required this setting is ignored.',
        'coust', 'description'),
    'bool', null)

,( 'ui.patron.edit.aua.state.suggest', 'gui',
    oils_i18n_gettext('ui.patron.edit.aua.state.suggest',
        'Suggest State field on patron registration',
        'coust', 'label'),
    oils_i18n_gettext('ui.patron.edit.aua.state.suggest',
        'The State field will be suggested on the patron registration screen. Suggesting a field makes it appear when suggested fields are shown. If the field is shown or required this setting is ignored.',
        'coust', 'description'),
    'bool', null)

,( 'ui.patron.edit.aua.post_code.example', 'gui',
    oils_i18n_gettext('ui.patron.edit.aua.post_code.example',
        'Example for post_code field on patron registration',
        'coust', 'label'),
    oils_i18n_gettext('ui.patron.edit.aua.post_code.example',
        'The Example for validation on the post_code field in patron registration.',
        'coust', 'description'),
    'string', null)

,( 'ui.patron.edit.aua.post_code.regex', 'gui',
    oils_i18n_gettext('ui.patron.edit.aua.post_code.regex',
        'Regex for post_code field on patron registration',
        'coust', 'label'),
    oils_i18n_gettext('ui.patron.edit.aua.post_code.regex',
        'The Regular Expression for validation on the post_code field in patron registration.',
        'coust', 'description'),
    'string', null)

,( 'ui.patron.edit.default_suggested', 'gui',
    oils_i18n_gettext('ui.patron.edit.default_suggested',
        'Default showing suggested patron registration fields',
        'coust', 'label'),
    oils_i18n_gettext('ui.patron.edit.default_suggested',
        'Instead of All fields, show just suggested fields in patron registration by default.',
        'coust', 'description'),
    'bool', null)

,( 'ui.patron.edit.phone.example', 'gui',
    oils_i18n_gettext('ui.patron.edit.phone.example',
        'Example for phone fields on patron registration',
        'coust', 'label'),
    oils_i18n_gettext('ui.patron.edit.phone.example',
        'The Example for validation on phone fields in patron registration. Applies to all phone fields without their own setting.',
        'coust', 'description'),
    'string', null)

,( 'ui.patron.edit.phone.regex', 'gui',
    oils_i18n_gettext('ui.patron.edit.phone.regex',
        'Regex for phone fields on patron registration',
        'coust', 'label'),
    oils_i18n_gettext('ui.patron.edit.phone.regex',
        'The Regular Expression for validation on phone fields in patron registration. Applies to all phone fields without their own setting. NOTE: See description of the day_phone regex for important information about capture groups with it.',
        'coust', 'description'),
    'string', null)

,( 'ui.patron.registration.require_address', 'gui',
    oils_i18n_gettext('ui.patron.registration.require_address',
        'Require at least one address for Patron Registration',
        'coust', 'label'),
    oils_i18n_gettext('ui.patron.registration.require_address',
        'Enforces a requirement for having at least one address for a patron during registration.',
        'coust', 'description'),
    'bool', null)

,( 'ui.patron_search.result_cap', 'gui',
    oils_i18n_gettext('ui.patron_search.result_cap',
        'Cap results in Patron Search at this number.',
        'coust', 'label'),
    oils_i18n_gettext('ui.patron_search.result_cap',
        'So for example, if you search for John Doe, normally you would get at most 50 results.  This setting allows you to raise or lower that limit.',
        'coust', 'description'),
    'integer', null)

,( 'ui.staff.require_initials.patron_standing_penalty', 'gui',
    oils_i18n_gettext('ui.staff.require_initials.patron_standing_penalty',
        'Require staff initials for entry/edit of patron standing penalties and messages.',
        'coust', 'label'),
    oils_i18n_gettext('ui.staff.require_initials.patron_standing_penalty',
        'Appends staff initials and edit date into patron standing penalties and messages.',
        'coust', 'description'),
    'bool', null)

,( 'ui.staff.require_initials.patron_info_notes', 'gui',
    oils_i18n_gettext('ui.staff.require_initials.patron_info_notes',
        'Require staff initials for entry/edit of patron notes.',
        'coust', 'label'),
    oils_i18n_gettext('ui.staff.require_initials.patron_info_notes',
        'Appends staff initials and edit date into patron note content.',
        'coust', 'description'),
    'bool', null)

,( 'ui.staff.require_initials.copy_notes', 'gui',
    oils_i18n_gettext('ui.staff.require_initials.copy_notes',
        'Require staff initials for entry/edit of copy notes.',
        'coust', 'label'),
    oils_i18n_gettext('ui.staff.require_initials.copy_notes',
        'Appends staff initials and edit date into copy note content.',
        'coust', 'description'),
    'bool', null)

,( 'ui.unified_volume_copy_editor', 'gui',
    oils_i18n_gettext('ui.unified_volume_copy_editor',
        'Unified Volume/Item Creator/Editor',
        'coust', 'label'),
    oils_i18n_gettext('ui.unified_volume_copy_editor',
        'If true combines the Volume/Copy Creator and Item Attribute Editor in some instances.',
        'coust', 'description'),
    'bool', null)

,( 'url.remote_column_settings', 'gui',
    oils_i18n_gettext('url.remote_column_settings',
        'URL for remote directory containing list column settings.',
        'coust', 'label'),
    oils_i18n_gettext('url.remote_column_settings',
        'URL for remote directory containing list column settings.  The format and naming convention for the files found in this directory match those in the local settings directory for a given workstation.  An administrator could create the desired settings locally and then copy all the tree_columns_for_* files to the remote directory.',
        'coust', 'description'),
    'string', null)
,( 'opac.staff_saved_search.size', 'opac',
    oils_i18n_gettext('opac.staff_saved_search.size',
        'OPAC: Number of staff client saved searches to display on left side of results and record details pages',
        'coust', 'label'),
    oils_i18n_gettext('opac.staff_saved_search.size',
        'If unset, the OPAC (only when wrapped in the staff client!) will default to showing you your ten most recent searches on the left side of the results and record details pages.  If you actually don''t want to see this feature at all, set this value to zero at the top of your organizational tree.',
        'coust', 'description'),
    'integer', null)
,( 'circ.holds.target_when_closed', 'circ',
    oils_i18n_gettext('circ.holds.target_when_closed',
        'Target copies for a hold even if copy''s circ lib is closed',
        'coust', 'label'),
    oils_i18n_gettext('circ.holds.target_when_closed',
        'If this setting is true at a given org unit or one of its ancestors, the hold targeter will target copies from this org unit even if the org unit is closed (according to the actor.org_unit.closed_date table).',
        'coust', 'description'),
    'bool', null)
,( 'circ.holds.target_when_closed_if_at_pickup_lib', 'circ',
    oils_i18n_gettext('circ.holds.target_when_closed_if_at_pickup_lib',
        'Target copies for a hold even if copy''s circ lib is closed IF the circ lib is the hold''s pickup lib',
        'coust', 'label'),
    oils_i18n_gettext('circ.holds.target_when_closed_if_at_pickup_lib',
        'If this setting is true at a given org unit or one of its ancestors, the hold targeter will target copies from this org unit even if the org unit is closed (according to the actor.org_unit.closed_date table) IF AND ONLY IF the copy''s circ lib is the same as the hold''s pickup lib.',
        'coust', 'description'),
    'bool', null)


,( 'opac.staff.jump_to_details_on_single_hit', 'opac',
    oils_i18n_gettext('opac.staff.jump_to_details_on_single_hit',
        'Jump to details on 1 hit (staff client)',
        'coust', 'label'),
    oils_i18n_gettext('opac.staff.jump_to_details_on_single_hit',
        'When a search yields only 1 result, jump directly to the record details page.  This setting only affects the OPAC within the staff client',
        'coust', 'description'),
    'bool', null)
,( 'opac.patron.jump_to_details_on_single_hit', 'opac',
    oils_i18n_gettext('opac.patron.jump_to_details_on_single_hit',
        'Jump to details on 1 hit (public)',
        'coust', 'label'),
    oils_i18n_gettext('opac.patron.jump_to_details_on_single_hit',
        'When a search yields only 1 result, jump directly to the record details page.  This setting only affects the public OPAC',
        'coust', 'description'),
    'bool', null)

,( 'opac.search.tag_circulated_items', 'opac',
    oils_i18n_gettext(
        'opac.search.tag_circulated_items',
        'Tag Circulated Items in Results',
        'coust', 'label'
    ),
    oils_i18n_gettext(
        'opac.search.tag_circulated_items',
        'When a user is both logged in and has opted in to circulation history tracking, turning on this setting will cause previous (or currently) circulated items to be highlighted in search results',
        'coust', 'description'
    ),
    'bool', null)

,( 'sms.enable', 'sms',
    oils_i18n_gettext(
        'sms.enable',
        'Enable features that send SMS text messages.',
        'coust',
        'label'
    ),
    oils_i18n_gettext(
        'sms.enable',
        'Current features that use SMS include hold-ready-for-pickup notifications and a "Send Text" action for call numbers in the OPAC. If this setting is not enabled, the SMS options will not be offered to the user.  Unless you are carefully silo-ing patrons and their use of the OPAC, the context org for this setting should be the top org in the org hierarchy, otherwise patrons can trample their user settings when jumping between orgs.',
        'coust',
        'description'
    ),
    'bool', null)
,( 'sms.disable_authentication_requirement.callnumbers', 'sms',
    oils_i18n_gettext(
        'sms.disable_authentication_requirement.callnumbers',
        'Disable auth requirement for texting call numbers.',
        'coust',
        'label'
    ),
    oils_i18n_gettext(
        'sms.disable_authentication_requirement.callnumbers',
        'Disable authentication requirement for sending call number information via SMS from the OPAC.',
        'coust',
        'description'
    ),
    'bool', null)
,( 'serial.default_display_grouping', 'serial',
    oils_i18n_gettext(
        'serial.default_display_grouping',
        'Default display grouping for serials distributions presented in the OPAC.',
        'coust',
        'label'
    ),
    oils_i18n_gettext(
        'serial.default_display_grouping',
        'Default display grouping for serials distributions presented in the OPAC. This can be "enum" or "chron".',
        'coust',
        'description'
    ),
    'string', null)
,( 'vandelay.default_match_set', 'vandelay',
    oils_i18n_gettext(
        'vandelay.default_match_set',
        'Default Record Match Set',
        'coust',
        'label'
    ),
    oils_i18n_gettext(
        'vandelay.default_match_set',
        'Default Record Match Set',
        'coust',
        'description'
    ),
    'string', null)
,( 'opac.browse.pager_shortcuts', 'opac',
    oils_i18n_gettext(
        'opac.browse.pager_shortcuts',
        'Paging shortcut links for OPAC Browse',
        'coust',
        'label'
    ),
    oils_i18n_gettext(
        '',
        'The characters in this string, in order, will be used as shortcut links for quick paging in the OPAC browse interface. Any sequence surrounded by asterisks will be taken as a whole label, not split into individual labels at the character level, but only the first character will serve as the basis of the search.',
        'coust',
        'description'
    ),
    'string', null)

,( 'circ.patron_edit.duplicate_patron_check_depth', 'circ',
    oils_i18n_gettext(
        'circ.patron_edit.duplicate_patron_check_depth',
        'Specify search depth for the duplicate patron check in the patron editor',
        'coust',
        'label'),
    oils_i18n_gettext(
        'circ.patron_edit.duplicate_patron_check_depth',
        'When using the patron registration page, the duplicate patron check will use the configured depth to scope the search for duplicate patrons.',
        'coust',
        'description'),
    'integer', null)
,('circ.use_lost_paid_copy_status',
 'circ',
 oils_i18n_gettext('circ.use_lost_paid_copy_status',
     'Use Lost and Paid copy status',
     'coust', 'label'),
 oils_i18n_gettext('circ.use_lost_paid_copy_status',
     'Use Lost and Paid copy status when lost or long overdue billing is paid',
     'coust', 'description'),
 'bool', null)

,( 'circ.checkin.lost_zero_balance.do_not_change', 'circ',
    oils_i18n_gettext('circ.checkin.lost_zero_balance.do_not_change',
        'Do not change fines/fees on zero-balance LOST transaction',
        'coust', 'label'),
    oils_i18n_gettext('circ.checkin.lost_zero_balance.do_not_change',
        'When an item has been marked lost and all fines/fees have been completely paid on the transaction, do not void or reinstate any fines/fees EVEN IF circ.void_lost_on_checkin and/or circ.void_lost_proc_fee_on_checkin are enabled',
        'coust', 'description'),
    'bool', null)

,(  'bill.prohibit_negative_balance_default', 'finance',
    oils_i18n_gettext(
        'bill.prohibit_negative_balance_default',
        'Prohibit negative balance on bills (DEFAULT)',
        'coust', 'label'),
    oils_i18n_gettext(
        'bill.prohibit_negative_balance_default',
        'Default setting to prevent negative balances (refunds) on circulation related bills. Set to "true" to prohibit negative balances at all times or, when used in conjunction with an interval setting, to prohibit negative balances after a set period of time. ',
        'coust', 'description'),
    'bool', null)
,(  'bill.prohibit_negative_balance_on_overdues', 'finance',
    oils_i18n_gettext(
        'bill.prohibit_negative_balance_on_overdues',
        'Prohibit negative balance on bills for overdue materials',
        'coust', 'label'),
    oils_i18n_gettext(
        'bill.prohibit_negative_balance_on_overdues',
        'Prevent negative balances (refunds) on bills for overdue materials. Set to "true" to prohibit negative balances at all times or, when used in conjunction with an interval setting, to prohibit negative balances after a set period of time.',
        'coust', 'description'),
    'bool', null)
,(  'bill.prohibit_negative_balance_on_lost', 'finance',
    oils_i18n_gettext(
        'bill.prohibit_negative_balance_on_lost',
        'Prohibit negative balance on bills for lost materials',
        'coust', 'label'),
    oils_i18n_gettext(
        'bill.prohibit_negative_balance_on_lost',
        'Prevent negative balances (refunds) on bills for lost/long overdue materials. Set to "true" to prohibit negative balances at all times or, when used in conjunction with an interval setting, to prohibit negative balances after an interval of time.',
        'coust', 'description'),
    'bool', null)
,(  'bill.negative_balance_interval_default', 'finance',
    oils_i18n_gettext(
        'bill.negative_balance_interval_default',
        'Negative Balance Interval (DEFAULT)',
        'coust', 'label'),
    oils_i18n_gettext(
        'bill.negative_balance_interval_default',
        'Amount of time after which no negative balances (refunds) are allowed on circulation bills. The "Prohibit negative balance on bills" setting must also be set to "true".',
        'coust', 'description'),
    'interval', null)
,(  'bill.negative_balance_interval_on_overdues', 'finance',
    oils_i18n_gettext(
        'bill.negative_balance_interval_on_overdues',
        'Negative Balance Interval for Overdues',
        'coust', 'label'),
    oils_i18n_gettext(
        'bill.negative_balance_interval_on_overdues',
        'Amount of time after which no negative balances (refunds) are allowed on bills for overdue materials. The "Prohibit negative balance on bills for overdue materials" setting must also be set to "true".',
        'coust', 'description'),
    'interval', null)
,(  'bill.negative_balance_interval_on_lost', 'finance',
    oils_i18n_gettext(
        'bill.negative_balance_interval_on_lost',
        'Negative Balance Interval for Lost',
        'coust', 'label'),
    oils_i18n_gettext(
        'bill.negative_balance_interval_on_lost',
        'Amount of time after which no negative balances (refunds) are allowed on bills for lost/long overdue materials. The "Prohibit negative balance on bills for lost materials" setting must also be set to "true".',
        'coust', 'description'),
    'interval', null)
,(  'ui.circ.billing.amount_limit', 'gui',
    oils_i18n_gettext(
      'ui.circ.billing.amount_limit',
      'Maximum payment amount allowed.',
      'coust', 'label'),
    oils_i18n_gettext(
      'ui.circ.billing.amount_limit',
      'The payment amount in the Patron Bills interface may not exceed the value of this setting.',
      'coust', 'description'),
    'currency',null)
,(  'ui.circ.billing.amount_warn', 'gui',
    oils_i18n_gettext(
      'ui.circ.billing.amount_warn',
      'Payment amount threshold for Are You Sure? dialog.',
      'coust', 'label'),
    oils_i18n_gettext(
      'ui.circ.billing.amount_warn',
      'In the Patron Bills interface, a payment attempt will warn if the amount exceeds the value of this setting.',
      'coust', 'description'),
    'currency', null)
;

UPDATE config.org_unit_setting_type
    SET view_perm = (SELECT id FROM permission.perm_list
        WHERE code = 'VIEW_CREDIT_CARD_PROCESSING' LIMIT 1)
    WHERE name LIKE 'credit.processor%' AND view_perm IS NULL;

UPDATE config.org_unit_setting_type
    SET update_perm = (SELECT id FROM permission.perm_list
        WHERE code = 'ADMIN_CREDIT_CARD_PROCESSING' LIMIT 1)
    WHERE name LIKE 'credit.processor%' AND update_perm IS NULL;

-- *** Has to go below coust definition to satisfy referential integrity ***
-- In booking, elbow room defines:
--  a) how far in the future you must make a reservation on a given item if
--      that item will have to transit somewhere to fulfill the reservation.
--  b) how soon a reservation must be starting for the reserved item to
--      be op-captured by the checkin interface.
INSERT INTO actor.org_unit_setting (org_unit, name, value) VALUES (
    (SELECT id FROM actor.org_unit WHERE parent_ou IS NULL),
    'circ.booking_reservation.default_elbow_room',
    '"1 day"')
    ,(1, 'cat.spine.line.margin', 0)
    ,(1, 'cat.spine.line.height', 9)
    ,(1, 'cat.spine.line.width', 8)
    ,(1, 'cat.label.font.family', '"monospace"')
    ,(1, 'cat.label.font.size', 10)
    ,(1, 'cat.label.font.weight', '"normal"')
    ,(1, 'circ.grace.extend', 'true')
;

--220.schema.rating.sql (Default badge for popularity ranking)
INSERT INTO rating.badge (name, description, scope, weight, horizon_age, importance_age, importance_interval, importance_scale, recalc_interval, popularity_parameter, percentile)
  VALUES('Top Holds Over Last 5 Years', 'The top 97th percentile for holds requested over the past five years on all materials. More weight is given to holds requested over the last year, with importance decreasing for every year after that.', 1, 3, '5 years', '5 years', '1 year', 2, '1 day', 2, 97);


-- Staged Search (for default matchpoints)
INSERT INTO search.relevance_adjustment (field, bump_type, multiplier) VALUES(1, 'first_word', 1.5);
INSERT INTO search.relevance_adjustment (field, bump_type, multiplier) VALUES(1, 'full_match', 20);

INSERT INTO search.relevance_adjustment (field, bump_type, multiplier) VALUES(2, 'first_word', 1.5);
INSERT INTO search.relevance_adjustment (field, bump_type, multiplier) VALUES(2, 'word_order', 10);
INSERT INTO search.relevance_adjustment (field, bump_type, multiplier) VALUES(2, 'full_match', 20);

INSERT INTO search.relevance_adjustment (field, bump_type, multiplier) VALUES(3, 'first_word', 1.5);
INSERT INTO search.relevance_adjustment (field, bump_type, multiplier) VALUES(3, 'word_order', 10);
INSERT INTO search.relevance_adjustment (field, bump_type, multiplier) VALUES(3, 'full_match', 20);

INSERT INTO search.relevance_adjustment (field, bump_type, multiplier) VALUES(4, 'first_word', 1.5);
INSERT INTO search.relevance_adjustment (field, bump_type, multiplier) VALUES(4, 'word_order', 10);
INSERT INTO search.relevance_adjustment (field, bump_type, multiplier) VALUES(4, 'full_match', 20);

INSERT INTO search.relevance_adjustment (field, bump_type, multiplier) VALUES(5, 'first_word', 1.5);
INSERT INTO search.relevance_adjustment (field, bump_type, multiplier) VALUES(5, 'word_order', 10);
INSERT INTO search.relevance_adjustment (field, bump_type, multiplier) VALUES(5, 'full_match', 20);

INSERT INTO search.relevance_adjustment (field, bump_type, multiplier) VALUES(6, 'first_word', 1.5);
INSERT INTO search.relevance_adjustment (field, bump_type, multiplier) VALUES(6, 'word_order', 10);
INSERT INTO search.relevance_adjustment (field, bump_type, multiplier) VALUES(6, 'full_match', 20);

INSERT INTO search.relevance_adjustment (field, bump_type, multiplier) VALUES(7, 'first_word', 1.5);

INSERT INTO search.relevance_adjustment (field, bump_type, multiplier) VALUES(8, 'first_word', 1.5);

INSERT INTO search.relevance_adjustment (field, bump_type, multiplier) VALUES(9, 'first_word', 1.5);

INSERT INTO search.relevance_adjustment (field, bump_type, multiplier) VALUES(10, 'first_word', 1.5);

INSERT INTO search.relevance_adjustment (field, bump_type, multiplier) VALUES(15, 'word_order', 10);

-- Vandelay (for importing and exporting records) 012.schema.vandelay.sql 
INSERT INTO vandelay.bib_attr_definition ( id, code, description, xpath ) VALUES (1, 'title', oils_i18n_gettext(1, 'Title of work', 'vqbrad', 'description'),'//*[@tag="245"]/*[contains("abcmnopr",@code)]');
INSERT INTO vandelay.bib_attr_definition ( id, code, description, xpath ) VALUES (2, 'author', oils_i18n_gettext(2, 'Author of work', 'vqbrad', 'description'),'//*[@tag="100" or @tag="110" or @tag="113"]/*[contains("ad",@code)]');
INSERT INTO vandelay.bib_attr_definition ( id, code, description, xpath ) VALUES (3, 'language', oils_i18n_gettext(3, 'Language of work', 'vqbrad', 'description'),'//*[@tag="240"]/*[@code="l"][1]');
INSERT INTO vandelay.bib_attr_definition ( id, code, description, xpath ) VALUES (4, 'pagination', oils_i18n_gettext(4, 'Pagination', 'vqbrad', 'description'),'//*[@tag="300"]/*[@code="a"][1]');
INSERT INTO vandelay.bib_attr_definition ( id, code, description, xpath, remove ) VALUES (5, 'isbn',oils_i18n_gettext(5, 'ISBN', 'vqbrad', 'description'),'//*[@tag="020"]/*[@code="a"]', $r$(?:-|\s.+$)$r$);
INSERT INTO vandelay.bib_attr_definition ( id, code, description, xpath, remove ) VALUES (6, 'issn',oils_i18n_gettext(6, 'ISSN', 'vqbrad', 'description'),'//*[@tag="022"]/*[@code="a"]', $r$(?:-|\s.+$)$r$);
INSERT INTO vandelay.bib_attr_definition ( id, code, description, xpath ) VALUES (7, 'price',oils_i18n_gettext(7, 'Price', 'vqbrad', 'description'),'//*[@tag="020" or @tag="022"]/*[@code="c"][1]');
INSERT INTO vandelay.bib_attr_definition ( id, code, description, xpath) VALUES (8, 'rec_identifier',oils_i18n_gettext(8, 'Accession Number', 'vqbrad', 'description'),'//*[@tag="001"]');
INSERT INTO vandelay.bib_attr_definition ( id, code, description, xpath) VALUES (9, 'eg_tcn',oils_i18n_gettext(9, 'TCN Value', 'vqbrad', 'description'),'//*[@tag="901"]/*[@code="a"]');
INSERT INTO vandelay.bib_attr_definition ( id, code, description, xpath) VALUES (10, 'eg_tcn_source',oils_i18n_gettext(10, 'TCN Source', 'vqbrad', 'description'),'//*[@tag="901"]/*[@code="b"]');
INSERT INTO vandelay.bib_attr_definition ( id, code, description, xpath) VALUES (11, 'eg_identifier',oils_i18n_gettext(11, 'Internal ID', 'vqbrad', 'description'),'//*[@tag="901"]/*[@code="c"]');
INSERT INTO vandelay.bib_attr_definition ( id, code, description, xpath ) VALUES (12, 'publisher',oils_i18n_gettext(12, 'Publisher', 'vqbrad', 'description'),'//*[@tag="260"]/*[@code="b"][1]');
INSERT INTO vandelay.bib_attr_definition ( id, code, description, xpath, remove ) VALUES (13, 'pubdate',oils_i18n_gettext(13, 'Publication Date', 'vqbrad', 'description'),'//*[@tag="260"]/*[@code="c"][1]',$r$\D$r$);
INSERT INTO vandelay.bib_attr_definition ( id, code, description, xpath ) VALUES (14, 'edition',oils_i18n_gettext(14, 'Edition', 'vqbrad', 'description'),'//*[@tag="250"]/*[@code="a"][1]');
INSERT INTO vandelay.bib_attr_definition ( id, code, description, xpath ) VALUES (15, 'item_barcode',oils_i18n_gettext(15, 'Item Barcode', 'vqbrad', 'description'),'//*[@tag="852"]/*[@code="p"][1]');
INSERT INTO vandelay.bib_attr_definition ( id, code, description, xpath ) VALUES (16, 'zsource', oils_i18n_gettext(16, 'Z39.50 Source', 'vqbrad', 'description'), '//*[@tag="901"]/*[@code="z"]');
SELECT SETVAL('vandelay.bib_attr_definition_id_seq'::TEXT, 100);

INSERT INTO vandelay.import_item_attr_definition (
    owner, name, tag, owning_lib, circ_lib, location,
    call_number, circ_modifier, barcode, price, copy_number,
    circulate, ref, holdable, opac_visible, status
) VALUES (
    1,
    'Evergreen 852 export format',
    '852',
    '[@code = "b"][1]',
    '[@code = "b"][2]',
    'c',
    'j',
    'g',
    'p',
    'y',
    't',
    '[@code = "x" and text() = "circulating"]',
    '[@code = "x" and text() = "reference"]',
    '[@code = "x" and text() = "holdable"]',
    '[@code = "x" and text() = "visible"]',
    'z'
);

INSERT INTO vandelay.import_item_attr_definition (
    owner,
    name,
    tag,
    owning_lib,
    location,
    call_number,
    circ_modifier,
    barcode,
    price,
    status
) VALUES (
    1,
    'Unicorn Import format -- 999',
    '999',
    'm',
    'l',
    'a',
    't',
    'i',
    'p',
    'k'
);

INSERT INTO vandelay.authority_attr_definition (id, code, description, xpath) VALUES (1, 'rec_identifier',oils_i18n_gettext(1, 'Identifier', 'vqarad', 'description'),'//*[@tag="001"]');
SELECT SETVAL('vandelay.authority_attr_definition_id_seq'::TEXT, 100);


INSERT INTO container.copy_bucket_type (code,label) VALUES ('misc', oils_i18n_gettext('misc', 'Miscellaneous', 'ccpbt', 'label'));
INSERT INTO container.copy_bucket_type (code,label) VALUES ('staff_client', oils_i18n_gettext('staff_client', 'General Staff Client container', 'ccpbt', 'label'));
INSERT INTO container.copy_bucket_type (code,label) VALUES ( 'circ_history', 'Circulation History' );
INSERT INTO container.call_number_bucket_type (code,label) VALUES ('misc', oils_i18n_gettext('misc', 'Miscellaneous', 'ccnbt', 'label'));
INSERT INTO container.biblio_record_entry_bucket_type (code,label) VALUES ('misc', oils_i18n_gettext('misc', 'Miscellaneous', 'cbrebt', 'label'));
INSERT INTO container.biblio_record_entry_bucket_type (code,label) VALUES ('staff_client', oils_i18n_gettext('staff_client', 'General Staff Client container', 'cbrebt', 'label'));
INSERT INTO container.biblio_record_entry_bucket_type (code,label) VALUES ('bookbag', oils_i18n_gettext('bookbag', 'Book List', 'cbrebt', 'label'));
INSERT INTO container.biblio_record_entry_bucket_type (code,label) VALUES ('reading_list', oils_i18n_gettext('reading_list', 'Reading List', 'cbrebt', 'label'));
INSERT INTO container.biblio_record_entry_bucket_type (code,label) VALUES ('template_merge',oils_i18n_gettext('template_merge','Template Merge Container', 'cbrebt', 'label'));
INSERT INTO container.biblio_record_entry_bucket_type (code,label) VALUES ('url_verify', oils_i18n_gettext('url_verify', 'URL Verification Queue', 'cbrebt', 'label'));

INSERT INTO container.user_bucket_type (code,label) VALUES ('misc', oils_i18n_gettext('misc', 'Miscellaneous', 'cubt', 'label'));
INSERT INTO container.user_bucket_type (code,label) VALUES ('folks', oils_i18n_gettext('folks', 'Friends', 'cubt', 'label'));
INSERT INTO container.user_bucket_type (code,label) VALUES ('folks:pub_book_bags.view', oils_i18n_gettext('folks:pub_book_bags.view', 'List Published Book Lists', 'cubt', 'label'));
INSERT INTO container.user_bucket_type (code,label) VALUES ('folks:pub_book_bags.add', oils_i18n_gettext('folks:pub_book_bags.add', 'Add to Published Book Lists', 'cubt', 'label'));
INSERT INTO container.user_bucket_type (code,label) VALUES ('folks:circ.view', oils_i18n_gettext('folks:circ.view', 'View Circulations', 'cubt', 'label'));
INSERT INTO container.user_bucket_type (code,label) VALUES ('folks:circ.renew', oils_i18n_gettext('folks:circ.renew', 'Renew Circulations', 'cubt', 'label'));
INSERT INTO container.user_bucket_type (code,label) VALUES ('folks:circ.checkout', oils_i18n_gettext('folks:circ.checkout', 'Checkout Items', 'cubt', 'label'));
INSERT INTO container.user_bucket_type (code,label) VALUES ('folks:hold.view', oils_i18n_gettext('folks:hold.view', 'View Holds', 'cubt', 'label'));
INSERT INTO container.user_bucket_type (code,label) VALUES ('folks:hold.cancel', oils_i18n_gettext('folks:hold.cancel', 'Cancel Holds', 'cubt', 'label'));


----------------------------------
-- MARC21 record structure data --
----------------------------------

-- Record type map
INSERT INTO config.marc21_rec_type_map (code, type_val, blvl_val) VALUES ('BKS','at','acdm');
INSERT INTO config.marc21_rec_type_map (code, type_val, blvl_val) VALUES ('SER','a','bsi');
INSERT INTO config.marc21_rec_type_map (code, type_val, blvl_val) VALUES ('VIS','gkro','abcdmsi');
INSERT INTO config.marc21_rec_type_map (code, type_val, blvl_val) VALUES ('MIX','p','cdi');
INSERT INTO config.marc21_rec_type_map (code, type_val, blvl_val) VALUES ('MAP','ef','abcdmsi');
INSERT INTO config.marc21_rec_type_map (code, type_val, blvl_val) VALUES ('SCO','cd','abcdmsi');
INSERT INTO config.marc21_rec_type_map (code, type_val, blvl_val) VALUES ('REC','ij','abcdmsi');
INSERT INTO config.marc21_rec_type_map (code, type_val, blvl_val) VALUES ('COM','m','abcdmsi');
INSERT INTO config.marc21_rec_type_map (code, type_val, blvl_val) VALUES ('AUT','z',' ');
INSERT INTO config.marc21_rec_type_map (code, type_val, blvl_val) VALUES ('MFHD','uvxy',' ');


------ Physical Characteristics

-- Map
INSERT INTO config.marc21_physical_characteristic_type_map (ptype_key, label) VALUES ('a','Map');
INSERT INTO config.marc21_physical_characteristic_subfield_map (ptype_key,subfield,start_pos,length,label) VALUES ('a','b','1','1','SMD');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('d',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Atlas');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('g',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Diagram');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('j',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Map');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('k',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Profile');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('q',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Model');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('r',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Remote-sensing image');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('s',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Section');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('u',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Unspecified');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('y',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'View');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('z',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Other');
INSERT INTO config.marc21_physical_characteristic_subfield_map (ptype_key,subfield,start_pos,length,label) VALUES ('a','d','3','1','Color');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('a',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'One color');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('c',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Multicolored');
INSERT INTO config.marc21_physical_characteristic_subfield_map (ptype_key,subfield,start_pos,length,label) VALUES ('a','e','4','1','Physical medium');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('a',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Paper');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('b',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Wood');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('c',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Stone');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('d',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Metal');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('e',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Synthetics');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('f',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Skins');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('g',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Textile');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('p',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Plaster');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('q',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Flexible base photographic medium, positive');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('r',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Flexible base photographic medium, negative');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('s',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Non-flexible base photographic medium, positive');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('t',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Non-flexible base photographic medium, negative');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('u',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Unknown');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('y',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Other photographic medium');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('z',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Other');
INSERT INTO config.marc21_physical_characteristic_subfield_map (ptype_key,subfield,start_pos,length,label) VALUES ('a','f','5','1','Type of reproduction');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('f',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Facsimile');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('n',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Not applicable');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('u',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Unknown');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('z',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Other');
INSERT INTO config.marc21_physical_characteristic_subfield_map (ptype_key,subfield,start_pos,length,label) VALUES ('a','g','6','1','Production/reproduction details');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('a',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Photocopy, blueline print');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('b',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Photocopy');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('c',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Pre-production');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('d',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Film');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('u',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Unknown');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('z',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Other');
INSERT INTO config.marc21_physical_characteristic_subfield_map (ptype_key,subfield,start_pos,length,label) VALUES ('a','h','7','1','Positive/negative');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('a',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Positive');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('b',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Negative');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('m',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Mixed');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('n',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Not applicable');

-- Electronic Resource
INSERT INTO config.marc21_physical_characteristic_type_map (ptype_key, label) VALUES ('c','Electronic Resource');
INSERT INTO config.marc21_physical_characteristic_subfield_map (ptype_key,subfield,start_pos,length,label) VALUES ('c','b','1','1','SMD');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('a',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Tape Cartridge');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('b',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Chip cartridge');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('c',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Computer optical disk cartridge');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('f',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Tape cassette');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('h',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Tape reel');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('j',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Magnetic disk');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('m',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Magneto-optical disk');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('o',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Optical disk');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('r',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Remote');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('u',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Unspecified');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('z',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Other');
INSERT INTO config.marc21_physical_characteristic_subfield_map (ptype_key,subfield,start_pos,length,label) VALUES ('c','d','3','1','Color');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('a',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'One color');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('b',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Black-and-white');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('c',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Multicolored');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('g',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Gray scale');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('m',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Mixed');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('n',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Not applicable');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('u',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Unknown');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('z',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Other');
INSERT INTO config.marc21_physical_characteristic_subfield_map (ptype_key,subfield,start_pos,length,label) VALUES ('c','e','4','1','Dimensions');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('a',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'3 1/2 in.');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('e',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'12 in.');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('g',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'4 3/4 in. or 12 cm.');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('i',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'1 1/8 x 2 3/8 in.');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('j',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'3 7/8 x 2 1/2 in.');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('n',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Not applicable');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('o',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'5 1/4 in.');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('u',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Unknown');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('v',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'8 in.');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('z',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Other');
INSERT INTO config.marc21_physical_characteristic_subfield_map (ptype_key,subfield,start_pos,length,label) VALUES ('c','f','5','1','Sound');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES (' ',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'No sound (Silent)');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('a',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Sound');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('u',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Unknown');
INSERT INTO config.marc21_physical_characteristic_subfield_map (ptype_key,subfield,start_pos,length,label) VALUES ('c','g','6','3','Image bit depth');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('---',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Unknown');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('mmm',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Multiple');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('nnn',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Not applicable');
INSERT INTO config.marc21_physical_characteristic_subfield_map (ptype_key,subfield,start_pos,length,label) VALUES ('c','h','9','1','File formats');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('a',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'One file format');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('m',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Multiple file formats');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('u',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Unknown');
INSERT INTO config.marc21_physical_characteristic_subfield_map (ptype_key,subfield,start_pos,length,label) VALUES ('c','i','10','1','Quality assurance target(s)');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('a',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Absent');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('n',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Not applicable');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('p',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Present');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('u',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Unknown');
INSERT INTO config.marc21_physical_characteristic_subfield_map (ptype_key,subfield,start_pos,length,label) VALUES ('c','j','11','1','Antecedent/Source');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('a',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'File reproduced from original');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('b',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'File reproduced from microform');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('c',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'File reproduced from electronic resource');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('d',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'File reproduced from an intermediate (not microform)');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('m',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Mixed');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('n',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Not applicable');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('u',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Unknown');
INSERT INTO config.marc21_physical_characteristic_subfield_map (ptype_key,subfield,start_pos,length,label) VALUES ('c','k','12','1','Level of compression');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('a',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Uncompressed');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('b',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Lossless');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('d',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Lossy');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('m',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Mixed');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('u',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Unknown');
INSERT INTO config.marc21_physical_characteristic_subfield_map (ptype_key,subfield,start_pos,length,label) VALUES ('c','l','13','1','Reformatting quality');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('a',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Access');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('n',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Not applicable');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('p',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Preservation');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('r',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Replacement');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('u',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Unknown');

-- Globe
INSERT INTO config.marc21_physical_characteristic_type_map (ptype_key, label) VALUES ('d','Globe');
INSERT INTO config.marc21_physical_characteristic_subfield_map (ptype_key,subfield,start_pos,length,label) VALUES ('d','b','1','1','SMD');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('a',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Celestial globe');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('b',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Planetary or lunar globe');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('c',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Terrestrial globe');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('e',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Earth moon globe');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('u',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Unspecified');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('z',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Other');
INSERT INTO config.marc21_physical_characteristic_subfield_map (ptype_key,subfield,start_pos,length,label) VALUES ('d','d','3','1','Color');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('a',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'One color');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('c',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Multicolored');
INSERT INTO config.marc21_physical_characteristic_subfield_map (ptype_key,subfield,start_pos,length,label) VALUES ('d','e','4','1','Physical medium');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('a',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Paper');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('b',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Wood');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('c',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Stone');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('d',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Metal');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('e',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Synthetics');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('f',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Skins');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('g',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Textile');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('p',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Plaster');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('u',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Unknown');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('z',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Other');
INSERT INTO config.marc21_physical_characteristic_subfield_map (ptype_key,subfield,start_pos,length,label) VALUES ('d','f','5','1','Type of reproduction');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('f',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Facsimile');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('n',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Not applicable');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('u',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Unknown');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('z',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Other');

-- Tactile Material
INSERT INTO config.marc21_physical_characteristic_type_map (ptype_key, label) VALUES ('f','Tactile Material');
INSERT INTO config.marc21_physical_characteristic_subfield_map (ptype_key,subfield,start_pos,length,label) VALUES ('f','b','1','1','SMD');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('a',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Moon');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('b',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Braille');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('c',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Combination');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('d',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Tactile, with no writing system');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('u',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Unspecified');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('z',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Other');
INSERT INTO config.marc21_physical_characteristic_subfield_map (ptype_key,subfield,start_pos,length,label) VALUES ('f','d','3','2','Class of braille writing');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('a',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Literary braille');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('b',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Format code braille');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('c',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Mathematics and scientific braille');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('d',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Computer braille');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('e',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Music braille');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('m',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Multiple braille types');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('n',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Not applicable');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('u',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Unknown');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('z',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Other');
INSERT INTO config.marc21_physical_characteristic_subfield_map (ptype_key,subfield,start_pos,length,label) VALUES ('f','e','5','1','Level of contraction');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('a',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Uncontracted');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('b',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Contracted');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('m',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Combination');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('n',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Not applicable');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('u',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Unknown');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('z',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Other');
INSERT INTO config.marc21_physical_characteristic_subfield_map (ptype_key,subfield,start_pos,length,label) VALUES ('f','f','6','3','Braille music format');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('a',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Bar over bar');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('b',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Bar by bar');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('c',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Line over line');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('d',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Paragraph');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('e',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Single line');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('f',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Section by section');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('g',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Line by line');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('h',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Open score');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('i',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Spanner short form scoring');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('j',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Short form scoring');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('k',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Outline');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('l',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Vertical score');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('n',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Not applicable');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('u',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Unknown');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('z',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Other');
INSERT INTO config.marc21_physical_characteristic_subfield_map (ptype_key,subfield,start_pos,length,label) VALUES ('f','g','9','1','Special physical characteristics');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('a',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Print/braille');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('b',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Jumbo or enlarged braille');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('n',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Not applicable');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('u',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Unknown');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('z',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Other');

-- Projected Graphic
INSERT INTO config.marc21_physical_characteristic_type_map (ptype_key, label) VALUES ('g','Projected Graphic');
INSERT INTO config.marc21_physical_characteristic_subfield_map (ptype_key,subfield,start_pos,length,label) VALUES ('g','b','1','1','SMD');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('c',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Film cartridge');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('d',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Filmstrip');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('f',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Film filmstrip type');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('o',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Filmstrip roll');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('s',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Slide');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('t',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Transparency');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('z',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Other');
INSERT INTO config.marc21_physical_characteristic_subfield_map (ptype_key,subfield,start_pos,length,label) VALUES ('g','d','3','1','Color');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('b',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Black-and-white');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('c',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Multicolored');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('h',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Hand-colored');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('m',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Mixed');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('n',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Not applicable');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('u',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Unknown');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('z',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Other');
INSERT INTO config.marc21_physical_characteristic_subfield_map (ptype_key,subfield,start_pos,length,label) VALUES ('g','e','4','1','Base of emulsion');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('d',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Glass');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('e',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Synthetics');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('j',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Safety film');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('k',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Film base, other than safety film');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('m',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Mixed collection');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('o',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Paper');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('u',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Unknown');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('z',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Other');
INSERT INTO config.marc21_physical_characteristic_subfield_map (ptype_key,subfield,start_pos,length,label) VALUES ('g','f','5','1','Sound on medium or separate');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('a',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Sound on medium');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('b',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Sound separate from medium');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('u',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Unknown');
INSERT INTO config.marc21_physical_characteristic_subfield_map (ptype_key,subfield,start_pos,length,label) VALUES ('g','g','6','1','Medium for sound');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('a',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Optical sound track on motion picture film');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('b',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Magnetic sound track on motion picture film');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('c',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Magnetic audio tape in cartridge');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('d',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Sound disc');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('e',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Magnetic audio tape on reel');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('f',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Magnetic audio tape in cassette');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('g',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Optical and magnetic sound track on film');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('h',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Videotape');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('i',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Videodisc');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('u',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Unknown');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('z',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Other');
INSERT INTO config.marc21_physical_characteristic_subfield_map (ptype_key,subfield,start_pos,length,label) VALUES ('g','h','7','1','Dimensions');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('a',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Standard 8 mm.');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('b',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Super 8 mm./single 8 mm.');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('c',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'9.5 mm.');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('d',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'16 mm.');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('e',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'28 mm.');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('f',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'35 mm.');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('g',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'70 mm.');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('j',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'2 x 2 in. (5 x 5 cm.)');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('k',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'2 1/4 x 2 1/4 in. (6 x 6 cm.)');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('s',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'4 x 5 in. (10 x 13 cm.)');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('t',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'5 x 7 in. (13 x 18 cm.)');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('u',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Unknown');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('v',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'8 x 10 in. (21 x 26 cm.)');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('w',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'9 x 9 in. (23 x 23 cm.)');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('x',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'10 x 10 in. (26 x 26 cm.)');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('y',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'7 x 7 in. (18 x 18 cm.)');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('z',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Other');
INSERT INTO config.marc21_physical_characteristic_subfield_map (ptype_key,subfield,start_pos,length,label) VALUES ('g','i','8','1','Secondary support material');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('c',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Cardboard');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('d',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Glass');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('e',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Synthetics');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('h',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'metal');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('j',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Metal and glass');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('k',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Synthetics and glass');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('m',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Mixed collection');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('u',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Unknown');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('z',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Other');

-- Microform
INSERT INTO config.marc21_physical_characteristic_type_map (ptype_key, label) VALUES ('h','Microform');
INSERT INTO config.marc21_physical_characteristic_subfield_map (ptype_key,subfield,start_pos,length,label) VALUES ('h','b','1','1','SMD');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('a',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Aperture card');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('b',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Microfilm cartridge');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('c',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Microfilm cassette');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('d',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Microfilm reel');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('e',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Microfiche');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('f',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Microfiche cassette');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('g',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Microopaque');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('u',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Unspecified');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('z',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Other');
INSERT INTO config.marc21_physical_characteristic_subfield_map (ptype_key,subfield,start_pos,length,label) VALUES ('h','d','3','1','Positive/negative');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('a',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Positive');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('b',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Negative');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('m',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Mixed');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('u',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Unknown');
INSERT INTO config.marc21_physical_characteristic_subfield_map (ptype_key,subfield,start_pos,length,label) VALUES ('h','e','4','1','Dimensions');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('a',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'8 mm.');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('e',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'16 mm.');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('f',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'35 mm.');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('g',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'70mm.');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('h',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'105 mm.');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('l',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'3 x 5 in. (8 x 13 cm.)');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('m',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'4 x 6 in. (11 x 15 cm.)');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('o',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'6 x 9 in. (16 x 23 cm.)');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('p',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'3 1/4 x 7 3/8 in. (9 x 19 cm.)');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('u',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Unknown');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('z',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Other');
INSERT INTO config.marc21_physical_characteristic_subfield_map (ptype_key,subfield,start_pos,length,label) VALUES ('h','f','5','4','Reduction ratio range/Reduction ratio');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('a',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Low (1-16x)');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('b',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Normal (16-30x)');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('c',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'High (31-60x)');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('d',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Very high (61-90x)');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('e',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Ultra (90x-)');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('u',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Unknown');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('v',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Reduction ratio varies');
INSERT INTO config.marc21_physical_characteristic_subfield_map (ptype_key,subfield,start_pos,length,label) VALUES ('h','g','9','1','Color');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('b',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Black-and-white');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('c',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Multicolored');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('m',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Mixed');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('u',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Unknown');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('z',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Other');
INSERT INTO config.marc21_physical_characteristic_subfield_map (ptype_key,subfield,start_pos,length,label) VALUES ('h','h','10','1','Emulsion on film');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('a',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Silver halide');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('b',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Diazo');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('c',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Vesicular');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('m',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Mixed');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('n',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Not applicable');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('u',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Unknown');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('z',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Other');
INSERT INTO config.marc21_physical_characteristic_subfield_map (ptype_key,subfield,start_pos,length,label) VALUES ('h','i','11','1','Quality assurance target(s)');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('a',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'1st gen. master');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('b',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Printing master');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('c',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Service copy');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('m',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Mixed generation');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('u',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Unknown');
INSERT INTO config.marc21_physical_characteristic_subfield_map (ptype_key,subfield,start_pos,length,label) VALUES ('h','j','12','1','Base of film');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('a',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Safety base, undetermined');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('c',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Safety base, acetate undetermined');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('d',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Safety base, diacetate');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('l',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Nitrate base');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('m',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Mixed base');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('n',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Not applicable');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('p',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Safety base, polyester');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('r',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Safety base, mixed');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('t',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Safety base, triacetate');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('u',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Unknown');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('z',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Other');

-- Non-projected Graphic
INSERT INTO config.marc21_physical_characteristic_type_map (ptype_key, label) VALUES ('k','Non-projected Graphic');
INSERT INTO config.marc21_physical_characteristic_subfield_map (ptype_key,subfield,start_pos,length,label) VALUES ('k','b','1','1','SMD');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('c',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Collage');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('d',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Drawing');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('e',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Painting');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('f',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Photo-mechanical print');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('g',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Photonegative');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('h',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Photoprint');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('i',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Picture');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('j',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Print');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('l',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Technical drawing');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('n',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Chart');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('o',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Flash/activity card');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('u',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Unspecified');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('z',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Other');
INSERT INTO config.marc21_physical_characteristic_subfield_map (ptype_key,subfield,start_pos,length,label) VALUES ('k','d','3','1','Color');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('a',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'One color');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('b',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Black-and-white');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('c',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Multicolored');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('h',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Hand-colored');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('m',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Mixed');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('u',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Unknown');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('z',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Other');
INSERT INTO config.marc21_physical_characteristic_subfield_map (ptype_key,subfield,start_pos,length,label) VALUES ('k','e','4','1','Primary support material');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('a',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Canvas');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('b',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Bristol board');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('c',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Cardboard/illustration board');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('d',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Glass');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('e',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Synthetics');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('f',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Skins');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('g',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Textile');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('h',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Metal');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('m',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Mixed collection');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('o',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Paper');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('p',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Plaster');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('q',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Hardboard');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('r',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Porcelain');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('s',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Stone');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('t',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Wood');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('u',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Unknown');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('z',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Other');
INSERT INTO config.marc21_physical_characteristic_subfield_map (ptype_key,subfield,start_pos,length,label) VALUES ('k','f','5','1','Secondary support material');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('a',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Canvas');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('b',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Bristol board');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('c',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Cardboard/illustration board');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('d',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Glass');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('e',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Synthetics');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('f',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Skins');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('g',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Textile');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('h',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Metal');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('m',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Mixed collection');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('o',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Paper');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('p',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Plaster');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('q',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Hardboard');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('r',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Porcelain');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('s',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Stone');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('t',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Wood');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('u',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Unknown');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('z',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Other');

-- Motion Picture
INSERT INTO config.marc21_physical_characteristic_type_map (ptype_key, label) VALUES ('m','Motion Picture');
INSERT INTO config.marc21_physical_characteristic_subfield_map (ptype_key,subfield,start_pos,length,label) VALUES ('m','b','1','1','SMD');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('a',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Film cartridge');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('f',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Film cassette');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('r',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Film reel');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('u',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Unspecified');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('z',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Other');
INSERT INTO config.marc21_physical_characteristic_subfield_map (ptype_key,subfield,start_pos,length,label) VALUES ('m','d','3','1','Color');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('b',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Black-and-white');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('c',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Multicolored');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('h',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Hand-colored');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('m',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Mixed');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('u',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Unknown');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('z',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Other');
INSERT INTO config.marc21_physical_characteristic_subfield_map (ptype_key,subfield,start_pos,length,label) VALUES ('m','e','4','1','Motion picture presentation format');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('a',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Standard sound aperture, reduced frame');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('b',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Nonanamorphic (wide-screen)');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('c',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'3D');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('d',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Anamorphic (wide-screen)');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('e',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Other-wide screen format');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('f',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Standard. silent aperture, full frame');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('u',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Unknown');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('z',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Other');
INSERT INTO config.marc21_physical_characteristic_subfield_map (ptype_key,subfield,start_pos,length,label) VALUES ('m','f','5','1','Sound on medium or separate');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('a',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Sound on medium');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('b',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Sound separate from medium');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('u',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Unknown');
INSERT INTO config.marc21_physical_characteristic_subfield_map (ptype_key,subfield,start_pos,length,label) VALUES ('m','g','6','1','Medium for sound');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('a',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Optical sound track on motion picture film');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('b',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Magnetic sound track on motion picture film');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('c',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Magnetic audio tape in cartridge');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('d',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Sound disc');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('e',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Magnetic audio tape on reel');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('f',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Magnetic audio tape in cassette');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('g',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Optical and magnetic sound track on film');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('h',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Videotape');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('i',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Videodisc');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('u',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Unknown');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('z',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Other');
INSERT INTO config.marc21_physical_characteristic_subfield_map (ptype_key,subfield,start_pos,length,label) VALUES ('m','h','7','1','Dimensions');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('a',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Standard 8 mm.');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('b',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Super 8 mm./single 8 mm.');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('c',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'9.5 mm.');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('d',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'16 mm.');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('e',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'28 mm.');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('f',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'35 mm.');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('g',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'70 mm.');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('u',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Unknown');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('z',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Other');
INSERT INTO config.marc21_physical_characteristic_subfield_map (ptype_key,subfield,start_pos,length,label) VALUES ('m','i','8','1','Configuration of playback channels');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('k',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Mixed');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('m',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Monaural');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('n',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Not applicable');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('q',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Multichannel, surround or quadraphonic');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('s',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Stereophonic');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('u',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Unknown');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('z',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Other');
INSERT INTO config.marc21_physical_characteristic_subfield_map (ptype_key,subfield,start_pos,length,label) VALUES ('m','j','9','1','Production elements');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('a',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Work print');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('b',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Trims');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('c',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Outtakes');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('d',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Rushes');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('e',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Mixing tracks');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('f',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Title bands/inter-title rolls');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('g',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Production rolls');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('n',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Not applicable');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('z',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Other');

-- Remote-sensing Image
INSERT INTO config.marc21_physical_characteristic_type_map (ptype_key, label) VALUES ('r','Remote-sensing Image');
INSERT INTO config.marc21_physical_characteristic_subfield_map (ptype_key,subfield,start_pos,length,label) VALUES ('r','b','1','1','SMD');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('u',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Unspecified');
INSERT INTO config.marc21_physical_characteristic_subfield_map (ptype_key,subfield,start_pos,length,label) VALUES ('r','d','3','1','Altitude of sensor');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('a',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Surface');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('b',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Airborne');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('c',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Spaceborne');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('n',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Not applicable');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('u',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Unknown');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('z',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Other');
INSERT INTO config.marc21_physical_characteristic_subfield_map (ptype_key,subfield,start_pos,length,label) VALUES ('r','e','4','1','Attitude of sensor');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('a',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Low oblique');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('b',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'High oblique');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('c',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Vertical');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('n',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Not applicable');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('u',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Unknown');
INSERT INTO config.marc21_physical_characteristic_subfield_map (ptype_key,subfield,start_pos,length,label) VALUES ('r','f','5','1','Cloud cover');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('0',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'0-09%');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('1',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'10-19%');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('2',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'20-29%');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('3',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'30-39%');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('4',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'40-49%');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('5',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'50-59%');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('6',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'60-69%');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('7',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'70-79%');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('8',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'80-89%');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('9',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'90-100%');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('n',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Not applicable');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('u',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Unknown');
INSERT INTO config.marc21_physical_characteristic_subfield_map (ptype_key,subfield,start_pos,length,label) VALUES ('r','g','6','1','Platform construction type');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('a',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Balloon');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('b',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Aircraft-low altitude');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('c',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Aircraft-medium altitude');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('d',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Aircraft-high altitude');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('e',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Manned spacecraft');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('f',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Unmanned spacecraft');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('g',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Land-based remote-sensing device');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('h',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Water surface-based remote-sensing device');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('i',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Submersible remote-sensing device');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('n',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Not applicable');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('u',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Unknown');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('z',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Other');
INSERT INTO config.marc21_physical_characteristic_subfield_map (ptype_key,subfield,start_pos,length,label) VALUES ('r','h','7','1','Platform use category');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('a',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Meteorological');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('b',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Surface observing');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('c',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Space observing');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('m',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Mixed uses');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('n',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Not applicable');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('u',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Unknown');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('z',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Other');
INSERT INTO config.marc21_physical_characteristic_subfield_map (ptype_key,subfield,start_pos,length,label) VALUES ('r','i','8','1','Sensor type');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('a',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Active');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('b',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Passive');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('u',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Unknown');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('z',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Other');
INSERT INTO config.marc21_physical_characteristic_subfield_map (ptype_key,subfield,start_pos,length,label) VALUES ('r','j','9','2','Data type');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('aa',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Visible light');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('da',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Near infrared');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('db',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Middle infrared');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('dc',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Far infrared');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('dd',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Thermal infrared');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('de',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Shortwave infrared (SWIR)');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('df',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Reflective infrared');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('dv',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Combinations');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('dz',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Other infrared data');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('ga',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Sidelooking airborne radar (SLAR)');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('gb',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Synthetic aperture radar (SAR-single frequency)');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('gc',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'SAR-multi-frequency (multichannel)');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('gd',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'SAR-like polarization');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('ge',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'SAR-cross polarization');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('gf',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Infometric SAR');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('gg',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Polarmetric SAR');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('gu',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Passive microwave mapping');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('gz',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Other microwave data');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('ja',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Far ultraviolet');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('jb',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Middle ultraviolet');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('jc',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Near ultraviolet');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('jv',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Ultraviolet combinations');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('jz',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Other ultraviolet data');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('ma',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Multi-spectral, multidata');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('mb',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Multi-temporal');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('mm',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Combination of various data types');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('nn',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Not applicable');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('pa',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Sonar-water depth');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('pb',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Sonar-bottom topography images, sidescan');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('pc',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Sonar-bottom topography, near-surface');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('pd',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Sonar-bottom topography, near-bottom');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('pe',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Seismic surveys');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('pz',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Other acoustical data');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('ra',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Gravity anomales (general)');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('rb',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Free-air');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('rc',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Bouger');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('rd',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Isostatic');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('sa',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Magnetic field');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('ta',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Radiometric surveys');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('uu',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Unknown');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('zz',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Other');

-- Sound Recording
INSERT INTO config.marc21_physical_characteristic_type_map (ptype_key, label) VALUES ('s','Sound Recording');
INSERT INTO config.marc21_physical_characteristic_subfield_map (ptype_key,subfield,start_pos,length,label) VALUES ('s','b','1','1','SMD');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('d',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Sound disc');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('e',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Cylinder');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('g',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Sound cartridge');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('i',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Sound-track film');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('q',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Roll');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('s',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Sound cassette');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('t',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Sound-tape reel');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('u',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Unspecified');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('w',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Wire recording');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('z',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Other');
INSERT INTO config.marc21_physical_characteristic_subfield_map (ptype_key,subfield,start_pos,length,label) VALUES ('s','d','3','1','Speed');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('a',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'16 rpm');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('b',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'33 1/3 rpm');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('c',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'45 rpm');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('d',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'78 rpm');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('e',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'8 rpm');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('f',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'1.4 mps');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('h',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'120 rpm');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('i',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'160 rpm');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('k',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'15/16 ips');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('l',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'1 7/8 ips');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('m',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'3 3/4 ips');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('o',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'7 1/2 ips');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('p',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'15 ips');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('r',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'30 ips');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('u',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Unknown');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('z',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Other');
INSERT INTO config.marc21_physical_characteristic_subfield_map (ptype_key,subfield,start_pos,length,label) VALUES ('s','e','4','1','Configuration of playback channels');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('m',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Monaural');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('q',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Quadraphonic');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('s',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Stereophonic');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('u',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Unknown');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('z',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Other');
INSERT INTO config.marc21_physical_characteristic_subfield_map (ptype_key,subfield,start_pos,length,label) VALUES ('s','f','5','1','Groove width or pitch');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('m',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Microgroove/fine');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('n',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Not applicable');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('s',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Coarse/standard');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('u',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Unknown');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('z',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Other');
INSERT INTO config.marc21_physical_characteristic_subfield_map (ptype_key,subfield,start_pos,length,label) VALUES ('s','g','6','1','Dimensions');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('a',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'3 in.');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('b',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'5 in.');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('c',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'7 in.');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('d',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'10 in.');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('e',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'12 in.');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('f',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'16 in.');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('g',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'4 3/4 in. (12 cm.)');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('j',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'3 7/8 x 2 1/2 in.');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('n',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Not applicable');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('o',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'5 1/4 x 3 7/8 in.');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('s',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'2 3/4 x 4 in.');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('u',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Unknown');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('z',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Other');
INSERT INTO config.marc21_physical_characteristic_subfield_map (ptype_key,subfield,start_pos,length,label) VALUES ('s','h','7','1','Tape width');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('l',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'1/8 in.');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('m',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'1/4in.');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('n',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Not applicable');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('o',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'1/2 in.');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('p',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'1 in.');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('u',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Unknown');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('z',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Other');
INSERT INTO config.marc21_physical_characteristic_subfield_map (ptype_key,subfield,start_pos,length,label) VALUES ('s','i','8','1','Tape configuration ');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('a',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Full (1) track');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('b',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Half (2) track');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('c',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Quarter (4) track');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('d',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'8 track');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('e',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'12 track');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('f',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'16 track');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('n',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Not applicable');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('u',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Unknown');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('z',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Other');
INSERT INTO config.marc21_physical_characteristic_subfield_map (ptype_key,subfield,start_pos,length,label) VALUES ('s','m','12','1','Special playback');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('a',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'NAB standard');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('b',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'CCIR standard');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('c',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Dolby-B encoded, standard Dolby');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('d',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'dbx encoded');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('e',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Digital recording');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('f',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Dolby-A encoded');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('g',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Dolby-C encoded');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('h',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'CX encoded');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('n',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Not applicable');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('u',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Unknown');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('z',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Other');
INSERT INTO config.marc21_physical_characteristic_subfield_map (ptype_key,subfield,start_pos,length,label) VALUES ('s','n','13','1','Capture and storage');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('a',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Acoustical capture, direct storage');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('b',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Direct storage, not acoustical');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('d',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Digital storage');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('e',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Analog electrical storage');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('u',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Unknown');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('z',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Other');

-- Videorecording
INSERT INTO config.marc21_physical_characteristic_type_map (ptype_key, label) VALUES ('v','Videorecording');
INSERT INTO config.marc21_physical_characteristic_subfield_map (ptype_key,subfield,start_pos,length,label) VALUES ('v','b','1','1','SMD');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('c',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Videocartridge');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('d',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Videodisc');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('f',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Videocassette');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('r',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Videoreel');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('u',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Unspecified');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('z',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Other');
INSERT INTO config.marc21_physical_characteristic_subfield_map (ptype_key,subfield,start_pos,length,label) VALUES ('v','d','3','1','Color');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('b',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Black-and-white');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('c',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Multicolored');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('m',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Mixed');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('n',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Not applicable');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('u',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Unknown');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('z',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Other');
INSERT INTO config.marc21_physical_characteristic_subfield_map (ptype_key,subfield,start_pos,length,label) VALUES ('v','e','4','1','Videorecording format');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('a',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Beta');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('b',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'VHS');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('c',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'U-matic');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('d',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'EIAJ');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('e',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Type C');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('f',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Quadruplex');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('g',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Laserdisc');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('h',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'CED');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('i',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Betacam');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('j',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Betacam SP');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('k',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Super-VHS');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('m',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'M-II');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('o',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'D-2');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('p',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'8 mm.');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('q',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Hi-8 mm.');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('s',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Blu-ray');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('u',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Unknown');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('v',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'DVD');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('z',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Other');
INSERT INTO config.marc21_physical_characteristic_subfield_map (ptype_key,subfield,start_pos,length,label) VALUES ('v','f','5','1','Sound on medium or separate');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('a',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Sound on medium');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('b',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Sound separate from medium');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('u',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Unknown');
INSERT INTO config.marc21_physical_characteristic_subfield_map (ptype_key,subfield,start_pos,length,label) VALUES ('v','g','6','1','Medium for sound');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('a',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Optical sound track on motion picture film');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('b',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Magnetic sound track on motion picture film');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('c',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Magnetic audio tape in cartridge');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('d',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Sound disc');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('e',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Magnetic audio tape on reel');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('f',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Magnetic audio tape in cassette');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('g',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Optical and magnetic sound track on motion picture film');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('h',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Videotape');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('i',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Videodisc');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('u',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Unknown');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('z',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Other');
INSERT INTO config.marc21_physical_characteristic_subfield_map (ptype_key,subfield,start_pos,length,label) VALUES ('v','h','7','1','Dimensions');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('a',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'8 mm.');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('m',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'1/4 in.');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('o',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'1/2 in.');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('p',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'1 in.');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('q',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'2 in.');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('r',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'3/4 in.');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('u',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Unknown');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('z',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Other');
INSERT INTO config.marc21_physical_characteristic_subfield_map (ptype_key,subfield,start_pos,length,label) VALUES ('v','i','8','1','Configuration of playback channel');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('k',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Mixed');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('m',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Monaural');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('n',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Not applicable');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('q',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Multichannel, surround or quadraphonic');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('s',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Stereophonic');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('u',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Unknown');
INSERT INTO config.marc21_physical_characteristic_value_map (value,ptype_subfield,label) VALUES ('z',CURRVAL('config.marc21_physical_characteristic_subfield_map_id_seq'),'Other');

-- Fixed Field position data -- 0-based!
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('Alph', '006', 'SER', 16, 1, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('Alph', '008', 'SER', 33, 1, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('Audn', '006', 'BKS', 5, 1, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('Audn', '006', 'COM', 5, 1, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('Audn', '006', 'REC', 5, 1, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('Audn', '006', 'SCO', 5, 1, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('Audn', '006', 'VIS', 5, 1, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('Audn', '008', 'BKS', 22, 1, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('Audn', '008', 'COM', 22, 1, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('Audn', '008', 'REC', 22, 1, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('Audn', '008', 'SCO', 22, 1, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('Audn', '008', 'VIS', 22, 1, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('BLvl', 'ldr', 'BKS', 7, 1, 'm');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('BLvl', 'ldr', 'COM', 7, 1, 'm');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('BLvl', 'ldr', 'MAP', 7, 1, 'm');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('BLvl', 'ldr', 'MIX', 7, 1, 'c');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('BLvl', 'ldr', 'REC', 7, 1, 'm');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('BLvl', 'ldr', 'SCO', 7, 1, 'm');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('BLvl', 'ldr', 'SER', 7, 1, 's');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('BLvl', 'ldr', 'VIS', 7, 1, 'm');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('Biog', '006', 'BKS', 17, 1, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('Biog', '008', 'BKS', 34, 1, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('Conf', '006', 'BKS', 11, 1, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('Conf', '006', 'SER', 11, 1, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('Conf', '008', 'BKS', 29, 1, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('Conf', '008', 'SER', 29, 1, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('Cont', '006', 'BKS', 7, 4, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('Cont', '006', 'SER', 8, 3, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('Cont', '008', 'BKS', 24, 4, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('Cont', '008', 'SER', 25, 3, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('Ctrl', 'ldr', 'BKS', 8, 1, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('Ctrl', 'ldr', 'COM', 8, 1, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('Ctrl', 'ldr', 'MAP', 8, 1, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('Ctrl', 'ldr', 'MIX', 8, 1, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('Ctrl', 'ldr', 'REC', 8, 1, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('Ctrl', 'ldr', 'SCO', 8, 1, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('Ctrl', 'ldr', 'SER', 8, 1, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('Ctrl', 'ldr', 'VIS', 8, 1, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('Ctry', '008', 'BKS', 15, 3, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('Ctry', '008', 'COM', 15, 3, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('Ctry', '008', 'MAP', 15, 3, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('Ctry', '008', 'MIX', 15, 3, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('Ctry', '008', 'REC', 15, 3, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('Ctry', '008', 'SCO', 15, 3, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('Ctry', '008', 'SER', 15, 3, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('Ctry', '008', 'VIS', 15, 3, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('Date1', '008', 'BKS', 7, 4, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('Date1', '008', 'COM', 7, 4, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('Date1', '008', 'MAP', 7, 4, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('Date1', '008', 'MIX', 7, 4, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('Date1', '008', 'REC', 7, 4, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('Date1', '008', 'SCO', 7, 4, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('Date1', '008', 'SER', 7, 4, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('Date1', '008', 'VIS', 7, 4, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('Date2', '008', 'BKS', 11, 4, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('Date2', '008', 'COM', 11, 4, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('Date2', '008', 'MAP', 11, 4, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('Date2', '008', 'MIX', 11, 4, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('Date2', '008', 'REC', 11, 4, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('Date2', '008', 'SCO', 11, 4, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('Date2', '008', 'SER', 11, 4, '9');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('Date2', '008', 'VIS', 11, 4, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('Desc', 'ldr', 'BKS', 18, 1, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('Desc', 'ldr', 'COM', 18, 1, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('Desc', 'ldr', 'MAP', 18, 1, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('Desc', 'ldr', 'MIX', 18, 1, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('Desc', 'ldr', 'REC', 18, 1, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('Desc', 'ldr', 'SCO', 18, 1, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('Desc', 'ldr', 'SER', 18, 1, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('Desc', 'ldr', 'VIS', 18, 1, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('DtSt', '008', 'BKS', 6, 1, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('DtSt', '008', 'COM', 6, 1, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('DtSt', '008', 'MAP', 6, 1, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('DtSt', '008', 'MIX', 6, 1, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('DtSt', '008', 'REC', 6, 1, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('DtSt', '008', 'SCO', 6, 1, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('DtSt', '008', 'SER', 6, 1, 'c');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('DtSt', '008', 'VIS', 6, 1, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('ELvl', 'ldr', 'BKS', 17, 1, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('ELvl', 'ldr', 'COM', 17, 1, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('ELvl', 'ldr', 'MAP', 17, 1, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('ELvl', 'ldr', 'MIX', 17, 1, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('ELvl', 'ldr', 'REC', 17, 1, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('ELvl', 'ldr', 'SCO', 17, 1, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('ELvl', 'ldr', 'SER', 17, 1, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('ELvl', 'ldr', 'VIS', 17, 1, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('ELvl', 'ldr', 'AUT', 17, 1, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('Fest', '006', 'BKS', 13, 1, '0');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('Fest', '008', 'BKS', 30, 1, '0');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('Form', '006', 'BKS', 6, 1, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('Form', '006', 'MAP', 12, 1, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('Form', '006', 'MIX', 6, 1, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('Form', '006', 'REC', 6, 1, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('Form', '006', 'SCO', 6, 1, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('Form', '006', 'SER', 6, 1, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('Form', '006', 'VIS', 12, 1, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('Form', '008', 'BKS', 23, 1, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('Form', '008', 'MAP', 29, 1, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('Form', '008', 'MIX', 23, 1, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('Form', '008', 'REC', 23, 1, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('Form', '008', 'SCO', 23, 1, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('Form', '008', 'SER', 23, 1, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('Form', '008', 'VIS', 29, 1, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('GPub', '006', 'BKS', 11, 1, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('GPub', '006', 'COM', 11, 1, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('GPub', '006', 'MAP', 11, 1, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('GPub', '006', 'SER', 11, 1, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('GPub', '006', 'VIS', 11, 1, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('GPub', '008', 'BKS', 28, 1, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('GPub', '008', 'COM', 28, 1, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('GPub', '008', 'MAP', 28, 1, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('GPub', '008', 'SER', 28, 1, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('GPub', '008', 'VIS', 28, 1, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('Ills', '006', 'BKS', 1, 4, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('Ills', '008', 'BKS', 18, 4, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('Indx', '006', 'BKS', 14, 1, '0');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('Indx', '006', 'MAP', 14, 1, '0');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('Indx', '008', 'BKS', 31, 1, '0');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('Indx', '008', 'MAP', 31, 1, '0');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('Lang', '008', 'BKS', 35, 3, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('Lang', '008', 'COM', 35, 3, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('Lang', '008', 'MAP', 35, 3, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('Lang', '008', 'MIX', 35, 3, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('Lang', '008', 'REC', 35, 3, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('Lang', '008', 'SCO', 35, 3, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('Lang', '008', 'SER', 35, 3, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('Lang', '008', 'VIS', 35, 3, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('LitF', '006', 'BKS', 16, 1, '0');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('LitF', '008', 'BKS', 33, 1, '0');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('MRec', '008', 'BKS', 38, 1, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('MRec', '008', 'COM', 38, 1, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('MRec', '008', 'MAP', 38, 1, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('MRec', '008', 'MIX', 38, 1, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('MRec', '008', 'REC', 38, 1, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('MRec', '008', 'SCO', 38, 1, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('MRec', '008', 'SER', 38, 1, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('MRec', '008', 'VIS', 38, 1, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('S/L', '006', 'SER', 17, 1, '0');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('S/L', '008', 'SER', 34, 1, '0');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('TMat', '006', 'VIS', 16, 1, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('TMat', '008', 'VIS', 33, 1, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('Type', 'ldr', 'BKS', 6, 1, 'a');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('Type', 'ldr', 'COM', 6, 1, 'm');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('Type', 'ldr', 'MAP', 6, 1, 'e');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('Type', 'ldr', 'MIX', 6, 1, 'p');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('Type', 'ldr', 'REC', 6, 1, 'i');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('Type', 'ldr', 'SCO', 6, 1, 'c');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('Type', 'ldr', 'SER', 6, 1, 'a');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('Type', 'ldr', 'VIS', 6, 1, 'g');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('Subj', '008', 'AUT', 11, 1, '|');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('RecStat', 'ldr', 'AUT', 5, 1, 'n');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('Type', 'ldr', 'AUT', 6, 1, 'z');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('GeoDiv', '008', 'AUT', 6, 1, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('Roman', '008', 'AUT', 7, 1, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('CatLang', '008', 'AUT', 8, 1, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('Kind', '008', 'AUT', 9, 1, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('Rules', '008', 'AUT', 10, 1, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('Subj', '008', 'AUT', 11, 1, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('Series', '008', 'AUT', 12, 1, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('SerNum', '008', 'AUT', 13, 1, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('NameUse', '008', 'AUT', 14, 1, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('SubjUse', '008', 'AUT', 15, 1, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('SerUse', '008', 'AUT', 16, 1, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('TypeSubd', '008', 'AUT', 17, 1, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('GovtAgn', '008', 'AUT', 28, 1, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('RefStatus', '008', 'AUT', 29, 1, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('UpdStatus', '008', 'AUT', 31, 1, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('Name', '008', 'AUT', 32, 1, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('Status', '008', 'AUT', 33, 1, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('ModRec', '008', 'AUT', 38, 1, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('Source', '008', 'AUT', 39, 1, ' ');

INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('File', '008', 'COM', 26, 1, 'u');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('File', '006', 'COM', 9, 1, 'u');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('Freq', '008', 'SER', 18, 1, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('Freq', '006', 'SER', 1, 1, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('Regl', '008', 'SER', 19, 1, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('Regl', '006', 'SER', 2, 1, ' ');

INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('AccM', '006', 'REC', 7, 6, '      ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('AccM', '006', 'SCO', 7, 6, '      ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('AccM', '008', 'REC', 24, 6, '      ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('AccM', '008', 'SCO', 24, 6, '      ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('Comp', '006', 'REC', 1, 2, 'uu');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('Comp', '006', 'SCO', 1, 2, 'uu');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('Comp', '008', 'REC', 18, 2, 'uu');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('Comp', '008', 'SCO', 18, 2, 'uu');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('CrTp', '006', 'MAP', 8, 1, 'a');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('CrTp', '008', 'MAP', 25, 1, 'a');

INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('EntW', '006', 'SER', 7, 1, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('EntW', '008', 'SER', 24, 1, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('FMus', '006', 'REC', 3, 1, 'n');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('FMus', '006', 'SCO', 3, 1, 'u');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('FMus', '008', 'REC', 20, 1, 'n');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('FMus', '008', 'SCO', 20, 1, 'u');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('Form', '006', 'COM', 6, 1, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('Form', '008', 'COM', 23, 1, ' ');

INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('LTxt', '006', 'REC', 13, 2, '  ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('LTxt', '008', 'REC', 30, 2, '  ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('LTxt', '006', 'SCO', 13, 2, 'n ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('LTxt', '008', 'SCO', 30, 2, 'n ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('Orig', '006', 'SER', 5, 1, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('Orig', '008', 'SER', 22, 1, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('Part', '006', 'REC', 4, 1, 'n');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('Part', '006', 'SCO', 4, 1, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('Part', '008', 'REC', 21, 1, 'n');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('Part', '008', 'SCO', 21, 1, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('Proj', '006', 'MAP', 5, 2, '  ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('Proj', '008', 'MAP', 22, 2, '  ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('Relf', '006', 'MAP', 1, 4, '    ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('Relf', '008', 'MAP', 18, 4, '    ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('SpFm', '006', 'MAP', 16, 2, '  ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('SpFm', '008', 'MAP', 33, 2, '  ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('SrTp', '006', 'SER', 4, 1, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('SrTp', '008', 'SER', 21, 1, ' ');

INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('Tech', '006', 'VIS', 17, 1, 'n');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('Tech', '008', 'VIS', 34, 1, 'n');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('Time', '006', 'VIS', 1, 3, '   ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('Time', '008', 'VIS', 18, 3, '   ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('TrAr', '006', 'SCO', 16, 1, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('TrAr', '006', 'REC', 16, 1, 'n');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('TrAr', '008', 'SCO', 33, 1, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('TrAr', '008', 'REC', 33, 1, 'n');


INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('AccM1', '006', 'REC', 7, 1, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('AccM1', '006', 'SCO', 7, 1, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('AccM1', '008', 'REC', 24, 1, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('AccM1', '008', 'SCO', 24, 1, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('AccM2', '006', 'REC', 8, 1, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('AccM2', '006', 'SCO', 8, 1, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('AccM2', '008', 'REC', 25, 1, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('AccM2', '008', 'SCO', 25, 1, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('AccM3', '006', 'REC', 9, 1, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('AccM3', '006', 'SCO', 9, 1, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('AccM3', '008', 'REC', 26, 1, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('AccM3', '008', 'SCO', 26, 1, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('AccM4', '006', 'REC', 10, 1, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('AccM4', '006', 'SCO', 10, 1, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('AccM4', '008', 'REC', 27, 1, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('AccM4', '008', 'SCO', 27, 1, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('AccM5', '006', 'REC', 11, 1, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('AccM5', '006', 'SCO', 11, 1, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('AccM5', '008', 'REC', 28, 1, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('AccM5', '008', 'SCO', 28, 1, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('AccM6', '006', 'REC', 12, 1, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('AccM6', '006', 'SCO', 12, 1, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('AccM6', '008', 'REC', 29, 1, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('AccM6', '008', 'SCO', 29, 1, ' ');

INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('Cont1', '006', 'BKS', 7, 1, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('Cont1', '006', 'SER', 8, 1, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('Cont1', '008', 'BKS', 24, 1, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('Cont1', '008', 'SER', 25, 1, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('Cont2', '006', 'BKS', 8, 1, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('Cont2', '006', 'SER', 9, 1, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('Cont2', '008', 'BKS', 25, 1, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('Cont2', '008', 'SER', 26, 1, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('Cont3', '006', 'BKS', 9, 1, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('Cont3', '006', 'SER', 10, 1, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('Cont3', '008', 'BKS', 26, 1, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('Cont3', '008', 'SER', 27, 1, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('Cont4', '006', 'BKS', 10, 1, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('Cont4', '008', 'BKS', 27, 1, ' ');

INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('Ills1', '006', 'BKS', 1, 1, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('Ills1', '008', 'BKS', 18, 1, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('Ills2', '006', 'BKS', 2, 1, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('Ills2', '008', 'BKS', 19, 1, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('Ills3', '006', 'BKS', 3, 1, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('Ills3', '008', 'BKS', 20, 1, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('Ills4', '006', 'BKS', 4, 1, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('Ills4', '008', 'BKS', 21, 1, ' ');

INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('LTxt1', '006', 'REC', 13, 1, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('LTxt1', '006', 'SCO', 13, 1, 'n');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('LTxt1', '008', 'REC', 30, 1, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('LTxt1', '008', 'SCO', 30, 1, 'n');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('LTxt2', '006', 'REC', 14, 1, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('LTxt2', '006', 'SCO', 14, 1, 'n');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('LTxt2', '008', 'REC', 31, 1, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('LTxt2', '008', 'SCO', 31, 1, 'n');

INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('Relf1', '006', 'MAP', 1, 1, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('Relf1', '008', 'MAP', 18, 1, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('Relf2', '006', 'MAP', 2, 1, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('Relf2', '008', 'MAP', 19, 1, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('Relf3', '006', 'MAP', 3, 1, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('Relf3', '008', 'MAP', 20, 1, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('Relf4', '006', 'MAP', 4, 1, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('Relf4', '008', 'MAP', 21, 1, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('SpFm1', '006', 'MAP', 16, 1, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('SpFm1', '008', 'MAP', 33, 1, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('SpFm2', '006', 'MAP', 17, 1, ' ');
INSERT INTO config.marc21_ff_pos_map (fixed_field, tag, rec_type,start_pos, length, default_val) VALUES ('SpFm2', '008', 'MAP', 34, 1, ' ');


-- record attributes
INSERT INTO config.record_attr_definition (name,label,fixed_field) values ('alph','Alph','Alph');
INSERT INTO config.record_attr_definition (name,label,fixed_field,description) values ('audience','Audn','Audn', oils_i18n_gettext('audience', 'Audience', 'crad', 'label'));
INSERT INTO config.record_attr_definition (name,label,fixed_field,multi,description) values ('bib_level','BLvl','BLvl',FALSE,oils_i18n_gettext('bib_level', 'Bib Level', 'crad', 'label'));
INSERT INTO config.record_attr_definition (name,label,fixed_field) values ('biog','Biog','Biog');
INSERT INTO config.record_attr_definition (name,label,fixed_field) values ('conf','Conf','Conf');
INSERT INTO config.record_attr_definition (name,label,fixed_field,multi) values ('control_type','Ctrl','Ctrl',FALSE);
INSERT INTO config.record_attr_definition (name,label,fixed_field) values ('ctry','Ctry','Ctry');
INSERT INTO config.record_attr_definition (name,label,fixed_field) values ('date1','Date1','Date1');
INSERT INTO config.record_attr_definition (name,label,fixed_field,sorter,filter,multi) values ('pubdate','Pub Date','Date1',TRUE,FALSE,FALSE);
INSERT INTO config.record_attr_definition (name,label,fixed_field) values ('date2','Date2','Date2');
INSERT INTO config.record_attr_definition (name,label,fixed_field,multi) values ('cat_form','Desc','Desc',FALSE);
INSERT INTO config.record_attr_definition (name,label,fixed_field) values ('pub_status','DtSt','DtSt');
INSERT INTO config.record_attr_definition (name,label,fixed_field,multi) values ('enc_level','ELvl','ELvl',FALSE);
INSERT INTO config.record_attr_definition (name,label,fixed_field) values ('fest','Fest','Fest');
INSERT INTO config.record_attr_definition (name,label,fixed_field,description) values ('item_form','Form','Form',oils_i18n_gettext('item_form', 'Item Form', 'crad', 'label'));
INSERT INTO config.record_attr_definition (name,label,fixed_field) values ('gpub','GPub','GPub');
INSERT INTO config.record_attr_definition (name,label,fixed_field,composite) values ('ills','Ills','Ills',TRUE);
INSERT INTO config.record_attr_definition (name,label,fixed_field) values ('indx','Indx','Indx');
INSERT INTO config.record_attr_definition (name,label,fixed_field,description) values ('item_lang','Lang','Lang',oils_i18n_gettext('item_lang', 'Language', 'crad', 'label'));
INSERT INTO config.record_attr_definition (name,label,fixed_field) values ('language','Language (2.0 compat version)','Lang');
INSERT INTO config.record_attr_definition (name,label,fixed_field,description) values ('lit_form','LitF','LitF',oils_i18n_gettext('lit_form', 'Literary Form', 'crad', 'label'));
INSERT INTO config.record_attr_definition (name,label,fixed_field) values ('mrec','MRec','MRec');
INSERT INTO config.record_attr_definition (name,label,fixed_field) values ('ff_sl','S/L','S/L');
INSERT INTO config.record_attr_definition (name,label,fixed_field) values ('type_mat','TMat','TMat');
INSERT INTO config.record_attr_definition (name,label,fixed_field,multi,description) values ('item_type','Type','Type',FALSE,oils_i18n_gettext('item_type', 'Item Type', 'crad', 'label'));
INSERT INTO config.record_attr_definition (name,label,phys_char_sf,description) values ('vr_format','Videorecording format',72,oils_i18n_gettext('vr_format', 'Video Format', 'crad', 'label'));
INSERT INTO config.record_attr_definition (name,label,fixed_field) values ('file','File','File');
INSERT INTO config.record_attr_definition (name,label,fixed_field) values ('freq','Freq','Freq');
INSERT INTO config.record_attr_definition (name,label,fixed_field) values ('regl','Regl','Regl');
INSERT INTO config.record_attr_definition (name,label,sorter,filter,tag,multi) values ('titlesort','Title',TRUE,FALSE,'tnf',FALSE);
INSERT INTO config.record_attr_definition (name,label,sorter,filter,tag,sf_list,multi) values ('authorsort','Author',TRUE,FALSE,'1%','abcdefgklmnopqrstvxyz',FALSE);
INSERT INTO config.record_attr_definition (name, label, phys_char_sf)
    VALUES ('sr_format', oils_i18n_gettext('sr_format', 'Sound recording format', 'crad', 'label'), '62');
INSERT INTO config.record_attr_definition (name, label, multi, filter, composite) 
    VALUES ('icon_format', oils_i18n_gettext('icon_format', 'OPAC Format Icons', 'crad', 'label'), TRUE, TRUE, TRUE);
INSERT INTO config.record_attr_definition (name, label, multi, filter, composite) 
    VALUES ('mr_hold_format', oils_i18n_gettext('mr_hold_format', 'Metarecord Hold Formats', 'crad', 'label'),
    TRUE, TRUE, TRUE);
INSERT INTO config.record_attr_definition 
    (name, label, multi, filter, composite) VALUES (
        'search_format', 
        oils_i18n_gettext('search_format', 'Search Formats', 'crad', 'label'),
        TRUE, TRUE, TRUE
    );

INSERT INTO config.record_attr_definition (name, label, format, xpath, vocabulary) VALUES (
    'content_type', oils_i18n_gettext('content_type', 'Content Type', 'ccvm', 'label'),
    'marcxml',
    $$//marc:datafield[@tag='336']/marc:subfield[@code='a']$$,
    'http://rdaregistry.info/termList/RDAContentType'
);
INSERT INTO config.record_attr_definition (name, label, format, xpath, vocabulary) VALUES (
    'media_type', oils_i18n_gettext('media_type', 'Media Type', 'ccvm', 'label'),
    'marcxml',
    $$//marc:datafield[@tag='337']/marc:subfield[@code='a']$$,
    'http://rdaregistry.info/termList/RDAMediaType'
);
INSERT INTO config.record_attr_definition (name, label, format, xpath, vocabulary) VALUES (
    'carrier_type', oils_i18n_gettext('carrier_type', 'Carrier Type', 'ccvm', 'label'),
    'marcxml',
    $$//marc:datafield[@tag='338']/marc:subfield[@code='a']$$,
    'http://rdaregistry.info/termList/RDACarrierType'
);

INSERT INTO config.record_attr_definition (name,label,fixed_field,composite) VALUES ('accm','AccM','AccM',TRUE);
INSERT INTO config.record_attr_definition (name,label,fixed_field) VALUES ('comp','Comp','Comp');
INSERT INTO config.record_attr_definition (name,label,fixed_field) VALUES ('crtp','CrTp','CrTp');
INSERT INTO config.record_attr_definition (name,label,fixed_field) VALUES ('entw','EntW','EntW');
INSERT INTO config.record_attr_definition (name,label,fixed_field,composite) VALUES ('cont','Cont','Cont',TRUE);
INSERT INTO config.record_attr_definition (name,label,fixed_field) VALUES ('fmus','FMus','FMus');
INSERT INTO config.record_attr_definition (name,label,fixed_field,composite) VALUES ('ltxt','LTxt','LTxt',TRUE);
INSERT INTO config.record_attr_definition (name,label,fixed_field) VALUES ('orig','Orig','Orig');
INSERT INTO config.record_attr_definition (name,label,fixed_field) VALUES ('part','Part','Part');
INSERT INTO config.record_attr_definition (name,label,fixed_field) VALUES ('proj','Proj','Proj');
INSERT INTO config.record_attr_definition (name,label,fixed_field,composite) VALUES ('relf','Relf','Relf',TRUE);
INSERT INTO config.record_attr_definition (name,label,fixed_field,composite) VALUES ('spfm','SpFm','SpFm',TRUE);
INSERT INTO config.record_attr_definition (name,label,fixed_field) VALUES ('srtp','SrTp','SrTp');
INSERT INTO config.record_attr_definition (name,label,fixed_field) VALUES ('tech','Tech','Tech');
INSERT INTO config.record_attr_definition (name,label,fixed_field) VALUES ('trar','TrAr','TrAr');
INSERT INTO config.record_attr_definition (name,label,fixed_field) VALUES ('accm1','AccM(1)','AccM1');
INSERT INTO config.record_attr_definition (name,label,fixed_field) VALUES ('accm2','AccM(2)','AccM2');
INSERT INTO config.record_attr_definition (name,label,fixed_field) VALUES ('accm3','AccM(3)','AccM3');
INSERT INTO config.record_attr_definition (name,label,fixed_field) VALUES ('accm4','AccM(4)','AccM4');
INSERT INTO config.record_attr_definition (name,label,fixed_field) VALUES ('accm5','AccM(5)','AccM5');
INSERT INTO config.record_attr_definition (name,label,fixed_field) VALUES ('accm6','AccM(6)','AccM6');
INSERT INTO config.record_attr_definition (name,label,fixed_field) VALUES ('cont1','Cont(1)','Cont1');
INSERT INTO config.record_attr_definition (name,label,fixed_field) VALUES ('cont2','Cont(2)','Cont2');
INSERT INTO config.record_attr_definition (name,label,fixed_field) VALUES ('cont3','Cont(3)','Cont3');
INSERT INTO config.record_attr_definition (name,label,fixed_field) VALUES ('cont4','Cont(4)','Cont4');
INSERT INTO config.record_attr_definition (name,label,fixed_field) VALUES ('ills1','Ills(1)','Ills1');
INSERT INTO config.record_attr_definition (name,label,fixed_field) VALUES ('ills2','Ills(2)','Ills2');
INSERT INTO config.record_attr_definition (name,label,fixed_field) VALUES ('ills3','Ills(3)','Ills3');
INSERT INTO config.record_attr_definition (name,label,fixed_field) VALUES ('ills4','Ills(4)','Ills4');
INSERT INTO config.record_attr_definition (name,label,fixed_field) VALUES ('ltxt1','LTxt(1)','LTxt1');
INSERT INTO config.record_attr_definition (name,label,fixed_field) VALUES ('ltxt2','LTxt(2)','LTxt2');
INSERT INTO config.record_attr_definition (name,label,fixed_field) VALUES ('relf1','Relf(1)','Relf1');
INSERT INTO config.record_attr_definition (name,label,fixed_field) VALUES ('relf2','Relf(2)','Relf2');
INSERT INTO config.record_attr_definition (name,label,fixed_field) VALUES ('relf3','Relf(3)','Relf3');
INSERT INTO config.record_attr_definition (name,label,fixed_field) VALUES ('relf4','Relf(4)','Relf4');
INSERT INTO config.record_attr_definition (name,label,fixed_field) VALUES ('spfm1','SpFm(1)','SpFm1');
INSERT INTO config.record_attr_definition (name,label,fixed_field) VALUES ('spfm2','SpFm(2)','SpFm2');


-- TO-DO: Auto-generate these values from CLDR
-- XXX These are the values used in MARC records ... does that match CLDR, including deprecated languages?
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES
    (1, 'item_lang', 'aar', oils_i18n_gettext('aar', 'Afar', 'ccvm', 'value')),
    (2, 'item_lang', 'abk', oils_i18n_gettext('abk', 'Abkhaz', 'ccvm', 'value')),
    (3, 'item_lang', 'ace', oils_i18n_gettext('ace', 'Achinese', 'ccvm', 'value')),
    (4, 'item_lang', 'ach', oils_i18n_gettext('ach', 'Acoli', 'ccvm', 'value')),
    (5, 'item_lang', 'ada', oils_i18n_gettext('ada', 'Adangme', 'ccvm', 'value')),
    (6, 'item_lang', 'ady', oils_i18n_gettext('ady', 'Adygei', 'ccvm', 'value')),
    (7, 'item_lang', 'afa', oils_i18n_gettext('afa', 'Afroasiatic (Other)', 'ccvm', 'value')),
    (8, 'item_lang', 'afh', oils_i18n_gettext('afh', 'Afrihili (Artificial language)', 'ccvm', 'value')),
    (9, 'item_lang', 'afr', oils_i18n_gettext('afr', 'Afrikaans', 'ccvm', 'value')),
    (10, 'item_lang', '-ajm', oils_i18n_gettext('-ajm', 'Aljamía', 'ccvm', 'value')),
    (11, 'item_lang', 'aka', oils_i18n_gettext('aka', 'Akan', 'ccvm', 'value')),
    (12, 'item_lang', 'akk', oils_i18n_gettext('akk', 'Akkadian', 'ccvm', 'value')),
    (13, 'item_lang', 'alb', oils_i18n_gettext('alb', 'Albanian', 'ccvm', 'value')),
    (14, 'item_lang', 'ale', oils_i18n_gettext('ale', 'Aleut', 'ccvm', 'value')),
    (15, 'item_lang', 'alg', oils_i18n_gettext('alg', 'Algonquian (Other)', 'ccvm', 'value')),
    (16, 'item_lang', 'amh', oils_i18n_gettext('amh', 'Amharic', 'ccvm', 'value')),
    (17, 'item_lang', 'ang', oils_i18n_gettext('ang', 'English, Old (ca. 450-1100)', 'ccvm', 'value')),
    (18, 'item_lang', 'apa', oils_i18n_gettext('apa', 'Apache languages', 'ccvm', 'value')),
    (19, 'item_lang', 'ara', oils_i18n_gettext('ara', 'Arabic', 'ccvm', 'value')),
    (20, 'item_lang', 'arc', oils_i18n_gettext('arc', 'Aramaic', 'ccvm', 'value')),
    (21, 'item_lang', 'arg', oils_i18n_gettext('arg', 'Aragonese Spanish', 'ccvm', 'value')),
    (22, 'item_lang', 'arm', oils_i18n_gettext('arm', 'Armenian', 'ccvm', 'value')),
    (23, 'item_lang', 'arn', oils_i18n_gettext('arn', 'Mapuche', 'ccvm', 'value')),
    (24, 'item_lang', 'arp', oils_i18n_gettext('arp', 'Arapaho', 'ccvm', 'value')),
    (25, 'item_lang', 'art', oils_i18n_gettext('art', 'Artificial (Other)', 'ccvm', 'value')),
    (26, 'item_lang', 'arw', oils_i18n_gettext('arw', 'Arawak', 'ccvm', 'value')),
    (27, 'item_lang', 'asm', oils_i18n_gettext('asm', 'Assamese', 'ccvm', 'value')),
    (28, 'item_lang', 'ast', oils_i18n_gettext('ast', 'Bable', 'ccvm', 'value')),
    (29, 'item_lang', 'ath', oils_i18n_gettext('ath', 'Athapascan (Other)', 'ccvm', 'value')),
    (30, 'item_lang', 'aus', oils_i18n_gettext('aus', 'Australian languages', 'ccvm', 'value')),
    (31, 'item_lang', 'ava', oils_i18n_gettext('ava', 'Avaric', 'ccvm', 'value')),
    (32, 'item_lang', 'ave', oils_i18n_gettext('ave', 'Avestan', 'ccvm', 'value')),
    (33, 'item_lang', 'awa', oils_i18n_gettext('awa', 'Awadhi', 'ccvm', 'value')),
    (34, 'item_lang', 'aym', oils_i18n_gettext('aym', 'Aymara', 'ccvm', 'value')),
    (35, 'item_lang', 'aze', oils_i18n_gettext('aze', 'Azerbaijani', 'ccvm', 'value')),
    (36, 'item_lang', 'bad', oils_i18n_gettext('bad', 'Banda', 'ccvm', 'value')),
    (37, 'item_lang', 'bai', oils_i18n_gettext('bai', 'Bamileke languages', 'ccvm', 'value')),
    (38, 'item_lang', 'bak', oils_i18n_gettext('bak', 'Bashkir', 'ccvm', 'value')),
    (39, 'item_lang', 'bal', oils_i18n_gettext('bal', 'Baluchi', 'ccvm', 'value')),
    (40, 'item_lang', 'bam', oils_i18n_gettext('40', 'Bambara', 'ccvm', 'value')),
    (41, 'item_lang', 'ban', oils_i18n_gettext('41', 'Balinese', 'ccvm', 'value')),
    (42, 'item_lang', 'baq', oils_i18n_gettext('42', 'Basque', 'ccvm', 'value')),
    (43, 'item_lang', 'bas', oils_i18n_gettext('43', 'Basa', 'ccvm', 'value')),
    (44, 'item_lang', 'bat', oils_i18n_gettext('44', 'Baltic (Other)', 'ccvm', 'value')),
    (45, 'item_lang', 'bej', oils_i18n_gettext('45', 'Beja', 'ccvm', 'value')),
    (46, 'item_lang', 'bel', oils_i18n_gettext('46', 'Belarusian', 'ccvm', 'value')),
    (47, 'item_lang', 'bem', oils_i18n_gettext('47', 'Bemba', 'ccvm', 'value')),
    (48, 'item_lang', 'ben', oils_i18n_gettext('48', 'Bengali', 'ccvm', 'value')),
    (49, 'item_lang', 'ber', oils_i18n_gettext('49', 'Berber (Other)', 'ccvm', 'value')),
    (50, 'item_lang', 'bho', oils_i18n_gettext('50', 'Bhojpuri', 'ccvm', 'value')),
    (51, 'item_lang', 'bih', oils_i18n_gettext('51', 'Bihari', 'ccvm', 'value')),
    (52, 'item_lang', 'bik', oils_i18n_gettext('52', 'Bikol', 'ccvm', 'value')),
    (53, 'item_lang', 'bin', oils_i18n_gettext('53', 'Edo', 'ccvm', 'value')),
    (54, 'item_lang', 'bis', oils_i18n_gettext('54', 'Bislama', 'ccvm', 'value')),
    (55, 'item_lang', 'bla', oils_i18n_gettext('55', 'Siksika', 'ccvm', 'value')),
    (56, 'item_lang', 'bnt', oils_i18n_gettext('56', 'Bantu (Other)', 'ccvm', 'value')),
    (57, 'item_lang', 'bos', oils_i18n_gettext('57', 'Bosnian', 'ccvm', 'value')),
    (58, 'item_lang', 'bra', oils_i18n_gettext('58', 'Braj', 'ccvm', 'value')),
    (59, 'item_lang', 'bre', oils_i18n_gettext('59', 'Breton', 'ccvm', 'value')),
    (60, 'item_lang', 'btk', oils_i18n_gettext('60', 'Batak', 'ccvm', 'value')),
    (61, 'item_lang', 'bua', oils_i18n_gettext('61', 'Buriat', 'ccvm', 'value')),
    (62, 'item_lang', 'bug', oils_i18n_gettext('62', 'Bugis', 'ccvm', 'value')),
    (63, 'item_lang', 'bul', oils_i18n_gettext('63', 'Bulgarian', 'ccvm', 'value')),
    (64, 'item_lang', 'bur', oils_i18n_gettext('64', 'Burmese', 'ccvm', 'value')),
    (65, 'item_lang', 'cad', oils_i18n_gettext('65', 'Caddo', 'ccvm', 'value')),
    (66, 'item_lang', 'cai', oils_i18n_gettext('66', 'Central American Indian (Other)', 'ccvm', 'value')),
    (67, 'item_lang', '-cam', oils_i18n_gettext('67', 'Khmer', 'ccvm', 'value')),
    (68, 'item_lang', 'car', oils_i18n_gettext('68', 'Carib', 'ccvm', 'value')),
    (69, 'item_lang', 'cat', oils_i18n_gettext('69', 'Catalan', 'ccvm', 'value')),
    (70, 'item_lang', 'cau', oils_i18n_gettext('70', 'Caucasian (Other)', 'ccvm', 'value')),
    (71, 'item_lang', 'ceb', oils_i18n_gettext('71', 'Cebuano', 'ccvm', 'value')),
    (72, 'item_lang', 'cel', oils_i18n_gettext('72', 'Celtic (Other)', 'ccvm', 'value')),
    (73, 'item_lang', 'cha', oils_i18n_gettext('73', 'Chamorro', 'ccvm', 'value')),
    (74, 'item_lang', 'chb', oils_i18n_gettext('74', 'Chibcha', 'ccvm', 'value')),
    (75, 'item_lang', 'che', oils_i18n_gettext('75', 'Chechen', 'ccvm', 'value')),
    (76, 'item_lang', 'chg', oils_i18n_gettext('76', 'Chagatai', 'ccvm', 'value')),
    (77, 'item_lang', 'chi', oils_i18n_gettext('77', 'Chinese', 'ccvm', 'value')),
    (78, 'item_lang', 'chk', oils_i18n_gettext('78', 'Truk', 'ccvm', 'value')),
    (79, 'item_lang', 'chm', oils_i18n_gettext('79', 'Mari', 'ccvm', 'value')),
    (80, 'item_lang', 'chn', oils_i18n_gettext('80', 'Chinook jargon', 'ccvm', 'value')),
    (81, 'item_lang', 'cho', oils_i18n_gettext('81', 'Choctaw', 'ccvm', 'value')),
    (82, 'item_lang', 'chp', oils_i18n_gettext('82', 'Chipewyan', 'ccvm', 'value')),
    (83, 'item_lang', 'chr', oils_i18n_gettext('83', 'Cherokee', 'ccvm', 'value')),
    (84, 'item_lang', 'chu', oils_i18n_gettext('84', 'Church Slavic', 'ccvm', 'value')),
    (85, 'item_lang', 'chv', oils_i18n_gettext('85', 'Chuvash', 'ccvm', 'value')),
    (86, 'item_lang', 'chy', oils_i18n_gettext('86', 'Cheyenne', 'ccvm', 'value')),
    (87, 'item_lang', 'cmc', oils_i18n_gettext('87', 'Chamic languages', 'ccvm', 'value')),
    (88, 'item_lang', 'cop', oils_i18n_gettext('88', 'Coptic', 'ccvm', 'value')),
    (89, 'item_lang', 'cor', oils_i18n_gettext('89', 'Cornish', 'ccvm', 'value')),
    (90, 'item_lang', 'cos', oils_i18n_gettext('90', 'Corsican', 'ccvm', 'value')),
    (91, 'item_lang', 'cpe', oils_i18n_gettext('91', 'Creoles and Pidgins, English-based (Other)', 'ccvm', 'value')),
    (92, 'item_lang', 'cpf', oils_i18n_gettext('92', 'Creoles and Pidgins, French-based (Other)', 'ccvm', 'value')),
    (93, 'item_lang', 'cpp', oils_i18n_gettext('93', 'Creoles and Pidgins, Portuguese-based (Other)', 'ccvm', 'value')),
    (94, 'item_lang', 'cre', oils_i18n_gettext('94', 'Cree', 'ccvm', 'value')),
    (95, 'item_lang', 'crh', oils_i18n_gettext('95', 'Crimean Tatar', 'ccvm', 'value')),
    (96, 'item_lang', 'crp', oils_i18n_gettext('96', 'Creoles and Pidgins (Other)', 'ccvm', 'value')),
    (97, 'item_lang', 'cus', oils_i18n_gettext('97', 'Cushitic (Other)', 'ccvm', 'value')),
    (98, 'item_lang', 'cze', oils_i18n_gettext('98', 'Czech', 'ccvm', 'value')),
    (99, 'item_lang', 'dak', oils_i18n_gettext('99', 'Dakota', 'ccvm', 'value')),
    (100, 'item_lang', 'dan', oils_i18n_gettext('100', 'Danish', 'ccvm', 'value')),
    (101, 'item_lang', 'dar', oils_i18n_gettext('101', 'Dargwa', 'ccvm', 'value')),
    (102, 'item_lang', 'day', oils_i18n_gettext('102', 'Dayak', 'ccvm', 'value')),
    (103, 'item_lang', 'del', oils_i18n_gettext('103', 'Delaware', 'ccvm', 'value')),
    (104, 'item_lang', 'den', oils_i18n_gettext('104', 'Slave', 'ccvm', 'value')),
    (105, 'item_lang', 'dgr', oils_i18n_gettext('105', 'Dogrib', 'ccvm', 'value')),
    (106, 'item_lang', 'din', oils_i18n_gettext('106', 'Dinka', 'ccvm', 'value')),
    (107, 'item_lang', 'div', oils_i18n_gettext('107', 'Divehi', 'ccvm', 'value')),
    (108, 'item_lang', 'doi', oils_i18n_gettext('108', 'Dogri', 'ccvm', 'value')),
    (109, 'item_lang', 'dra', oils_i18n_gettext('109', 'Dravidian (Other)', 'ccvm', 'value')),
    (110, 'item_lang', 'dua', oils_i18n_gettext('110', 'Duala', 'ccvm', 'value')),
    (111, 'item_lang', 'dum', oils_i18n_gettext('111', 'Dutch, Middle (ca. 1050-1350)', 'ccvm', 'value')),
    (112, 'item_lang', 'dut', oils_i18n_gettext('112', 'Dutch', 'ccvm', 'value')),
    (113, 'item_lang', 'dyu', oils_i18n_gettext('113', 'Dyula', 'ccvm', 'value')),
    (114, 'item_lang', 'dzo', oils_i18n_gettext('114', 'Dzongkha', 'ccvm', 'value')),
    (115, 'item_lang', 'efi', oils_i18n_gettext('115', 'Efik', 'ccvm', 'value')),
    (116, 'item_lang', 'egy', oils_i18n_gettext('116', 'Egyptian', 'ccvm', 'value')),
    (117, 'item_lang', 'eka', oils_i18n_gettext('117', 'Ekajuk', 'ccvm', 'value')),
    (118, 'item_lang', 'elx', oils_i18n_gettext('118', 'Elamite', 'ccvm', 'value')),
    (119, 'item_lang', 'eng', oils_i18n_gettext('119', 'English', 'ccvm', 'value')),
    (120, 'item_lang', 'enm', oils_i18n_gettext('120', 'English, Middle (1100-1500)', 'ccvm', 'value')),
    (121, 'item_lang', 'epo', oils_i18n_gettext('121', 'Esperanto', 'ccvm', 'value')),
    (122, 'item_lang', '-esk', oils_i18n_gettext('122', 'Eskimo languages', 'ccvm', 'value')),
    (123, 'item_lang', '-esp', oils_i18n_gettext('123', 'Esperanto', 'ccvm', 'value')),
    (124, 'item_lang', 'est', oils_i18n_gettext('124', 'Estonian', 'ccvm', 'value')),
    (125, 'item_lang', '-eth', oils_i18n_gettext('125', 'Ethiopic', 'ccvm', 'value')),
    (126, 'item_lang', 'ewe', oils_i18n_gettext('126', 'Ewe', 'ccvm', 'value')),
    (127, 'item_lang', 'ewo', oils_i18n_gettext('127', 'Ewondo', 'ccvm', 'value')),
    (128, 'item_lang', 'fan', oils_i18n_gettext('128', 'Fang', 'ccvm', 'value')),
    (129, 'item_lang', 'fao', oils_i18n_gettext('129', 'Faroese', 'ccvm', 'value')),
    (130, 'item_lang', '-far', oils_i18n_gettext('130', 'Faroese', 'ccvm', 'value')),
    (131, 'item_lang', 'fat', oils_i18n_gettext('131', 'Fanti', 'ccvm', 'value')),
    (132, 'item_lang', 'fij', oils_i18n_gettext('132', 'Fijian', 'ccvm', 'value')),
    (133, 'item_lang', 'fin', oils_i18n_gettext('133', 'Finnish', 'ccvm', 'value')),
    (134, 'item_lang', 'fiu', oils_i18n_gettext('134', 'Finno-Ugrian (Other)', 'ccvm', 'value')),
    (135, 'item_lang', 'fon', oils_i18n_gettext('135', 'Fon', 'ccvm', 'value')),
    (136, 'item_lang', 'fre', oils_i18n_gettext('136', 'French', 'ccvm', 'value')),
    (137, 'item_lang', '-fri', oils_i18n_gettext('137', 'Frisian', 'ccvm', 'value')),
    (138, 'item_lang', 'frm', oils_i18n_gettext('138', 'French, Middle (ca. 1400-1600)', 'ccvm', 'value')),
    (139, 'item_lang', 'fro', oils_i18n_gettext('139', 'French, Old (ca. 842-1400)', 'ccvm', 'value')),
    (140, 'item_lang', 'fry', oils_i18n_gettext('140', 'Frisian', 'ccvm', 'value')),
    (141, 'item_lang', 'ful', oils_i18n_gettext('141', 'Fula', 'ccvm', 'value')),
    (142, 'item_lang', 'fur', oils_i18n_gettext('142', 'Friulian', 'ccvm', 'value')),
    (143, 'item_lang', 'gaa', oils_i18n_gettext('143', 'Gã', 'ccvm', 'value')),
    (144, 'item_lang', '-gae', oils_i18n_gettext('144', 'Scottish Gaelic', 'ccvm', 'value')),
    (145, 'item_lang', '-gag', oils_i18n_gettext('145', 'Galician', 'ccvm', 'value')),
    (146, 'item_lang', '-gal', oils_i18n_gettext('146', 'Oromo', 'ccvm', 'value')),
    (147, 'item_lang', 'gay', oils_i18n_gettext('147', 'Gayo', 'ccvm', 'value')),
    (148, 'item_lang', 'gba', oils_i18n_gettext('148', 'Gbaya', 'ccvm', 'value')),
    (149, 'item_lang', 'gem', oils_i18n_gettext('149', 'Germanic (Other)', 'ccvm', 'value')),
    (150, 'item_lang', 'geo', oils_i18n_gettext('150', 'Georgian', 'ccvm', 'value')),
    (151, 'item_lang', 'ger', oils_i18n_gettext('151', 'German', 'ccvm', 'value')),
    (152, 'item_lang', 'gez', oils_i18n_gettext('152', 'Ethiopic', 'ccvm', 'value')),
    (153, 'item_lang', 'gil', oils_i18n_gettext('153', 'Gilbertese', 'ccvm', 'value')),
    (154, 'item_lang', 'gla', oils_i18n_gettext('154', 'Scottish Gaelic', 'ccvm', 'value')),
    (155, 'item_lang', 'gle', oils_i18n_gettext('155', 'Irish', 'ccvm', 'value')),
    (156, 'item_lang', 'glg', oils_i18n_gettext('156', 'Galician', 'ccvm', 'value')),
    (157, 'item_lang', 'glv', oils_i18n_gettext('157', 'Manx', 'ccvm', 'value')),
    (158, 'item_lang', 'gmh', oils_i18n_gettext('158', 'German, Middle High (ca. 1050-1500)', 'ccvm', 'value')),
    (159, 'item_lang', 'goh', oils_i18n_gettext('159', 'German, Old High (ca. 750-1050)', 'ccvm', 'value')),
    (160, 'item_lang', 'gon', oils_i18n_gettext('160', 'Gondi', 'ccvm', 'value')),
    (161, 'item_lang', 'gor', oils_i18n_gettext('161', 'Gorontalo', 'ccvm', 'value')),
    (162, 'item_lang', 'got', oils_i18n_gettext('162', 'Gothic', 'ccvm', 'value')),
    (163, 'item_lang', 'grb', oils_i18n_gettext('163', 'Grebo', 'ccvm', 'value')),
    (164, 'item_lang', 'grc', oils_i18n_gettext('164', 'Greek, Ancient (to 1453)', 'ccvm', 'value')),
    (165, 'item_lang', 'gre', oils_i18n_gettext('165', 'Greek, Modern (1453- )', 'ccvm', 'value')),
    (166, 'item_lang', 'grn', oils_i18n_gettext('166', 'Guarani', 'ccvm', 'value')),
    (167, 'item_lang', '-gua', oils_i18n_gettext('167', 'Guarani', 'ccvm', 'value')),
    (168, 'item_lang', 'guj', oils_i18n_gettext('168', 'Gujarati', 'ccvm', 'value')),
    (169, 'item_lang', 'gwi', oils_i18n_gettext('169', 'Gwich''in', 'ccvm', 'value')),
    (170, 'item_lang', 'hai', oils_i18n_gettext('170', 'Haida', 'ccvm', 'value')),
    (171, 'item_lang', 'hat', oils_i18n_gettext('171', 'Haitian French Creole', 'ccvm', 'value')),
    (172, 'item_lang', 'hau', oils_i18n_gettext('172', 'Hausa', 'ccvm', 'value')),
    (173, 'item_lang', 'haw', oils_i18n_gettext('173', 'Hawaiian', 'ccvm', 'value')),
    (174, 'item_lang', 'heb', oils_i18n_gettext('174', 'Hebrew', 'ccvm', 'value')),
    (175, 'item_lang', 'her', oils_i18n_gettext('175', 'Herero', 'ccvm', 'value')),
    (176, 'item_lang', 'hil', oils_i18n_gettext('176', 'Hiligaynon', 'ccvm', 'value')),
    (177, 'item_lang', 'him', oils_i18n_gettext('177', 'Himachali', 'ccvm', 'value')),
    (178, 'item_lang', 'hin', oils_i18n_gettext('178', 'Hindi', 'ccvm', 'value')),
    (179, 'item_lang', 'hit', oils_i18n_gettext('179', 'Hittite', 'ccvm', 'value')),
    (180, 'item_lang', 'hmn', oils_i18n_gettext('180', 'Hmong', 'ccvm', 'value')),
    (181, 'item_lang', 'hmo', oils_i18n_gettext('181', 'Hiri Motu', 'ccvm', 'value')),
    (182, 'item_lang', 'hun', oils_i18n_gettext('182', 'Hungarian', 'ccvm', 'value')),
    (183, 'item_lang', 'hup', oils_i18n_gettext('183', 'Hupa', 'ccvm', 'value')),
    (184, 'item_lang', 'iba', oils_i18n_gettext('184', 'Iban', 'ccvm', 'value')),
    (185, 'item_lang', 'ibo', oils_i18n_gettext('185', 'Igbo', 'ccvm', 'value')),
    (186, 'item_lang', 'ice', oils_i18n_gettext('186', 'Icelandic', 'ccvm', 'value')),
    (187, 'item_lang', 'ido', oils_i18n_gettext('187', 'Ido', 'ccvm', 'value')),
    (188, 'item_lang', 'iii', oils_i18n_gettext('188', 'Sichuan Yi', 'ccvm', 'value')),
    (189, 'item_lang', 'ijo', oils_i18n_gettext('189', 'Ijo', 'ccvm', 'value')),
    (190, 'item_lang', 'iku', oils_i18n_gettext('190', 'Inuktitut', 'ccvm', 'value')),
    (191, 'item_lang', 'ile', oils_i18n_gettext('191', 'Interlingue', 'ccvm', 'value')),
    (192, 'item_lang', 'ilo', oils_i18n_gettext('192', 'Iloko', 'ccvm', 'value')),
    (193, 'item_lang', 'ina', oils_i18n_gettext('193', 'Interlingua (International Auxiliary Language Association)', 'ccvm', 'value')),
    (194, 'item_lang', 'inc', oils_i18n_gettext('194', 'Indic (Other)', 'ccvm', 'value')),
    (195, 'item_lang', 'ind', oils_i18n_gettext('195', 'Indonesian', 'ccvm', 'value')),
    (196, 'item_lang', 'ine', oils_i18n_gettext('196', 'Indo-European (Other)', 'ccvm', 'value')),
    (197, 'item_lang', 'inh', oils_i18n_gettext('197', 'Ingush', 'ccvm', 'value')),
    (198, 'item_lang', '-int', oils_i18n_gettext('198', 'Interlingua (International Auxiliary Language Association)', 'ccvm', 'value')),
    (199, 'item_lang', 'ipk', oils_i18n_gettext('199', 'Inupiaq', 'ccvm', 'value')),
    (200, 'item_lang', 'ira', oils_i18n_gettext('200', 'Iranian (Other)', 'ccvm', 'value')),
    (201, 'item_lang', '-iri', oils_i18n_gettext('201', 'Irish', 'ccvm', 'value')),
    (202, 'item_lang', 'iro', oils_i18n_gettext('202', 'Iroquoian (Other)', 'ccvm', 'value')),
    (203, 'item_lang', 'ita', oils_i18n_gettext('203', 'Italian', 'ccvm', 'value')),
    (204, 'item_lang', 'jav', oils_i18n_gettext('204', 'Javanese', 'ccvm', 'value')),
    (205, 'item_lang', 'jpn', oils_i18n_gettext('205', 'Japanese', 'ccvm', 'value')),
    (206, 'item_lang', 'jpr', oils_i18n_gettext('206', 'Judeo-Persian', 'ccvm', 'value')),
    (207, 'item_lang', 'jrb', oils_i18n_gettext('207', 'Judeo-Arabic', 'ccvm', 'value')),
    (208, 'item_lang', 'kaa', oils_i18n_gettext('208', 'Kara-Kalpak', 'ccvm', 'value')),
    (209, 'item_lang', 'kab', oils_i18n_gettext('209', 'Kabyle', 'ccvm', 'value')),
    (210, 'item_lang', 'kac', oils_i18n_gettext('210', 'Kachin', 'ccvm', 'value')),
    (211, 'item_lang', 'kal', oils_i18n_gettext('211', 'Kalâtdlisut', 'ccvm', 'value')),
    (212, 'item_lang', 'kam', oils_i18n_gettext('212', 'Kamba', 'ccvm', 'value')),
    (213, 'item_lang', 'kan', oils_i18n_gettext('213', 'Kannada', 'ccvm', 'value')),
    (214, 'item_lang', 'kar', oils_i18n_gettext('214', 'Karen', 'ccvm', 'value')),
    (215, 'item_lang', 'kas', oils_i18n_gettext('215', 'Kashmiri', 'ccvm', 'value')),
    (216, 'item_lang', 'kau', oils_i18n_gettext('216', 'Kanuri', 'ccvm', 'value')),
    (217, 'item_lang', 'kaw', oils_i18n_gettext('217', 'Kawi', 'ccvm', 'value')),
    (218, 'item_lang', 'kaz', oils_i18n_gettext('218', 'Kazakh', 'ccvm', 'value')),
    (219, 'item_lang', 'kbd', oils_i18n_gettext('219', 'Kabardian', 'ccvm', 'value')),
    (220, 'item_lang', 'kha', oils_i18n_gettext('220', 'Khasi', 'ccvm', 'value')),
    (221, 'item_lang', 'khi', oils_i18n_gettext('221', 'Khoisan (Other)', 'ccvm', 'value')),
    (222, 'item_lang', 'khm', oils_i18n_gettext('222', 'Khmer', 'ccvm', 'value')),
    (223, 'item_lang', 'kho', oils_i18n_gettext('223', 'Khotanese', 'ccvm', 'value')),
    (224, 'item_lang', 'kik', oils_i18n_gettext('224', 'Kikuyu', 'ccvm', 'value')),
    (225, 'item_lang', 'kin', oils_i18n_gettext('225', 'Kinyarwanda', 'ccvm', 'value')),
    (226, 'item_lang', 'kir', oils_i18n_gettext('226', 'Kyrgyz', 'ccvm', 'value')),
    (227, 'item_lang', 'kmb', oils_i18n_gettext('227', 'Kimbundu', 'ccvm', 'value')),
    (228, 'item_lang', 'kok', oils_i18n_gettext('228', 'Konkani', 'ccvm', 'value')),
    (229, 'item_lang', 'kom', oils_i18n_gettext('229', 'Komi', 'ccvm', 'value')),
    (230, 'item_lang', 'kon', oils_i18n_gettext('230', 'Kongo', 'ccvm', 'value')),
    (231, 'item_lang', 'kor', oils_i18n_gettext('231', 'Korean', 'ccvm', 'value')),
    (232, 'item_lang', 'kos', oils_i18n_gettext('232', 'Kusaie', 'ccvm', 'value')),
    (233, 'item_lang', 'kpe', oils_i18n_gettext('233', 'Kpelle', 'ccvm', 'value')),
    (234, 'item_lang', 'kro', oils_i18n_gettext('234', 'Kru', 'ccvm', 'value')),
    (235, 'item_lang', 'kru', oils_i18n_gettext('235', 'Kurukh', 'ccvm', 'value')),
    (236, 'item_lang', 'kua', oils_i18n_gettext('236', 'Kuanyama', 'ccvm', 'value')),
    (237, 'item_lang', 'kum', oils_i18n_gettext('237', 'Kumyk', 'ccvm', 'value')),
    (238, 'item_lang', 'kur', oils_i18n_gettext('238', 'Kurdish', 'ccvm', 'value')),
    (239, 'item_lang', '-kus', oils_i18n_gettext('239', 'Kusaie', 'ccvm', 'value')),
    (240, 'item_lang', 'kut', oils_i18n_gettext('240', 'Kutenai', 'ccvm', 'value')),
    (241, 'item_lang', 'lad', oils_i18n_gettext('241', 'Ladino', 'ccvm', 'value')),
    (242, 'item_lang', 'lah', oils_i18n_gettext('242', 'Lahnda', 'ccvm', 'value')),
    (243, 'item_lang', 'lam', oils_i18n_gettext('243', 'Lamba', 'ccvm', 'value')),
    (244, 'item_lang', '-lan', oils_i18n_gettext('244', 'Occitan (post-1500)', 'ccvm', 'value')),
    (245, 'item_lang', 'lao', oils_i18n_gettext('245', 'Lao', 'ccvm', 'value')),
    (246, 'item_lang', '-lap', oils_i18n_gettext('246', 'Sami', 'ccvm', 'value')),
    (247, 'item_lang', 'lat', oils_i18n_gettext('247', 'Latin', 'ccvm', 'value')),
    (248, 'item_lang', 'lav', oils_i18n_gettext('248', 'Latvian', 'ccvm', 'value')),
    (249, 'item_lang', 'lez', oils_i18n_gettext('249', 'Lezgian', 'ccvm', 'value')),
    (250, 'item_lang', 'lim', oils_i18n_gettext('250', 'Limburgish', 'ccvm', 'value')),
    (251, 'item_lang', 'lin', oils_i18n_gettext('251', 'Lingala', 'ccvm', 'value')),
    (252, 'item_lang', 'lit', oils_i18n_gettext('252', 'Lithuanian', 'ccvm', 'value')),
    (253, 'item_lang', 'lol', oils_i18n_gettext('253', 'Mongo-Nkundu', 'ccvm', 'value')),
    (254, 'item_lang', 'loz', oils_i18n_gettext('254', 'Lozi', 'ccvm', 'value')),
    (255, 'item_lang', 'ltz', oils_i18n_gettext('255', 'Letzeburgesch', 'ccvm', 'value')),
    (256, 'item_lang', 'lua', oils_i18n_gettext('256', 'Luba-Lulua', 'ccvm', 'value')),
    (257, 'item_lang', 'lub', oils_i18n_gettext('257', 'Luba-Katanga', 'ccvm', 'value')),
    (258, 'item_lang', 'lug', oils_i18n_gettext('258', 'Ganda', 'ccvm', 'value')),
    (259, 'item_lang', 'lui', oils_i18n_gettext('259', 'Luiseño', 'ccvm', 'value')),
    (260, 'item_lang', 'lun', oils_i18n_gettext('260', 'Lunda', 'ccvm', 'value')),
    (261, 'item_lang', 'luo', oils_i18n_gettext('261', 'Luo (Kenya and Tanzania)', 'ccvm', 'value')),
    (262, 'item_lang', 'lus', oils_i18n_gettext('262', 'Lushai', 'ccvm', 'value')),
    (263, 'item_lang', 'mac', oils_i18n_gettext('263', 'Macedonian', 'ccvm', 'value')),
    (264, 'item_lang', 'mad', oils_i18n_gettext('264', 'Madurese', 'ccvm', 'value')),
    (265, 'item_lang', 'mag', oils_i18n_gettext('265', 'Magahi', 'ccvm', 'value')),
    (266, 'item_lang', 'mah', oils_i18n_gettext('266', 'Marshallese', 'ccvm', 'value')),
    (267, 'item_lang', 'mai', oils_i18n_gettext('267', 'Maithili', 'ccvm', 'value')),
    (268, 'item_lang', 'mak', oils_i18n_gettext('268', 'Makasar', 'ccvm', 'value')),
    (269, 'item_lang', 'mal', oils_i18n_gettext('269', 'Malayalam', 'ccvm', 'value')),
    (270, 'item_lang', 'man', oils_i18n_gettext('270', 'Mandingo', 'ccvm', 'value')),
    (271, 'item_lang', 'mao', oils_i18n_gettext('271', 'Maori', 'ccvm', 'value')),
    (272, 'item_lang', 'map', oils_i18n_gettext('272', 'Austronesian (Other)', 'ccvm', 'value')),
    (273, 'item_lang', 'mar', oils_i18n_gettext('273', 'Marathi', 'ccvm', 'value')),
    (274, 'item_lang', 'mas', oils_i18n_gettext('274', 'Masai', 'ccvm', 'value')),
    (275, 'item_lang', '-max', oils_i18n_gettext('275', 'Manx', 'ccvm', 'value')),
    (276, 'item_lang', 'may', oils_i18n_gettext('276', 'Malay', 'ccvm', 'value')),
    (277, 'item_lang', 'mdr', oils_i18n_gettext('277', 'Mandar', 'ccvm', 'value')),
    (278, 'item_lang', 'men', oils_i18n_gettext('278', 'Mende', 'ccvm', 'value')),
    (279, 'item_lang', 'mga', oils_i18n_gettext('279', 'Irish, Middle (ca. 1100-1550)', 'ccvm', 'value')),
    (280, 'item_lang', 'mic', oils_i18n_gettext('280', 'Micmac', 'ccvm', 'value')),
    (281, 'item_lang', 'min', oils_i18n_gettext('281', 'Minangkabau', 'ccvm', 'value')),
    (282, 'item_lang', 'mis', oils_i18n_gettext('282', 'Miscellaneous languages', 'ccvm', 'value')),
    (283, 'item_lang', 'mkh', oils_i18n_gettext('283', 'Mon-Khmer (Other)', 'ccvm', 'value')),
    (284, 'item_lang', '-mla', oils_i18n_gettext('284', 'Malagasy', 'ccvm', 'value')),
    (285, 'item_lang', 'mlg', oils_i18n_gettext('285', 'Malagasy', 'ccvm', 'value')),
    (286, 'item_lang', 'mlt', oils_i18n_gettext('286', 'Maltese', 'ccvm', 'value')),
    (287, 'item_lang', 'mnc', oils_i18n_gettext('287', 'Manchu', 'ccvm', 'value')),
    (288, 'item_lang', 'mni', oils_i18n_gettext('288', 'Manipuri', 'ccvm', 'value')),
    (289, 'item_lang', 'mno', oils_i18n_gettext('289', 'Manobo languages', 'ccvm', 'value')),
    (290, 'item_lang', 'moh', oils_i18n_gettext('290', 'Mohawk', 'ccvm', 'value')),
    (291, 'item_lang', 'mol', oils_i18n_gettext('291', 'Moldavian', 'ccvm', 'value')),
    (292, 'item_lang', 'mon', oils_i18n_gettext('292', 'Mongolian', 'ccvm', 'value')),
    (293, 'item_lang', 'mos', oils_i18n_gettext('293', 'Mooré', 'ccvm', 'value')),
    (294, 'item_lang', 'mul', oils_i18n_gettext('294', 'Multiple languages', 'ccvm', 'value')),
    (295, 'item_lang', 'mun', oils_i18n_gettext('295', 'Munda (Other)', 'ccvm', 'value')),
    (296, 'item_lang', 'mus', oils_i18n_gettext('296', 'Creek', 'ccvm', 'value')),
    (297, 'item_lang', 'mwr', oils_i18n_gettext('297', 'Marwari', 'ccvm', 'value')),
    (298, 'item_lang', 'myn', oils_i18n_gettext('298', 'Mayan languages', 'ccvm', 'value')),
    (299, 'item_lang', 'nah', oils_i18n_gettext('299', 'Nahuatl', 'ccvm', 'value')),
    (300, 'item_lang', 'nai', oils_i18n_gettext('300', 'North American Indian (Other)', 'ccvm', 'value')),
    (301, 'item_lang', 'nap', oils_i18n_gettext('301', 'Neapolitan Italian', 'ccvm', 'value')),
    (302, 'item_lang', 'nau', oils_i18n_gettext('302', 'Nauru', 'ccvm', 'value')),
    (303, 'item_lang', 'nav', oils_i18n_gettext('303', 'Navajo', 'ccvm', 'value')),
    (304, 'item_lang', 'nbl', oils_i18n_gettext('304', 'Ndebele (South Africa)', 'ccvm', 'value')),
    (305, 'item_lang', 'nde', oils_i18n_gettext('305', 'Ndebele (Zimbabwe)  ', 'ccvm', 'value')),
    (306, 'item_lang', 'ndo', oils_i18n_gettext('306', 'Ndonga', 'ccvm', 'value')),
    (307, 'item_lang', 'nds', oils_i18n_gettext('307', 'Low German', 'ccvm', 'value')),
    (308, 'item_lang', 'nep', oils_i18n_gettext('308', 'Nepali', 'ccvm', 'value')),
    (309, 'item_lang', 'new', oils_i18n_gettext('309', 'Newari', 'ccvm', 'value')),
    (310, 'item_lang', 'nia', oils_i18n_gettext('310', 'Nias', 'ccvm', 'value')),
    (311, 'item_lang', 'nic', oils_i18n_gettext('311', 'Niger-Kordofanian (Other)', 'ccvm', 'value')),
    (312, 'item_lang', 'niu', oils_i18n_gettext('312', 'Niuean', 'ccvm', 'value')),
    (313, 'item_lang', 'nno', oils_i18n_gettext('313', 'Norwegian (Nynorsk)', 'ccvm', 'value')),
    (314, 'item_lang', 'nob', oils_i18n_gettext('314', 'Norwegian (Bokmål)', 'ccvm', 'value')),
    (315, 'item_lang', 'nog', oils_i18n_gettext('315', 'Nogai', 'ccvm', 'value')),
    (316, 'item_lang', 'non', oils_i18n_gettext('316', 'Old Norse', 'ccvm', 'value')),
    (317, 'item_lang', 'nor', oils_i18n_gettext('317', 'Norwegian', 'ccvm', 'value')),
    (318, 'item_lang', 'nso', oils_i18n_gettext('318', 'Northern Sotho', 'ccvm', 'value')),
    (319, 'item_lang', 'nub', oils_i18n_gettext('319', 'Nubian languages', 'ccvm', 'value')),
    (320, 'item_lang', 'nya', oils_i18n_gettext('320', 'Nyanja', 'ccvm', 'value')),
    (321, 'item_lang', 'nym', oils_i18n_gettext('321', 'Nyamwezi', 'ccvm', 'value')),
    (322, 'item_lang', 'nyn', oils_i18n_gettext('322', 'Nyankole', 'ccvm', 'value')),
    (323, 'item_lang', 'nyo', oils_i18n_gettext('323', 'Nyoro', 'ccvm', 'value')),
    (324, 'item_lang', 'nzi', oils_i18n_gettext('324', 'Nzima', 'ccvm', 'value')),
    (325, 'item_lang', 'oci', oils_i18n_gettext('325', 'Occitan (post-1500)', 'ccvm', 'value')),
    (326, 'item_lang', 'oji', oils_i18n_gettext('326', 'Ojibwa', 'ccvm', 'value')),
    (327, 'item_lang', 'ori', oils_i18n_gettext('327', 'Oriya', 'ccvm', 'value')),
    (328, 'item_lang', 'orm', oils_i18n_gettext('328', 'Oromo', 'ccvm', 'value')),
    (329, 'item_lang', 'osa', oils_i18n_gettext('329', 'Osage', 'ccvm', 'value')),
    (330, 'item_lang', 'oss', oils_i18n_gettext('330', 'Ossetic', 'ccvm', 'value')),
    (331, 'item_lang', 'ota', oils_i18n_gettext('331', 'Turkish, Ottoman', 'ccvm', 'value')),
    (332, 'item_lang', 'oto', oils_i18n_gettext('332', 'Otomian languages', 'ccvm', 'value')),
    (333, 'item_lang', 'paa', oils_i18n_gettext('333', 'Papuan (Other)', 'ccvm', 'value')),
    (334, 'item_lang', 'pag', oils_i18n_gettext('334', 'Pangasinan', 'ccvm', 'value')),
    (335, 'item_lang', 'pal', oils_i18n_gettext('335', 'Pahlavi', 'ccvm', 'value')),
    (336, 'item_lang', 'pam', oils_i18n_gettext('336', 'Pampanga', 'ccvm', 'value')),
    (337, 'item_lang', 'pan', oils_i18n_gettext('337', 'Panjabi', 'ccvm', 'value')),
    (338, 'item_lang', 'pap', oils_i18n_gettext('338', 'Papiamento', 'ccvm', 'value')),
    (339, 'item_lang', 'pau', oils_i18n_gettext('339', 'Palauan', 'ccvm', 'value')),
    (340, 'item_lang', 'peo', oils_i18n_gettext('340', 'Old Persian (ca. 600-400 B.C.)', 'ccvm', 'value')),
    (341, 'item_lang', 'per', oils_i18n_gettext('341', 'Persian', 'ccvm', 'value')),
    (342, 'item_lang', 'phi', oils_i18n_gettext('342', 'Philippine (Other)', 'ccvm', 'value')),
    (343, 'item_lang', 'phn', oils_i18n_gettext('343', 'Phoenician', 'ccvm', 'value')),
    (344, 'item_lang', 'pli', oils_i18n_gettext('344', 'Pali', 'ccvm', 'value')),
    (345, 'item_lang', 'pol', oils_i18n_gettext('345', 'Polish', 'ccvm', 'value')),
    (346, 'item_lang', 'pon', oils_i18n_gettext('346', 'Ponape', 'ccvm', 'value')),
    (347, 'item_lang', 'por', oils_i18n_gettext('347', 'Portuguese', 'ccvm', 'value')),
    (348, 'item_lang', 'pra', oils_i18n_gettext('348', 'Prakrit languages', 'ccvm', 'value')),
    (349, 'item_lang', 'pro', oils_i18n_gettext('349', 'Provençal (to 1500)', 'ccvm', 'value')),
    (350, 'item_lang', 'pus', oils_i18n_gettext('350', 'Pushto', 'ccvm', 'value')),
    (351, 'item_lang', 'que', oils_i18n_gettext('351', 'Quechua', 'ccvm', 'value')),
    (352, 'item_lang', 'raj', oils_i18n_gettext('352', 'Rajasthani', 'ccvm', 'value')),
    (353, 'item_lang', 'rap', oils_i18n_gettext('353', 'Rapanui', 'ccvm', 'value')),
    (354, 'item_lang', 'rar', oils_i18n_gettext('354', 'Rarotongan', 'ccvm', 'value')),
    (355, 'item_lang', 'roa', oils_i18n_gettext('355', 'Romance (Other)', 'ccvm', 'value')),
    (356, 'item_lang', 'roh', oils_i18n_gettext('356', 'Raeto-Romance', 'ccvm', 'value')),
    (357, 'item_lang', 'rom', oils_i18n_gettext('357', 'Romani', 'ccvm', 'value')),
    (358, 'item_lang', 'rum', oils_i18n_gettext('358', 'Romanian', 'ccvm', 'value')),
    (359, 'item_lang', 'run', oils_i18n_gettext('359', 'Rundi', 'ccvm', 'value')),
    (360, 'item_lang', 'rus', oils_i18n_gettext('360', 'Russian', 'ccvm', 'value')),
    (361, 'item_lang', 'sad', oils_i18n_gettext('361', 'Sandawe', 'ccvm', 'value')),
    (362, 'item_lang', 'sag', oils_i18n_gettext('362', 'Sango (Ubangi Creole)', 'ccvm', 'value')),
    (363, 'item_lang', 'sah', oils_i18n_gettext('363', 'Yakut', 'ccvm', 'value')),
    (364, 'item_lang', 'sai', oils_i18n_gettext('364', 'South American Indian (Other)', 'ccvm', 'value')),
    (365, 'item_lang', 'sal', oils_i18n_gettext('365', 'Salishan languages', 'ccvm', 'value')),
    (366, 'item_lang', 'sam', oils_i18n_gettext('366', 'Samaritan Aramaic', 'ccvm', 'value')),
    (367, 'item_lang', 'san', oils_i18n_gettext('367', 'Sanskrit', 'ccvm', 'value')),
    (368, 'item_lang', '-sao', oils_i18n_gettext('368', 'Samoan', 'ccvm', 'value')),
    (369, 'item_lang', 'sas', oils_i18n_gettext('369', 'Sasak', 'ccvm', 'value')),
    (370, 'item_lang', 'sat', oils_i18n_gettext('370', 'Santali', 'ccvm', 'value')),
    (371, 'item_lang', 'scc', oils_i18n_gettext('371', 'Serbian', 'ccvm', 'value')),
    (372, 'item_lang', 'sco', oils_i18n_gettext('372', 'Scots', 'ccvm', 'value')),
    (373, 'item_lang', 'scr', oils_i18n_gettext('373', 'Croatian', 'ccvm', 'value')),
    (374, 'item_lang', 'sel', oils_i18n_gettext('374', 'Selkup', 'ccvm', 'value')),
    (375, 'item_lang', 'sem', oils_i18n_gettext('375', 'Semitic (Other)', 'ccvm', 'value')),
    (376, 'item_lang', 'sga', oils_i18n_gettext('376', 'Irish, Old (to 1100)', 'ccvm', 'value')),
    (377, 'item_lang', 'sgn', oils_i18n_gettext('377', 'Sign languages', 'ccvm', 'value')),
    (378, 'item_lang', 'shn', oils_i18n_gettext('378', 'Shan', 'ccvm', 'value')),
    (379, 'item_lang', '-sho', oils_i18n_gettext('379', 'Shona', 'ccvm', 'value')),
    (380, 'item_lang', 'sid', oils_i18n_gettext('380', 'Sidamo', 'ccvm', 'value')),
    (381, 'item_lang', 'sin', oils_i18n_gettext('381', 'Sinhalese', 'ccvm', 'value')),
    (382, 'item_lang', 'sio', oils_i18n_gettext('382', 'Siouan (Other)', 'ccvm', 'value')),
    (383, 'item_lang', 'sit', oils_i18n_gettext('383', 'Sino-Tibetan (Other)', 'ccvm', 'value')),
    (384, 'item_lang', 'sla', oils_i18n_gettext('384', 'Slavic (Other)', 'ccvm', 'value')),
    (385, 'item_lang', 'slo', oils_i18n_gettext('385', 'Slovak', 'ccvm', 'value')),
    (386, 'item_lang', 'slv', oils_i18n_gettext('386', 'Slovenian', 'ccvm', 'value')),
    (387, 'item_lang', 'sma', oils_i18n_gettext('387', 'Southern Sami', 'ccvm', 'value')),
    (388, 'item_lang', 'sme', oils_i18n_gettext('388', 'Northern Sami', 'ccvm', 'value')),
    (389, 'item_lang', 'smi', oils_i18n_gettext('389', 'Sami', 'ccvm', 'value')),
    (390, 'item_lang', 'smj', oils_i18n_gettext('390', 'Lule Sami', 'ccvm', 'value')),
    (391, 'item_lang', 'smn', oils_i18n_gettext('391', 'Inari Sami', 'ccvm', 'value')),
    (392, 'item_lang', 'smo', oils_i18n_gettext('392', 'Samoan', 'ccvm', 'value')),
    (393, 'item_lang', 'sms', oils_i18n_gettext('393', 'Skolt Sami', 'ccvm', 'value')),
    (394, 'item_lang', 'sna', oils_i18n_gettext('394', 'Shona', 'ccvm', 'value')),
    (395, 'item_lang', 'snd', oils_i18n_gettext('395', 'Sindhi', 'ccvm', 'value')),
    (396, 'item_lang', '-snh', oils_i18n_gettext('396', 'Sinhalese', 'ccvm', 'value')),
    (397, 'item_lang', 'snk', oils_i18n_gettext('397', 'Soninke', 'ccvm', 'value')),
    (398, 'item_lang', 'sog', oils_i18n_gettext('398', 'Sogdian', 'ccvm', 'value')),
    (399, 'item_lang', 'som', oils_i18n_gettext('399', 'Somali', 'ccvm', 'value')),
    (400, 'item_lang', 'son', oils_i18n_gettext('400', 'Songhai', 'ccvm', 'value')),
    (401, 'item_lang', 'sot', oils_i18n_gettext('401', 'Sotho', 'ccvm', 'value')),
    (402, 'item_lang', 'spa', oils_i18n_gettext('402', 'Spanish', 'ccvm', 'value')),
    (403, 'item_lang', 'srd', oils_i18n_gettext('403', 'Sardinian', 'ccvm', 'value')),
    (404, 'item_lang', 'srr', oils_i18n_gettext('404', 'Serer', 'ccvm', 'value')),
    (405, 'item_lang', 'ssa', oils_i18n_gettext('405', 'Nilo-Saharan (Other)', 'ccvm', 'value')),
    (406, 'item_lang', '-sso', oils_i18n_gettext('406', 'Sotho', 'ccvm', 'value')),
    (407, 'item_lang', 'ssw', oils_i18n_gettext('407', 'Swazi', 'ccvm', 'value')),
    (408, 'item_lang', 'suk', oils_i18n_gettext('408', 'Sukuma', 'ccvm', 'value')),
    (409, 'item_lang', 'sun', oils_i18n_gettext('409', 'Sundanese', 'ccvm', 'value')),
    (410, 'item_lang', 'sus', oils_i18n_gettext('410', 'Susu', 'ccvm', 'value')),
    (411, 'item_lang', 'sux', oils_i18n_gettext('411', 'Sumerian', 'ccvm', 'value')),
    (412, 'item_lang', 'swa', oils_i18n_gettext('412', 'Swahili', 'ccvm', 'value')),
    (413, 'item_lang', 'swe', oils_i18n_gettext('413', 'Swedish', 'ccvm', 'value')),
    (414, 'item_lang', '-swz', oils_i18n_gettext('414', 'Swazi', 'ccvm', 'value')),
    (415, 'item_lang', 'syr', oils_i18n_gettext('415', 'Syriac', 'ccvm', 'value')),
    (416, 'item_lang', '-tag', oils_i18n_gettext('416', 'Tagalog', 'ccvm', 'value')),
    (417, 'item_lang', 'tah', oils_i18n_gettext('417', 'Tahitian', 'ccvm', 'value')),
    (418, 'item_lang', 'tai', oils_i18n_gettext('418', 'Tai (Other)', 'ccvm', 'value')),
    (419, 'item_lang', '-taj', oils_i18n_gettext('419', 'Tajik', 'ccvm', 'value')),
    (420, 'item_lang', 'tam', oils_i18n_gettext('420', 'Tamil', 'ccvm', 'value')),
    (421, 'item_lang', '-tar', oils_i18n_gettext('421', 'Tatar', 'ccvm', 'value')),
    (422, 'item_lang', 'tat', oils_i18n_gettext('422', 'Tatar', 'ccvm', 'value')),
    (423, 'item_lang', 'tel', oils_i18n_gettext('423', 'Telugu', 'ccvm', 'value')),
    (424, 'item_lang', 'tem', oils_i18n_gettext('424', 'Temne', 'ccvm', 'value')),
    (425, 'item_lang', 'ter', oils_i18n_gettext('425', 'Terena', 'ccvm', 'value')),
    (426, 'item_lang', 'tet', oils_i18n_gettext('426', 'Tetum', 'ccvm', 'value')),
    (427, 'item_lang', 'tgk', oils_i18n_gettext('427', 'Tajik', 'ccvm', 'value')),
    (428, 'item_lang', 'tgl', oils_i18n_gettext('428', 'Tagalog', 'ccvm', 'value')),
    (429, 'item_lang', 'tha', oils_i18n_gettext('429', 'Thai', 'ccvm', 'value')),
    (430, 'item_lang', 'tib', oils_i18n_gettext('430', 'Tibetan', 'ccvm', 'value')),
    (431, 'item_lang', 'tig', oils_i18n_gettext('431', 'Tigré', 'ccvm', 'value')),
    (432, 'item_lang', 'tir', oils_i18n_gettext('432', 'Tigrinya', 'ccvm', 'value')),
    (433, 'item_lang', 'tiv', oils_i18n_gettext('433', 'Tiv', 'ccvm', 'value')),
    (434, 'item_lang', 'tkl', oils_i18n_gettext('434', 'Tokelauan', 'ccvm', 'value')),
    (435, 'item_lang', 'tli', oils_i18n_gettext('435', 'Tlingit', 'ccvm', 'value')),
    (436, 'item_lang', 'tmh', oils_i18n_gettext('436', 'Tamashek', 'ccvm', 'value')),
    (437, 'item_lang', 'tog', oils_i18n_gettext('437', 'Tonga (Nyasa)', 'ccvm', 'value')),
    (438, 'item_lang', 'ton', oils_i18n_gettext('438', 'Tongan', 'ccvm', 'value')),
    (439, 'item_lang', 'tpi', oils_i18n_gettext('439', 'Tok Pisin', 'ccvm', 'value')),
    (440, 'item_lang', '-tru', oils_i18n_gettext('440', 'Truk', 'ccvm', 'value')),
    (441, 'item_lang', 'tsi', oils_i18n_gettext('441', 'Tsimshian', 'ccvm', 'value')),
    (442, 'item_lang', 'tsn', oils_i18n_gettext('442', 'Tswana', 'ccvm', 'value')),
    (443, 'item_lang', 'tso', oils_i18n_gettext('443', 'Tsonga', 'ccvm', 'value')),
    (444, 'item_lang', '-tsw', oils_i18n_gettext('444', 'Tswana', 'ccvm', 'value')),
    (445, 'item_lang', 'tuk', oils_i18n_gettext('445', 'Turkmen', 'ccvm', 'value')),
    (446, 'item_lang', 'tum', oils_i18n_gettext('446', 'Tumbuka', 'ccvm', 'value')),
    (447, 'item_lang', 'tup', oils_i18n_gettext('447', 'Tupi languages', 'ccvm', 'value')),
    (448, 'item_lang', 'tur', oils_i18n_gettext('448', 'Turkish', 'ccvm', 'value')),
    (449, 'item_lang', 'tut', oils_i18n_gettext('449', 'Altaic (Other)', 'ccvm', 'value')),
    (450, 'item_lang', 'tvl', oils_i18n_gettext('450', 'Tuvaluan', 'ccvm', 'value')),
    (451, 'item_lang', 'twi', oils_i18n_gettext('451', 'Twi', 'ccvm', 'value')),
    (452, 'item_lang', 'tyv', oils_i18n_gettext('452', 'Tuvinian', 'ccvm', 'value')),
    (453, 'item_lang', 'udm', oils_i18n_gettext('453', 'Udmurt', 'ccvm', 'value')),
    (454, 'item_lang', 'uga', oils_i18n_gettext('454', 'Ugaritic', 'ccvm', 'value')),
    (455, 'item_lang', 'uig', oils_i18n_gettext('455', 'Uighur', 'ccvm', 'value')),
    (456, 'item_lang', 'ukr', oils_i18n_gettext('456', 'Ukrainian', 'ccvm', 'value')),
    (457, 'item_lang', 'umb', oils_i18n_gettext('457', 'Umbundu', 'ccvm', 'value')),
    (458, 'item_lang', 'und', oils_i18n_gettext('458', 'Undetermined', 'ccvm', 'value')),
    (459, 'item_lang', 'urd', oils_i18n_gettext('459', 'Urdu', 'ccvm', 'value')),
    (460, 'item_lang', 'uzb', oils_i18n_gettext('460', 'Uzbek', 'ccvm', 'value')),
    (461, 'item_lang', 'vai', oils_i18n_gettext('461', 'Vai', 'ccvm', 'value')),
    (462, 'item_lang', 'ven', oils_i18n_gettext('462', 'Venda', 'ccvm', 'value')),
    (463, 'item_lang', 'vie', oils_i18n_gettext('463', 'Vietnamese', 'ccvm', 'value')),
    (464, 'item_lang', 'vol', oils_i18n_gettext('464', 'Volapük', 'ccvm', 'value')),
    (465, 'item_lang', 'vot', oils_i18n_gettext('465', 'Votic', 'ccvm', 'value')),
    (466, 'item_lang', 'wak', oils_i18n_gettext('466', 'Wakashan languages', 'ccvm', 'value')),
    (467, 'item_lang', 'wal', oils_i18n_gettext('467', 'Walamo', 'ccvm', 'value')),
    (468, 'item_lang', 'war', oils_i18n_gettext('468', 'Waray', 'ccvm', 'value')),
    (469, 'item_lang', 'was', oils_i18n_gettext('469', 'Washo', 'ccvm', 'value')),
    (470, 'item_lang', 'wel', oils_i18n_gettext('470', 'Welsh', 'ccvm', 'value')),
    (471, 'item_lang', 'wen', oils_i18n_gettext('471', 'Sorbian languages', 'ccvm', 'value')),
    (472, 'item_lang', 'wln', oils_i18n_gettext('472', 'Walloon', 'ccvm', 'value')),
    (473, 'item_lang', 'wol', oils_i18n_gettext('473', 'Wolof', 'ccvm', 'value')),
    (474, 'item_lang', 'xal', oils_i18n_gettext('474', 'Kalmyk', 'ccvm', 'value')),
    (475, 'item_lang', 'xho', oils_i18n_gettext('475', 'Xhosa', 'ccvm', 'value')),
    (476, 'item_lang', 'yao', oils_i18n_gettext('476', 'Yao (Africa)', 'ccvm', 'value')),
    (477, 'item_lang', 'yap', oils_i18n_gettext('477', 'Yapese', 'ccvm', 'value')),
    (478, 'item_lang', 'yid', oils_i18n_gettext('478', 'Yiddish', 'ccvm', 'value')),
    (479, 'item_lang', 'yor', oils_i18n_gettext('479', 'Yoruba', 'ccvm', 'value')),
    (480, 'item_lang', 'ypk', oils_i18n_gettext('480', 'Yupik languages', 'ccvm', 'value')),
    (481, 'item_lang', 'zap', oils_i18n_gettext('481', 'Zapotec', 'ccvm', 'value')),
    (482, 'item_lang', 'zen', oils_i18n_gettext('482', 'Zenaga', 'ccvm', 'value')),
    (483, 'item_lang', 'zha', oils_i18n_gettext('483', 'Zhuang', 'ccvm', 'value')),
    (484, 'item_lang', 'znd', oils_i18n_gettext('484', 'Zande', 'ccvm', 'value')),
    (485, 'item_lang', 'zul', oils_i18n_gettext('485', 'Zulu', 'ccvm', 'value')),
    (486, 'item_lang', 'zun', oils_i18n_gettext('486', 'Zuni', 'ccvm', 'value'));

INSERT INTO config.coded_value_map (id, ctype, code, value, description) VALUES 
    (487,'audience', ' ', oils_i18n_gettext('487', 'Unknown or unspecified', 'ccvm', 'value'),  oils_i18n_gettext('487', 'The target audience for the item not known or not specified.', 'ccvm', 'description')),
    (488,'audience', 'a', oils_i18n_gettext('488', 'Preschool', 'ccvm', 'value'),               oils_i18n_gettext('488', 'The item is intended for children, approximate ages 0-5 years.', 'ccvm', 'description')),
    (489,'audience', 'b', oils_i18n_gettext('489', 'Primary', 'ccvm', 'value'),                 oils_i18n_gettext('489', 'The item is intended for children, approximate ages 6-8 years.', 'ccvm', 'description')),
    (490,'audience', 'c', oils_i18n_gettext('490', 'Pre-adolescent', 'ccvm', 'value'),          oils_i18n_gettext('490', 'The item is intended for young people, approximate ages 9-13 years.', 'ccvm', 'description')),
    (491,'audience', 'd', oils_i18n_gettext('491', 'Adolescent', 'ccvm', 'value'),              oils_i18n_gettext('491', 'The item is intended for young people, approximate ages 14-17 years.', 'ccvm', 'description')),
    (492,'audience', 'e', oils_i18n_gettext('492', 'Adult', 'ccvm', 'value'),                   oils_i18n_gettext('492', 'The item is intended for adults.', 'ccvm', 'description')),
    (493,'audience', 'f', oils_i18n_gettext('493', 'Specialized', 'ccvm', 'value'),             oils_i18n_gettext('493', 'The item is aimed at a particular audience and the nature of the presentation makes the item of little interest to another audience.', 'ccvm', 'description')),
    (494,'audience', 'g', oils_i18n_gettext('494', 'General', 'ccvm', 'value'),                 oils_i18n_gettext('494', 'The item is of general interest and not aimed at an audience of a particular intellectual level.', 'ccvm', 'description')),
    (495,'audience', 'j', oils_i18n_gettext('495', 'Juvenile', 'ccvm', 'value'),                oils_i18n_gettext('495', 'The item is intended for children and young people, approximate ages 0-15 years.', 'ccvm', 'description'));

INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES
    (496, 'item_type', 'a', oils_i18n_gettext('496', 'Language material', 'ccvm', 'value')),
    (497, 'item_type', 't', oils_i18n_gettext('497', 'Manuscript language material', 'ccvm', 'value')),
    (498, 'item_type', 'g', oils_i18n_gettext('498', 'Projected medium', 'ccvm', 'value')),
    (499, 'item_type', 'k', oils_i18n_gettext('499', 'Two-dimensional nonprojectable graphic', 'ccvm', 'value')),
    (500, 'item_type', 'r', oils_i18n_gettext('500', 'Three-dimensional artifact or naturally occurring object', 'ccvm', 'value')),
    (501, 'item_type', 'o', oils_i18n_gettext('501', 'Kit', 'ccvm', 'value')),
    (502, 'item_type', 'p', oils_i18n_gettext('502', 'Mixed materials', 'ccvm', 'value')),
    (503, 'item_type', 'e', oils_i18n_gettext('503', 'Cartographic material', 'ccvm', 'value')),
    (504, 'item_type', 'f', oils_i18n_gettext('504', 'Manuscript cartographic material', 'ccvm', 'value')),
    (505, 'item_type', 'c', oils_i18n_gettext('505', 'Notated music', 'ccvm', 'value')),
    (506, 'item_type', 'd', oils_i18n_gettext('506', 'Manuscript notated music', 'ccvm', 'value')),
    (507, 'item_type', 'i', oils_i18n_gettext('507', 'Nonmusical sound recording', 'ccvm', 'value')),
    (508, 'item_type', 'j', oils_i18n_gettext('508', 'Musical sound recording', 'ccvm', 'value')),
    (509, 'item_type', 'm', oils_i18n_gettext('509', 'Computer file', 'ccvm', 'value'));

INSERT INTO config.coded_value_map (id, ctype, code, value, description) VALUES 
    (510, 'lit_form', '0', oils_i18n_gettext('510', 'Not fiction (not further specified)', 'ccvm', 'value'), oils_i18n_gettext('510', 'The item is not a work of fiction and no further identification of the literary form is desired', 'ccvm', 'description')),
    (511, 'lit_form', '1', oils_i18n_gettext('511', 'Fiction (not further specified)', 'ccvm', 'value'),     oils_i18n_gettext('511', 'The item is a work of fiction and no further identification of the literary form is desired', 'ccvm', 'description')),
    (512, 'lit_form', 'c', oils_i18n_gettext('512', 'Comic strips', 'ccvm', 'value'), NULL),
    (513, 'lit_form', 'd', oils_i18n_gettext('513', 'Dramas', 'ccvm', 'value'), NULL),
    (514, 'lit_form', 'e', oils_i18n_gettext('514', 'Essays', 'ccvm', 'value'), NULL),
    (515, 'lit_form', 'f', oils_i18n_gettext('515', 'Novels', 'ccvm', 'value'), NULL),
    (516, 'lit_form', 'h', oils_i18n_gettext('516', 'Humor, satires, etc.', 'ccvm', 'value'),                oils_i18n_gettext('516', 'The item is a humorous work, satire or of similar literary form.', 'ccvm', 'description')),
    (517, 'lit_form', 'i', oils_i18n_gettext('517', 'Letters', 'ccvm', 'value'),                             oils_i18n_gettext('517', 'The item is a single letter or collection of correspondence.', 'ccvm', 'description')),
    (518, 'lit_form', 'j', oils_i18n_gettext('518', 'Short stories', 'ccvm', 'value'),                       oils_i18n_gettext('518', 'The item is a short story or collection of short stories.', 'ccvm', 'description')),
    (519, 'lit_form', 'm', oils_i18n_gettext('519', 'Mixed forms', 'ccvm', 'value'),                         oils_i18n_gettext('519', 'The item is a variety of literary forms (e.g., poetry and short stories).', 'ccvm', 'description')),
    (520, 'lit_form', 'p', oils_i18n_gettext('520', 'Poetry', 'ccvm', 'value'),                              oils_i18n_gettext('520', 'The item is a poem or collection of poems.', 'ccvm', 'description')),
    (521, 'lit_form', 's', oils_i18n_gettext('521', 'Speeches', 'ccvm', 'value'),                            oils_i18n_gettext('521', 'The item is a speech or collection of speeches.', 'ccvm', 'description')),
    (522, 'lit_form', 'u', oils_i18n_gettext('522', 'Unknown', 'ccvm', 'value'),                             oils_i18n_gettext('522', 'The literary form of the item is unknown.', 'ccvm', 'description'));


INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES
    (523, 'item_form', 'a', oils_i18n_gettext('523', 'Microfilm', 'ccvm', 'value')),
    (524, 'item_form', 'b', oils_i18n_gettext('524', 'Microfiche', 'ccvm', 'value')),
    (525, 'item_form', 'c', oils_i18n_gettext('525', 'Microopaque', 'ccvm', 'value')),
    (526, 'item_form', 'd', oils_i18n_gettext('526', 'Large print', 'ccvm', 'value')),
    (527, 'item_form', 'f', oils_i18n_gettext('527', 'Braille', 'ccvm', 'value')),
    (528, 'item_form', 'r', oils_i18n_gettext('528', 'Regular print reproduction', 'ccvm', 'value')),
    (529, 'item_form', 's', oils_i18n_gettext('529', 'Electronic', 'ccvm', 'value'));
    -- see below for more item_form entries

INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES
    (530, 'bib_level', 'a', oils_i18n_gettext('530', 'Monographic component part', 'ccvm', 'value')),
    (531, 'bib_level', 'b', oils_i18n_gettext('531', 'Serial component part', 'ccvm', 'value')),
    (532, 'bib_level', 'c', oils_i18n_gettext('532', 'Collection', 'ccvm', 'value')),
    (533, 'bib_level', 'd', oils_i18n_gettext('533', 'Subunit', 'ccvm', 'value')),
    (534, 'bib_level', 'i', oils_i18n_gettext('534', 'Integrating resource', 'ccvm', 'value')),
    (535, 'bib_level', 'm', oils_i18n_gettext('535', 'Monograph/Item', 'ccvm', 'value')),
    (536, 'bib_level', 's', oils_i18n_gettext('536', 'Serial', 'ccvm', 'value'));

INSERT INTO config.coded_value_map(id, ctype, code, value) VALUES
    (537, 'vr_format', 'a', oils_i18n_gettext('537', 'Beta', 'ccvm', 'value')),
    (538, 'vr_format', 'b', oils_i18n_gettext('538', 'VHS', 'ccvm', 'value')),
    (539, 'vr_format', 'c', oils_i18n_gettext('539', 'U-matic', 'ccvm', 'value')),
    (540, 'vr_format', 'd', oils_i18n_gettext('540', 'EIAJ', 'ccvm', 'value')),
    (541, 'vr_format', 'e', oils_i18n_gettext('541', 'Type C', 'ccvm', 'value')),
    (542, 'vr_format', 'f', oils_i18n_gettext('542', 'Quadruplex', 'ccvm', 'value')),
    (543, 'vr_format', 'g', oils_i18n_gettext('543', 'Laserdisc', 'ccvm', 'value')),
    (544, 'vr_format', 'h', oils_i18n_gettext('544', 'CED videodisc', 'ccvm', 'value')),
    (545, 'vr_format', 'i', oils_i18n_gettext('545', 'Betacam', 'ccvm', 'value')),
    (546, 'vr_format', 'j', oils_i18n_gettext('546', 'Betacam SP', 'ccvm', 'value')),
    (547, 'vr_format', 'k', oils_i18n_gettext('547', 'Super-VHS', 'ccvm', 'value')),
    (548, 'vr_format', 'm', oils_i18n_gettext('548', 'M-II', 'ccvm', 'value')),
    (549, 'vr_format', 'o', oils_i18n_gettext('549', 'D-2', 'ccvm', 'value')),
    (550, 'vr_format', 'p', oils_i18n_gettext('550', '8 mm.', 'ccvm', 'value')),
    (551, 'vr_format', 'q', oils_i18n_gettext('551', 'Hi-8 mm.', 'ccvm', 'value')),
    (552, 'vr_format', 's', oils_i18n_gettext('552', 'Blu-ray disc', 'ccvm', 'value')),
    (553, 'vr_format', 'u', oils_i18n_gettext('553', 'Unknown', 'ccvm', 'value')),
    (554, 'vr_format', 'v', oils_i18n_gettext('554', 'DVD', 'ccvm', 'value')),
    (555, 'vr_format', 'z', oils_i18n_gettext('555', 'Other', 'ccvm', 'value')),
    (556, 'vr_format', ' ', oils_i18n_gettext('556', 'Unspecified', 'ccvm', 'value'));

INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES
    (557, 'sr_format', 'a', oils_i18n_gettext(557, '16 rpm', 'ccvm', 'value')),
    (558, 'sr_format', 'b', oils_i18n_gettext(558, '33 1/3 rpm', 'ccvm', 'value')),
    (559, 'sr_format', 'c', oils_i18n_gettext(559, '45 rpm', 'ccvm', 'value')),
    (560, 'sr_format', 'f', oils_i18n_gettext(560, '1.4 m. per second', 'ccvm', 'value')),
    (561, 'sr_format', 'd', oils_i18n_gettext(561, '78 rpm', 'ccvm', 'value')),
    (562, 'sr_format', 'e', oils_i18n_gettext(562, '8 rpm', 'ccvm', 'value')),
    (563, 'sr_format', 'l', oils_i18n_gettext(563, '1 7/8 ips', 'ccvm', 'value'));

INSERT INTO config.coded_value_map
    (id, ctype, code, value, search_label) VALUES 
(564, 'icon_format', 'book', 
    oils_i18n_gettext(564, 'Book', 'ccvm', 'value'),
    oils_i18n_gettext(564, 'Book', 'ccvm', 'search_label')),
(565, 'icon_format', 'braille', 
    oils_i18n_gettext(565, 'Braille', 'ccvm', 'value'),
    oils_i18n_gettext(565, 'Braille', 'ccvm', 'search_label')),
(566, 'icon_format', 'software', 
    oils_i18n_gettext(566, 'Software and video games', 'ccvm', 'value'),
    oils_i18n_gettext(566, 'Software and video games', 'ccvm', 'search_label')),
(567, 'icon_format', 'dvd', 
    oils_i18n_gettext(567, 'DVD', 'ccvm', 'value'),
    oils_i18n_gettext(567, 'DVD', 'ccvm', 'search_label')),
(568, 'icon_format', 'ebook', 
    oils_i18n_gettext(568, 'E-book', 'ccvm', 'value'),
    oils_i18n_gettext(568, 'E-book', 'ccvm', 'search_label')),
(569, 'icon_format', 'eaudio', 
    oils_i18n_gettext(569, 'E-audio', 'ccvm', 'value'),
    oils_i18n_gettext(569, 'E-audio', 'ccvm', 'search_label')),
(570, 'icon_format', 'kit', 
    oils_i18n_gettext(570, 'Kit', 'ccvm', 'value'),
    oils_i18n_gettext(570, 'Kit', 'ccvm', 'search_label')),
(571, 'icon_format', 'map', 
    oils_i18n_gettext(571, 'Map', 'ccvm', 'value'),
    oils_i18n_gettext(571, 'Map', 'ccvm', 'search_label')),
(572, 'icon_format', 'microform', 
    oils_i18n_gettext(572, 'Microform', 'ccvm', 'value'),
    oils_i18n_gettext(572, 'Microform', 'ccvm', 'search_label')),
(573, 'icon_format', 'score', 
    oils_i18n_gettext(573, 'Music Score', 'ccvm', 'value'),
    oils_i18n_gettext(573, 'Music Score', 'ccvm', 'search_label')),
(574, 'icon_format', 'picture', 
    oils_i18n_gettext(574, 'Picture', 'ccvm', 'value'),
    oils_i18n_gettext(574, 'Picture', 'ccvm', 'search_label')),
(575, 'icon_format', 'equip', 
    oils_i18n_gettext(575, 'Equipment, games, toys', 'ccvm', 'value'),
    oils_i18n_gettext(575, 'Equipment, games, toys', 'ccvm', 'search_label')),
(576, 'icon_format', 'serial', 
    oils_i18n_gettext(576, 'Serials and magazines', 'ccvm', 'value'),
    oils_i18n_gettext(576, 'Serials and magazines', 'ccvm', 'search_label')),
(577, 'icon_format', 'vhs', 
    oils_i18n_gettext(577, 'VHS', 'ccvm', 'value'),
    oils_i18n_gettext(577, 'VHS', 'ccvm', 'search_label')),
(578, 'icon_format', 'evideo', 
    oils_i18n_gettext(578, 'E-video', 'ccvm', 'value'),
    oils_i18n_gettext(578, 'E-video', 'ccvm', 'search_label')),
(579, 'icon_format', 'cdaudiobook', 
    oils_i18n_gettext(579, 'CD Audiobook', 'ccvm', 'value'),
    oils_i18n_gettext(579, 'CD Audiobook', 'ccvm', 'search_label')),
(580, 'icon_format', 'cdmusic', 
    oils_i18n_gettext(580, 'CD Music recording', 'ccvm', 'value'),
    oils_i18n_gettext(580, 'CD Music recording', 'ccvm', 'search_label')),
(581, 'icon_format', 'casaudiobook', 
    oils_i18n_gettext(581, 'Cassette audiobook', 'ccvm', 'value'),
    oils_i18n_gettext(581, 'Cassette audiobook', 'ccvm', 'search_label')),
(582, 'icon_format', 'casmusic',
    oils_i18n_gettext(582, 'Audiocassette music recording', 'ccvm', 'value'),
    oils_i18n_gettext(582, 'Audiocassette music recording', 'ccvm', 'search_label')),
(583, 'icon_format', 'phonospoken', 
    oils_i18n_gettext(583, 'Phonograph spoken recording', 'ccvm', 'value'),
    oils_i18n_gettext(583, 'Phonograph spoken recording', 'ccvm', 'search_label')),
(584, 'icon_format', 'phonomusic', 
    oils_i18n_gettext(584, 'Phonograph music recording', 'ccvm', 'value'),
    oils_i18n_gettext(584, 'Phonograph music recording', 'ccvm', 'search_label')),
(585, 'icon_format', 'lpbook', 
    oils_i18n_gettext(585, 'Large Print Book', 'ccvm', 'value'),
    oils_i18n_gettext(585, 'Large Print Book', 'ccvm', 'search_label'));

INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES 
(586, 'item_form', 'o', oils_i18n_gettext('586', 'Online', 'ccvm', 'value')),
(587, 'item_form', 'q', oils_i18n_gettext('587', 'Direct electronic', 'ccvm', 'value'));

-- these formats are a subset of the "icon_format" attribute,
-- modified to exclude electronic resources, which are not holdable
INSERT INTO config.coded_value_map
    (id, ctype, code, value, search_label) VALUES 
(588, 'mr_hold_format', 'book', 
    oils_i18n_gettext(588, 'Book', 'ccvm', 'value'),
    oils_i18n_gettext(588, 'Book', 'ccvm', 'search_label')),
(589, 'mr_hold_format', 'braille', 
    oils_i18n_gettext(589, 'Braille', 'ccvm', 'value'),
    oils_i18n_gettext(589, 'Braille', 'ccvm', 'search_label')),
(590, 'mr_hold_format', 'software', 
    oils_i18n_gettext(590, 'Software and video games', 'ccvm', 'value'),
    oils_i18n_gettext(590, 'Software and video games', 'ccvm', 'search_label')),
(591, 'mr_hold_format', 'dvd', 
    oils_i18n_gettext(591, 'DVD', 'ccvm', 'value'),
    oils_i18n_gettext(591, 'DVD', 'ccvm', 'search_label')),
(592, 'mr_hold_format', 'kit', 
    oils_i18n_gettext(592, 'Kit', 'ccvm', 'value'),
    oils_i18n_gettext(592, 'Kit', 'ccvm', 'search_label')),
(593, 'mr_hold_format', 'map', 
    oils_i18n_gettext(593, 'Map', 'ccvm', 'value'),
    oils_i18n_gettext(593, 'Map', 'ccvm', 'search_label')),
(594, 'mr_hold_format', 'microform', 
    oils_i18n_gettext(594, 'Microform', 'ccvm', 'value'),
    oils_i18n_gettext(594, 'Microform', 'ccvm', 'search_label')),
(595, 'mr_hold_format', 'score', 
    oils_i18n_gettext(595, 'Music Score', 'ccvm', 'value'),
    oils_i18n_gettext(595, 'Music Score', 'ccvm', 'search_label')),
(596, 'mr_hold_format', 'picture', 
    oils_i18n_gettext(596, 'Picture', 'ccvm', 'value'),
    oils_i18n_gettext(596, 'Picture', 'ccvm', 'search_label')),
(597, 'mr_hold_format', 'equip', 
    oils_i18n_gettext(597, 'Equipment, games, toys', 'ccvm', 'value'),
    oils_i18n_gettext(597, 'Equipment, games, toys', 'ccvm', 'search_label')),
(598, 'mr_hold_format', 'serial', 
    oils_i18n_gettext(598, 'Serials and magazines', 'ccvm', 'value'),
    oils_i18n_gettext(598, 'Serials and magazines', 'ccvm', 'search_label')),
(599, 'mr_hold_format', 'vhs', 
    oils_i18n_gettext(599, 'VHS', 'ccvm', 'value'),
    oils_i18n_gettext(599, 'VHS', 'ccvm', 'search_label')),
(600, 'mr_hold_format', 'cdaudiobook', 
    oils_i18n_gettext(600, 'CD Audiobook', 'ccvm', 'value'),
    oils_i18n_gettext(600, 'CD Audiobook', 'ccvm', 'search_label')),
(601, 'mr_hold_format', 'cdmusic', 
    oils_i18n_gettext(601, 'CD Music recording', 'ccvm', 'value'),
    oils_i18n_gettext(601, 'CD Music recording', 'ccvm', 'search_label')),
(602, 'mr_hold_format', 'casaudiobook', 
    oils_i18n_gettext(602, 'Cassette audiobook', 'ccvm', 'value'),
    oils_i18n_gettext(602, 'Cassette audiobook', 'ccvm', 'search_label')),
(603, 'mr_hold_format', 'casmusic',
    oils_i18n_gettext(603, 'Audiocassette music recording', 'ccvm', 'value'),
    oils_i18n_gettext(603, 'Audiocassette music recording', 'ccvm', 'search_label')),
(604, 'mr_hold_format', 'phonospoken', 
    oils_i18n_gettext(604, 'Phonograph spoken recording', 'ccvm', 'value'),
    oils_i18n_gettext(604, 'Phonograph spoken recording', 'ccvm', 'search_label')),
(605, 'mr_hold_format', 'phonomusic', 
    oils_i18n_gettext(605, 'Phonograph music recording', 'ccvm', 'value'),
    oils_i18n_gettext(605, 'Phonograph music recording', 'ccvm', 'search_label')),
(606, 'mr_hold_format', 'lpbook', 
    oils_i18n_gettext(606, 'Large Print Book', 'ccvm', 'value'),
    oils_i18n_gettext(606, 'Large Print Book', 'ccvm', 'search_label')) ;

-- catch-all music of unkown format
INSERT INTO config.coded_value_map
    (id, ctype, code, value, search_label) VALUES 
(607, 'icon_format', 'music', 
    oils_i18n_gettext(607, 'Musical Sound Recording (Unknown Format)', 'ccvm', 'value'),
    oils_i18n_gettext(607, 'Musical Sound Recording (Unknown Format)', 'ccvm', 'search_label'));

-- icon for blu-ray
INSERT INTO config.coded_value_map
    (id, ctype, code, value, search_label) VALUES 
(608, 'icon_format', 'blu-ray', 
    oils_i18n_gettext(608, 'Blu-ray', 'ccvm', 'value'),
    oils_i18n_gettext(608, 'Blu-ray', 'ccvm', 'search_label'));

-- metarecord hold format for blu-ray
INSERT INTO config.coded_value_map
    (id, ctype, code, value, search_label) VALUES 
(609, 'mr_hold_format', 'blu-ray', 
    oils_i18n_gettext(609, 'Blu-ray', 'ccvm', 'value'),
    oils_i18n_gettext(609, 'Blu-ray', 'ccvm', 'search_label'));

-- search format values
INSERT INTO config.coded_value_map
    (id, ctype, code, value, search_label) VALUES 
(610, 'search_format', 'book', 
    oils_i18n_gettext(610, 'All Books', 'ccvm', 'value'),
    oils_i18n_gettext(610, 'All Books', 'ccvm', 'search_label')),
(611, 'search_format', 'braille', 
    oils_i18n_gettext(611, 'Braille', 'ccvm', 'value'),
    oils_i18n_gettext(611, 'Braille', 'ccvm', 'search_label')),
(612, 'search_format', 'software', 
    oils_i18n_gettext(612, 'Software and video games', 'ccvm', 'value'),
    oils_i18n_gettext(612, 'Software and video games', 'ccvm', 'search_label')),
(613, 'search_format', 'dvd', 
    oils_i18n_gettext(613, 'DVD', 'ccvm', 'value'),
    oils_i18n_gettext(613, 'DVD', 'ccvm', 'search_label')),
(614, 'search_format', 'ebook', 
    oils_i18n_gettext(614, 'E-book', 'ccvm', 'value'),
    oils_i18n_gettext(614, 'E-book', 'ccvm', 'search_label')),
(615, 'search_format', 'eaudio', 
    oils_i18n_gettext(615, 'E-audio', 'ccvm', 'value'),
    oils_i18n_gettext(615, 'E-audio', 'ccvm', 'search_label')),
(616, 'search_format', 'kit', 
    oils_i18n_gettext(616, 'Kit', 'ccvm', 'value'),
    oils_i18n_gettext(616, 'Kit', 'ccvm', 'search_label')),
(617, 'search_format', 'map', 
    oils_i18n_gettext(617, 'Map', 'ccvm', 'value'),
    oils_i18n_gettext(617, 'Map', 'ccvm', 'search_label')),
(618, 'search_format', 'microform', 
    oils_i18n_gettext(618, 'Microform', 'ccvm', 'value'),
    oils_i18n_gettext(618, 'Microform', 'ccvm', 'search_label')),
(619, 'search_format', 'score', 
    oils_i18n_gettext(619, 'Music Score', 'ccvm', 'value'),
    oils_i18n_gettext(619, 'Music Score', 'ccvm', 'search_label')),
(620, 'search_format', 'picture', 
    oils_i18n_gettext(620, 'Picture', 'ccvm', 'value'),
    oils_i18n_gettext(620, 'Picture', 'ccvm', 'search_label')),
(621, 'search_format', 'equip', 
    oils_i18n_gettext(621, 'Equipment, games, toys', 'ccvm', 'value'),
    oils_i18n_gettext(621, 'Equipment, games, toys', 'ccvm', 'search_label')),
(622, 'search_format', 'serial', 
    oils_i18n_gettext(622, 'Serials and magazines', 'ccvm', 'value'),
    oils_i18n_gettext(622, 'Serials and magazines', 'ccvm', 'search_label')),
(623, 'search_format', 'vhs', 
    oils_i18n_gettext(623, 'VHS', 'ccvm', 'value'),
    oils_i18n_gettext(623, 'VHS', 'ccvm', 'search_label')),
(624, 'search_format', 'evideo', 
    oils_i18n_gettext(624, 'E-video', 'ccvm', 'value'),
    oils_i18n_gettext(624, 'E-video', 'ccvm', 'search_label')),
(625, 'search_format', 'cdaudiobook', 
    oils_i18n_gettext(625, 'CD Audiobook', 'ccvm', 'value'),
    oils_i18n_gettext(625, 'CD Audiobook', 'ccvm', 'search_label')),
(626, 'search_format', 'cdmusic', 
    oils_i18n_gettext(626, 'CD Music recording', 'ccvm', 'value'),
    oils_i18n_gettext(626, 'CD Music recording', 'ccvm', 'search_label')),
(627, 'search_format', 'casaudiobook', 
    oils_i18n_gettext(627, 'Cassette audiobook', 'ccvm', 'value'),
    oils_i18n_gettext(627, 'Cassette audiobook', 'ccvm', 'search_label')),
(628, 'search_format', 'casmusic',
    oils_i18n_gettext(628, 'Audiocassette music recording', 'ccvm', 'value'),
    oils_i18n_gettext(628, 'Audiocassette music recording', 'ccvm', 'search_label')),
(629, 'search_format', 'phonospoken', 
    oils_i18n_gettext(629, 'Phonograph spoken recording', 'ccvm', 'value'),
    oils_i18n_gettext(629, 'Phonograph spoken recording', 'ccvm', 'search_label')),
(630, 'search_format', 'phonomusic', 
    oils_i18n_gettext(630, 'Phonograph music recording', 'ccvm', 'value'),
    oils_i18n_gettext(630, 'Phonograph music recording', 'ccvm', 'search_label')),
(631, 'search_format', 'lpbook', 
    oils_i18n_gettext(631, 'Large Print Book', 'ccvm', 'value'),
    oils_i18n_gettext(631, 'Large Print Book', 'ccvm', 'search_label')),
(632, 'search_format', 'music', 
    oils_i18n_gettext(632, 'All Music', 'ccvm', 'label'),
    oils_i18n_gettext(632, 'All Music', 'ccvm', 'search_label')),
(633, 'search_format', 'blu-ray', 
    oils_i18n_gettext(633, 'Blu-ray', 'ccvm', 'value'),
    oils_i18n_gettext(633, 'Blu-ray', 'ccvm', 'search_label'));

-- Electronic search format, not opac_visible
INSERT INTO config.coded_value_map
    (id, ctype, code, opac_visible, value, search_label) VALUES
(712, 'search_format', 'electronic', FALSE,
    oils_i18n_gettext(712, 'Electronic', 'ccvm', 'value'),
    oils_i18n_gettext(712, 'Electronic', 'ccvm', 'search_label'));

-- RDA content type, media type, and carrier type
INSERT INTO config.coded_value_map (id, ctype, code, value, concept_uri)
  VALUES (634, 'content_type', 'two-dimensional moving image',
  oils_i18n_gettext(634, 'two-dimensional moving image', 'ccvm', 'value'),
  'http://rdaregistry.info/termList/RDAContentType/1023');
INSERT INTO config.coded_value_map (id, ctype, code, value, concept_uri)
  VALUES (635, 'content_type', 'three-dimensional moving image',
  oils_i18n_gettext(635, 'three-dimensional moving image', 'ccvm', 'value'),
  'http://rdaregistry.info/termList/RDAContentType/1022');
INSERT INTO config.coded_value_map (id, ctype, code, value, concept_uri)
  VALUES (636, 'content_type', 'three-dimensional form',
  oils_i18n_gettext(636, 'three-dimensional form', 'ccvm', 'value'),
  'http://rdaregistry.info/termList/RDAContentType/1021');
INSERT INTO config.coded_value_map (id, ctype, code, value, concept_uri)
  VALUES (637, 'content_type', 'text',
  oils_i18n_gettext(637, 'text', 'ccvm', 'value'),
  'http://rdaregistry.info/termList/RDAContentType/1020');
INSERT INTO config.coded_value_map (id, ctype, code, value, concept_uri)
  VALUES (638, 'content_type', 'tactile three-dimensional form',
  oils_i18n_gettext(638, 'tactile three-dimensional form', 'ccvm', 'value'),
  'http://rdaregistry.info/termList/RDAContentType/1019');
INSERT INTO config.coded_value_map (id, ctype, code, value, concept_uri)
  VALUES (639, 'content_type', 'tactile text',
  oils_i18n_gettext(639, 'tactile text', 'ccvm', 'value'),
  'http://rdaregistry.info/termList/RDAContentType/1018');
INSERT INTO config.coded_value_map (id, ctype, code, value, concept_uri)
  VALUES (640, 'content_type', 'tactile notated movement',
  oils_i18n_gettext(640, 'tactile notated movement', 'ccvm', 'value'),
  'http://rdaregistry.info/termList/RDAContentType/1017');
INSERT INTO config.coded_value_map (id, ctype, code, value, concept_uri)
  VALUES (641, 'content_type', 'tactile notated music',
  oils_i18n_gettext(641, 'tactile notated music', 'ccvm', 'value'),
  'http://rdaregistry.info/termList/RDAContentType/1016');
INSERT INTO config.coded_value_map (id, ctype, code, value, concept_uri)
  VALUES (642, 'content_type', 'tactile image',
  oils_i18n_gettext(642, 'tactile image', 'ccvm', 'value'),
  'http://rdaregistry.info/termList/RDAContentType/1015');
INSERT INTO config.coded_value_map (id, ctype, code, value, concept_uri)
  VALUES (643, 'content_type', 'still image',
  oils_i18n_gettext(643, 'still image', 'ccvm', 'value'),
  'http://rdaregistry.info/termList/RDAContentType/1014');
INSERT INTO config.coded_value_map (id, ctype, code, value, concept_uri)
  VALUES (644, 'content_type', 'spoken word',
  oils_i18n_gettext(644, 'spoken word', 'ccvm', 'value'),
  'http://rdaregistry.info/termList/RDAContentType/1013');
INSERT INTO config.coded_value_map (id, ctype, code, value, concept_uri)
  VALUES (645, 'content_type', 'sounds',
  oils_i18n_gettext(645, 'sounds', 'ccvm', 'value'),
  'http://rdaregistry.info/termList/RDAContentType/1012');
INSERT INTO config.coded_value_map (id, ctype, code, value, concept_uri)
  VALUES (646, 'content_type', 'performed music',
  oils_i18n_gettext(646, 'performed music', 'ccvm', 'value'),
  'http://rdaregistry.info/termList/RDAContentType/1011');
INSERT INTO config.coded_value_map (id, ctype, code, value, concept_uri)
  VALUES (647, 'content_type', 'notated music',
  oils_i18n_gettext(647, 'notated music', 'ccvm', 'value'),
  'http://rdaregistry.info/termList/RDAContentType/1010');
INSERT INTO config.coded_value_map (id, ctype, code, value, concept_uri)
  VALUES (648, 'content_type', 'notated movement',
  oils_i18n_gettext(648, 'notated movement', 'ccvm', 'value'),
  'http://rdaregistry.info/termList/RDAContentType/1009');
INSERT INTO config.coded_value_map (id, ctype, code, value, concept_uri)
  VALUES (649, 'content_type', 'computer program',
  oils_i18n_gettext(649, 'computer program', 'ccvm', 'value'),
  'http://rdaregistry.info/termList/RDAContentType/1008');
INSERT INTO config.coded_value_map (id, ctype, code, value, concept_uri)
  VALUES (650, 'content_type', 'computer dataset',
  oils_i18n_gettext(650, 'computer dataset', 'ccvm', 'value'),
  'http://rdaregistry.info/termList/RDAContentType/1007');
INSERT INTO config.coded_value_map (id, ctype, code, value, concept_uri)
  VALUES (651, 'content_type', 'cartographic three-dimensional form',
  oils_i18n_gettext(651, 'cartographic three-dimensional form', 'ccvm', 'value'),
  'http://rdaregistry.info/termList/RDAContentType/1006');
INSERT INTO config.coded_value_map (id, ctype, code, value, concept_uri)
  VALUES (652, 'content_type', 'cartographic tactile three-dimensional form',
  oils_i18n_gettext(652, 'cartographic tactile three-dimensional form', 'ccvm', 'value'),
  'http://rdaregistry.info/termList/RDAContentType/1005');
INSERT INTO config.coded_value_map (id, ctype, code, value, concept_uri)
  VALUES (653, 'content_type', 'cartographic tactile image',
  oils_i18n_gettext(653, 'cartographic tactile image', 'ccvm', 'value'),
  'http://rdaregistry.info/termList/RDAContentType/1004');
INSERT INTO config.coded_value_map (id, ctype, code, value, concept_uri)
  VALUES (654, 'content_type', 'cartographic moving image',
  oils_i18n_gettext(654, 'cartographic moving image', 'ccvm', 'value'),
  'http://rdaregistry.info/termList/RDAContentType/1003');
INSERT INTO config.coded_value_map (id, ctype, code, value, concept_uri)
  VALUES (655, 'content_type', 'cartographic image',
  oils_i18n_gettext(655, 'cartographic image', 'ccvm', 'value'),
  'http://rdaregistry.info/termList/RDAContentType/1002');
INSERT INTO config.coded_value_map (id, ctype, code, value, concept_uri)
  VALUES (656, 'content_type', 'cartographic dataset',
  oils_i18n_gettext(656, 'cartographic dataset', 'ccvm', 'value'),
  'http://rdaregistry.info/termList/RDAContentType/1001');
INSERT INTO config.coded_value_map (id, ctype, code, value, concept_uri)
  VALUES (657, 'media_type', 'video',
  oils_i18n_gettext(657, 'video', 'ccvm', 'value'),
  'http://rdaregistry.info/termList/RDAMediaType/1008');
INSERT INTO config.coded_value_map (id, ctype, code, value, concept_uri)
  VALUES (658, 'media_type', 'unmediated',
  oils_i18n_gettext(658, 'unmediated', 'ccvm', 'value'),
  'http://rdaregistry.info/termList/RDAMediaType/1007');
INSERT INTO config.coded_value_map (id, ctype, code, value, concept_uri)
  VALUES (659, 'media_type', 'stereographic',
  oils_i18n_gettext(659, 'stereographic', 'ccvm', 'value'),
  'http://rdaregistry.info/termList/RDAMediaType/1006');
INSERT INTO config.coded_value_map (id, ctype, code, value, concept_uri)
  VALUES (660, 'media_type', 'projected',
  oils_i18n_gettext(660, 'projected', 'ccvm', 'value'),
  'http://rdaregistry.info/termList/RDAMediaType/1005');
INSERT INTO config.coded_value_map (id, ctype, code, value, concept_uri)
  VALUES (661, 'media_type', 'microscopic',
  oils_i18n_gettext(661, 'microscopic', 'ccvm', 'value'),
  'http://rdaregistry.info/termList/RDAMediaType/1004');
INSERT INTO config.coded_value_map (id, ctype, code, value, concept_uri)
  VALUES (662, 'media_type', 'computer',
  oils_i18n_gettext(662, 'computer', 'ccvm', 'value'),
  'http://rdaregistry.info/termList/RDAMediaType/1003');
INSERT INTO config.coded_value_map (id, ctype, code, value, concept_uri)
  VALUES (663, 'media_type', 'microform',
  oils_i18n_gettext(663, 'microform', 'ccvm', 'value'),
  'http://rdaregistry.info/termList/RDAMediaType/1002');
INSERT INTO config.coded_value_map (id, ctype, code, value, concept_uri)
  VALUES (664, 'media_type', 'audio',
  oils_i18n_gettext(664, 'audio', 'ccvm', 'value'),
  'http://rdaregistry.info/termList/RDAMediaType/1001');
INSERT INTO config.coded_value_map (id, ctype, code, value, concept_uri)
  VALUES (665, 'media_type', 'Published',
  oils_i18n_gettext(665, 'Published', 'ccvm', 'value'),
  'http://metadataregistry.org/uri/RegStatus/1001');
INSERT INTO config.coded_value_map (id, ctype, code, value, concept_uri)
  VALUES (666, 'carrier_type', 'film roll',
  oils_i18n_gettext(666, 'film roll', 'ccvm', 'value'),
  'http://rdaregistry.info/termList/RDACarrierType/1069');
INSERT INTO config.coded_value_map (id, ctype, code, value, concept_uri)
  VALUES (667, 'carrier_type', 'videodisc',
  oils_i18n_gettext(667, 'videodisc', 'ccvm', 'value'),
  'http://rdaregistry.info/termList/RDACarrierType/1060');
INSERT INTO config.coded_value_map (id, ctype, code, value, concept_uri)
  VALUES (668, 'carrier_type', 'object',
  oils_i18n_gettext(668, 'object', 'ccvm', 'value'),
  'http://rdaregistry.info/termList/RDACarrierType/1059');
INSERT INTO config.coded_value_map (id, ctype, code, value, concept_uri)
  VALUES (669, 'carrier_type', 'microfilm roll',
  oils_i18n_gettext(669, 'microfilm roll', 'ccvm', 'value'),
  'http://rdaregistry.info/termList/RDACarrierType/1056');
INSERT INTO config.coded_value_map (id, ctype, code, value, concept_uri)
  VALUES (670, 'carrier_type', 'videotape reel',
  oils_i18n_gettext(670, 'videotape reel', 'ccvm', 'value'),
  'http://rdaregistry.info/termList/RDACarrierType/1053');
INSERT INTO config.coded_value_map (id, ctype, code, value, concept_uri)
  VALUES (671, 'carrier_type', 'videocassette',
  oils_i18n_gettext(671, 'videocassette', 'ccvm', 'value'),
  'http://rdaregistry.info/termList/RDACarrierType/1052');
INSERT INTO config.coded_value_map (id, ctype, code, value, concept_uri)
  VALUES (672, 'carrier_type', 'video cartridge',
  oils_i18n_gettext(672, 'video cartridge', 'ccvm', 'value'),
  'http://rdaregistry.info/termList/RDACarrierType/1051');
INSERT INTO config.coded_value_map (id, ctype, code, value, concept_uri)
  VALUES (673, 'carrier_type', 'volume',
  oils_i18n_gettext(673, 'volume', 'ccvm', 'value'),
  'http://rdaregistry.info/termList/RDACarrierType/1049');
INSERT INTO config.coded_value_map (id, ctype, code, value, concept_uri)
  VALUES (674, 'carrier_type', 'sheet',
  oils_i18n_gettext(674, 'sheet', 'ccvm', 'value'),
  'http://rdaregistry.info/termList/RDACarrierType/1048');
INSERT INTO config.coded_value_map (id, ctype, code, value, concept_uri)
  VALUES (675, 'carrier_type', 'roll',
  oils_i18n_gettext(675, 'roll', 'ccvm', 'value'),
  'http://rdaregistry.info/termList/RDACarrierType/1047');
INSERT INTO config.coded_value_map (id, ctype, code, value, concept_uri)
  VALUES (676, 'carrier_type', 'flipchart',
  oils_i18n_gettext(676, 'flipchart', 'ccvm', 'value'),
  'http://rdaregistry.info/termList/RDACarrierType/1046');
INSERT INTO config.coded_value_map (id, ctype, code, value, concept_uri)
  VALUES (677, 'carrier_type', 'card',
  oils_i18n_gettext(677, 'card', 'ccvm', 'value'),
  'http://rdaregistry.info/termList/RDACarrierType/1045');
INSERT INTO config.coded_value_map (id, ctype, code, value, concept_uri)
  VALUES (678, 'carrier_type', 'stereograph disc',
  oils_i18n_gettext(678, 'stereograph disc', 'ccvm', 'value'),
  'http://rdaregistry.info/termList/RDACarrierType/1043');
INSERT INTO config.coded_value_map (id, ctype, code, value, concept_uri)
  VALUES (679, 'carrier_type', 'stereograph card',
  oils_i18n_gettext(679, 'stereograph card', 'ccvm', 'value'),
  'http://rdaregistry.info/termList/RDACarrierType/1042');
INSERT INTO config.coded_value_map (id, ctype, code, value, concept_uri)
  VALUES (680, 'carrier_type', 'slide',
  oils_i18n_gettext(680, 'slide', 'ccvm', 'value'),
  'http://rdaregistry.info/termList/RDACarrierType/1040');
INSERT INTO config.coded_value_map (id, ctype, code, value, concept_uri)
  VALUES (681, 'carrier_type', 'overhead transparency',
  oils_i18n_gettext(681, 'overhead transparency', 'ccvm', 'value'),
  'http://rdaregistry.info/termList/RDACarrierType/1039');
INSERT INTO config.coded_value_map (id, ctype, code, value, concept_uri)
  VALUES (682, 'carrier_type', 'filmstrip cartridge',
  oils_i18n_gettext(682, 'filmstrip cartridge', 'ccvm', 'value'),
  'http://rdaregistry.info/termList/RDACarrierType/1037');
INSERT INTO config.coded_value_map (id, ctype, code, value, concept_uri)
  VALUES (683, 'carrier_type', 'filmstrip',
  oils_i18n_gettext(683, 'filmstrip', 'ccvm', 'value'),
  'http://rdaregistry.info/termList/RDACarrierType/1036');
INSERT INTO config.coded_value_map (id, ctype, code, value, concept_uri)
  VALUES (684, 'carrier_type', 'filmslip',
  oils_i18n_gettext(684, 'filmslip', 'ccvm', 'value'),
  'http://rdaregistry.info/termList/RDACarrierType/1035');
INSERT INTO config.coded_value_map (id, ctype, code, value, concept_uri)
  VALUES (685, 'carrier_type', 'film reel',
  oils_i18n_gettext(685, 'film reel', 'ccvm', 'value'),
  'http://rdaregistry.info/termList/RDACarrierType/1034');
INSERT INTO config.coded_value_map (id, ctype, code, value, concept_uri)
  VALUES (686, 'carrier_type', 'film cassette',
  oils_i18n_gettext(686, 'film cassette', 'ccvm', 'value'),
  'http://rdaregistry.info/termList/RDACarrierType/1033');
INSERT INTO config.coded_value_map (id, ctype, code, value, concept_uri)
  VALUES (687, 'carrier_type', 'film cartridge',
  oils_i18n_gettext(687, 'film cartridge', 'ccvm', 'value'),
  'http://rdaregistry.info/termList/RDACarrierType/1032');
INSERT INTO config.coded_value_map (id, ctype, code, value, concept_uri)
  VALUES (688, 'carrier_type', 'microscope slide',
  oils_i18n_gettext(688, 'microscope slide', 'ccvm', 'value'),
  'http://rdaregistry.info/termList/RDACarrierType/1030');
INSERT INTO config.coded_value_map (id, ctype, code, value, concept_uri)
  VALUES (689, 'carrier_type', 'microopaque',
  oils_i18n_gettext(689, 'microopaque', 'ccvm', 'value'),
  'http://rdaregistry.info/termList/RDACarrierType/1028');
INSERT INTO config.coded_value_map (id, ctype, code, value, concept_uri)
  VALUES (690, 'carrier_type', 'microfilm slip',
  oils_i18n_gettext(690, 'microfilm slip', 'ccvm', 'value'),
  'http://rdaregistry.info/termList/RDACarrierType/1027');
INSERT INTO config.coded_value_map (id, ctype, code, value, concept_uri)
  VALUES (691, 'carrier_type', 'microfilm reel',
  oils_i18n_gettext(691, 'microfilm reel', 'ccvm', 'value'),
  'http://rdaregistry.info/termList/RDACarrierType/1026');
INSERT INTO config.coded_value_map (id, ctype, code, value, concept_uri)
  VALUES (692, 'carrier_type', 'microfilm cassette',
  oils_i18n_gettext(692, 'microfilm cassette', 'ccvm', 'value'),
  'http://rdaregistry.info/termList/RDACarrierType/1025');
INSERT INTO config.coded_value_map (id, ctype, code, value, concept_uri)
  VALUES (693, 'carrier_type', 'microfilm cartridge',
  oils_i18n_gettext(693, 'microfilm cartridge', 'ccvm', 'value'),
  'http://rdaregistry.info/termList/RDACarrierType/1024');
INSERT INTO config.coded_value_map (id, ctype, code, value, concept_uri)
  VALUES (694, 'carrier_type', 'microfiche cassette',
  oils_i18n_gettext(694, 'microfiche cassette', 'ccvm', 'value'),
  'http://rdaregistry.info/termList/RDACarrierType/1023');
INSERT INTO config.coded_value_map (id, ctype, code, value, concept_uri)
  VALUES (695, 'carrier_type', 'microfiche',
  oils_i18n_gettext(695, 'microfiche', 'ccvm', 'value'),
  'http://rdaregistry.info/termList/RDACarrierType/1022');
INSERT INTO config.coded_value_map (id, ctype, code, value, concept_uri)
  VALUES (696, 'carrier_type', 'aperture card',
  oils_i18n_gettext(696, 'aperture card', 'ccvm', 'value'),
  'http://rdaregistry.info/termList/RDACarrierType/1021');
INSERT INTO config.coded_value_map (id, ctype, code, value, concept_uri)
  VALUES (697, 'carrier_type', 'online resource',
  oils_i18n_gettext(697, 'online resource', 'ccvm', 'value'),
  'http://rdaregistry.info/termList/RDACarrierType/1018');
INSERT INTO config.coded_value_map (id, ctype, code, value, concept_uri)
  VALUES (698, 'carrier_type', 'computer tape reel',
  oils_i18n_gettext(698, 'computer tape reel', 'ccvm', 'value'),
  'http://rdaregistry.info/termList/RDACarrierType/1017');
INSERT INTO config.coded_value_map (id, ctype, code, value, concept_uri)
  VALUES (699, 'carrier_type', 'computer tape cassette',
  oils_i18n_gettext(699, 'computer tape cassette', 'ccvm', 'value'),
  'http://rdaregistry.info/termList/RDACarrierType/1016');
INSERT INTO config.coded_value_map (id, ctype, code, value, concept_uri)
  VALUES (700, 'carrier_type', 'computer tape cartridge',
  oils_i18n_gettext(700, 'computer tape cartridge', 'ccvm', 'value'),
  'http://rdaregistry.info/termList/RDACarrierType/1015');
INSERT INTO config.coded_value_map (id, ctype, code, value, concept_uri)
  VALUES (701, 'carrier_type', 'computer disc cartridge',
  oils_i18n_gettext(701, 'computer disc cartridge', 'ccvm', 'value'),
  'http://rdaregistry.info/termList/RDACarrierType/1014');
INSERT INTO config.coded_value_map (id, ctype, code, value, concept_uri)
  VALUES (702, 'carrier_type', 'computer disc',
  oils_i18n_gettext(702, 'computer disc', 'ccvm', 'value'),
  'http://rdaregistry.info/termList/RDACarrierType/1013');
INSERT INTO config.coded_value_map (id, ctype, code, value, concept_uri)
  VALUES (703, 'carrier_type', 'computer chip cartridge',
  oils_i18n_gettext(703, 'computer chip cartridge', 'ccvm', 'value'),
  'http://rdaregistry.info/termList/RDACarrierType/1012');
INSERT INTO config.coded_value_map (id, ctype, code, value, concept_uri)
  VALUES (704, 'carrier_type', 'computer card',
  oils_i18n_gettext(704, 'computer card', 'ccvm', 'value'),
  'http://rdaregistry.info/termList/RDACarrierType/1011');
INSERT INTO config.coded_value_map (id, ctype, code, value, concept_uri)
  VALUES (705, 'carrier_type', 'audiotape reel',
  oils_i18n_gettext(705, 'audiotape reel', 'ccvm', 'value'),
  'http://rdaregistry.info/termList/RDACarrierType/1008');
INSERT INTO config.coded_value_map (id, ctype, code, value, concept_uri)
  VALUES (706, 'carrier_type', 'audiocassette',
  oils_i18n_gettext(706, 'audiocassette', 'ccvm', 'value'),
  'http://rdaregistry.info/termList/RDACarrierType/1007');
INSERT INTO config.coded_value_map (id, ctype, code, value, concept_uri)
  VALUES (707, 'carrier_type', 'audio roll',
  oils_i18n_gettext(707, 'audio roll', 'ccvm', 'value'),
  'http://rdaregistry.info/termList/RDACarrierType/1006');
INSERT INTO config.coded_value_map (id, ctype, code, value, concept_uri)
  VALUES (708, 'carrier_type', 'sound-track reel',
  oils_i18n_gettext(708, 'sound-track reel', 'ccvm', 'value'),
  'http://rdaregistry.info/termList/RDACarrierType/1005');
INSERT INTO config.coded_value_map (id, ctype, code, value, concept_uri)
  VALUES (709, 'carrier_type', 'audio disc',
  oils_i18n_gettext(709, 'audio disc', 'ccvm', 'value'),
  'http://rdaregistry.info/termList/RDACarrierType/1004');
INSERT INTO config.coded_value_map (id, ctype, code, value, concept_uri)
  VALUES (710, 'carrier_type', 'audio cylinder',
  oils_i18n_gettext(710, 'audio cylinder', 'ccvm', 'value'),
  'http://rdaregistry.info/termList/RDACarrierType/1003');
INSERT INTO config.coded_value_map (id, ctype, code, value, concept_uri)
  VALUES (711, 'carrier_type', 'audio cartridge',
  oils_i18n_gettext(711, 'audio cartridge', 'ccvm', 'value'),
  'http://rdaregistry.info/termList/RDACarrierType/1002');

-- Accompanying Matter
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1735, 'accm', ' ', oils_i18n_gettext('1735', 'No accompanying matter', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (713, 'accm', 'a', oils_i18n_gettext('713', 'Discography', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (714, 'accm', 'b', oils_i18n_gettext('714', 'Bibliography', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (715, 'accm', 'c', oils_i18n_gettext('715', 'Thematic index', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (716, 'accm', 'd', oils_i18n_gettext('716', 'Libretto or text', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (717, 'accm', 'e', oils_i18n_gettext('717', 'Biography of composer or author', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (718, 'accm', 'f', oils_i18n_gettext('718', 'Biography or performer or history of ensemble', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (719, 'accm', 'g', oils_i18n_gettext('719', 'Technical and/or historical information on instruments', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (720, 'accm', 'h', oils_i18n_gettext('720', 'Technical information on music', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (721, 'accm', 'i', oils_i18n_gettext('721', 'Historical information', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (722, 'accm', 'k', oils_i18n_gettext('722', 'Ethnological information', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (723, 'accm', 'r', oils_i18n_gettext('723', 'Instructional materials', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (724, 'accm', 's', oils_i18n_gettext('724', 'Music', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (725, 'accm', 'z', oils_i18n_gettext('725', 'Other accompanying matter', 'ccvm', 'value'));

-- Form of Composition
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (726, 'comp', '  ', oils_i18n_gettext('726', 'No information supplied', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (727, 'comp', 'an', oils_i18n_gettext('727', 'Anthems', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (728, 'comp', 'bd', oils_i18n_gettext('728', 'Ballads', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (729, 'comp', 'bt', oils_i18n_gettext('729', 'Ballets', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (730, 'comp', 'bg', oils_i18n_gettext('730', 'Bluegrass music', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (731, 'comp', 'bl', oils_i18n_gettext('731', 'Blues', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (732, 'comp', 'cn', oils_i18n_gettext('732', 'Canons and rounds', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (733, 'comp', 'ct', oils_i18n_gettext('733', 'Cantatas', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (734, 'comp', 'cz', oils_i18n_gettext('734', 'Canzonas', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (735, 'comp', 'cr', oils_i18n_gettext('735', 'Carols', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (736, 'comp', 'ca', oils_i18n_gettext('736', 'Chaconnes', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (737, 'comp', 'cs', oils_i18n_gettext('737', 'Chance compositions', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (738, 'comp', 'cp', oils_i18n_gettext('738', 'Chansons, Polyphonic', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (739, 'comp', 'cc', oils_i18n_gettext('739', 'Chant, Christian', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (740, 'comp', 'cb', oils_i18n_gettext('740', 'Chants, other', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (741, 'comp', 'cl', oils_i18n_gettext('741', 'Chorale preludes', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (742, 'comp', 'ch', oils_i18n_gettext('742', 'Chorales', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (743, 'comp', 'cg', oils_i18n_gettext('743', 'Concerti grossi', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (744, 'comp', 'co', oils_i18n_gettext('744', 'Concertos', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (745, 'comp', 'cy', oils_i18n_gettext('745', 'Country music', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (746, 'comp', 'df', oils_i18n_gettext('746', 'Dance forms', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (747, 'comp', 'dv', oils_i18n_gettext('747', 'Divertimentos, serenades, cassations, divertissements, and notturni', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (748, 'comp', 'ft', oils_i18n_gettext('748', 'Fantasias', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (749, 'comp', 'fl', oils_i18n_gettext('749', 'Flamenco', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (750, 'comp', 'fm', oils_i18n_gettext('750', 'Folk music', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (751, 'comp', 'fg', oils_i18n_gettext('751', 'Fugues', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (752, 'comp', 'gm', oils_i18n_gettext('752', 'Gospel music', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (753, 'comp', 'hy', oils_i18n_gettext('753', 'Hymns', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (754, 'comp', 'jz', oils_i18n_gettext('754', 'Jazz', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (755, 'comp', 'md', oils_i18n_gettext('755', 'Madrigals', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (756, 'comp', 'mr', oils_i18n_gettext('756', 'Marches', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (757, 'comp', 'ms', oils_i18n_gettext('757', 'Masses', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (758, 'comp', 'mz', oils_i18n_gettext('758', 'Mazurkas', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (759, 'comp', 'mi', oils_i18n_gettext('759', 'Minuets', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (760, 'comp', 'mo', oils_i18n_gettext('760', 'Motets', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (761, 'comp', 'mp', oils_i18n_gettext('761', 'Motion picture music', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (762, 'comp', 'mu', oils_i18n_gettext('762', 'Multiple forms', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (763, 'comp', 'mc', oils_i18n_gettext('763', 'Musical reviews and comedies', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (764, 'comp', 'nc', oils_i18n_gettext('764', 'Nocturnes', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (765, 'comp', 'nn', oils_i18n_gettext('765', 'Not applicable', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (766, 'comp', 'op', oils_i18n_gettext('766', 'Operas', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (767, 'comp', 'or', oils_i18n_gettext('767', 'Oratorios', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (768, 'comp', 'ov', oils_i18n_gettext('768', 'Overtures', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (769, 'comp', 'pt', oils_i18n_gettext('769', 'Part-songs', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (770, 'comp', 'ps', oils_i18n_gettext('770', 'Passacaglias', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (771, 'comp', 'pm', oils_i18n_gettext('771', 'Passion music', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (772, 'comp', 'pv', oils_i18n_gettext('772', 'Pavans', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (773, 'comp', 'po', oils_i18n_gettext('773', 'Polonaises', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (774, 'comp', 'pp', oils_i18n_gettext('774', 'Popular music', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (775, 'comp', 'pr', oils_i18n_gettext('775', 'Preludes', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (776, 'comp', 'pg', oils_i18n_gettext('776', 'Program music', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (777, 'comp', 'rg', oils_i18n_gettext('777', 'Ragtime music', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (778, 'comp', 'rq', oils_i18n_gettext('778', 'Requiems', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (779, 'comp', 'rp', oils_i18n_gettext('779', 'Rhapsodies', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (780, 'comp', 'ri', oils_i18n_gettext('780', 'Ricercars', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (781, 'comp', 'rc', oils_i18n_gettext('781', 'Rock music', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (782, 'comp', 'rd', oils_i18n_gettext('782', 'Rondos', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (783, 'comp', 'sn', oils_i18n_gettext('783', 'Sonatas', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (784, 'comp', 'sg', oils_i18n_gettext('784', 'Songs', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (785, 'comp', 'sd', oils_i18n_gettext('785', 'Square dance music', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (786, 'comp', 'st', oils_i18n_gettext('786', 'Studies and exercises', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (787, 'comp', 'su', oils_i18n_gettext('787', 'Suites', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (788, 'comp', 'sp', oils_i18n_gettext('788', 'Symphonic poems', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (789, 'comp', 'sy', oils_i18n_gettext('789', 'Symphonies', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (790, 'comp', 'tl', oils_i18n_gettext('790', 'Teatro lirico', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (791, 'comp', 'tc', oils_i18n_gettext('791', 'Toccatas', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (792, 'comp', 'ts', oils_i18n_gettext('792', 'Trio-sonatas', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (793, 'comp', 'uu', oils_i18n_gettext('793', 'Unknown', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (794, 'comp', 'vi', oils_i18n_gettext('794', 'Villancicos', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (795, 'comp', 'vr', oils_i18n_gettext('795', 'Variations', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (796, 'comp', 'wz', oils_i18n_gettext('796', 'Waltzes', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (797, 'comp', 'za', oils_i18n_gettext('797', 'Zarzuelas', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (798, 'comp', 'zz', oils_i18n_gettext('798', 'Other forms', 'ccvm', 'value'));

-- Type of Cartographic Material
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (799, 'crtp', 'a', oils_i18n_gettext('799', 'Single map', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (800, 'crtp', 'b', oils_i18n_gettext('800', 'Map series', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (801, 'crtp', 'c', oils_i18n_gettext('801', 'Map serial', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (802, 'crtp', 'd', oils_i18n_gettext('802', 'Globe', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (803, 'crtp', 'e', oils_i18n_gettext('803', 'Atlas', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (804, 'crtp', 'f', oils_i18n_gettext('804', 'Separate supplement to another work', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (805, 'crtp', 'g', oils_i18n_gettext('805', 'Bound as part of another work', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (806, 'crtp', 'u', oils_i18n_gettext('806', 'Unknown', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (807, 'crtp', 'z', oils_i18n_gettext('807', 'Other', 'ccvm', 'value'));

-- Nature of Entire Work
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (808, 'entw', ' ', oils_i18n_gettext('808', 'Not specified', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (809, 'entw', 'a', oils_i18n_gettext('809', 'Abstracts/summaries', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (810, 'entw', 'b', oils_i18n_gettext('810', 'Bibliographies', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (811, 'entw', 'c', oils_i18n_gettext('811', 'Catalogs', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (812, 'entw', 'd', oils_i18n_gettext('812', 'Dictionaries', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (813, 'entw', 'e', oils_i18n_gettext('813', 'Encyclopedias', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (814, 'entw', 'f', oils_i18n_gettext('814', 'Handbooks', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (815, 'entw', 'g', oils_i18n_gettext('815', 'Legal articles', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (816, 'entw', 'h', oils_i18n_gettext('816', 'Biography', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (817, 'entw', 'i', oils_i18n_gettext('817', 'Indexes', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (818, 'entw', 'k', oils_i18n_gettext('818', 'Discographies', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (819, 'entw', 'l', oils_i18n_gettext('819', 'Legislation', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (820, 'entw', 'm', oils_i18n_gettext('820', 'Theses', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (821, 'entw', 'n', oils_i18n_gettext('821', 'Surveys of the literature in a subject area', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (822, 'entw', 'o', oils_i18n_gettext('822', 'Reviews', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (823, 'entw', 'p', oils_i18n_gettext('823', 'Programmed texts', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (824, 'entw', 'q', oils_i18n_gettext('824', 'Filmographies', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (825, 'entw', 'r', oils_i18n_gettext('825', 'Directories', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (826, 'entw', 's', oils_i18n_gettext('826', 'Statistics', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (827, 'entw', 't', oils_i18n_gettext('827', 'Technical reports', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (828, 'entw', 'u', oils_i18n_gettext('828', 'Standards/specifications', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (829, 'entw', 'v', oils_i18n_gettext('829', 'Legal cases and case notes', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (830, 'entw', 'w', oils_i18n_gettext('830', 'Law reports and digests', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (831, 'entw', 'y', oils_i18n_gettext('831', 'Yearbooks', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (832, 'entw', 'z', oils_i18n_gettext('832', 'Treaties', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (833, 'entw', '5', oils_i18n_gettext('833', 'Calendars', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (834, 'entw', '6', oils_i18n_gettext('834', 'Comics/graphic novels', 'ccvm', 'value'));

-- Nature of Contents
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (835, 'cont', ' ', oils_i18n_gettext('835', 'Not specified', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (836, 'cont', 'a', oils_i18n_gettext('836', 'Abstracts/summaries', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (837, 'cont', 'b', oils_i18n_gettext('837', 'Bibliographies', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (838, 'cont', 'c', oils_i18n_gettext('838', 'Catalogs', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (839, 'cont', 'd', oils_i18n_gettext('839', 'Dictionaries', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (840, 'cont', 'e', oils_i18n_gettext('840', 'Encyclopedias', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (841, 'cont', 'f', oils_i18n_gettext('841', 'Handbooks', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (842, 'cont', 'g', oils_i18n_gettext('842', 'Legal articles', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (843, 'cont', 'h', oils_i18n_gettext('843', 'Biography', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (844, 'cont', 'i', oils_i18n_gettext('844', 'Indexes', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (845, 'cont', 'j', oils_i18n_gettext('845', 'Patent document', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (846, 'cont', 'k', oils_i18n_gettext('846', 'Discographies', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (847, 'cont', 'l', oils_i18n_gettext('847', 'Legislation', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (848, 'cont', 'm', oils_i18n_gettext('848', 'Theses', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (849, 'cont', 'n', oils_i18n_gettext('849', 'Surveys of the literature in a subject area', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (850, 'cont', 'o', oils_i18n_gettext('850', 'Reviews', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (851, 'cont', 'p', oils_i18n_gettext('851', 'Programmed texts', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (852, 'cont', 'q', oils_i18n_gettext('852', 'Filmographies', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (853, 'cont', 'r', oils_i18n_gettext('853', 'Directories', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (854, 'cont', 's', oils_i18n_gettext('854', 'Statistics', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (855, 'cont', 't', oils_i18n_gettext('855', 'Technical reports', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (856, 'cont', 'u', oils_i18n_gettext('856', 'Standards/specifications', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (857, 'cont', 'v', oils_i18n_gettext('857', 'Legal cases and case notes', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (858, 'cont', 'w', oils_i18n_gettext('858', 'Law reports and digests', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (859, 'cont', 'x', oils_i18n_gettext('859', 'Other reports', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (860, 'cont', 'y', oils_i18n_gettext('860', 'Yearbooks', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (861, 'cont', 'z', oils_i18n_gettext('861', 'Treaties', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (862, 'cont', '2', oils_i18n_gettext('862', 'Offprints', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (863, 'cont', '5', oils_i18n_gettext('863', 'Calendars', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (864, 'cont', '6', oils_i18n_gettext('864', 'Comics/graphic novels', 'ccvm', 'value'));

-- Format of Music
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (865, 'fmus', ' ', oils_i18n_gettext('865', 'Information not supplied', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (866, 'fmus', 'a', oils_i18n_gettext('866', 'Full score', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (867, 'fmus', 'b', oils_i18n_gettext('867', 'Full score, miniature or study size', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (868, 'fmus', 'c', oils_i18n_gettext('868', 'Accompaniment reduced for keyboard', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (869, 'fmus', 'd', oils_i18n_gettext('869', 'Voice score with accompaniment omitted', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (870, 'fmus', 'e', oils_i18n_gettext('870', 'Condensed score or piano-conductor score', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (871, 'fmus', 'g', oils_i18n_gettext('871', 'Close score', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (872, 'fmus', 'h', oils_i18n_gettext('872', 'Chorus score', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (873, 'fmus', 'i', oils_i18n_gettext('873', 'Condensed score', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (874, 'fmus', 'j', oils_i18n_gettext('874', 'Performer-conductor part', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (875, 'fmus', 'k', oils_i18n_gettext('875', 'Vocal score', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (876, 'fmus', 'l', oils_i18n_gettext('876', 'Score', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (877, 'fmus', 'm', oils_i18n_gettext('877', 'Multiple score formats', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (878, 'fmus', 'n', oils_i18n_gettext('878', 'Not applicable', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (879, 'fmus', 'u', oils_i18n_gettext('879', 'Unknown', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (880, 'fmus', 'z', oils_i18n_gettext('880', 'Other', 'ccvm', 'value'));

-- Literary Text for Sound Recordings
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (881, 'ltxt', ' ', oils_i18n_gettext('881', 'Item is a music sound recording', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (882, 'ltxt', 'a', oils_i18n_gettext('882', 'Autobiography', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (883, 'ltxt', 'b', oils_i18n_gettext('883', 'Biography', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (884, 'ltxt', 'c', oils_i18n_gettext('884', 'Conference proceedings', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (885, 'ltxt', 'd', oils_i18n_gettext('885', 'Drama', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (886, 'ltxt', 'e', oils_i18n_gettext('886', 'Essays', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (887, 'ltxt', 'f', oils_i18n_gettext('887', 'Fiction', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (888, 'ltxt', 'g', oils_i18n_gettext('888', 'Reporting', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (889, 'ltxt', 'h', oils_i18n_gettext('889', 'History', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (890, 'ltxt', 'i', oils_i18n_gettext('890', 'Instruction', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (891, 'ltxt', 'j', oils_i18n_gettext('891', 'Language instruction', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (892, 'ltxt', 'k', oils_i18n_gettext('892', 'Comedy', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (893, 'ltxt', 'l', oils_i18n_gettext('893', 'Lectures, speeches', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (894, 'ltxt', 'm', oils_i18n_gettext('894', 'Memoirs', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (895, 'ltxt', 'n', oils_i18n_gettext('895', 'Not applicable', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (896, 'ltxt', 'o', oils_i18n_gettext('896', 'Folktales', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (897, 'ltxt', 'p', oils_i18n_gettext('897', 'Poetry', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (898, 'ltxt', 'r', oils_i18n_gettext('898', 'Rehearsals', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (899, 'ltxt', 's', oils_i18n_gettext('899', 'Sounds', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (900, 'ltxt', 't', oils_i18n_gettext('900', 'Interviews', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (901, 'ltxt', 'z', oils_i18n_gettext('901', 'Other', 'ccvm', 'value'));

-- Form of Original Item
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (902, 'orig', ' ', oils_i18n_gettext('902', 'None of the following', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (903, 'orig', 'a', oils_i18n_gettext('903', 'Microfilm', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (904, 'orig', 'b', oils_i18n_gettext('904', 'Microfiche', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (905, 'orig', 'c', oils_i18n_gettext('905', 'Microopaque', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (906, 'orig', 'd', oils_i18n_gettext('906', 'Large print', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (907, 'orig', 'e', oils_i18n_gettext('907', 'Newspaper format', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (908, 'orig', 'f', oils_i18n_gettext('908', 'Braille', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (909, 'orig', 'o', oils_i18n_gettext('909', 'Online', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (910, 'orig', 'q', oils_i18n_gettext('910', 'Direct electronic', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (911, 'orig', 's', oils_i18n_gettext('911', 'Electronic', 'ccvm', 'value'));

-- Music Parts
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (912, 'part', ' ', oils_i18n_gettext('912', 'No parts in hand or not specified', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (913, 'part', 'd', oils_i18n_gettext('913', 'Instrumental and vocal parts', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (914, 'part', 'e', oils_i18n_gettext('914', 'Instrumental parts', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (915, 'part', 'f', oils_i18n_gettext('915', 'Vocal parts', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (916, 'part', 'n', oils_i18n_gettext('916', 'Not Applicable', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (917, 'part', 'u', oils_i18n_gettext('917', 'Unknown', 'ccvm', 'value'));

-- Projection
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (918, 'proj', '  ', oils_i18n_gettext('918', 'Project not specified', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (919, 'proj', 'aa', oils_i18n_gettext('919', 'Aitoff', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (920, 'proj', 'ab', oils_i18n_gettext('920', 'Gnomic', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (921, 'proj', 'ac', oils_i18n_gettext('921', 'Lambert''s azimuthal equal area', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (922, 'proj', 'ad', oils_i18n_gettext('922', 'Orthographic', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (923, 'proj', 'ae', oils_i18n_gettext('923', 'Azimuthal equidistant', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (924, 'proj', 'af', oils_i18n_gettext('924', 'Stereographic', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (925, 'proj', 'ag', oils_i18n_gettext('925', 'General vertical near-sided', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (926, 'proj', 'am', oils_i18n_gettext('926', 'Modified stereographic for Alaska', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (927, 'proj', 'an', oils_i18n_gettext('927', 'Chamberlin trimetric', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (928, 'proj', 'ap', oils_i18n_gettext('928', 'Polar stereographic', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (929, 'proj', 'au', oils_i18n_gettext('929', 'Azimuthal, specific type unknown', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (930, 'proj', 'az', oils_i18n_gettext('930', 'Azimuthal, other', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (931, 'proj', 'ba', oils_i18n_gettext('931', 'Gall', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (932, 'proj', 'bb', oils_i18n_gettext('932', 'Goode''s homolographic', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (933, 'proj', 'bc', oils_i18n_gettext('933', 'Lambert''s cylindrical equal area', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (934, 'proj', 'bd', oils_i18n_gettext('934', 'Mercator', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (935, 'proj', 'be', oils_i18n_gettext('935', 'Miller', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (936, 'proj', 'bf', oils_i18n_gettext('936', 'Mollweide', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (937, 'proj', 'bg', oils_i18n_gettext('937', 'Sinusoidal', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (938, 'proj', 'bh', oils_i18n_gettext('938', 'Transverse Mercator', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (939, 'proj', 'bi', oils_i18n_gettext('939', 'Gauss-Kruger', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (940, 'proj', 'bj', oils_i18n_gettext('940', 'Equirectangular', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (941, 'proj', 'bk', oils_i18n_gettext('941', 'Krovak', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (942, 'proj', 'bl', oils_i18n_gettext('942', 'Cassini-Soldner', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (943, 'proj', 'bo', oils_i18n_gettext('943', 'Oblique Mercator', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (944, 'proj', 'br', oils_i18n_gettext('944', 'Robinson', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (945, 'proj', 'bs', oils_i18n_gettext('945', 'Space oblique Mercator', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (946, 'proj', 'bu', oils_i18n_gettext('946', 'Cylindrical, specific type unknown', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (947, 'proj', 'bz', oils_i18n_gettext('947', 'Cylindrical, other', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (948, 'proj', 'ca', oils_i18n_gettext('948', 'Alber''s equal area', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (949, 'proj', 'cb', oils_i18n_gettext('949', 'Bonne', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (950, 'proj', 'cc', oils_i18n_gettext('950', 'Lambert''s conformal conic', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (951, 'proj', 'ce', oils_i18n_gettext('951', 'Equidistant conic', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (952, 'proj', 'cp', oils_i18n_gettext('952', 'Polyconic', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (953, 'proj', 'cu', oils_i18n_gettext('953', 'Conic, specific type unknown', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (954, 'proj', 'cz', oils_i18n_gettext('954', 'Conic, other', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (955, 'proj', 'da', oils_i18n_gettext('955', 'Armadillo', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (956, 'proj', 'db', oils_i18n_gettext('956', 'Butterfly', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (957, 'proj', 'dc', oils_i18n_gettext('957', 'Eckert', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (958, 'proj', 'dd', oils_i18n_gettext('958', 'Goode''s homolosine', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (959, 'proj', 'de', oils_i18n_gettext('959', 'Miller''s bipolar oblique conformal conic', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (960, 'proj', 'df', oils_i18n_gettext('960', 'Van Der Grinten', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (961, 'proj', 'dg', oils_i18n_gettext('961', 'Dymaxion', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (962, 'proj', 'dh', oils_i18n_gettext('962', 'Cordiform', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (963, 'proj', 'dl', oils_i18n_gettext('963', 'Lambert conformal', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (964, 'proj', 'zz', oils_i18n_gettext('964', 'Other', 'ccvm', 'value'));

-- Relief
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (965, 'relf', ' ', oils_i18n_gettext('965', 'No relief shown', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (966, 'relf', 'a', oils_i18n_gettext('966', 'Contours', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (967, 'relf', 'b', oils_i18n_gettext('967', 'Shading', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (968, 'relf', 'c', oils_i18n_gettext('968', 'Gradient and bathymetric tints', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (969, 'relf', 'd', oils_i18n_gettext('969', 'Hachures', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (970, 'relf', 'e', oils_i18n_gettext('970', 'Bathymetry, soundings', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (971, 'relf', 'f', oils_i18n_gettext('971', 'Form lines', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (972, 'relf', 'g', oils_i18n_gettext('972', 'Spot heights', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (973, 'relf', 'i', oils_i18n_gettext('973', 'Pictorially', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (974, 'relf', 'j', oils_i18n_gettext('974', 'Land forms', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (975, 'relf', 'k', oils_i18n_gettext('975', 'Bathymetry, isolines', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (976, 'relf', 'm', oils_i18n_gettext('976', 'Rock drawings', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (977, 'relf', 'z', oils_i18n_gettext('977', 'Other', 'ccvm', 'value'));

-- Special Format Characteristics
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (978, 'spfm', ' ', oils_i18n_gettext('978', 'No specified special format characteristics', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (979, 'spfm', 'e', oils_i18n_gettext('979', 'Manuscript', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (980, 'spfm', 'j', oils_i18n_gettext('980', 'Picture card, post card', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (981, 'spfm', 'k', oils_i18n_gettext('981', 'Calendar', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (982, 'spfm', 'l', oils_i18n_gettext('982', 'Puzzle', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (983, 'spfm', 'n', oils_i18n_gettext('983', 'Game', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (984, 'spfm', 'o', oils_i18n_gettext('984', 'Wall map', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (985, 'spfm', 'p', oils_i18n_gettext('985', 'Playing cards', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (986, 'spfm', 'r', oils_i18n_gettext('986', 'Loose-leaf', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (987, 'spfm', 'z', oils_i18n_gettext('987', 'Other', 'ccvm', 'value'));

-- Type of Continuing Resource
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (988, 'srtp', ' ', oils_i18n_gettext('988', 'None of the following', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (989, 'srtp', 'd', oils_i18n_gettext('989', 'Updating database', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (990, 'srtp', 'l', oils_i18n_gettext('990', 'Updating loose-leaf', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (991, 'srtp', 'm', oils_i18n_gettext('991', 'Monographic series', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (992, 'srtp', 'n', oils_i18n_gettext('992', 'Newspaper', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (993, 'srtp', 'p', oils_i18n_gettext('993', 'Periodical', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (994, 'srtp', 'w', oils_i18n_gettext('994', 'Updating Web site', 'ccvm', 'value'));

-- Technique
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (995, 'tech', 'a', oils_i18n_gettext('995', 'Animation', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (996, 'tech', 'c', oils_i18n_gettext('996', 'Animation and live action', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (997, 'tech', 'l', oils_i18n_gettext('997', 'Live action', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (998, 'tech', 'n', oils_i18n_gettext('998', 'Not applicable', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (999, 'tech', 'u', oils_i18n_gettext('999', 'Unknown', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1000, 'tech', 'z', oils_i18n_gettext('1000', 'Other', 'ccvm', 'value'));

-- Transposition and Arrangement
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1001, 'trar', ' ', oils_i18n_gettext('1001', 'Not arrangement or transposition or not specified', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1002, 'trar', 'a', oils_i18n_gettext('1002', 'Transposition', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1003, 'trar', 'b', oils_i18n_gettext('1003', 'Arrangement', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1004, 'trar', 'c', oils_i18n_gettext('1004', 'Both transposed and arranged', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1005, 'trar', 'n', oils_i18n_gettext('1005', 'Not applicable', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1006, 'trar', 'u', oils_i18n_gettext('1006', 'Unknown', 'ccvm', 'value'));

-- Country of Publication, etc.
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1007, 'ctry', 'aa ', oils_i18n_gettext('1007', 'Albania ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1008, 'ctry', 'abc', oils_i18n_gettext('1008', 'Alberta ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1009, 'ctry', 'aca', oils_i18n_gettext('1009', 'Australian Capital Territory ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1010, 'ctry', 'ae ', oils_i18n_gettext('1010', 'Algeria ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1011, 'ctry', 'af ', oils_i18n_gettext('1011', 'Afghanistan ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1012, 'ctry', 'ag ', oils_i18n_gettext('1012', 'Argentina ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1013, 'ctry', 'ai ', oils_i18n_gettext('1013', 'Armenia (Republic) ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1014, 'ctry', 'aj ', oils_i18n_gettext('1014', 'Azerbaijan ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1015, 'ctry', 'aku', oils_i18n_gettext('1015', 'Alaska ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1016, 'ctry', 'alu', oils_i18n_gettext('1016', 'Alabama ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1017, 'ctry', 'am ', oils_i18n_gettext('1017', 'Anguilla ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1018, 'ctry', 'an ', oils_i18n_gettext('1018', 'Andorra ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1019, 'ctry', 'ao ', oils_i18n_gettext('1019', 'Angola ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1020, 'ctry', 'aq ', oils_i18n_gettext('1020', 'Antigua and Barbuda ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1021, 'ctry', 'aru', oils_i18n_gettext('1021', 'Arkansas ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1022, 'ctry', 'as ', oils_i18n_gettext('1022', 'American Samoa ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1023, 'ctry', 'at ', oils_i18n_gettext('1023', 'Australia ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1024, 'ctry', 'au ', oils_i18n_gettext('1024', 'Austria ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1025, 'ctry', 'aw ', oils_i18n_gettext('1025', 'Aruba ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1026, 'ctry', 'ay ', oils_i18n_gettext('1026', 'Antarctica ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1027, 'ctry', 'azu', oils_i18n_gettext('1027', 'Arizona ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1028, 'ctry', 'ba ', oils_i18n_gettext('1028', 'Bahrain ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1029, 'ctry', 'bb ', oils_i18n_gettext('1029', 'Barbados ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1030, 'ctry', 'bcc', oils_i18n_gettext('1030', 'British Columbia ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1031, 'ctry', 'bd ', oils_i18n_gettext('1031', 'Burundi ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1032, 'ctry', 'be ', oils_i18n_gettext('1032', 'Belgium ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1033, 'ctry', 'bf ', oils_i18n_gettext('1033', 'Bahamas ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1034, 'ctry', 'bg ', oils_i18n_gettext('1034', 'Bangladesh ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1035, 'ctry', 'bh ', oils_i18n_gettext('1035', 'Belize ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1036, 'ctry', 'bi ', oils_i18n_gettext('1036', 'British Indian Ocean Territory ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1037, 'ctry', 'bl ', oils_i18n_gettext('1037', 'Brazil ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1038, 'ctry', 'bm ', oils_i18n_gettext('1038', 'Bermuda Islands ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1039, 'ctry', 'bn ', oils_i18n_gettext('1039', 'Bosnia and Herzegovina ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1040, 'ctry', 'bo ', oils_i18n_gettext('1040', 'Bolivia ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1041, 'ctry', 'bp ', oils_i18n_gettext('1041', 'Solomon Islands ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1042, 'ctry', 'br ', oils_i18n_gettext('1042', 'Burma ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1043, 'ctry', 'bs ', oils_i18n_gettext('1043', 'Botswana ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1044, 'ctry', 'bt ', oils_i18n_gettext('1044', 'Bhutan ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1045, 'ctry', 'bu ', oils_i18n_gettext('1045', 'Bulgaria ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1046, 'ctry', 'bv ', oils_i18n_gettext('1046', 'Bouvet Island ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1047, 'ctry', 'bw ', oils_i18n_gettext('1047', 'Belarus ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1048, 'ctry', 'bx ', oils_i18n_gettext('1048', 'Brunei ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1049, 'ctry', 'ca ', oils_i18n_gettext('1049', 'Caribbean Netherlands ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1050, 'ctry', 'cau', oils_i18n_gettext('1050', 'California ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1051, 'ctry', 'cb ', oils_i18n_gettext('1051', 'Cambodia ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1052, 'ctry', 'cc ', oils_i18n_gettext('1052', 'China ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1053, 'ctry', 'cd ', oils_i18n_gettext('1053', 'Chad ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1054, 'ctry', 'ce ', oils_i18n_gettext('1054', 'Sri Lanka ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1055, 'ctry', 'cf ', oils_i18n_gettext('1055', 'Congo (Brazzaville) ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1056, 'ctry', 'cg ', oils_i18n_gettext('1056', 'Congo (Democratic Republic) ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1057, 'ctry', 'ch ', oils_i18n_gettext('1057', 'China (Republic : 1949', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1058, 'ctry', 'ci ', oils_i18n_gettext('1058', 'Croatia ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1059, 'ctry', 'cj ', oils_i18n_gettext('1059', 'Cayman Islands ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1060, 'ctry', 'ck ', oils_i18n_gettext('1060', 'Colombia ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1061, 'ctry', 'cl ', oils_i18n_gettext('1061', 'Chile ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1062, 'ctry', 'cm ', oils_i18n_gettext('1062', 'Cameroon ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1063, 'ctry', 'co ', oils_i18n_gettext('1063', 'Curaçao ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1064, 'ctry', 'cou', oils_i18n_gettext('1064', 'Colorado ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1065, 'ctry', 'cq ', oils_i18n_gettext('1065', 'Comoros ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1066, 'ctry', 'cr ', oils_i18n_gettext('1066', 'Costa Rica ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1067, 'ctry', 'ctu', oils_i18n_gettext('1067', 'Connecticut ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1068, 'ctry', 'cu ', oils_i18n_gettext('1068', 'Cuba ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1069, 'ctry', 'cv ', oils_i18n_gettext('1069', 'Cabo Verde ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1070, 'ctry', 'cw ', oils_i18n_gettext('1070', 'Cook Islands ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1071, 'ctry', 'cx ', oils_i18n_gettext('1071', 'Central African Republic ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1072, 'ctry', 'cy ', oils_i18n_gettext('1072', 'Cyprus ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1073, 'ctry', 'dcu', oils_i18n_gettext('1073', 'District of Columbia ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1074, 'ctry', 'deu', oils_i18n_gettext('1074', 'Delaware ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1075, 'ctry', 'dk ', oils_i18n_gettext('1075', 'Denmark ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1076, 'ctry', 'dm ', oils_i18n_gettext('1076', 'Benin ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1077, 'ctry', 'dq ', oils_i18n_gettext('1077', 'Dominica ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1078, 'ctry', 'dr ', oils_i18n_gettext('1078', 'Dominican Republic ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1079, 'ctry', 'ea ', oils_i18n_gettext('1079', 'Eritrea ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1080, 'ctry', 'ec ', oils_i18n_gettext('1080', 'Ecuador ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1081, 'ctry', 'eg ', oils_i18n_gettext('1081', 'Equatorial Guinea ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1082, 'ctry', 'em ', oils_i18n_gettext('1082', 'Timor', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1083, 'ctry', 'enk', oils_i18n_gettext('1083', 'England ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1084, 'ctry', 'er ', oils_i18n_gettext('1084', 'Estonia ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1085, 'ctry', 'es ', oils_i18n_gettext('1085', 'El Salvador ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1086, 'ctry', 'et ', oils_i18n_gettext('1086', 'Ethiopia ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1087, 'ctry', 'fa ', oils_i18n_gettext('1087', 'Faroe Islands ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1088, 'ctry', 'fg ', oils_i18n_gettext('1088', 'French Guiana ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1089, 'ctry', 'fi ', oils_i18n_gettext('1089', 'Finland ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1090, 'ctry', 'fj ', oils_i18n_gettext('1090', 'Fiji ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1091, 'ctry', 'fk ', oils_i18n_gettext('1091', 'Falkland Islands ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1092, 'ctry', 'flu', oils_i18n_gettext('1092', 'Florida ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1093, 'ctry', 'fm ', oils_i18n_gettext('1093', 'Micronesia (Federated States) ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1094, 'ctry', 'fp ', oils_i18n_gettext('1094', 'French Polynesia ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1095, 'ctry', 'fr ', oils_i18n_gettext('1095', 'France ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1096, 'ctry', 'fs ', oils_i18n_gettext('1096', 'Terres australes et antarctiques françaises ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1097, 'ctry', 'ft ', oils_i18n_gettext('1097', 'Djibouti ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1098, 'ctry', 'gau', oils_i18n_gettext('1098', 'Georgia ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1099, 'ctry', 'gb ', oils_i18n_gettext('1099', 'Kiribati ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1100, 'ctry', 'gd ', oils_i18n_gettext('1100', 'Grenada ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1101, 'ctry', 'gh ', oils_i18n_gettext('1101', 'Ghana ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1102, 'ctry', 'gi ', oils_i18n_gettext('1102', 'Gibraltar ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1103, 'ctry', 'gl ', oils_i18n_gettext('1103', 'Greenland ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1104, 'ctry', 'gm ', oils_i18n_gettext('1104', 'Gambia ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1105, 'ctry', 'go ', oils_i18n_gettext('1105', 'Gabon ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1106, 'ctry', 'gp ', oils_i18n_gettext('1106', 'Guadeloupe ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1107, 'ctry', 'gr ', oils_i18n_gettext('1107', 'Greece ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1108, 'ctry', 'gs ', oils_i18n_gettext('1108', 'Georgia (Republic) ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1109, 'ctry', 'gt ', oils_i18n_gettext('1109', 'Guatemala ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1110, 'ctry', 'gu ', oils_i18n_gettext('1110', 'Guam ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1111, 'ctry', 'gv ', oils_i18n_gettext('1111', 'Guinea ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1112, 'ctry', 'gw ', oils_i18n_gettext('1112', 'Germany ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1113, 'ctry', 'gy ', oils_i18n_gettext('1113', 'Guyana ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1114, 'ctry', 'gz ', oils_i18n_gettext('1114', 'Gaza Strip ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1115, 'ctry', 'hiu', oils_i18n_gettext('1115', 'Hawaii ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1116, 'ctry', 'hm ', oils_i18n_gettext('1116', 'Heard and McDonald Islands ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1117, 'ctry', 'ho ', oils_i18n_gettext('1117', 'Honduras ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1118, 'ctry', 'ht ', oils_i18n_gettext('1118', 'Haiti ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1119, 'ctry', 'hu ', oils_i18n_gettext('1119', 'Hungary ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1120, 'ctry', 'iau', oils_i18n_gettext('1120', 'Iowa ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1121, 'ctry', 'ic ', oils_i18n_gettext('1121', 'Iceland ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1122, 'ctry', 'idu', oils_i18n_gettext('1122', 'Idaho ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1123, 'ctry', 'ie ', oils_i18n_gettext('1123', 'Ireland ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1124, 'ctry', 'ii ', oils_i18n_gettext('1124', 'India ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1125, 'ctry', 'ilu', oils_i18n_gettext('1125', 'Illinois ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1126, 'ctry', 'inu', oils_i18n_gettext('1126', 'Indiana ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1127, 'ctry', 'io ', oils_i18n_gettext('1127', 'Indonesia ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1128, 'ctry', 'iq ', oils_i18n_gettext('1128', 'Iraq ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1129, 'ctry', 'ir ', oils_i18n_gettext('1129', 'Iran ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1130, 'ctry', 'is ', oils_i18n_gettext('1130', 'Israel ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1131, 'ctry', 'it ', oils_i18n_gettext('1131', 'Italy ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1132, 'ctry', 'iv ', oils_i18n_gettext('1132', 'Côte d''Ivoire ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1133, 'ctry', 'iy ', oils_i18n_gettext('1133', 'Iraq', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1134, 'ctry', 'ja ', oils_i18n_gettext('1134', 'Japan ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1135, 'ctry', 'ji ', oils_i18n_gettext('1135', 'Johnston Atoll ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1136, 'ctry', 'jm ', oils_i18n_gettext('1136', 'Jamaica ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1137, 'ctry', 'jo ', oils_i18n_gettext('1137', 'Jordan ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1138, 'ctry', 'ke ', oils_i18n_gettext('1138', 'Kenya ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1139, 'ctry', 'kg ', oils_i18n_gettext('1139', 'Kyrgyzstan ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1140, 'ctry', 'kn ', oils_i18n_gettext('1140', 'Korea (North) ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1141, 'ctry', 'ko ', oils_i18n_gettext('1141', 'Korea (South) ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1142, 'ctry', 'ksu', oils_i18n_gettext('1142', 'Kansas ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1143, 'ctry', 'ku ', oils_i18n_gettext('1143', 'Kuwait ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1144, 'ctry', 'kv ', oils_i18n_gettext('1144', 'Kosovo ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1145, 'ctry', 'kyu', oils_i18n_gettext('1145', 'Kentucky ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1146, 'ctry', 'kz ', oils_i18n_gettext('1146', 'Kazakhstan ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1147, 'ctry', 'lau', oils_i18n_gettext('1147', 'Louisiana ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1148, 'ctry', 'lb ', oils_i18n_gettext('1148', 'Liberia ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1149, 'ctry', 'le ', oils_i18n_gettext('1149', 'Lebanon ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1150, 'ctry', 'lh ', oils_i18n_gettext('1150', 'Liechtenstein ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1151, 'ctry', 'li ', oils_i18n_gettext('1151', 'Lithuania ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1152, 'ctry', 'lo ', oils_i18n_gettext('1152', 'Lesotho ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1153, 'ctry', 'ls ', oils_i18n_gettext('1153', 'Laos ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1154, 'ctry', 'lu ', oils_i18n_gettext('1154', 'Luxembourg ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1155, 'ctry', 'lv ', oils_i18n_gettext('1155', 'Latvia ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1156, 'ctry', 'ly ', oils_i18n_gettext('1156', 'Libya ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1157, 'ctry', 'mau', oils_i18n_gettext('1157', 'Massachusetts ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1158, 'ctry', 'mbc', oils_i18n_gettext('1158', 'Manitoba ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1159, 'ctry', 'mc ', oils_i18n_gettext('1159', 'Monaco ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1160, 'ctry', 'mdu', oils_i18n_gettext('1160', 'Maryland ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1161, 'ctry', 'meu', oils_i18n_gettext('1161', 'Maine ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1162, 'ctry', 'mf ', oils_i18n_gettext('1162', 'Mauritius ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1163, 'ctry', 'mg ', oils_i18n_gettext('1163', 'Madagascar ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1164, 'ctry', 'miu', oils_i18n_gettext('1164', 'Michigan ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1165, 'ctry', 'mj ', oils_i18n_gettext('1165', 'Montserrat ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1166, 'ctry', 'mk ', oils_i18n_gettext('1166', 'Oman ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1167, 'ctry', 'ml ', oils_i18n_gettext('1167', 'Mali ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1168, 'ctry', 'mm ', oils_i18n_gettext('1168', 'Malta ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1169, 'ctry', 'mnu', oils_i18n_gettext('1169', 'Minnesota ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1170, 'ctry', 'mo ', oils_i18n_gettext('1170', 'Montenegro ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1171, 'ctry', 'mou', oils_i18n_gettext('1171', 'Missouri ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1172, 'ctry', 'mp ', oils_i18n_gettext('1172', 'Mongolia ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1173, 'ctry', 'mq ', oils_i18n_gettext('1173', 'Martinique ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1174, 'ctry', 'mr ', oils_i18n_gettext('1174', 'Morocco ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1175, 'ctry', 'msu', oils_i18n_gettext('1175', 'Mississippi ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1176, 'ctry', 'mtu', oils_i18n_gettext('1176', 'Montana ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1177, 'ctry', 'mu ', oils_i18n_gettext('1177', 'Mauritania ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1178, 'ctry', 'mv ', oils_i18n_gettext('1178', 'Moldova ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1179, 'ctry', 'mw ', oils_i18n_gettext('1179', 'Malawi ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1180, 'ctry', 'mx ', oils_i18n_gettext('1180', 'Mexico ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1181, 'ctry', 'my ', oils_i18n_gettext('1181', 'Malaysia ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1182, 'ctry', 'mz ', oils_i18n_gettext('1182', 'Mozambique ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1183, 'ctry', 'nbu', oils_i18n_gettext('1183', 'Nebraska ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1184, 'ctry', 'ncu', oils_i18n_gettext('1184', 'North Carolina ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1185, 'ctry', 'ndu', oils_i18n_gettext('1185', 'North Dakota ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1186, 'ctry', 'ne ', oils_i18n_gettext('1186', 'Netherlands ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1187, 'ctry', 'nfc', oils_i18n_gettext('1187', 'Newfoundland and Labrador ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1188, 'ctry', 'ng ', oils_i18n_gettext('1188', 'Niger ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1189, 'ctry', 'nhu', oils_i18n_gettext('1189', 'New Hampshire ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1190, 'ctry', 'nik', oils_i18n_gettext('1190', 'Northern Ireland ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1191, 'ctry', 'nju', oils_i18n_gettext('1191', 'New Jersey ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1192, 'ctry', 'nkc', oils_i18n_gettext('1192', 'New Brunswick ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1193, 'ctry', 'nl ', oils_i18n_gettext('1193', 'New Caledonia ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1194, 'ctry', 'nmu', oils_i18n_gettext('1194', 'New Mexico ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1195, 'ctry', 'nn ', oils_i18n_gettext('1195', 'Vanuatu ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1196, 'ctry', 'no ', oils_i18n_gettext('1196', 'Norway ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1197, 'ctry', 'np ', oils_i18n_gettext('1197', 'Nepal ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1198, 'ctry', 'nq ', oils_i18n_gettext('1198', 'Nicaragua ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1199, 'ctry', 'nr ', oils_i18n_gettext('1199', 'Nigeria ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1200, 'ctry', 'nsc', oils_i18n_gettext('1200', 'Nova Scotia ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1201, 'ctry', 'ntc', oils_i18n_gettext('1201', 'Northwest Territories ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1202, 'ctry', 'nu ', oils_i18n_gettext('1202', 'Nauru ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1203, 'ctry', 'nuc', oils_i18n_gettext('1203', 'Nunavut ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1204, 'ctry', 'nvu', oils_i18n_gettext('1204', 'Nevada ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1205, 'ctry', 'nw ', oils_i18n_gettext('1205', 'Northern Mariana Islands ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1206, 'ctry', 'nx ', oils_i18n_gettext('1206', 'Norfolk Island ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1207, 'ctry', 'nyu', oils_i18n_gettext('1207', 'New York (State) ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1208, 'ctry', 'nz ', oils_i18n_gettext('1208', 'New Zealand ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1209, 'ctry', 'ohu', oils_i18n_gettext('1209', 'Ohio ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1210, 'ctry', 'oku', oils_i18n_gettext('1210', 'Oklahoma ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1211, 'ctry', 'onc', oils_i18n_gettext('1211', 'Ontario ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1212, 'ctry', 'oru', oils_i18n_gettext('1212', 'Oregon ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1213, 'ctry', 'ot ', oils_i18n_gettext('1213', 'Mayotte ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1214, 'ctry', 'pau', oils_i18n_gettext('1214', 'Pennsylvania ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1215, 'ctry', 'pc ', oils_i18n_gettext('1215', 'Pitcairn Island ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1216, 'ctry', 'pe ', oils_i18n_gettext('1216', 'Peru ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1217, 'ctry', 'pf ', oils_i18n_gettext('1217', 'Paracel Islands ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1218, 'ctry', 'pg ', oils_i18n_gettext('1218', 'Guinea', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1219, 'ctry', 'ph ', oils_i18n_gettext('1219', 'Philippines ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1220, 'ctry', 'pic', oils_i18n_gettext('1220', 'Prince Edward Island ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1221, 'ctry', 'pk ', oils_i18n_gettext('1221', 'Pakistan ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1222, 'ctry', 'pl ', oils_i18n_gettext('1222', 'Poland ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1223, 'ctry', 'pn ', oils_i18n_gettext('1223', 'Panama ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1224, 'ctry', 'po ', oils_i18n_gettext('1224', 'Portugal ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1225, 'ctry', 'pp ', oils_i18n_gettext('1225', 'Papua New Guinea ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1226, 'ctry', 'pr ', oils_i18n_gettext('1226', 'Puerto Rico ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1227, 'ctry', 'pw ', oils_i18n_gettext('1227', 'Palau ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1228, 'ctry', 'py ', oils_i18n_gettext('1228', 'Paraguay ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1229, 'ctry', 'qa ', oils_i18n_gettext('1229', 'Qatar ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1230, 'ctry', 'qea', oils_i18n_gettext('1230', 'Queensland ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1231, 'ctry', 'quc', oils_i18n_gettext('1231', 'Québec (Province) ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1232, 'ctry', 'rb ', oils_i18n_gettext('1232', 'Serbia ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1233, 'ctry', 're ', oils_i18n_gettext('1233', 'Réunion ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1234, 'ctry', 'rh ', oils_i18n_gettext('1234', 'Zimbabwe ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1235, 'ctry', 'riu', oils_i18n_gettext('1235', 'Rhode Island ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1236, 'ctry', 'rm ', oils_i18n_gettext('1236', 'Romania ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1237, 'ctry', 'ru ', oils_i18n_gettext('1237', 'Russia (Federation) ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1238, 'ctry', 'rw ', oils_i18n_gettext('1238', 'Rwanda ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1239, 'ctry', 'sa ', oils_i18n_gettext('1239', 'South Africa ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1240, 'ctry', 'sc ', oils_i18n_gettext('1240', 'Saint', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1241, 'ctry', 'scu', oils_i18n_gettext('1241', 'South Carolina ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1242, 'ctry', 'sd ', oils_i18n_gettext('1242', 'South Sudan ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1243, 'ctry', 'sdu', oils_i18n_gettext('1243', 'South Dakota ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1244, 'ctry', 'se ', oils_i18n_gettext('1244', 'Seychelles ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1245, 'ctry', 'sf ', oils_i18n_gettext('1245', 'Sao Tome and Principe ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1246, 'ctry', 'sg ', oils_i18n_gettext('1246', 'Senegal ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1247, 'ctry', 'sh ', oils_i18n_gettext('1247', 'Spanish North Africa ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1248, 'ctry', 'si ', oils_i18n_gettext('1248', 'Singapore ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1249, 'ctry', 'sj ', oils_i18n_gettext('1249', 'Sudan ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1250, 'ctry', 'sl ', oils_i18n_gettext('1250', 'Sierra Leone ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1251, 'ctry', 'sm ', oils_i18n_gettext('1251', 'San Marino ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1252, 'ctry', 'sn ', oils_i18n_gettext('1252', 'Sint Maarten ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1253, 'ctry', 'snc', oils_i18n_gettext('1253', 'Saskatchewan ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1254, 'ctry', 'so ', oils_i18n_gettext('1254', 'Somalia ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1255, 'ctry', 'sp ', oils_i18n_gettext('1255', 'Spain ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1256, 'ctry', 'sq ', oils_i18n_gettext('1256', 'Swaziland ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1257, 'ctry', 'sr ', oils_i18n_gettext('1257', 'Surinam ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1258, 'ctry', 'ss ', oils_i18n_gettext('1258', 'Western Sahara ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1259, 'ctry', 'st ', oils_i18n_gettext('1259', 'Saint', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1260, 'ctry', 'stk', oils_i18n_gettext('1260', 'Scotland ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1261, 'ctry', 'su ', oils_i18n_gettext('1261', 'Saudi Arabia ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1262, 'ctry', 'sw ', oils_i18n_gettext('1262', 'Sweden ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1263, 'ctry', 'sx ', oils_i18n_gettext('1263', 'Namibia ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1264, 'ctry', 'sy ', oils_i18n_gettext('1264', 'Syria ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1265, 'ctry', 'sz ', oils_i18n_gettext('1265', 'Switzerland ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1266, 'ctry', 'ta ', oils_i18n_gettext('1266', 'Tajikistan ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1267, 'ctry', 'tc ', oils_i18n_gettext('1267', 'Turks and Caicos Islands ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1268, 'ctry', 'tg ', oils_i18n_gettext('1268', 'Togo ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1269, 'ctry', 'th ', oils_i18n_gettext('1269', 'Thailand ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1270, 'ctry', 'ti ', oils_i18n_gettext('1270', 'Tunisia ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1271, 'ctry', 'tk ', oils_i18n_gettext('1271', 'Turkmenistan ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1272, 'ctry', 'tl ', oils_i18n_gettext('1272', 'Tokelau ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1273, 'ctry', 'tma', oils_i18n_gettext('1273', 'Tasmania ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1274, 'ctry', 'tnu', oils_i18n_gettext('1274', 'Tennessee ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1275, 'ctry', 'to ', oils_i18n_gettext('1275', 'Tonga ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1276, 'ctry', 'tr ', oils_i18n_gettext('1276', 'Trinidad and Tobago ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1277, 'ctry', 'ts ', oils_i18n_gettext('1277', 'United Arab Emirates ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1278, 'ctry', 'tu ', oils_i18n_gettext('1278', 'Turkey ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1279, 'ctry', 'tv ', oils_i18n_gettext('1279', 'Tuvalu ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1280, 'ctry', 'txu', oils_i18n_gettext('1280', 'Texas ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1281, 'ctry', 'tz ', oils_i18n_gettext('1281', 'Tanzania ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1282, 'ctry', 'ua ', oils_i18n_gettext('1282', 'Egypt ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1283, 'ctry', 'uc ', oils_i18n_gettext('1283', 'United States Misc. Caribbean Islands ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1284, 'ctry', 'ug ', oils_i18n_gettext('1284', 'Uganda ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1285, 'ctry', 'uik', oils_i18n_gettext('1285', 'United Kingdom Misc. Islands ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1286, 'ctry', 'un ', oils_i18n_gettext('1286', 'Ukraine ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1287, 'ctry', 'up ', oils_i18n_gettext('1287', 'United States Misc. Pacific Islands ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1288, 'ctry', 'utu', oils_i18n_gettext('1288', 'Utah ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1289, 'ctry', 'uv ', oils_i18n_gettext('1289', 'Burkina Faso ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1290, 'ctry', 'uy ', oils_i18n_gettext('1290', 'Uruguay ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1291, 'ctry', 'uz ', oils_i18n_gettext('1291', 'Uzbekistan ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1292, 'ctry', 'vau', oils_i18n_gettext('1292', 'Virginia ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1293, 'ctry', 'vb ', oils_i18n_gettext('1293', 'British Virgin Islands ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1294, 'ctry', 'vc ', oils_i18n_gettext('1294', 'Vatican City ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1295, 'ctry', 've ', oils_i18n_gettext('1295', 'Venezuela ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1296, 'ctry', 'vi ', oils_i18n_gettext('1296', 'Virgin Islands of the United States ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1297, 'ctry', 'vm ', oils_i18n_gettext('1297', 'Vietnam ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1298, 'ctry', 'vp ', oils_i18n_gettext('1298', 'Various places ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1299, 'ctry', 'vra', oils_i18n_gettext('1299', 'Victoria ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1300, 'ctry', 'vtu', oils_i18n_gettext('1300', 'Vermont ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1301, 'ctry', 'wau', oils_i18n_gettext('1301', 'Washington (State) ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1302, 'ctry', 'wea', oils_i18n_gettext('1302', 'Western Australia ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1303, 'ctry', 'wf ', oils_i18n_gettext('1303', 'Wallis and Futuna ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1304, 'ctry', 'wiu', oils_i18n_gettext('1304', 'Wisconsin ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1305, 'ctry', 'wj ', oils_i18n_gettext('1305', 'West Bank of the Jordan River ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1306, 'ctry', 'wk ', oils_i18n_gettext('1306', 'Wake Island ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1307, 'ctry', 'wlk', oils_i18n_gettext('1307', 'Wales ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1308, 'ctry', 'ws ', oils_i18n_gettext('1308', 'Samoa ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1309, 'ctry', 'wvu', oils_i18n_gettext('1309', 'West Virginia ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1310, 'ctry', 'wyu', oils_i18n_gettext('1310', 'Wyoming ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1311, 'ctry', 'xa ', oils_i18n_gettext('1311', 'Christmas Island (Indian Ocean) ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1312, 'ctry', 'xb ', oils_i18n_gettext('1312', 'Cocos (Keeling) Islands ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1313, 'ctry', 'xc ', oils_i18n_gettext('1313', 'Maldives ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1314, 'ctry', 'xd ', oils_i18n_gettext('1314', 'Saint Kitts', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1315, 'ctry', 'xe ', oils_i18n_gettext('1315', 'Marshall Islands ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1316, 'ctry', 'xf ', oils_i18n_gettext('1316', 'Midway Islands ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1317, 'ctry', 'xga', oils_i18n_gettext('1317', 'Coral Sea Islands Territory ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1318, 'ctry', 'xh ', oils_i18n_gettext('1318', 'Niue ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1319, 'ctry', 'xj ', oils_i18n_gettext('1319', 'Saint Helena ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1320, 'ctry', 'xk ', oils_i18n_gettext('1320', 'Saint Lucia ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1321, 'ctry', 'xl ', oils_i18n_gettext('1321', 'Saint Pierre and Miquelon ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1322, 'ctry', 'xm ', oils_i18n_gettext('1322', 'Saint Vincent and the Grenadines ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1323, 'ctry', 'xn ', oils_i18n_gettext('1323', 'Macedonia ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1324, 'ctry', 'xna', oils_i18n_gettext('1324', 'New South Wales ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1325, 'ctry', 'xo ', oils_i18n_gettext('1325', 'Slovakia ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1326, 'ctry', 'xoa', oils_i18n_gettext('1326', 'Northern Territory ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1327, 'ctry', 'xp ', oils_i18n_gettext('1327', 'Spratly Island ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1328, 'ctry', 'xr ', oils_i18n_gettext('1328', 'Czech Republic ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1329, 'ctry', 'xra', oils_i18n_gettext('1329', 'South Australia ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1330, 'ctry', 'xs ', oils_i18n_gettext('1330', 'South Georgia and the South Sandwich Islands ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1331, 'ctry', 'xv ', oils_i18n_gettext('1331', 'Slovenia ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1332, 'ctry', 'xx ', oils_i18n_gettext('1332', 'No place, unknown, or undetermined ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1333, 'ctry', 'xxc', oils_i18n_gettext('1333', 'Canada ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1334, 'ctry', 'xxk', oils_i18n_gettext('1334', 'United Kingdom ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1335, 'ctry', 'xxu', oils_i18n_gettext('1335', 'United States ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1336, 'ctry', 'ye ', oils_i18n_gettext('1336', 'Yemen ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1337, 'ctry', 'ykc', oils_i18n_gettext('1337', 'Yukon Territory ', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1338, 'ctry', 'za ', oils_i18n_gettext('1338', 'Zambia ', 'ccvm', 'value'));

-- Type of Date/Publication Status
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1339, 'pub_status', 'b', oils_i18n_gettext('1339', 'No dates given; B.C. date involved', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1340, 'pub_status', 'c', oils_i18n_gettext('1340', 'Continuing resource currently published', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1341, 'pub_status', 'd', oils_i18n_gettext('1341', 'Continuing resource ceased publication', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1342, 'pub_status', 'e', oils_i18n_gettext('1342', 'Detailed date', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1343, 'pub_status', 'i', oils_i18n_gettext('1343', 'Inclusive dates of collection', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1344, 'pub_status', 'k', oils_i18n_gettext('1344', 'Range of years of bulk of collection', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1345, 'pub_status', 'm', oils_i18n_gettext('1345', 'Multiple dates', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1346, 'pub_status', 'n', oils_i18n_gettext('1346', 'Dates unknown', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1347, 'pub_status', 'p', oils_i18n_gettext('1347', 'Date of distribution/release/issue and production/recording session when different', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1348, 'pub_status', 'q', oils_i18n_gettext('1348', 'Questionable date', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1349, 'pub_status', 'r', oils_i18n_gettext('1349', 'Reprint/reissue date and original date', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1350, 'pub_status', 's', oils_i18n_gettext('1350', 'Single known date/probable date', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1351, 'pub_status', 't', oils_i18n_gettext('1351', 'Publication date and copyright date', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1352, 'pub_status', 'u', oils_i18n_gettext('1352', 'Continuing resource status unknown', 'ccvm', 'value'));


-- These are fixed fields that are made up of multiple single-character codes. These are the actual fields used for the individual positions,
-- the "unnumbered" version of these fields are used for the MARC editor and as composite attributes for use in the OPAC if desired.
-- i18n ids are left as-is because they are exactly the same value.
-- The ' ' codes only apply to the first position because if there's anything in pos 1 then additional spaces are just filler.
-- There's also no need for them to be opac visible because there are composite attributes that OR these numbered attributes together.
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1353, 'accm1', ' ', oils_i18n_gettext('1735', 'No accompanying matter', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1354, 'accm1', 'a', oils_i18n_gettext('713', 'Discography', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1355, 'accm1', 'b', oils_i18n_gettext('714', 'Bibliography', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1356, 'accm1', 'c', oils_i18n_gettext('715', 'Thematic index', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1357, 'accm1', 'd', oils_i18n_gettext('716', 'Libretto or text', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1358, 'accm1', 'e', oils_i18n_gettext('717', 'Biography of composer or author', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1359, 'accm1', 'f', oils_i18n_gettext('718', 'Biography or performer or history of ensemble', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1360, 'accm1', 'g', oils_i18n_gettext('719', 'Technical and/or historical information on instruments', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1361, 'accm1', 'h', oils_i18n_gettext('720', 'Technical information on music', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1362, 'accm1', 'i', oils_i18n_gettext('721', 'Historical information', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1363, 'accm1', 'k', oils_i18n_gettext('722', 'Ethnological information', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1364, 'accm1', 'r', oils_i18n_gettext('723', 'Instructional materials', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1365, 'accm1', 's', oils_i18n_gettext('724', 'Music', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1366, 'accm1', 'z', oils_i18n_gettext('725', 'Other accompanying matter', 'ccvm', 'value'), FALSE);

INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1367, 'accm2', 'a', oils_i18n_gettext('713', 'Discography', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1368, 'accm2', 'b', oils_i18n_gettext('714', 'Bibliography', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1369, 'accm2', 'c', oils_i18n_gettext('715', 'Thematic index', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1370, 'accm2', 'd', oils_i18n_gettext('716', 'Libretto or text', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1371, 'accm2', 'e', oils_i18n_gettext('717', 'Biography of composer or author', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1372, 'accm2', 'f', oils_i18n_gettext('718', 'Biography or performer or history of ensemble', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1373, 'accm2', 'g', oils_i18n_gettext('719', 'Technical and/or historical information on instruments', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1374, 'accm2', 'h', oils_i18n_gettext('720', 'Technical information on music', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1375, 'accm2', 'i', oils_i18n_gettext('721', 'Historical information', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1376, 'accm2', 'k', oils_i18n_gettext('722', 'Ethnological information', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1377, 'accm2', 'r', oils_i18n_gettext('723', 'Instructional materials', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1378, 'accm2', 's', oils_i18n_gettext('724', 'Music', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1379, 'accm2', 'z', oils_i18n_gettext('725', 'Other accompanying matter', 'ccvm', 'value'), FALSE);

INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1380, 'accm3', 'a', oils_i18n_gettext('713', 'Discography', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1381, 'accm3', 'b', oils_i18n_gettext('714', 'Bibliography', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1382, 'accm3', 'c', oils_i18n_gettext('715', 'Thematic index', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1383, 'accm3', 'd', oils_i18n_gettext('716', 'Libretto or text', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1384, 'accm3', 'e', oils_i18n_gettext('717', 'Biography of composer or author', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1385, 'accm3', 'f', oils_i18n_gettext('718', 'Biography or performer or history of ensemble', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1386, 'accm3', 'g', oils_i18n_gettext('719', 'Technical and/or historical information on instruments', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1387, 'accm3', 'h', oils_i18n_gettext('720', 'Technical information on music', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1388, 'accm3', 'i', oils_i18n_gettext('721', 'Historical information', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1389, 'accm3', 'k', oils_i18n_gettext('722', 'Ethnological information', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1390, 'accm3', 'r', oils_i18n_gettext('723', 'Instructional materials', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1391, 'accm3', 's', oils_i18n_gettext('724', 'Music', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1392, 'accm3', 'z', oils_i18n_gettext('725', 'Other accompanying matter', 'ccvm', 'value'), FALSE);

INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1393, 'accm4', 'a', oils_i18n_gettext('713', 'Discography', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1394, 'accm4', 'b', oils_i18n_gettext('714', 'Bibliography', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1395, 'accm4', 'c', oils_i18n_gettext('715', 'Thematic index', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1396, 'accm4', 'd', oils_i18n_gettext('716', 'Libretto or text', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1397, 'accm4', 'e', oils_i18n_gettext('717', 'Biography of composer or author', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1398, 'accm4', 'f', oils_i18n_gettext('718', 'Biography or performer or history of ensemble', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1399, 'accm4', 'g', oils_i18n_gettext('719', 'Technical and/or historical information on instruments', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1400, 'accm4', 'h', oils_i18n_gettext('720', 'Technical information on music', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1401, 'accm4', 'i', oils_i18n_gettext('721', 'Historical information', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1402, 'accm4', 'k', oils_i18n_gettext('722', 'Ethnological information', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1403, 'accm4', 'r', oils_i18n_gettext('723', 'Instructional materials', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1404, 'accm4', 's', oils_i18n_gettext('724', 'Music', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1405, 'accm4', 'z', oils_i18n_gettext('725', 'Other accompanying matter', 'ccvm', 'value'), FALSE);

INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1406, 'accm5', 'a', oils_i18n_gettext('713', 'Discography', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1407, 'accm5', 'b', oils_i18n_gettext('714', 'Bibliography', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1408, 'accm5', 'c', oils_i18n_gettext('715', 'Thematic index', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1409, 'accm5', 'd', oils_i18n_gettext('716', 'Libretto or text', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1410, 'accm5', 'e', oils_i18n_gettext('717', 'Biography of composer or author', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1411, 'accm5', 'f', oils_i18n_gettext('718', 'Biography or performer or history of ensemble', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1412, 'accm5', 'g', oils_i18n_gettext('719', 'Technical and/or historical information on instruments', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1413, 'accm5', 'h', oils_i18n_gettext('720', 'Technical information on music', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1414, 'accm5', 'i', oils_i18n_gettext('721', 'Historical information', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1415, 'accm5', 'k', oils_i18n_gettext('722', 'Ethnological information', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1416, 'accm5', 'r', oils_i18n_gettext('723', 'Instructional materials', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1417, 'accm5', 's', oils_i18n_gettext('724', 'Music', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1418, 'accm5', 'z', oils_i18n_gettext('725', 'Other accompanying matter', 'ccvm', 'value'), FALSE);

INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1419, 'accm6', 'a', oils_i18n_gettext('713', 'Discography', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1420, 'accm6', 'b', oils_i18n_gettext('714', 'Bibliography', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1421, 'accm6', 'c', oils_i18n_gettext('715', 'Thematic index', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1422, 'accm6', 'd', oils_i18n_gettext('716', 'Libretto or text', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1423, 'accm6', 'e', oils_i18n_gettext('717', 'Biography of composer or author', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1424, 'accm6', 'f', oils_i18n_gettext('718', 'Biography or performer or history of ensemble', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1425, 'accm6', 'g', oils_i18n_gettext('719', 'Technical and/or historical information on instruments', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1426, 'accm6', 'h', oils_i18n_gettext('720', 'Technical information on music', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1427, 'accm6', 'i', oils_i18n_gettext('721', 'Historical information', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1428, 'accm6', 'k', oils_i18n_gettext('722', 'Ethnological information', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1429, 'accm6', 'r', oils_i18n_gettext('723', 'Instructional materials', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1430, 'accm6', 's', oils_i18n_gettext('724', 'Music', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1431, 'accm6', 'z', oils_i18n_gettext('725', 'Other accompanying matter', 'ccvm', 'value'), FALSE);

INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1432, 'cont1', ' ', oils_i18n_gettext('835', 'Not specified', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1433, 'cont1', 'a', oils_i18n_gettext('836', 'Abstracts/summaries', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1434, 'cont1', 'b', oils_i18n_gettext('837', 'Bibliographies', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1435, 'cont1', 'c', oils_i18n_gettext('838', 'Catalogs', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1436, 'cont1', 'd', oils_i18n_gettext('839', 'Dictionaries', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1437, 'cont1', 'e', oils_i18n_gettext('840', 'Encyclopedias', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1438, 'cont1', 'f', oils_i18n_gettext('841', 'Handbooks', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1439, 'cont1', 'g', oils_i18n_gettext('842', 'Legal articles', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1440, 'cont1', 'h', oils_i18n_gettext('843', 'Biography', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1441, 'cont1', 'i', oils_i18n_gettext('844', 'Indexes', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1442, 'cont1', 'j', oils_i18n_gettext('845', 'Patent document', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1443, 'cont1', 'k', oils_i18n_gettext('846', 'Discographies', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1444, 'cont1', 'l', oils_i18n_gettext('847', 'Legislation', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1445, 'cont1', 'm', oils_i18n_gettext('848', 'Theses', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1446, 'cont1', 'n', oils_i18n_gettext('849', 'Surveys of the literature in a subject area', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1447, 'cont1', 'o', oils_i18n_gettext('850', 'Reviews', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1448, 'cont1', 'p', oils_i18n_gettext('851', 'Programmed texts', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1449, 'cont1', 'q', oils_i18n_gettext('852', 'Filmographies', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1450, 'cont1', 'r', oils_i18n_gettext('853', 'Directories', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1451, 'cont1', 's', oils_i18n_gettext('854', 'Statistics', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1452, 'cont1', 't', oils_i18n_gettext('855', 'Technical reports', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1453, 'cont1', 'u', oils_i18n_gettext('856', 'Standards/specifications', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1454, 'cont1', 'v', oils_i18n_gettext('857', 'Legal cases and case notes', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1455, 'cont1', 'w', oils_i18n_gettext('858', 'Law reports and digests', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1456, 'cont1', 'x', oils_i18n_gettext('859', 'Other reports', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1457, 'cont1', 'y', oils_i18n_gettext('860', 'Yearbooks', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1458, 'cont1', 'z', oils_i18n_gettext('861', 'Treaties', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1459, 'cont1', '2', oils_i18n_gettext('862', 'Offprints', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1460, 'cont1', '5', oils_i18n_gettext('863', 'Calendars', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1461, 'cont1', '6', oils_i18n_gettext('864', 'Comics/graphic novels', 'ccvm', 'value'), FALSE);

INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1462, 'cont2', 'a', oils_i18n_gettext('836', 'Abstracts/summaries', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1463, 'cont2', 'b', oils_i18n_gettext('837', 'Bibliographies', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1464, 'cont2', 'c', oils_i18n_gettext('838', 'Catalogs', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1465, 'cont2', 'd', oils_i18n_gettext('839', 'Dictionaries', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1466, 'cont2', 'e', oils_i18n_gettext('840', 'Encyclopedias', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1467, 'cont2', 'f', oils_i18n_gettext('841', 'Handbooks', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1468, 'cont2', 'g', oils_i18n_gettext('842', 'Legal articles', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1469, 'cont2', 'h', oils_i18n_gettext('843', 'Biography', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1470, 'cont2', 'i', oils_i18n_gettext('844', 'Indexes', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1471, 'cont2', 'j', oils_i18n_gettext('845', 'Patent document', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1472, 'cont2', 'k', oils_i18n_gettext('846', 'Discographies', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1473, 'cont2', 'l', oils_i18n_gettext('847', 'Legislation', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1474, 'cont2', 'm', oils_i18n_gettext('848', 'Theses', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1475, 'cont2', 'n', oils_i18n_gettext('849', 'Surveys of the literature in a subject area', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1476, 'cont2', 'o', oils_i18n_gettext('850', 'Reviews', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1477, 'cont2', 'p', oils_i18n_gettext('851', 'Programmed texts', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1478, 'cont2', 'q', oils_i18n_gettext('852', 'Filmographies', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1479, 'cont2', 'r', oils_i18n_gettext('853', 'Directories', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1480, 'cont2', 's', oils_i18n_gettext('854', 'Statistics', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1481, 'cont2', 't', oils_i18n_gettext('855', 'Technical reports', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1482, 'cont2', 'u', oils_i18n_gettext('856', 'Standards/specifications', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1483, 'cont2', 'v', oils_i18n_gettext('857', 'Legal cases and case notes', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1484, 'cont2', 'w', oils_i18n_gettext('858', 'Law reports and digests', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1485, 'cont2', 'x', oils_i18n_gettext('859', 'Other reports', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1486, 'cont2', 'y', oils_i18n_gettext('860', 'Yearbooks', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1487, 'cont2', 'z', oils_i18n_gettext('861', 'Treaties', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1488, 'cont2', '2', oils_i18n_gettext('862', 'Offprints', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1489, 'cont2', '5', oils_i18n_gettext('863', 'Calendars', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1490, 'cont2', '6', oils_i18n_gettext('864', 'Comics/graphic novels', 'ccvm', 'value'), FALSE);

INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1491, 'cont3', 'a', oils_i18n_gettext('836', 'Abstracts/summaries', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1492, 'cont3', 'b', oils_i18n_gettext('837', 'Bibliographies', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1493, 'cont3', 'c', oils_i18n_gettext('838', 'Catalogs', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1494, 'cont3', 'd', oils_i18n_gettext('839', 'Dictionaries', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1495, 'cont3', 'e', oils_i18n_gettext('840', 'Encyclopedias', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1496, 'cont3', 'f', oils_i18n_gettext('841', 'Handbooks', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1497, 'cont3', 'g', oils_i18n_gettext('842', 'Legal articles', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1498, 'cont3', 'h', oils_i18n_gettext('843', 'Biography', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1499, 'cont3', 'i', oils_i18n_gettext('844', 'Indexes', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1500, 'cont3', 'j', oils_i18n_gettext('845', 'Patent document', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1501, 'cont3', 'k', oils_i18n_gettext('846', 'Discographies', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1502, 'cont3', 'l', oils_i18n_gettext('847', 'Legislation', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1503, 'cont3', 'm', oils_i18n_gettext('848', 'Theses', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1504, 'cont3', 'n', oils_i18n_gettext('849', 'Surveys of the literature in a subject area', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1505, 'cont3', 'o', oils_i18n_gettext('850', 'Reviews', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1506, 'cont3', 'p', oils_i18n_gettext('851', 'Programmed texts', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1507, 'cont3', 'q', oils_i18n_gettext('852', 'Filmographies', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1508, 'cont3', 'r', oils_i18n_gettext('853', 'Directories', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1509, 'cont3', 's', oils_i18n_gettext('854', 'Statistics', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1510, 'cont3', 't', oils_i18n_gettext('855', 'Technical reports', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1511, 'cont3', 'u', oils_i18n_gettext('856', 'Standards/specifications', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1512, 'cont3', 'v', oils_i18n_gettext('857', 'Legal cases and case notes', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1513, 'cont3', 'w', oils_i18n_gettext('858', 'Law reports and digests', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1514, 'cont3', 'x', oils_i18n_gettext('859', 'Other reports', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1515, 'cont3', 'y', oils_i18n_gettext('860', 'Yearbooks', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1516, 'cont3', 'z', oils_i18n_gettext('861', 'Treaties', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1517, 'cont3', '2', oils_i18n_gettext('862', 'Offprints', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1518, 'cont3', '5', oils_i18n_gettext('863', 'Calendars', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1519, 'cont3', '6', oils_i18n_gettext('864', 'Comics/graphic novels', 'ccvm', 'value'), FALSE);

INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1520, 'cont4', 'a', oils_i18n_gettext('836', 'Abstracts/summaries', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1521, 'cont4', 'b', oils_i18n_gettext('837', 'Bibliographies', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1522, 'cont4', 'c', oils_i18n_gettext('838', 'Catalogs', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1523, 'cont4', 'd', oils_i18n_gettext('839', 'Dictionaries', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1524, 'cont4', 'e', oils_i18n_gettext('840', 'Encyclopedias', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1525, 'cont4', 'f', oils_i18n_gettext('841', 'Handbooks', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1526, 'cont4', 'g', oils_i18n_gettext('842', 'Legal articles', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1527, 'cont4', 'h', oils_i18n_gettext('843', 'Biography', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1528, 'cont4', 'i', oils_i18n_gettext('844', 'Indexes', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1529, 'cont4', 'j', oils_i18n_gettext('845', 'Patent document', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1530, 'cont4', 'k', oils_i18n_gettext('846', 'Discographies', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1531, 'cont4', 'l', oils_i18n_gettext('847', 'Legislation', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1532, 'cont4', 'm', oils_i18n_gettext('848', 'Theses', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1533, 'cont4', 'n', oils_i18n_gettext('849', 'Surveys of the literature in a subject area', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1534, 'cont4', 'o', oils_i18n_gettext('850', 'Reviews', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1535, 'cont4', 'p', oils_i18n_gettext('851', 'Programmed texts', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1536, 'cont4', 'q', oils_i18n_gettext('852', 'Filmographies', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1537, 'cont4', 'r', oils_i18n_gettext('853', 'Directories', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1538, 'cont4', 's', oils_i18n_gettext('854', 'Statistics', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1539, 'cont4', 't', oils_i18n_gettext('855', 'Technical reports', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1540, 'cont4', 'u', oils_i18n_gettext('856', 'Standards/specifications', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1541, 'cont4', 'v', oils_i18n_gettext('857', 'Legal cases and case notes', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1542, 'cont4', 'w', oils_i18n_gettext('858', 'Law reports and digests', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1543, 'cont4', 'x', oils_i18n_gettext('859', 'Other reports', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1544, 'cont4', 'y', oils_i18n_gettext('860', 'Yearbooks', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1545, 'cont4', 'z', oils_i18n_gettext('861', 'Treaties', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1546, 'cont4', '2', oils_i18n_gettext('862', 'Offprints', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1547, 'cont4', '5', oils_i18n_gettext('863', 'Calendars', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1548, 'cont4', '6', oils_i18n_gettext('864', 'Comics/graphic novels', 'ccvm', 'value'), FALSE);

INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1549, 'ltxt1', ' ', oils_i18n_gettext('881', 'Item is a music sound recording', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1550, 'ltxt1', 'a', oils_i18n_gettext('882', 'Autobiography', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1551, 'ltxt1', 'b', oils_i18n_gettext('883', 'Biography', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1552, 'ltxt1', 'c', oils_i18n_gettext('884', 'Conference proceedings', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1553, 'ltxt1', 'd', oils_i18n_gettext('885', 'Drama', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1554, 'ltxt1', 'e', oils_i18n_gettext('886', 'Essays', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1555, 'ltxt1', 'f', oils_i18n_gettext('887', 'Fiction', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1556, 'ltxt1', 'g', oils_i18n_gettext('888', 'Reporting', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1557, 'ltxt1', 'h', oils_i18n_gettext('889', 'History', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1558, 'ltxt1', 'i', oils_i18n_gettext('890', 'Instruction', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1559, 'ltxt1', 'j', oils_i18n_gettext('891', 'Language instruction', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1560, 'ltxt1', 'k', oils_i18n_gettext('892', 'Comedy', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1561, 'ltxt1', 'l', oils_i18n_gettext('893', 'Lectures, speeches', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1562, 'ltxt1', 'm', oils_i18n_gettext('894', 'Memoirs', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1563, 'ltxt1', 'n', oils_i18n_gettext('895', 'Not applicable', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1564, 'ltxt1', 'o', oils_i18n_gettext('896', 'Folktales', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1565, 'ltxt1', 'p', oils_i18n_gettext('897', 'Poetry', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1566, 'ltxt1', 'r', oils_i18n_gettext('898', 'Rehearsals', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1567, 'ltxt1', 's', oils_i18n_gettext('899', 'Sounds', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1568, 'ltxt1', 't', oils_i18n_gettext('900', 'Interviews', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1569, 'ltxt1', 'z', oils_i18n_gettext('901', 'Other', 'ccvm', 'value'), FALSE);

INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1570, 'ltxt2', 'a', oils_i18n_gettext('882', 'Autobiography', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1571, 'ltxt2', 'b', oils_i18n_gettext('883', 'Biography', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1572, 'ltxt2', 'c', oils_i18n_gettext('884', 'Conference proceedings', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1573, 'ltxt2', 'd', oils_i18n_gettext('885', 'Drama', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1574, 'ltxt2', 'e', oils_i18n_gettext('886', 'Essays', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1575, 'ltxt2', 'f', oils_i18n_gettext('887', 'Fiction', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1576, 'ltxt2', 'g', oils_i18n_gettext('888', 'Reporting', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1577, 'ltxt2', 'h', oils_i18n_gettext('889', 'History', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1578, 'ltxt2', 'i', oils_i18n_gettext('890', 'Instruction', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1579, 'ltxt2', 'j', oils_i18n_gettext('891', 'Language instruction', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1580, 'ltxt2', 'k', oils_i18n_gettext('892', 'Comedy', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1581, 'ltxt2', 'l', oils_i18n_gettext('893', 'Lectures, speeches', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1582, 'ltxt2', 'm', oils_i18n_gettext('894', 'Memoirs', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1583, 'ltxt2', 'n', oils_i18n_gettext('895', 'Not applicable', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1584, 'ltxt2', 'o', oils_i18n_gettext('896', 'Folktales', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1585, 'ltxt2', 'p', oils_i18n_gettext('897', 'Poetry', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1586, 'ltxt2', 'r', oils_i18n_gettext('898', 'Rehearsals', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1587, 'ltxt2', 's', oils_i18n_gettext('899', 'Sounds', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1588, 'ltxt2', 't', oils_i18n_gettext('900', 'Interviews', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1589, 'ltxt2', 'z', oils_i18n_gettext('901', 'Other', 'ccvm', 'value'), FALSE);

INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1590, 'relf1', ' ', oils_i18n_gettext('965', 'No relief shown', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1591, 'relf1', 'a', oils_i18n_gettext('966', 'Contours', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1592, 'relf1', 'b', oils_i18n_gettext('967', 'Shading', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1593, 'relf1', 'c', oils_i18n_gettext('968', 'Gradient and bathymetric tints', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1594, 'relf1', 'd', oils_i18n_gettext('969', 'Hachures', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1595, 'relf1', 'e', oils_i18n_gettext('970', 'Bathymetry, soundings', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1596, 'relf1', 'f', oils_i18n_gettext('971', 'Form lines', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1597, 'relf1', 'g', oils_i18n_gettext('972', 'Spot heights', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1598, 'relf1', 'i', oils_i18n_gettext('973', 'Pictorially', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1599, 'relf1', 'j', oils_i18n_gettext('974', 'Land forms', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1600, 'relf1', 'k', oils_i18n_gettext('975', 'Bathymetry, isolines', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1601, 'relf1', 'm', oils_i18n_gettext('976', 'Rock drawings', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1602, 'relf1', 'z', oils_i18n_gettext('977', 'Other', 'ccvm', 'value'), FALSE);

INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1603, 'relf2', 'a', oils_i18n_gettext('966', 'Contours', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1604, 'relf2', 'b', oils_i18n_gettext('967', 'Shading', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1605, 'relf2', 'c', oils_i18n_gettext('968', 'Gradient and bathymetric tints', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1606, 'relf2', 'd', oils_i18n_gettext('969', 'Hachures', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1607, 'relf2', 'e', oils_i18n_gettext('970', 'Bathymetry, soundings', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1608, 'relf2', 'f', oils_i18n_gettext('971', 'Form lines', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1609, 'relf2', 'g', oils_i18n_gettext('972', 'Spot heights', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1610, 'relf2', 'i', oils_i18n_gettext('973', 'Pictorially', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1611, 'relf2', 'j', oils_i18n_gettext('974', 'Land forms', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1612, 'relf2', 'k', oils_i18n_gettext('975', 'Bathymetry, isolines', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1613, 'relf2', 'm', oils_i18n_gettext('976', 'Rock drawings', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1614, 'relf2', 'z', oils_i18n_gettext('977', 'Other', 'ccvm', 'value'), FALSE);

INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1615, 'relf3', 'a', oils_i18n_gettext('966', 'Contours', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1616, 'relf3', 'b', oils_i18n_gettext('967', 'Shading', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1617, 'relf3', 'c', oils_i18n_gettext('968', 'Gradient and bathymetric tints', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1618, 'relf3', 'd', oils_i18n_gettext('969', 'Hachures', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1619, 'relf3', 'e', oils_i18n_gettext('970', 'Bathymetry, soundings', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1620, 'relf3', 'f', oils_i18n_gettext('971', 'Form lines', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1621, 'relf3', 'g', oils_i18n_gettext('972', 'Spot heights', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1622, 'relf3', 'i', oils_i18n_gettext('973', 'Pictorially', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1623, 'relf3', 'j', oils_i18n_gettext('974', 'Land forms', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1624, 'relf3', 'k', oils_i18n_gettext('975', 'Bathymetry, isolines', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1625, 'relf3', 'm', oils_i18n_gettext('976', 'Rock drawings', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1626, 'relf3', 'z', oils_i18n_gettext('977', 'Other', 'ccvm', 'value'), FALSE);

INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1627, 'relf4', 'a', oils_i18n_gettext('966', 'Contours', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1628, 'relf4', 'b', oils_i18n_gettext('967', 'Shading', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1629, 'relf4', 'c', oils_i18n_gettext('968', 'Gradient and bathymetric tints', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1630, 'relf4', 'd', oils_i18n_gettext('969', 'Hachures', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1631, 'relf4', 'e', oils_i18n_gettext('970', 'Bathymetry, soundings', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1632, 'relf4', 'f', oils_i18n_gettext('971', 'Form lines', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1633, 'relf4', 'g', oils_i18n_gettext('972', 'Spot heights', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1634, 'relf4', 'i', oils_i18n_gettext('973', 'Pictorially', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1635, 'relf4', 'j', oils_i18n_gettext('974', 'Land forms', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1636, 'relf4', 'k', oils_i18n_gettext('975', 'Bathymetry, isolines', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1637, 'relf4', 'm', oils_i18n_gettext('976', 'Rock drawings', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1638, 'relf4', 'z', oils_i18n_gettext('977', 'Other', 'ccvm', 'value'), FALSE);

INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1639, 'spfm1', ' ', oils_i18n_gettext('978', 'No specified special format characteristics', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1640, 'spfm1', 'e', oils_i18n_gettext('979', 'Manuscript', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1641, 'spfm1', 'j', oils_i18n_gettext('980', 'Picture card, post card', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1642, 'spfm1', 'k', oils_i18n_gettext('981', 'Calendar', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1643, 'spfm1', 'l', oils_i18n_gettext('982', 'Puzzle', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1644, 'spfm1', 'n', oils_i18n_gettext('983', 'Game', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1645, 'spfm1', 'o', oils_i18n_gettext('984', 'Wall map', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1646, 'spfm1', 'p', oils_i18n_gettext('985', 'Playing cards', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1647, 'spfm1', 'r', oils_i18n_gettext('986', 'Loose-leaf', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1648, 'spfm1', 'z', oils_i18n_gettext('987', 'Other', 'ccvm', 'value'), FALSE);

INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1649, 'spfm2', 'e', oils_i18n_gettext('979', 'Manuscript', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1650, 'spfm2', 'j', oils_i18n_gettext('980', 'Picture card, post card', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1651, 'spfm2', 'k', oils_i18n_gettext('981', 'Calendar', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1652, 'spfm2', 'l', oils_i18n_gettext('982', 'Puzzle', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1653, 'spfm2', 'n', oils_i18n_gettext('983', 'Game', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1654, 'spfm2', 'o', oils_i18n_gettext('984', 'Wall map', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1655, 'spfm2', 'p', oils_i18n_gettext('985', 'Playing cards', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1656, 'spfm2', 'r', oils_i18n_gettext('986', 'Loose-leaf', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1657, 'spfm2', 'z', oils_i18n_gettext('987', 'Other', 'ccvm', 'value'), FALSE);

-- Illustrations
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1658, 'ills', ' ', oils_i18n_gettext('1658', 'No Illustrations', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1659, 'ills', 'a', oils_i18n_gettext('1659', 'Illustrations', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1660, 'ills', 'b', oils_i18n_gettext('1660', 'Maps', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1661, 'ills', 'c', oils_i18n_gettext('1661', 'Portraits', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1662, 'ills', 'd', oils_i18n_gettext('1662', 'Charts', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1663, 'ills', 'e', oils_i18n_gettext('1663', 'Plans', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1664, 'ills', 'f', oils_i18n_gettext('1664', 'Plates', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1665, 'ills', 'g', oils_i18n_gettext('1665', 'Music', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1666, 'ills', 'h', oils_i18n_gettext('1666', 'Facsimiles', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1667, 'ills', 'i', oils_i18n_gettext('1667', 'Coats of arms', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1668, 'ills', 'j', oils_i18n_gettext('1668', 'Genealogical tables', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1669, 'ills', 'k', oils_i18n_gettext('1669', 'Forms', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1670, 'ills', 'l', oils_i18n_gettext('1670', 'Samples', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1671, 'ills', 'm', oils_i18n_gettext('1671', 'Phonodisc, phonowire, etc.', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1672, 'ills', 'o', oils_i18n_gettext('1672', 'Photographs', 'ccvm', 'value'));
INSERT INTO config.coded_value_map (id, ctype, code, value) VALUES (1673, 'ills', 'p', oils_i18n_gettext('1673', 'Illuminations', 'ccvm', 'value'));
	
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1674, 'ills1', ' ', oils_i18n_gettext('1658', 'No Illustrations', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1675, 'ills1', 'a', oils_i18n_gettext('1659', 'Illustrations', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1676, 'ills1', 'b', oils_i18n_gettext('1660', 'Maps', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1677, 'ills1', 'c', oils_i18n_gettext('1661', 'Portraits', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1678, 'ills1', 'd', oils_i18n_gettext('1662', 'Charts', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1679, 'ills1', 'e', oils_i18n_gettext('1663', 'Plans', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1680, 'ills1', 'f', oils_i18n_gettext('1664', 'Plates', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1681, 'ills1', 'g', oils_i18n_gettext('1665', 'Music', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1682, 'ills1', 'h', oils_i18n_gettext('1666', 'Facsimiles', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1683, 'ills1', 'i', oils_i18n_gettext('1667', 'Coats of arms', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1684, 'ills1', 'j', oils_i18n_gettext('1668', 'Genealogical tables', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1685, 'ills1', 'k', oils_i18n_gettext('1669', 'Forms', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1686, 'ills1', 'l', oils_i18n_gettext('1670', 'Samples', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1687, 'ills1', 'm', oils_i18n_gettext('1671', 'Phonodisc, phonowire, etc.', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1688, 'ills1', 'o', oils_i18n_gettext('1672', 'Photographs', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1689, 'ills1', 'p', oils_i18n_gettext('1673', 'Illuminations', 'ccvm', 'value'), FALSE);
	
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1690, 'ills2', 'a', oils_i18n_gettext('1659', 'Illustrations', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1691, 'ills2', 'b', oils_i18n_gettext('1660', 'Maps', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1692, 'ills2', 'c', oils_i18n_gettext('1661', 'Portraits', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1693, 'ills2', 'd', oils_i18n_gettext('1662', 'Charts', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1694, 'ills2', 'e', oils_i18n_gettext('1663', 'Plans', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1695, 'ills2', 'f', oils_i18n_gettext('1664', 'Plates', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1696, 'ills2', 'g', oils_i18n_gettext('1665', 'Music', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1697, 'ills2', 'h', oils_i18n_gettext('1666', 'Facsimiles', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1698, 'ills2', 'i', oils_i18n_gettext('1667', 'Coats of arms', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1699, 'ills2', 'j', oils_i18n_gettext('1668', 'Genealogical tables', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1700, 'ills2', 'k', oils_i18n_gettext('1669', 'Forms', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1701, 'ills2', 'l', oils_i18n_gettext('1670', 'Samples', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1702, 'ills2', 'm', oils_i18n_gettext('1671', 'Phonodisc, phonowire, etc.', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1703, 'ills2', 'o', oils_i18n_gettext('1672', 'Photographs', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1704, 'ills2', 'p', oils_i18n_gettext('1673', 'Illuminations', 'ccvm', 'value'), FALSE);
	
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1705, 'ills3', 'a', oils_i18n_gettext('1659', 'Illustrations', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1706, 'ills3', 'b', oils_i18n_gettext('1660', 'Maps', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1707, 'ills3', 'c', oils_i18n_gettext('1661', 'Portraits', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1708, 'ills3', 'd', oils_i18n_gettext('1662', 'Charts', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1709, 'ills3', 'e', oils_i18n_gettext('1663', 'Plans', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1710, 'ills3', 'f', oils_i18n_gettext('1664', 'Plates', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1711, 'ills3', 'g', oils_i18n_gettext('1665', 'Music', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1712, 'ills3', 'h', oils_i18n_gettext('1666', 'Facsimiles', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1713, 'ills3', 'i', oils_i18n_gettext('1667', 'Coats of arms', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1714, 'ills3', 'j', oils_i18n_gettext('1668', 'Genealogical tables', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1715, 'ills3', 'k', oils_i18n_gettext('1669', 'Forms', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1716, 'ills3', 'l', oils_i18n_gettext('1670', 'Samples', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1717, 'ills3', 'm', oils_i18n_gettext('1671', 'Phonodisc, phonowire, etc.', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1718, 'ills3', 'o', oils_i18n_gettext('1672', 'Photographs', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1719, 'ills3', 'p', oils_i18n_gettext('1673', 'Illuminations', 'ccvm', 'value'), FALSE);
	
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1720, 'ills4', 'a', oils_i18n_gettext('1659', 'Illustrations', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1721, 'ills4', 'b', oils_i18n_gettext('1660', 'Maps', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1722, 'ills4', 'c', oils_i18n_gettext('1661', 'Portraits', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1723, 'ills4', 'd', oils_i18n_gettext('1662', 'Charts', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1724, 'ills4', 'e', oils_i18n_gettext('1663', 'Plans', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1725, 'ills4', 'f', oils_i18n_gettext('1664', 'Plates', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1726, 'ills4', 'g', oils_i18n_gettext('1665', 'Music', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1727, 'ills4', 'h', oils_i18n_gettext('1666', 'Facsimiles', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1728, 'ills4', 'i', oils_i18n_gettext('1667', 'Coats of arms', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1729, 'ills4', 'j', oils_i18n_gettext('1668', 'Genealogical tables', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1730, 'ills4', 'k', oils_i18n_gettext('1669', 'Forms', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1731, 'ills4', 'l', oils_i18n_gettext('1670', 'Samples', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1732, 'ills4', 'm', oils_i18n_gettext('1671', 'Phonodisc, phonowire, etc.', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1733, 'ills4', 'o', oils_i18n_gettext('1672', 'Photographs', 'ccvm', 'value'), FALSE);
INSERT INTO config.coded_value_map (id, ctype, code, value, opac_visible) VALUES (1734, 'ills4', 'p', oils_i18n_gettext('1673', 'Illuminations', 'ccvm', 'value'), FALSE);


-- carve out a slot of 10k IDs for stock CCVMs
SELECT SETVAL('config.coded_value_map_id_seq'::TEXT, 10000);


-- composite definitions for record attr "icon_format"

INSERT INTO config.composite_attr_entry_definition 
    (coded_value, definition) VALUES
--book
(564, '{"0":[{"_attr":"item_type","_val":"a"},{"_attr":"item_type","_val":"t"}],"1":{"_not":[{"_attr":"item_form","_val":"a"},{"_attr":"item_form","_val":"b"},{"_attr":"item_form","_val":"c"},{"_attr":"item_form","_val":"d"},{"_attr":"item_form","_val":"f"},{"_attr":"item_form","_val":"o"},{"_attr":"item_form","_val":"q"},{"_attr":"item_form","_val":"r"},{"_attr":"item_form","_val":"s"}]},"2":[{"_attr":"bib_level","_val":"a"},{"_attr":"bib_level","_val":"c"},{"_attr":"bib_level","_val":"d"},{"_attr":"bib_level","_val":"m"}]}'),

-- braille
(565, '{"0":{"_attr":"item_type","_val":"a"},"1":{"_attr":"item_form","_val":"f"}}'),

-- software
(566, '{"_attr":"item_type","_val":"m"}'),

-- dvd
(567, '{"_attr":"vr_format","_val":"v"}'),

-- ebook
(568, '{"0":[{"_attr":"item_type","_val":"a"},{"_attr":"item_type","_val":"t"}],"1":[{"_attr":"item_form","_val":"o"},{"_attr":"item_form","_val":"s"},{"_attr":"item_form","_val":"q"}],"2":[{"_attr":"bib_level","_val":"a"},{"_attr":"bib_level","_val":"c"},{"_attr":"bib_level","_val":"d"},{"_attr":"bib_level","_val":"m"}]}'),

-- eaudio
(569, '{"0":{"_attr":"item_type","_val":"i"},"1":[{"_attr":"item_form","_val":"o"},{"_attr":"item_form","_val":"q"},{"_attr":"item_form","_val":"s"}]}'),

-- kit
(570, '[{"_attr":"item_type","_val":"o"},{"_attr":"item_type","_val":"p"}]'),

-- map
(571, '[{"_attr":"item_type","_val":"e"},{"_attr":"item_type","_val":"f"}]'),

-- microform
(572, '[{"_attr":"item_form","_val":"a"},{"_attr":"item_form","_val":"b"},{"_attr":"item_form","_val":"c"}]'),

-- score
(573, '[{"_attr":"item_type","_val":"c"},{"_attr":"item_type","_val":"d"}]'),

-- picture
(574, '{"_attr":"item_type","_val":"k"}'),

-- equip
(575, '{"_attr":"item_type","_val":"r"}'),

-- serial
(576, '[{"_attr":"bib_level","_val":"b"},{"_attr":"bib_level","_val":"s"}]'),

-- vhs
(577, '{"_attr":"vr_format","_val":"b"}'),

-- evideo
(578, '{"0":{"_attr":"item_type","_val":"g"},"1":[{"_attr":"item_form","_val":"o"},{"_attr":"item_form","_val":"s"},{"_attr":"item_form","_val":"q"}]}'),

-- cdaudiobook
(579, '{"0":{"_attr":"item_type","_val":"i"},"1":{"_attr":"sr_format","_val":"f"}}'),

-- cdmusic
(580, '{"0":{"_attr":"item_type","_val":"j"},"1":{"_attr":"sr_format","_val":"f"}}'),

-- casaudiobook
(581, '{"0":{"_attr":"item_type","_val":"i"},"1":{"_attr":"sr_format","_val":"l"}}'),

-- casmusic
(582, '{"0":{"_attr":"item_type","_val":"j"},"1":{"_attr":"sr_format","_val":"l"}}'),

-- phonospoken
(583, '{"0":{"_attr":"item_type","_val":"i"},"1":[{"_attr":"sr_format","_val":"a"},{"_attr":"sr_format","_val":"b"},{"_attr":"sr_format","_val":"c"},{"_attr":"sr_format","_val":"d"},{"_attr":"sr_format","_val":"e"}]}'),

-- phonomusic
(584, '{"0":{"_attr":"item_type","_val":"j"},"1":[{"_attr":"sr_format","_val":"a"},{"_attr":"sr_format","_val":"b"},{"_attr":"sr_format","_val":"c"},{"_attr":"sr_format","_val":"d"},{"_attr":"sr_format","_val":"e"}]}'),

-- lpbook
(585, '{"0":[{"_attr":"item_type","_val":"a"},{"_attr":"item_type","_val":"t"}],"1":{"_attr":"item_form","_val":"d"},"2":[{"_attr":"bib_level","_val":"a"},{"_attr":"bib_level","_val":"c"},{"_attr":"bib_level","_val":"d"},{"_attr":"bib_level","_val":"m"}]}');

-- music (catch-all)
INSERT INTO config.composite_attr_entry_definition 
    (coded_value, definition) VALUES
(607, '{"0":{"_attr":"item_type","_val":"j"},"1":{"_not":[{"_attr":"sr_format","_val":"a"},{"_attr":"sr_format","_val":"b"},{"_attr":"sr_format","_val":"c"},{"_attr":"sr_format","_val":"d"},{"_attr":"sr_format","_val":"f"},{"_attr":"sr_format","_val":"e"},{"_attr":"sr_format","_val":"l"}]}}');

-- blu-ray icon_format
INSERT INTO config.composite_attr_entry_definition 
    (coded_value, definition) VALUES (608, '{"_attr":"vr_format","_val":"s"}');

-- electronic
INSERT INTO config.composite_attr_entry_definition
    (coded_value, definition) VALUES
(712, '[{"_attr":"item_form","_val":"s"},{"_attr":"item_form","_val":"o"}]');

-- use the definitions from the icon_format as the basis for the MR hold format definitions
DO $$
    DECLARE format TEXT;
BEGIN
    FOR format IN SELECT UNNEST(
        '{book,braille,software,dvd,kit,map,microform,score,picture,equip,serial,vhs,cdaudiobook,cdmusic,casaudiobook,casmusic,phonospoken,phonomusic,lpbook,blu-ray}'::text[])
    LOOP
        INSERT INTO config.composite_attr_entry_definition 
            (coded_value, definition) VALUES
            (
                -- get the ID from the new ccvm above
                (SELECT id FROM config.coded_value_map 
                    WHERE code = format AND ctype = 'mr_hold_format'),
                -- get the def of the matching ccvm attached to the icon_format attr
                (SELECT definition FROM config.composite_attr_entry_definition ccaed
                    JOIN config.coded_value_map ccvm ON (ccaed.coded_value = ccvm.id)
                    WHERE ccvm.ctype = 'icon_format' AND ccvm.code = format)
            );
    END LOOP; 
END $$;

-- copy the composite definition from icon_format into 
-- search_format for a baseline data set
DO $$
    DECLARE format config.coded_value_map%ROWTYPE;
BEGIN
    FOR format IN SELECT * 
        FROM config.coded_value_map WHERE ctype = 'icon_format'
    LOOP
        INSERT INTO config.composite_attr_entry_definition 
            (coded_value, definition) VALUES
            (
                -- get the ID from the new ccvm above
                (SELECT id FROM config.coded_value_map 
                    WHERE code = format.code AND ctype = 'search_format'),

                -- def of the matching icon_format attr
                (SELECT definition FROM config.composite_attr_entry_definition 
                    WHERE coded_value = format.id)
            );
    END LOOP; 
END $$;

-- modify the 'book' definition so that it includes large print
UPDATE config.composite_attr_entry_definition 
    SET definition = '{"0":[{"_attr":"item_type","_val":"a"},{"_attr":"item_type","_val":"t"}],"1":{"_not":[{"_attr":"item_form","_val":"a"},{"_attr":"item_form","_val":"b"},{"_attr":"item_form","_val":"c"},{"_attr":"item_form","_val":"f"},{"_attr":"item_form","_val":"o"},{"_attr":"item_form","_val":"q"},{"_attr":"item_form","_val":"r"},{"_attr":"item_form","_val":"s"}]},"2":[{"_attr":"bib_level","_val":"a"},{"_attr":"bib_level","_val":"c"},{"_attr":"bib_level","_val":"d"},{"_attr":"bib_level","_val":"m"}]}'
    WHERE coded_value = 610;

-- modify 'music' to include all recorded music, regardless of format
UPDATE config.composite_attr_entry_definition 
    SET definition = '{"_attr":"item_type","_val":"j"}'
    WHERE coded_value = 632;


-- Composite coded value maps for multi-position single-character fields that allow the "primary" fixed field to be used in advanced searches or other composite definitions without a ton of ORs and extra work.
-- Space is used as a filler for any position other than the first, so for something to actually have "No accompanying matter," for example, specifically accm1 must = ' '.
-- Any other value has the same meaning in any position.

-- Accompanying Matter
INSERT INTO config.composite_attr_entry_definition (coded_value, definition) VALUES (1735, '{"_attr":"accm1","_val":" "}');
INSERT INTO config.composite_attr_entry_definition (coded_value, definition) VALUES (713, '[{"_attr":"accm6","_val":"a"},{"_attr":"accm5","_val":"a"},{"_attr":"accm4","_val":"a"},{"_attr":"accm3","_val":"a"},{"_attr":"accm2","_val":"a"},{"_attr":"accm1","_val":"a"}]');
INSERT INTO config.composite_attr_entry_definition (coded_value, definition) VALUES (714, '[{"_attr":"accm6","_val":"b"},{"_attr":"accm5","_val":"b"},{"_attr":"accm4","_val":"b"},{"_attr":"accm3","_val":"b"},{"_attr":"accm2","_val":"b"},{"_attr":"accm1","_val":"b"}]');
INSERT INTO config.composite_attr_entry_definition (coded_value, definition) VALUES (715, '[{"_attr":"accm6","_val":"c"},{"_attr":"accm5","_val":"c"},{"_attr":"accm4","_val":"c"},{"_attr":"accm3","_val":"c"},{"_attr":"accm2","_val":"c"},{"_attr":"accm1","_val":"c"}]');
INSERT INTO config.composite_attr_entry_definition (coded_value, definition) VALUES (716, '[{"_attr":"accm6","_val":"d"},{"_attr":"accm5","_val":"d"},{"_attr":"accm4","_val":"d"},{"_attr":"accm3","_val":"d"},{"_attr":"accm2","_val":"d"},{"_attr":"accm1","_val":"d"}]');
INSERT INTO config.composite_attr_entry_definition (coded_value, definition) VALUES (717, '[{"_attr":"accm6","_val":"e"},{"_attr":"accm5","_val":"e"},{"_attr":"accm4","_val":"e"},{"_attr":"accm3","_val":"e"},{"_attr":"accm2","_val":"e"},{"_attr":"accm1","_val":"e"}]');
INSERT INTO config.composite_attr_entry_definition (coded_value, definition) VALUES (718, '[{"_attr":"accm6","_val":"f"},{"_attr":"accm5","_val":"f"},{"_attr":"accm4","_val":"f"},{"_attr":"accm3","_val":"f"},{"_attr":"accm2","_val":"f"},{"_attr":"accm1","_val":"f"}]');
INSERT INTO config.composite_attr_entry_definition (coded_value, definition) VALUES (719, '[{"_attr":"accm6","_val":"g"},{"_attr":"accm5","_val":"g"},{"_attr":"accm4","_val":"g"},{"_attr":"accm3","_val":"g"},{"_attr":"accm2","_val":"g"},{"_attr":"accm1","_val":"g"}]');
INSERT INTO config.composite_attr_entry_definition (coded_value, definition) VALUES (720, '[{"_attr":"accm6","_val":"h"},{"_attr":"accm5","_val":"h"},{"_attr":"accm4","_val":"h"},{"_attr":"accm3","_val":"h"},{"_attr":"accm2","_val":"h"},{"_attr":"accm1","_val":"h"}]');
INSERT INTO config.composite_attr_entry_definition (coded_value, definition) VALUES (721, '[{"_attr":"accm6","_val":"i"},{"_attr":"accm5","_val":"i"},{"_attr":"accm4","_val":"i"},{"_attr":"accm3","_val":"i"},{"_attr":"accm2","_val":"i"},{"_attr":"accm1","_val":"i"}]');
INSERT INTO config.composite_attr_entry_definition (coded_value, definition) VALUES (722, '[{"_attr":"accm6","_val":"k"},{"_attr":"accm5","_val":"k"},{"_attr":"accm4","_val":"k"},{"_attr":"accm3","_val":"k"},{"_attr":"accm2","_val":"k"},{"_attr":"accm1","_val":"k"}]');
INSERT INTO config.composite_attr_entry_definition (coded_value, definition) VALUES (723, '[{"_attr":"accm6","_val":"r"},{"_attr":"accm5","_val":"r"},{"_attr":"accm4","_val":"r"},{"_attr":"accm3","_val":"r"},{"_attr":"accm2","_val":"r"},{"_attr":"accm1","_val":"r"}]');
INSERT INTO config.composite_attr_entry_definition (coded_value, definition) VALUES (724, '[{"_attr":"accm6","_val":"s"},{"_attr":"accm5","_val":"s"},{"_attr":"accm4","_val":"s"},{"_attr":"accm3","_val":"s"},{"_attr":"accm2","_val":"s"},{"_attr":"accm1","_val":"s"}]');
INSERT INTO config.composite_attr_entry_definition (coded_value, definition) VALUES (725, '[{"_attr":"accm6","_val":"z"},{"_attr":"accm5","_val":"z"},{"_attr":"accm4","_val":"z"},{"_attr":"accm3","_val":"z"},{"_attr":"accm2","_val":"z"},{"_attr":"accm1","_val":"z"}]');

-- Nature of Contents
INSERT INTO config.composite_attr_entry_definition (coded_value, definition) VALUES (835, '{"_attr":"cont1","_val":" "}');
INSERT INTO config.composite_attr_entry_definition (coded_value, definition) VALUES (836, '[{"_attr":"cont4","_val":"a"},{"_attr":"cont3","_val":"a"},{"_attr":"cont2","_val":"a"},{"_attr":"cont1","_val":"a"}]');
INSERT INTO config.composite_attr_entry_definition (coded_value, definition) VALUES (837, '[{"_attr":"cont4","_val":"b"},{"_attr":"cont3","_val":"b"},{"_attr":"cont2","_val":"b"},{"_attr":"cont1","_val":"b"}]');
INSERT INTO config.composite_attr_entry_definition (coded_value, definition) VALUES (838, '[{"_attr":"cont4","_val":"c"},{"_attr":"cont3","_val":"c"},{"_attr":"cont2","_val":"c"},{"_attr":"cont1","_val":"c"}]');
INSERT INTO config.composite_attr_entry_definition (coded_value, definition) VALUES (839, '[{"_attr":"cont4","_val":"d"},{"_attr":"cont3","_val":"d"},{"_attr":"cont2","_val":"d"},{"_attr":"cont1","_val":"d"}]');
INSERT INTO config.composite_attr_entry_definition (coded_value, definition) VALUES (840, '[{"_attr":"cont4","_val":"e"},{"_attr":"cont3","_val":"e"},{"_attr":"cont2","_val":"e"},{"_attr":"cont1","_val":"e"}]');
INSERT INTO config.composite_attr_entry_definition (coded_value, definition) VALUES (841, '[{"_attr":"cont4","_val":"f"},{"_attr":"cont3","_val":"f"},{"_attr":"cont2","_val":"f"},{"_attr":"cont1","_val":"f"}]');
INSERT INTO config.composite_attr_entry_definition (coded_value, definition) VALUES (842, '[{"_attr":"cont4","_val":"g"},{"_attr":"cont3","_val":"g"},{"_attr":"cont2","_val":"g"},{"_attr":"cont1","_val":"g"}]');
INSERT INTO config.composite_attr_entry_definition (coded_value, definition) VALUES (843, '[{"_attr":"cont4","_val":"h"},{"_attr":"cont3","_val":"h"},{"_attr":"cont2","_val":"h"},{"_attr":"cont1","_val":"h"}]');
INSERT INTO config.composite_attr_entry_definition (coded_value, definition) VALUES (844, '[{"_attr":"cont4","_val":"i"},{"_attr":"cont3","_val":"i"},{"_attr":"cont2","_val":"i"},{"_attr":"cont1","_val":"i"}]');
INSERT INTO config.composite_attr_entry_definition (coded_value, definition) VALUES (845, '[{"_attr":"cont4","_val":"j"},{"_attr":"cont3","_val":"j"},{"_attr":"cont2","_val":"j"},{"_attr":"cont1","_val":"j"}]');
INSERT INTO config.composite_attr_entry_definition (coded_value, definition) VALUES (846, '[{"_attr":"cont4","_val":"k"},{"_attr":"cont3","_val":"k"},{"_attr":"cont2","_val":"k"},{"_attr":"cont1","_val":"k"}]');
INSERT INTO config.composite_attr_entry_definition (coded_value, definition) VALUES (847, '[{"_attr":"cont4","_val":"l"},{"_attr":"cont3","_val":"l"},{"_attr":"cont2","_val":"l"},{"_attr":"cont1","_val":"l"}]');
INSERT INTO config.composite_attr_entry_definition (coded_value, definition) VALUES (848, '[{"_attr":"cont4","_val":"m"},{"_attr":"cont3","_val":"m"},{"_attr":"cont2","_val":"m"},{"_attr":"cont1","_val":"m"}]');
INSERT INTO config.composite_attr_entry_definition (coded_value, definition) VALUES (849, '[{"_attr":"cont4","_val":"n"},{"_attr":"cont3","_val":"n"},{"_attr":"cont2","_val":"n"},{"_attr":"cont1","_val":"n"}]');
INSERT INTO config.composite_attr_entry_definition (coded_value, definition) VALUES (850, '[{"_attr":"cont4","_val":"o"},{"_attr":"cont3","_val":"o"},{"_attr":"cont2","_val":"o"},{"_attr":"cont1","_val":"o"}]');
INSERT INTO config.composite_attr_entry_definition (coded_value, definition) VALUES (851, '[{"_attr":"cont4","_val":"p"},{"_attr":"cont3","_val":"p"},{"_attr":"cont2","_val":"p"},{"_attr":"cont1","_val":"p"}]');
INSERT INTO config.composite_attr_entry_definition (coded_value, definition) VALUES (852, '[{"_attr":"cont4","_val":"q"},{"_attr":"cont3","_val":"q"},{"_attr":"cont2","_val":"q"},{"_attr":"cont1","_val":"q"}]');
INSERT INTO config.composite_attr_entry_definition (coded_value, definition) VALUES (853, '[{"_attr":"cont4","_val":"r"},{"_attr":"cont3","_val":"r"},{"_attr":"cont2","_val":"r"},{"_attr":"cont1","_val":"r"}]');
INSERT INTO config.composite_attr_entry_definition (coded_value, definition) VALUES (854, '[{"_attr":"cont4","_val":"s"},{"_attr":"cont3","_val":"s"},{"_attr":"cont2","_val":"s"},{"_attr":"cont1","_val":"s"}]');
INSERT INTO config.composite_attr_entry_definition (coded_value, definition) VALUES (855, '[{"_attr":"cont4","_val":"t"},{"_attr":"cont3","_val":"t"},{"_attr":"cont2","_val":"t"},{"_attr":"cont1","_val":"t"}]');
INSERT INTO config.composite_attr_entry_definition (coded_value, definition) VALUES (856, '[{"_attr":"cont4","_val":"u"},{"_attr":"cont3","_val":"u"},{"_attr":"cont2","_val":"u"},{"_attr":"cont1","_val":"u"}]');
INSERT INTO config.composite_attr_entry_definition (coded_value, definition) VALUES (857, '[{"_attr":"cont4","_val":"v"},{"_attr":"cont3","_val":"v"},{"_attr":"cont2","_val":"v"},{"_attr":"cont1","_val":"v"}]');
INSERT INTO config.composite_attr_entry_definition (coded_value, definition) VALUES (858, '[{"_attr":"cont4","_val":"w"},{"_attr":"cont3","_val":"w"},{"_attr":"cont2","_val":"w"},{"_attr":"cont1","_val":"w"}]');
INSERT INTO config.composite_attr_entry_definition (coded_value, definition) VALUES (859, '[{"_attr":"cont4","_val":"x"},{"_attr":"cont3","_val":"x"},{"_attr":"cont2","_val":"x"},{"_attr":"cont1","_val":"x"}]');
INSERT INTO config.composite_attr_entry_definition (coded_value, definition) VALUES (860, '[{"_attr":"cont4","_val":"y"},{"_attr":"cont3","_val":"y"},{"_attr":"cont2","_val":"y"},{"_attr":"cont1","_val":"y"}]');
INSERT INTO config.composite_attr_entry_definition (coded_value, definition) VALUES (861, '[{"_attr":"cont4","_val":"z"},{"_attr":"cont3","_val":"z"},{"_attr":"cont2","_val":"z"},{"_attr":"cont1","_val":"z"}]');
INSERT INTO config.composite_attr_entry_definition (coded_value, definition) VALUES (862, '[{"_attr":"cont4","_val":"2"},{"_attr":"cont3","_val":"2"},{"_attr":"cont2","_val":"2"},{"_attr":"cont1","_val":"2"}]');
INSERT INTO config.composite_attr_entry_definition (coded_value, definition) VALUES (863, '[{"_attr":"cont4","_val":"5"},{"_attr":"cont3","_val":"5"},{"_attr":"cont2","_val":"5"},{"_attr":"cont1","_val":"5"}]');
INSERT INTO config.composite_attr_entry_definition (coded_value, definition) VALUES (864, '[{"_attr":"cont4","_val":"6"},{"_attr":"cont3","_val":"6"},{"_attr":"cont2","_val":"6"},{"_attr":"cont1","_val":"6"}]');

-- Literary Text for Sound Recordings
INSERT INTO config.composite_attr_entry_definition (coded_value, definition) VALUES (881, '{"_attr":"ltxt1","_val":" "}');
INSERT INTO config.composite_attr_entry_definition (coded_value, definition) VALUES (882, '[{"_attr":"ltxt2","_val":"a"},{"_attr":"ltxt1","_val":"a"}]');
INSERT INTO config.composite_attr_entry_definition (coded_value, definition) VALUES (883, '[{"_attr":"ltxt2","_val":"b"},{"_attr":"ltxt1","_val":"b"}]');
INSERT INTO config.composite_attr_entry_definition (coded_value, definition) VALUES (884, '[{"_attr":"ltxt2","_val":"c"},{"_attr":"ltxt1","_val":"c"}]');
INSERT INTO config.composite_attr_entry_definition (coded_value, definition) VALUES (885, '[{"_attr":"ltxt2","_val":"d"},{"_attr":"ltxt1","_val":"d"}]');
INSERT INTO config.composite_attr_entry_definition (coded_value, definition) VALUES (886, '[{"_attr":"ltxt2","_val":"e"},{"_attr":"ltxt1","_val":"e"}]');
INSERT INTO config.composite_attr_entry_definition (coded_value, definition) VALUES (887, '[{"_attr":"ltxt2","_val":"f"},{"_attr":"ltxt1","_val":"f"}]');
INSERT INTO config.composite_attr_entry_definition (coded_value, definition) VALUES (888, '[{"_attr":"ltxt2","_val":"g"},{"_attr":"ltxt1","_val":"g"}]');
INSERT INTO config.composite_attr_entry_definition (coded_value, definition) VALUES (889, '[{"_attr":"ltxt2","_val":"h"},{"_attr":"ltxt1","_val":"h"}]');
INSERT INTO config.composite_attr_entry_definition (coded_value, definition) VALUES (890, '[{"_attr":"ltxt2","_val":"i"},{"_attr":"ltxt1","_val":"i"}]');
INSERT INTO config.composite_attr_entry_definition (coded_value, definition) VALUES (891, '[{"_attr":"ltxt2","_val":"j"},{"_attr":"ltxt1","_val":"j"}]');
INSERT INTO config.composite_attr_entry_definition (coded_value, definition) VALUES (892, '[{"_attr":"ltxt2","_val":"k"},{"_attr":"ltxt1","_val":"k"}]');
INSERT INTO config.composite_attr_entry_definition (coded_value, definition) VALUES (893, '[{"_attr":"ltxt2","_val":"l"},{"_attr":"ltxt1","_val":"l"}]');
INSERT INTO config.composite_attr_entry_definition (coded_value, definition) VALUES (894, '[{"_attr":"ltxt2","_val":"m"},{"_attr":"ltxt1","_val":"m"}]');
INSERT INTO config.composite_attr_entry_definition (coded_value, definition) VALUES (895, '[{"_attr":"ltxt2","_val":"n"},{"_attr":"ltxt1","_val":"n"}]');
INSERT INTO config.composite_attr_entry_definition (coded_value, definition) VALUES (896, '[{"_attr":"ltxt2","_val":"o"},{"_attr":"ltxt1","_val":"o"}]');
INSERT INTO config.composite_attr_entry_definition (coded_value, definition) VALUES (897, '[{"_attr":"ltxt2","_val":"p"},{"_attr":"ltxt1","_val":"p"}]');
INSERT INTO config.composite_attr_entry_definition (coded_value, definition) VALUES (898, '[{"_attr":"ltxt2","_val":"r"},{"_attr":"ltxt1","_val":"r"}]');
INSERT INTO config.composite_attr_entry_definition (coded_value, definition) VALUES (899, '[{"_attr":"ltxt2","_val":"s"},{"_attr":"ltxt1","_val":"s"}]');
INSERT INTO config.composite_attr_entry_definition (coded_value, definition) VALUES (900, '[{"_attr":"ltxt2","_val":"t"},{"_attr":"ltxt1","_val":"t"}]');
INSERT INTO config.composite_attr_entry_definition (coded_value, definition) VALUES (901, '[{"_attr":"ltxt2","_val":"z"},{"_attr":"ltxt1","_val":"z"}]');

-- Relief
INSERT INTO config.composite_attr_entry_definition (coded_value, definition) VALUES (965, '{"_attr":"relf1","_val":" "}');
INSERT INTO config.composite_attr_entry_definition (coded_value, definition) VALUES (966, '[{"_attr":"relf4","_val":"a"},{"_attr":"relf3","_val":"a"},{"_attr":"relf2","_val":"a"},{"_attr":"relf1","_val":"a"}]');
INSERT INTO config.composite_attr_entry_definition (coded_value, definition) VALUES (967, '[{"_attr":"relf4","_val":"b"},{"_attr":"relf3","_val":"b"},{"_attr":"relf2","_val":"b"},{"_attr":"relf1","_val":"b"}]');
INSERT INTO config.composite_attr_entry_definition (coded_value, definition) VALUES (968, '[{"_attr":"relf4","_val":"c"},{"_attr":"relf3","_val":"c"},{"_attr":"relf2","_val":"c"},{"_attr":"relf1","_val":"c"}]');
INSERT INTO config.composite_attr_entry_definition (coded_value, definition) VALUES (969, '[{"_attr":"relf4","_val":"d"},{"_attr":"relf3","_val":"d"},{"_attr":"relf2","_val":"d"},{"_attr":"relf1","_val":"d"}]');
INSERT INTO config.composite_attr_entry_definition (coded_value, definition) VALUES (970, '[{"_attr":"relf4","_val":"e"},{"_attr":"relf3","_val":"e"},{"_attr":"relf2","_val":"e"},{"_attr":"relf1","_val":"e"}]');
INSERT INTO config.composite_attr_entry_definition (coded_value, definition) VALUES (971, '[{"_attr":"relf4","_val":"f"},{"_attr":"relf3","_val":"f"},{"_attr":"relf2","_val":"f"},{"_attr":"relf1","_val":"f"}]');
INSERT INTO config.composite_attr_entry_definition (coded_value, definition) VALUES (972, '[{"_attr":"relf4","_val":"g"},{"_attr":"relf3","_val":"g"},{"_attr":"relf2","_val":"g"},{"_attr":"relf1","_val":"g"}]');
INSERT INTO config.composite_attr_entry_definition (coded_value, definition) VALUES (973, '[{"_attr":"relf4","_val":"i"},{"_attr":"relf3","_val":"i"},{"_attr":"relf2","_val":"i"},{"_attr":"relf1","_val":"i"}]');
INSERT INTO config.composite_attr_entry_definition (coded_value, definition) VALUES (974, '[{"_attr":"relf4","_val":"j"},{"_attr":"relf3","_val":"j"},{"_attr":"relf2","_val":"j"},{"_attr":"relf1","_val":"j"}]');
INSERT INTO config.composite_attr_entry_definition (coded_value, definition) VALUES (975, '[{"_attr":"relf4","_val":"k"},{"_attr":"relf3","_val":"k"},{"_attr":"relf2","_val":"k"},{"_attr":"relf1","_val":"k"}]');
INSERT INTO config.composite_attr_entry_definition (coded_value, definition) VALUES (976, '[{"_attr":"relf4","_val":"m"},{"_attr":"relf3","_val":"m"},{"_attr":"relf2","_val":"m"},{"_attr":"relf1","_val":"m"}]');
INSERT INTO config.composite_attr_entry_definition (coded_value, definition) VALUES (977, '[{"_attr":"relf4","_val":"z"},{"_attr":"relf3","_val":"z"},{"_attr":"relf2","_val":"z"},{"_attr":"relf1","_val":"z"}]');

-- Special Format Characteristics
INSERT INTO config.composite_attr_entry_definition (coded_value, definition) VALUES (978, '{"_attr":"spfm1","_val":" "}');
INSERT INTO config.composite_attr_entry_definition (coded_value, definition) VALUES (979, '[{"_attr":"spfm2","_val":"e"},{"_attr":"spfm1","_val":"e"}]');
INSERT INTO config.composite_attr_entry_definition (coded_value, definition) VALUES (980, '[{"_attr":"spfm2","_val":"j"},{"_attr":"spfm1","_val":"j"}]');
INSERT INTO config.composite_attr_entry_definition (coded_value, definition) VALUES (981, '[{"_attr":"spfm2","_val":"k"},{"_attr":"spfm1","_val":"k"}]');
INSERT INTO config.composite_attr_entry_definition (coded_value, definition) VALUES (982, '[{"_attr":"spfm2","_val":"l"},{"_attr":"spfm1","_val":"l"}]');
INSERT INTO config.composite_attr_entry_definition (coded_value, definition) VALUES (983, '[{"_attr":"spfm2","_val":"n"},{"_attr":"spfm1","_val":"n"}]');
INSERT INTO config.composite_attr_entry_definition (coded_value, definition) VALUES (984, '[{"_attr":"spfm2","_val":"o"},{"_attr":"spfm1","_val":"o"}]');
INSERT INTO config.composite_attr_entry_definition (coded_value, definition) VALUES (985, '[{"_attr":"spfm2","_val":"p"},{"_attr":"spfm1","_val":"p"}]');
INSERT INTO config.composite_attr_entry_definition (coded_value, definition) VALUES (986, '[{"_attr":"spfm2","_val":"r"},{"_attr":"spfm1","_val":"r"}]');
INSERT INTO config.composite_attr_entry_definition (coded_value, definition) VALUES (987, '[{"_attr":"spfm2","_val":"z"},{"_attr":"spfm1","_val":"z"}]');

-- Illustrations
INSERT INTO config.composite_attr_entry_definition (coded_value, definition) VALUES (1658, '{"_attr":"ills1","_val":" "}');
INSERT INTO config.composite_attr_entry_definition (coded_value, definition) VALUES (1659, '[{"_attr":"ills4","_val":"a"},{"_attr":"ills3","_val":"a"},{"_attr":"ills2","_val":"a"},{"_attr":"ills1","_val":"a"}]');
INSERT INTO config.composite_attr_entry_definition (coded_value, definition) VALUES (1660, '[{"_attr":"ills4","_val":"b"},{"_attr":"ills3","_val":"b"},{"_attr":"ills2","_val":"b"},{"_attr":"ills1","_val":"b"}]');
INSERT INTO config.composite_attr_entry_definition (coded_value, definition) VALUES (1661, '[{"_attr":"ills4","_val":"c"},{"_attr":"ills3","_val":"c"},{"_attr":"ills2","_val":"c"},{"_attr":"ills1","_val":"c"}]');
INSERT INTO config.composite_attr_entry_definition (coded_value, definition) VALUES (1662, '[{"_attr":"ills4","_val":"d"},{"_attr":"ills3","_val":"d"},{"_attr":"ills2","_val":"d"},{"_attr":"ills1","_val":"d"}]');
INSERT INTO config.composite_attr_entry_definition (coded_value, definition) VALUES (1663, '[{"_attr":"ills4","_val":"e"},{"_attr":"ills3","_val":"e"},{"_attr":"ills2","_val":"e"},{"_attr":"ills1","_val":"e"}]');
INSERT INTO config.composite_attr_entry_definition (coded_value, definition) VALUES (1664, '[{"_attr":"ills4","_val":"f"},{"_attr":"ills3","_val":"f"},{"_attr":"ills2","_val":"f"},{"_attr":"ills1","_val":"f"}]');
INSERT INTO config.composite_attr_entry_definition (coded_value, definition) VALUES (1665, '[{"_attr":"ills4","_val":"g"},{"_attr":"ills3","_val":"g"},{"_attr":"ills2","_val":"g"},{"_attr":"ills1","_val":"g"}]');
INSERT INTO config.composite_attr_entry_definition (coded_value, definition) VALUES (1666, '[{"_attr":"ills4","_val":"h"},{"_attr":"ills3","_val":"h"},{"_attr":"ills2","_val":"h"},{"_attr":"ills1","_val":"h"}]');
INSERT INTO config.composite_attr_entry_definition (coded_value, definition) VALUES (1667, '[{"_attr":"ills4","_val":"i"},{"_attr":"ills3","_val":"i"},{"_attr":"ills2","_val":"i"},{"_attr":"ills1","_val":"i"}]');
INSERT INTO config.composite_attr_entry_definition (coded_value, definition) VALUES (1668, '[{"_attr":"ills4","_val":"j"},{"_attr":"ills3","_val":"j"},{"_attr":"ills2","_val":"j"},{"_attr":"ills1","_val":"j"}]');
INSERT INTO config.composite_attr_entry_definition (coded_value, definition) VALUES (1669, '[{"_attr":"ills4","_val":"k"},{"_attr":"ills3","_val":"k"},{"_attr":"ills2","_val":"k"},{"_attr":"ills1","_val":"k"}]');
INSERT INTO config.composite_attr_entry_definition (coded_value, definition) VALUES (1670, '[{"_attr":"ills4","_val":"l"},{"_attr":"ills3","_val":"l"},{"_attr":"ills2","_val":"l"},{"_attr":"ills1","_val":"l"}]');
INSERT INTO config.composite_attr_entry_definition (coded_value, definition) VALUES (1671, '[{"_attr":"ills4","_val":"m"},{"_attr":"ills3","_val":"m"},{"_attr":"ills2","_val":"m"},{"_attr":"ills1","_val":"m"}]');
INSERT INTO config.composite_attr_entry_definition (coded_value, definition) VALUES (1672, '[{"_attr":"ills4","_val":"o"},{"_attr":"ills3","_val":"o"},{"_attr":"ills2","_val":"o"},{"_attr":"ills1","_val":"o"}]');
INSERT INTO config.composite_attr_entry_definition (coded_value, definition) VALUES (1673, '[{"_attr":"ills4","_val":"p"},{"_attr":"ills3","_val":"p"},{"_attr":"ills2","_val":"p"},{"_attr":"ills1","_val":"p"}]');



-- Trigger Event Definitions -------------------------------------------------

-- Sample Overdue Notice --

INSERT INTO action_trigger.event_definition (id, active, owner, name, hook, validator, reactor, delay, delay_field, group_field, max_delay, template) 
    VALUES (1, 'f', 1, '7 Day Overdue Email Notification', 'checkout.due', 'CircIsOverdue', 'SendEmail', '7 days', 'due_date', 'usr', '8 days', 
$$
[%- USE date -%]
[%- user = target.0.usr -%]
To: [%- params.recipient_email || user.email %]
From: [%- params.sender_email || default_sender %]
Date: [%- date.format(date.now, '%a, %d %b %Y %T -0000', gmt => 1) %]
Subject: Overdue Notification
Auto-Submitted: auto-generated

Dear [% user.family_name %], [% user.first_given_name %]
Our records indicate the following items are overdue.

[% FOR circ IN target %]
    [%- copy_details = helpers.get_copy_bib_basics(circ.target_copy.id) -%]
    Title: [% copy_details.title %]
    Author: [% copy_details.author %]
    Call Number: [% circ.target_copy.call_number.label %]
    Barcode: [% circ.target_copy.barcode %]
    Due: [% date.format(helpers.format_date(circ.due_date), '%Y-%m-%d') %]
    Item Cost: [% helpers.get_copy_price(circ.target_copy) %]
    Total Owed For Transaction: [% circ.billable_transaction.summary.balance_owed %]
    Library: [% circ.circ_lib.name %]

[% END %]

$$);

INSERT INTO action_trigger.environment (event_def, path) VALUES 
    (1, 'target_copy.call_number'),
    (1, 'target_copy.location'),
    (1, 'usr'),
    (1, 'billable_transaction.summary'),
    (1, 'circ_lib.billing_address');

-- Sample Mark Long-Overdue Item Lost --

INSERT INTO action_trigger.event_definition (id, active, owner, name, hook, validator, reactor, delay, delay_field) 
    VALUES (2, 'f', 1, '90 Day Overdue Mark Lost', 'checkout.due', 'CircIsOverdue', 'MarkItemLost', '90 days', 'due_date');

INSERT INTO action_trigger.event_params (event_def, param, value) VALUES
    (2, 'editor', '''1''');

-- Sample Auto Mark Lost Notice --

INSERT INTO action_trigger.event_definition (id, active, owner, name, hook, validator, reactor, group_field, template) 
    VALUES (3, 'f', 1, '90 Day Overdue Mark Lost Notice', 'lost.auto', 'NOOP_True', 'SendEmail', 'usr',
$$
[%- USE date -%]
[%- user = target.0.usr -%]
To: [%- params.recipient_email || user.email %]
From: [%- params.sender_email || default_sender %]
Date: [%- date.format(date.now, '%a, %d %b %Y %T -0000', gmt => 1) %]
Subject: Overdue Items Marked Lost
Auto-Submitted: auto-generated

Dear [% user.family_name %], [% user.first_given_name %]
The following items are 90 days overdue and have been marked LOST.

[% FOR circ IN target %]
    [%- copy_details = helpers.get_copy_bib_basics(circ.target_copy.id) -%]
    Title: [% copy_details.title %], by [% copy_details.author %]
    Call Number: [% circ.target_copy.call_number.label %]
    Shelving Location: [% circ.target_copy.location.name %]
    Barcode: [% circ.target_copy.barcode %]
    Due: [% date.format(helpers.format_date(circ.due_date), '%Y-%m-%d') %]
    Item Cost: [% helpers.get_copy_price(circ.target_copy) %]
    Total Owed For Transaction: [% circ.billable_transaction.summary.balance_owed %]
    Library: [% circ.circ_lib.name %]

[% END %]

$$);


INSERT INTO action_trigger.environment (event_def, path) VALUES 
    (3, 'target_copy.call_number'),
    (3, 'usr'),
    (3, 'billable_transaction.summary'),
    (3, 'circ_lib.billing_address'),
    (3, 'target_copy.location');


-- Sample Purchase Order HTML Template --

INSERT INTO action_trigger.event_definition (id, active, owner, name, hook, validator, reactor, template) 
    VALUES (4, 't', 1, 'PO HTML', 'format.po.html', 'NOOP_True', 'ProcessTemplate', 
$$
[%- USE date -%]
[%-
    # find a lineitem attribute by name and optional type
    BLOCK get_li_attr;
        FOR attr IN li.attributes;
            IF attr.attr_name == attr_name;
                IF !attr_type OR attr_type == attr.attr_type;
                    attr.attr_value;
                    LAST;
                END;
            END;
        END;
    END
-%]

<h2>Purchase Order: [% target.name %] ([% target.id %])</h2>
<br/>
date <b>[% date.format(date.now, '%Y%m%d') %]</b>
<br/>

<style>
    table td { padding:5px; border:1px solid #aaa;}
    table { width:95%; border-collapse:collapse; }
    #vendor-notes { padding:5px; border:1px solid #aaa; }
</style>
<table id='vendor-table'>
  <tr>
    <td valign='top'>Vendor</td>
    <td>
      <div>[% target.provider.name %]</div>
      <div>[% target.provider.addresses.0.street1 %]</div>
      <div>[% target.provider.addresses.0.street2 %]</div>
      <div>[% target.provider.addresses.0.city %]</div>
      <div>[% target.provider.addresses.0.state %]</div>
      <div>[% target.provider.addresses.0.country %]</div>
      <div>[% target.provider.addresses.0.post_code %]</div>
    </td>
    <td valign='top'>Ship to / Bill to</td>
    <td>
      <div>[% target.ordering_agency.name %]</div>
      <div>[% target.ordering_agency.billing_address.street1 %]</div>
      <div>[% target.ordering_agency.billing_address.street2 %]</div>
      <div>[% target.ordering_agency.billing_address.city %]</div>
      <div>[% target.ordering_agency.billing_address.state %]</div>
      <div>[% target.ordering_agency.billing_address.country %]</div>
      <div>[% target.ordering_agency.billing_address.post_code %]</div>
    </td>
  </tr>
</table>

<br/><br/>
<fieldset id='vendor-notes'>
    <legend>Notes to the Vendor</legend>
    <ul>
    [% FOR note IN target.notes %]
        [% IF note.vendor_public == 't' %]
            <li>[% note.value %]</li>
        [% END %]
    [% END %]
    </ul>
</fieldset>
<br/><br/>

<table>
  <thead>
    <tr>
      <th>PO#</th>
      <th>ISBN or Item #</th>
      <th>Title</th>
      <th>Quantity</th>
      <th>Unit Price</th>
      <th>Line Total</th>
      <th>Delayed / Canceled</th>
      <th>Notes</th>
    </tr>
  </thead>
  <tbody>

  [% subtotal = 0 %]
  [% FOR li IN target.lineitems %]

  <tr>
    [% count = li.lineitem_details.size %]
    [% price = li.estimated_unit_price %]
    [% litotal = (price * count) %]
    [% subtotal = subtotal + litotal %]
    [% 
        ident_attr = helpers.get_li_order_ident(li.attributes);
        SET ident_value = ident_attr.attr_value IF ident_attr;
    %]
    <td>[% target.id %]</td>
    <td>[% ident_value %]</td>
    <td>[% PROCESS get_li_attr attr_name = 'title' %]</td>
    <td>[% count %]</td>
    <td>[% price %]</td>
    <td>[% litotal %]</td>
    <td>[% li.cancel_reason.label %]</td>
    <td>
        <ul>
        [% FOR note IN li.lineitem_notes %]
            [% IF note.vendor_public == 't' %]
                <li>[% note.value %]</li>
            [% END %]
        [% END %]
        </ul>
    </td>
  </tr>
  [% END %]
  <tr>
    <td/><td/><td/><td/>
    <td>Subtotal</td>
    <td>[% subtotal %]</td>
  </tr>
  </tbody>
</table>

<br/>

Total Line Item Count: [% target.lineitems.size %]
$$);

INSERT INTO action_trigger.environment (event_def, path) VALUES 
    (4, 'lineitems.lineitem_details.fund'),
    (4, 'lineitems.lineitem_details.location'),
    (4, 'lineitems.lineitem_details.owning_lib'),
    (4, 'ordering_agency.mailing_address'),
    (4, 'ordering_agency.billing_address'),
    (4, 'provider.addresses'),
    (4, 'lineitems.attributes'),
    (4, 'lineitems.cancel_reason'),
    (4, 'lineitems.lineitem_notes'),
    (4, 'notes');

INSERT INTO action_trigger.cleanup ( module, description ) VALUES (
    'CreateHoldNotification',
    oils_i18n_gettext(
        'CreateHoldNotification',
        'Creates a hold_notification record for each notified hold',
        'atclean',
        'description'
    )
);

INSERT INTO action_trigger.event_definition (id, active, owner, name, hook, validator, reactor, delay, delay_field, group_field, cleanup_success, template)
    VALUES (5, 'f', 1, 'Hold Ready for Pickup Email Notification', 'hold.available', 'HoldIsAvailable', 'SendEmail', '30 minutes', 'shelf_time', 'usr', 'CreateHoldNotification',
$$
[%- USE date -%]
[%- user = target.0.usr -%]
To: [%- params.recipient_email || user.email %]
From: [%- params.sender_email || default_sender %]
Date: [%- date.format(date.now, '%a, %d %b %Y %T -0000', gmt => 1) %]
Subject: Hold Available Notification
Auto-Submitted: auto-generated

Dear [% user.family_name %], [% user.first_given_name %]
The item(s) you requested are available for pickup from the Library.

[% FOR hold IN target %]
    [%- copy_details = helpers.get_copy_bib_basics(hold.current_copy.id) -%]
    Title: [% copy_details.title %]
    Author: [% copy_details.author %]
    Call Number: [% hold.current_copy.call_number.label %]
    Barcode: [% hold.current_copy.barcode %]
    Library: [% hold.pickup_lib.name %]
[% END %]

$$);

INSERT INTO action_trigger.event_params (event_def, param, value)
    VALUES (5, 'check_email_notify', 1);

INSERT INTO action_trigger.hook (
        key,
        core_type,
        description,
        passive
    ) VALUES (
        'hold_request.shelf_expires_soon',
        'ahr',
        'A hold on the shelf will expire there soon.',
        TRUE
    );

INSERT INTO action_trigger.environment (event_def, path) VALUES
    (5, 'current_copy.call_number'),
    (5, 'usr'),
    (5, 'pickup_lib.billing_address');


INSERT INTO action_trigger.event_definition (
        id,
        active,
        owner,
        name,
        hook,
        validator,
        reactor,
        delay,
        delay_field,
        group_field,
        template
    ) VALUES (
        7,
        FALSE,
        1,
        'Hold Expires from Shelf Soon',
        'hold_request.shelf_expires_soon',
        'HoldIsAvailable',
        'SendEmail',
        '- 1 DAY',
        'shelf_expire_time',
        'usr',
$$
[%- USE date -%]
[%- user = target.0.usr -%]
To: [%- params.recipient_email || user.email %]
From: [%- params.sender_email || default_sender %]
Date: [%- date.format(date.now, '%a, %d %b %Y %T -0000', gmt => 1) %]
Subject: Hold Available Notification
Auto-Submitted: auto-generated

Dear [% user.family_name %], [% user.first_given_name %]
You requested holds on the following item(s), which are available for
pickup, but these holds will soon expire.

[% FOR hold IN target %]
    [%- data = helpers.get_copy_bib_basics(hold.current_copy.id) -%]
    Title: [% data.title %]
    Author: [% data.author %]
    Library: [% hold.pickup_lib.name %]
[% END %]
$$
);

INSERT INTO action_trigger.event_params (event_def, param, value)
    VALUES (7, 'check_email_notify', 1);

INSERT INTO action_trigger.environment (
        event_def,
        path
    ) VALUES
    ( 7, 'current_copy'),
    ( 7, 'pickup_lib.billing_address'),
    ( 7, 'usr');

-- long wait hold request notifications

INSERT INTO action_trigger.hook (
        key,
        core_type,
        description,
        passive
    ) VALUES (
        'hold_request.long_wait',
        'ahr',
        'A patron has been waiting on a hold to be fulfilled for a long time.',
        TRUE
    );

INSERT INTO action_trigger.validator (module,description) VALUES
    ('HoldNotifyCheck',
    oils_i18n_gettext(
        'HoldNotifyCheck',
        'Check Hold notification flag(s)',
        'atval',
        'description'
    ));

INSERT INTO action_trigger.event_definition (
        id,
        active,
        owner,
        name,
        hook,
        validator,
        reactor,
        delay,
        delay_field,
        group_field,
        template
    ) VALUES (
        9,
        FALSE,
        1,
        'Hold waiting for pickup for long time',
        'hold_request.long_wait',
        'HoldNotifyCheck',
        'SendEmail',
        '6 MONTHS',
        'request_time',
        'usr',
$$
[%- USE date -%]
[%- user = target.0.usr -%]
To: [%- params.recipient_email || user.email %]
From: [%- params.sender_email || default_sender %]
Date: [%- date.format(date.now, '%a, %d %b %Y %T -0000', gmt => 1) %]
Subject: Long Wait Hold Notification
Auto-Submitted: auto-generated

Dear [% user.family_name %], [% user.first_given_name %]

You requested hold(s) on the following item(s), but unfortunately
we have not been able to fulfill your request after a considerable
length of time.  If you would still like to receive these items,
no action is required.

[% FOR hold IN target %]
    [%- copy_details = helpers.get_copy_bib_basics(hold.current_copy.id) -%]
    Title: [% copy_details.title %]
    Author: [% copy_details.author %]
[% END %]
$$
);

INSERT INTO action_trigger.environment (event_def, path)
    VALUES
    (9, 'pickup_lib'),
    (9, 'usr'),
    (9, 'current_copy.call_number');

INSERT INTO action_trigger.event_params (event_def, param, value)
    VALUES (9, 'check_email_notify', 1);

-- trigger data related to acq user requests

INSERT INTO action_trigger.hook (key,core_type,description,passive) VALUES (
        'aur.ordered',
        'aur', 
        oils_i18n_gettext(
            'aur.ordered',
            'A patron acquisition request has been marked On-Order.',
            'ath',
            'description'
        ), 
        TRUE
    ), (
        'aur.received', 
        'aur', 
        oils_i18n_gettext(
            'aur.received', 
            'A patron acquisition request has been marked Received.',
            'ath',
            'description'
        ),
        TRUE
    ), (
        'aur.cancelled',
        'aur',
        oils_i18n_gettext(
            'aur.cancelled',
            'A patron acquisition request has been marked Cancelled.',
            'ath',
            'description'
        ),
        TRUE
    ), (
        'aur.created',
        'aur',
        oils_i18n_gettext(
            'aur.created',
            'A patron has made an acquisitions request.',
            'ath',
            'description'
        ),
        TRUE
    ), (
        'aur.rejected',
        'aur',
        oils_i18n_gettext(
            'aur.rejected',
            'A patron acquisition request has been rejected.',
            'ath',
            'description'
        ),
        TRUE
    )
;

INSERT INTO action_trigger.validator (module,description) VALUES (
        'Acq::UserRequestOrdered',
        oils_i18n_gettext(
            'Acq::UserRequestOrdered',
            'Tests to see if the corresponding Line Item has a state of "on-order".',
            'atval',
            'description'
        )
    ), (
        'Acq::UserRequestReceived',
        oils_i18n_gettext(
            'Acq::UserRequestReceived',
            'Tests to see if the corresponding Line Item has a state of "received".',
            'atval',
            'description'
        )
    ), (
        'Acq::UserRequestCancelled',
        oils_i18n_gettext(
            'Acq::UserRequestCancelled',
            'Tests to see if the corresponding Line Item has a state of "cancelled".',
            'atval',
            'description'
        )
    )
;

INSERT INTO action_trigger.event_definition (
        id,
        active,
        owner,
        name,
        hook,
        validator,
        reactor,
        template
    ) VALUES (
        15,
        FALSE,
        1,
        'Email Notice: Patron Acquisition Request marked On-Order.',
        'aur.ordered',
        'Acq::UserRequestOrdered',
        'SendEmail',
$$
[%- USE date -%]
[%- SET li = target.lineitem; -%]
[%- SET user = target.usr -%]
[%- SET title = helpers.get_li_attr("title", "", li.attributes) -%]
[%- SET author = helpers.get_li_attr("author", "", li.attributes) -%]
[%- SET edition = helpers.get_li_attr("edition", "", li.attributes) -%]
[%- SET isbn = helpers.get_li_attr("isbn", "", li.attributes) -%]
[%- SET publisher = helpers.get_li_attr("publisher", "", li.attributes) -%]
[%- SET pubdate = helpers.get_li_attr("pubdate", "", li.attributes) -%]

To: [%- params.recipient_email || user.email %]
From: [%- params.sender_email || default_sender %]
Date: [%- date.format(date.now, '%a, %d %b %Y %T -0000', gmt => 1) %]
Subject: Acquisition Request Notification
Auto-Submitted: auto-generated

Dear [% user.family_name %], [% user.first_given_name %]
Our records indicate the following acquisition request has been placed on order.

Title: [% title %]
[% IF author %]Author: [% author %][% END %]
[% IF edition %]Edition: [% edition %][% END %]
[% IF isbn %]ISBN: [% isbn %][% END %]
[% IF publisher %]Publisher: [% publisher %][% END %]
[% IF pubdate %]Publication Date: [% pubdate %][% END %]
Lineitem ID: [% li.id %]
$$
    ), (
        16,
        FALSE,
        1,
        'Email Notice: Patron Acquisition Request marked Received.',
        'aur.received',
        'Acq::UserRequestReceived',
        'SendEmail',
$$
[%- USE date -%]
[%- SET li = target.lineitem; -%]
[%- SET user = target.usr -%]
[%- SET title = helpers.get_li_attr("title", "", li.attributes) %]
[%- SET author = helpers.get_li_attr("author", "", li.attributes) %]
[%- SET edition = helpers.get_li_attr("edition", "", li.attributes) %]
[%- SET isbn = helpers.get_li_attr("isbn", "", li.attributes) %]
[%- SET publisher = helpers.get_li_attr("publisher", "", li.attributes) -%]
[%- SET pubdate = helpers.get_li_attr("pubdate", "", li.attributes) -%]

To: [%- params.recipient_email || user.email %]
From: [%- params.sender_email || default_sender %]
Date: [%- date.format(date.now, '%a, %d %b %Y %T -0000', gmt => 1) %]
Subject: Acquisition Request Notification
Auto-Submitted: auto-generated

Dear [% user.family_name %], [% user.first_given_name %]
Our records indicate the materials for the following acquisition request have been received.

Title: [% title %]
[% IF author %]Author: [% author %][% END %]
[% IF edition %]Edition: [% edition %][% END %]
[% IF isbn %]ISBN: [% isbn %][% END %]
[% IF publisher %]Publisher: [% publisher %][% END %]
[% IF pubdate %]Publication Date: [% pubdate %][% END %]
Lineitem ID: [% li.id %]
$$
    ), (
        17,
        FALSE,
        1,
        'Email Notice: Patron Acquisition Request marked Cancelled.',
        'aur.cancelled',
        'Acq::UserRequestCancelled',
        'SendEmail',
$$
[%- USE date -%]
[%- SET li = target.lineitem; -%]
[%- SET user = target.usr -%]
[%- SET title = helpers.get_li_attr("title", "", li.attributes) %]
[%- SET author = helpers.get_li_attr("author", "", li.attributes) %]
[%- SET edition = helpers.get_li_attr("edition", "", li.attributes) %]
[%- SET isbn = helpers.get_li_attr("isbn", "", li.attributes) %]
[%- SET publisher = helpers.get_li_attr("publisher", "", li.attributes) -%]
[%- SET pubdate = helpers.get_li_attr("pubdate", "", li.attributes) -%]

To: [%- params.recipient_email || user.email %]
From: [%- params.sender_email || default_sender %]
Date: [%- date.format(date.now, '%a, %d %b %Y %T -0000', gmt => 1) %]
Subject: Acquisition Request Notification
Auto-Submitted: auto-generated

Dear [% user.family_name %], [% user.first_given_name %]
Our records indicate the following acquisition request has been cancelled.

Title: [% title %]
[% IF author %]Author: [% author %][% END %]
[% IF edition %]Edition: [% edition %][% END %]
[% IF isbn %]ISBN: [% isbn %][% END %]
[% IF publisher %]Publisher: [% publisher %][% END %]
[% IF pubdate %]Publication Date: [% pubdate %][% END %]
Lineitem ID: [% li.id %]
$$
    ), (
        18,
        FALSE,
        1,
        'Email Notice: Acquisition Request created.',
        'aur.created',
        'NOOP_True',
        'SendEmail',
$$
[%- USE date -%]
[%- SET user = target.usr -%]
[%- SET title = target.title -%]
[%- SET author = target.author -%]
[%- SET isxn = target.isxn -%]
[%- SET publisher = target.publisher -%]
[%- SET pubdate = target.pubdate -%]

To: [%- params.recipient_email || user.email %]
From: [%- params.sender_email || default_sender %]
Date: [%- date.format(date.now, '%a, %d %b %Y %T -0000', gmt => 1) %]
Subject: Acquisition Request Notification
Auto-Submitted: auto-generated

Dear [% user.family_name %], [% user.first_given_name %]
Our records indicate that you have made the following acquisition request:

Title: [% title %]
[% IF author %]Author: [% author %][% END %]
[% IF edition %]Edition: [% edition %][% END %]
[% IF isbn %]ISXN: [% isxn %][% END %]
[% IF publisher %]Publisher: [% publisher %][% END %]
[% IF pubdate %]Publication Date: [% pubdate %][% END %]
$$
    ), (
        19,
        FALSE,
        1,
        'Email Notice: Acquisition Request Rejected.',
        'aur.rejected',
        'NOOP_True',
        'SendEmail',
$$
[%- USE date -%]
[%- SET user = target.usr -%]
[%- SET title = target.title -%]
[%- SET author = target.author -%]
[%- SET isxn = target.isxn -%]
[%- SET publisher = target.publisher -%]
[%- SET pubdate = target.pubdate -%]
[%- SET cancel_reason = target.cancel_reason.description -%]

To: [%- params.recipient_email || user.email %]
From: [%- params.sender_email || default_sender %]
Date: [%- date.format(date.now, '%a, %d %b %Y %T -0000', gmt => 1) %]
Subject: Acquisition Request Notification
Auto-Submitted: auto-generated

Dear [% user.family_name %], [% user.first_given_name %]
Our records indicate the following acquisition request has been rejected for this reason: [% cancel_reason %]

Title: [% title %]
[% IF author %]Author: [% author %][% END %]
[% IF edition %]Edition: [% edition %][% END %]
[% IF isbn %]ISBN: [% isbn %][% END %]
[% IF publisher %]Publisher: [% publisher %][% END %]
[% IF pubdate %]Publication Date: [% pubdate %][% END %]
$$
    )
;

INSERT INTO action_trigger.environment (
        event_def,
        path
    ) VALUES 
        ( 15, 'lineitem' ),
        ( 15, 'lineitem.attributes' ),
        ( 15, 'usr' ),

        ( 16, 'lineitem' ),
        ( 16, 'lineitem.attributes' ),
        ( 16, 'usr' ),

        ( 17, 'lineitem' ),
        ( 17, 'lineitem.attributes' ),
        ( 17, 'usr' ),

        ( 18, 'usr' ),
        ( 19, 'usr' ),
        ( 19, 'cancel_reason' )
    ;

INSERT INTO action_trigger.hook (key,core_type,description) VALUES ('password.reset_request','aupr','Patron has requested a self-serve password reset');
INSERT INTO action_trigger.event_definition (id, active, owner, name, hook, validator, reactor, delay, template) 
    VALUES (20, 'f', 1, 'Password reset request notification', 'password.reset_request', 'NOOP_True', 'SendEmail', '00:00:01',
$$
[%- USE date -%]
[%- user = target.usr -%]
To: [%- params.recipient_email || user.email %]
From: [%- params.sender_email || user.home_ou.email || default_sender %]
Date: [%- date.format(date.now, '%a, %d %b %Y %T -0000', gmt => 1) %]
Subject: [% user.home_ou.name %]: library account password reset request
Auto-Submitted: auto-generated

You have received this message because you, or somebody else, requested a reset
of your library system password. If you did not request a reset of your library
system password, just ignore this message and your current password will
continue to work.

If you did request a reset of your library system password, please perform
the following steps to continue the process of resetting your password:

1. Open the following link in a web browser: https://[% params.hostname %]/eg/opac/password_reset/[% target.uuid %]
The browser displays a password reset form.

2. Enter your new password in the password reset form in the browser. You must
enter the password twice to ensure that you do not make a mistake. If the
passwords match, you will then be able to log in to your library system account
with the new password.

$$);
INSERT INTO action_trigger.environment ( event_def, path) VALUES
    ( 20, 'usr' );
INSERT INTO action_trigger.environment ( event_def, path) VALUES
    ( 20, 'usr.home_ou' );


INSERT INTO action_trigger.hook (key, core_type, description, passive)
    VALUES (
        'format.acqcle.html',
        'acqcle',
        'Formats claim events into a voucher',
        TRUE
    );

INSERT INTO action_trigger.event_definition (
        id, active, owner, name, hook, group_field,
        validator, reactor, granularity, template
    ) VALUES (
        21,
        TRUE,
        1,
        'Claim Voucher',
        'format.acqcle.html',
        'claim',
        'NOOP_True',
        'ProcessTemplate',
        'print-on-demand',
$$
[%- USE date -%]
[%- SET claim = target.0.claim -%]
<!-- This will need refined/prettified. -->
<div class="acq-claim-voucher">
    <h2>Claim: [% claim.id %] ([% claim.type.code %])</h2>
    <h3>Against: [%- helpers.get_li_attr("title", "", claim.lineitem_detail.lineitem.attributes) -%]</h3>
    <ul>
        [% FOR event IN target %]
        <li>
            Event type: [% event.type.code %]
            [% IF event.type.library_initiated %](Library initiated)[% END %]
            <br />
            Event date: [% event.event_date %]<br />
            Order date: [% event.claim.lineitem_detail.lineitem.purchase_order.order_date %]<br />
            Expected receive date: [% event.claim.lineitem_detail.lineitem.expected_recv_time %]<br />
            Initiated by: [% event.creator.family_name %], [% event.creator.first_given_name %] [% event.creator.second_given_name %]<br />
            Barcode: [% event.claim.lineitem_detail.barcode %]; Fund:
            [% event.claim.lineitem_detail.fund.code %]
            ([% event.claim.lineitem_detail.fund.year %])
        </li>
        [% END %]
    </ul>
</div>
$$
);

INSERT INTO action_trigger.environment (event_def, path) VALUES
    (21, 'claim'),
    (21, 'claim.type'),
    (21, 'claim.lineitem_detail'),
    (21, 'claim.lineitem_detail.fund'),
    (21, 'claim.lineitem_detail.lineitem.attributes'),
    (21, 'claim.lineitem_detail.lineitem.purchase_order'),
    (21, 'creator'),
    (21, 'type')
;


INSERT INTO action_trigger.hook (key, core_type, description, passive)
    VALUES (
        'format.acqinv.html',
        'acqinv',
        'Formats invoices into a voucher',
        TRUE
    );

INSERT INTO action_trigger.event_definition (
        id, active, owner, name, hook,
        validator, reactor, granularity, template
    ) VALUES (
        22,
        TRUE,
        1,
        'Invoice',
        'format.acqinv.html',
        'NOOP_True',
        'ProcessTemplate',
        'print-on-demand',
$$
[% FILTER collapse %]
[%- SET invoice = target -%]
<!-- This lacks general refinement -->
<div class="acq-invoice-voucher">
    <h1>Invoice</h1>
    <div>
        <strong>No.</strong> [% invoice.inv_ident %]
        [% IF invoice.inv_type %]
            / <strong>Type:</strong>[% invoice.inv_type %]
        [% END %]
    </div>
    <div>
        <dl>
            [% BLOCK ent_with_address %]
            <dt>[% ent_label %]: [% ent.name %] ([% ent.code %])</dt>
            <dd>
                [% IF ent.addresses.0 %]
                    [% SET addr = ent.addresses.0 %]
                    [% addr.street1 %]<br />
                    [% IF addr.street2 %][% addr.street2 %]<br />[% END %]
                    [% addr.city %],
                    [% IF addr.county %] [% addr.county %], [% END %]
                    [% IF addr.state %] [% addr.state %] [% END %]
                    [% IF addr.post_code %][% addr.post_code %][% END %]<br />
                    [% IF addr.country %] [% addr.country %] [% END %]
                [% END %]
                <p>
                    [% IF ent.phone %] Phone: [% ent.phone %]<br />[% END %]
                    [% IF ent.fax_phone %] Fax: [% ent.fax_phone %]<br />[% END %]
                    [% IF ent.url %] URL: [% ent.url %]<br />[% END %]
                    [% IF ent.email %] E-mail: [% ent.email %] [% END %]
                </p>
            </dd>
            [% END %]
            [% INCLUDE ent_with_address
                ent = invoice.provider
                ent_label = "Provider" %]
            [% INCLUDE ent_with_address
                ent = invoice.shipper
                ent_label = "Shipper" %]
            <dt>Receiver</dt>
            <dd>
                [% invoice.receiver.name %] ([% invoice.receiver.shortname %])
            </dd>
            <dt>Received</dt>
            <dd>
                [% helpers.format_date(invoice.recv_date) %] by
                [% invoice.recv_method %]
            </dd>
            [% IF invoice.note %]
                <dt>Note</dt>
                <dd>
                    [% invoice.note %]
                </dd>
            [% END %]
        </dl>
    </div>
    <ul>
        [% FOR entry IN invoice.entries %]
            <li>
                [% IF entry.lineitem %]
                    Title: [% helpers.get_li_attr(
                        "title", "", entry.lineitem.attributes
                    ) %]<br />
                    Author: [% helpers.get_li_attr(
                        "author", "", entry.lineitem.attributes
                    ) %]
                [% END %]
                [% IF entry.purchase_order %]
                    (PO: [% entry.purchase_order.name %])
                [% END %]<br />
                Invoice item count: [% entry.inv_item_count %]
                [% IF entry.phys_item_count %]
                    / Physical item count: [% entry.phys_item_count %]
                [% END %]
                <br />
                [% IF entry.cost_billed %]
                    Cost billed: [% entry.cost_billed %]
                    [% IF entry.billed_per_item %](per item)[% END %]
                    <br />
                [% END %]
                [% IF entry.actual_cost %]
                    Actual cost: [% entry.actual_cost %]<br />
                [% END %]
                [% IF entry.amount_paid %]
                    Amount paid: [% entry.amount_paid %]<br />
                [% END %]
                [% IF entry.note %]Note: [% entry.note %][% END %]
            </li>
        [% END %]
        [% FOR item IN invoice.items %]
            <li>
                [% IF item.inv_item_type %]
                    Item Type: [% item.inv_item_type %]<br />
                [% END %]
                [% IF item.title %]Title/Description:
                    [% item.title %]<br />
                [% END %]
                [% IF item.author %]Author: [% item.author %]<br />[% END %]
                [% IF item.purchase_order %]PO: [% item.purchase_order %]<br />[% END %]
                [% IF item.note %]Note: [% item.note %]<br />[% END %]
                [% IF item.cost_billed %]
                    Cost billed: [% item.cost_billed %]<br />
                [% END %]
                [% IF item.actual_cost %]
                    Actual cost: [% item.actual_cost %]<br />
                [% END %]
                [% IF item.amount_paid %]
                    Amount paid: [% item.amount_paid %]<br />
                [% END %]
            </li>
        [% END %]
    </ul>
    <div>
        Amounts spent per fund:
        <table>
        [% FOR blob IN user_data %]
            <tr>
                <th style="text-align: left;">[% blob.fund.code %] ([% blob.fund.year %]):</th>
                <td>$[% blob.total %]</td>
            </tr>
        [% END %]
        </table>
    </div>
</div>
[% END %]$$
);


INSERT INTO action_trigger.environment (event_def, path) VALUES
    (22, 'provider'),
    (22, 'provider.addresses'),
    (22, 'shipper'),
    (22, 'shipper.addresses'),
    (22, 'receiver'),
    (22, 'entries'),
    (22, 'entries.purchase_order'),
    (22, 'entries.lineitem'),
    (22, 'entries.lineitem.attributes'),
    (22, 'items')
;

SELECT SETVAL('action_trigger.event_definition_id_seq'::TEXT, 100);

-- Hold cancel action/trigger hooks

INSERT INTO action_trigger.hook (key,core_type,description) VALUES (
    'hold_request.cancel.expire_no_target',
    'ahr',
    'A hold is cancelled because no copies were found'
);

INSERT INTO action_trigger.hook (key,core_type,description) VALUES (
    'hold_request.cancel.expire_holds_shelf',
    'ahr',
    'A hold is cancelled because it was on the holds shelf too long'
);

INSERT INTO action_trigger.hook (key,core_type,description) VALUES (
    'hold_request.cancel.staff',
    'ahr',
    'A hold is cancelled because it was cancelled by staff'
);

INSERT INTO action_trigger.hook (key,core_type,description) VALUES (
    'hold_request.cancel.patron',
    'ahr',
    'A hold is cancelled by the patron'
);


-- in-db indexing normalizers
INSERT INTO config.index_normalizer (name, description, func, param_count) VALUES (
	'NACO Normalize',
	'Apply NACO normalization rules to the extracted text.  See http://www.loc.gov/catdir/pcc/naco/normrule-2.html for details.',
	'naco_normalize',
	0
);

INSERT INTO config.index_normalizer (name, description, func, param_count) VALUES (
	'Normalize date range',
	'Split date ranges in the form of "XXXX-YYYY" into "XXXX YYYY" for proper index.',
	'split_date_range',
	0
);

INSERT INTO config.index_normalizer (name, description, func, param_count) VALUES (
	'NACO Normalize -- retain first comma',
	'Apply NACO normalization rules to the extracted text, retaining the first comma.  See http://www.loc.gov/catdir/pcc/naco/normrule-2.html for details.',
	'naco_normalize_keep_comma',
	0
);

INSERT INTO config.index_normalizer (name, description, func, param_count) VALUES (
	'Strip Diacritics',
	'Convert text to NFD form and remove non-spacing combining marks.',
	'remove_diacritics',
	0
);

INSERT INTO config.index_normalizer (name, description, func, param_count) VALUES (
	'Remove Parenthesized Substring',
	'Remove any parenthesized substrings from the extracted text, such as the agency code preceding authority record control numbers in subfield 0.',
	'remove_paren_substring',
	0
);

INSERT INTO config.index_normalizer (name, description, func, param_count) VALUES (
	'Up-case',
	'Convert text upper case.',
	'uppercase',
	0
);

INSERT INTO config.index_normalizer (name, description, func, param_count) VALUES (
	'Down-case',
	'Convert text lower case.',
	'lowercase',
	0
);

INSERT INTO config.index_normalizer (name, description, func, param_count) VALUES (
	'Extract Dewey-like number',
	'Extract a string of numeric characters that resembles a DDC number.',
	'call_number_dewey',
	0
);

INSERT INTO config.index_normalizer (name, description, func, param_count) VALUES (
	'Left truncation',
	'Discard the specified number of characters from the left side of the string.',
	'left_trunc',
	1
);

INSERT INTO config.index_normalizer (name, description, func, param_count) VALUES (
	'Right truncation',
	'Include only the specified number of characters from the left side of the string.',
	'right_trunc',
	1
);

INSERT INTO config.index_normalizer (name, description, func, param_count) VALUES (
	'First word',
	'Include only the first space-separated word of a string.',
	'first_word',
	0
);

INSERT INTO config.index_normalizer (name, description, func, param_count) VALUES (
	'ISBN 10/13 conversion',
	'Translate ISBN10 to ISBN13 and vice versa.',
	'translate_isbn1013',
	0
);

INSERT INTO config.index_normalizer (name, description, func, param_count) VALUES (
	'Replace',
	'Replace all occurences of first parameter in the string with the second parameter.',
	'replace',
	2
);

INSERT INTO config.index_normalizer (name, description, func, param_count) VALUES (
	'Trim Surrounding Space',
	'Trim leading and trailing spaces from extracted text.',
	'btrim',
	0
);

INSERT INTO config.index_normalizer (name, description, func, param_count) VALUES (
    'Generic Mapping Normalizer', 
    'Map values or sets of values to new values',
    'generic_map_normalizer', 
    1
);

INSERT INTO config.index_normalizer (name, description, func, param_count) VALUES (
    'Coded Value Map Normalizer', 
    'Applies coded_value_map mapping of values',
    'coded_value_map_normalizer', 
    1
);

INSERT INTO config.index_normalizer (name, description, func, param_count) VALUES (
	'Search Normalize',
	'Apply search normalization rules to the extracted text. A less extreme version of NACO normalization.',
	'search_normalize',
	0
);

INSERT INTO config.index_normalizer (name, description, func, param_count) VALUES (
	'Number or NULL Normalize',
	'Normalize the value to NULL if it is not a number',
	'integer_or_null',
	0
);

INSERT INTO config.index_normalizer (name, description, func, param_count) VALUES (
	'Approximate Low Date Normalize',
	'Normalize the value to the nearest date-ish value, rounding down',
	'approximate_low_date',
	0
);

INSERT INTO config.index_normalizer (name, description, func, param_count) VALUES (
	'Approximate High Date Normalize',
	'Normalize the value to the nearest date-ish value, rounding up',
	'approximate_high_date',
	0
);

INSERT INTO config.index_normalizer (name, description, func, param_count) VALUES (
	'Trim Trailing Punctuation',
	'Eliminate extraneous trailing commas and periods in text',
	'metabib.trim_trailing_punctuation',
	0
);

-- make use of the index normalizers

INSERT INTO config.metabib_field_index_norm_map (field,norm)
    SELECT  m.id,
            i.id
      FROM  config.metabib_field m,
        config.index_normalizer i
      WHERE i.func IN ('search_normalize','split_date_range')
            AND m.id NOT IN (18, 19, 25);

INSERT INTO config.metabib_field_index_norm_map (field,norm,pos)
    SELECT  m.id,
            i.id,
            2
      FROM  config.metabib_field m,
            config.index_normalizer i
      WHERE i.func IN ('translate_isbn1013')
            AND m.id IN (18);

INSERT INTO config.metabib_field_index_norm_map (field,norm,params)
    SELECT  m.id,
            i.id,
            $$["-",""]$$
      FROM  config.metabib_field m,
            config.index_normalizer i
      WHERE i.func IN ('replace')
            AND m.id IN (19);

INSERT INTO config.metabib_field_index_norm_map (field,norm,params, pos)
     SELECT  m.id,
             i.id,
             $$["]",""]$$,
             '-1'
       FROM  config.metabib_field m,
             config.index_normalizer i
       WHERE i.func IN ('replace')
             AND m.id IN (1);
             
INSERT INTO config.metabib_field_index_norm_map (field,norm,params, pos)
     SELECT  m.id,
             i.id,
             $$["[",""]$$,
             '-1'
       FROM  config.metabib_field m,
             config.index_normalizer i
       WHERE i.func IN ('replace')
             AND m.id IN (1);

INSERT INTO config.metabib_field_index_norm_map (field,norm,pos)
    SELECT  m.id,
            i.id,
            -1
      FROM  config.metabib_field m,
            config.index_normalizer i
      WHERE i.func = 'remove_paren_substring'
            AND m.id IN (28);

INSERT INTO config.metabib_field_index_norm_map (field,norm,pos)
    SELECT  m.id,
            i.id,
            -1
      FROM  config.metabib_field m,
            config.index_normalizer i
      WHERE i.func = 'metabib.trim_trailing_punctuation'
            AND m.id IN (7,8,9,10);


INSERT INTO config.record_attr_index_norm_map (attr,norm,pos)
    SELECT  m.name, i.id, 0
      FROM  config.record_attr_definition m,
            config.index_normalizer i
      WHERE i.func IN ('content_or_null')
            AND m.name IN ('titlesort', 'authorsort');

INSERT INTO config.record_attr_index_norm_map (attr,norm,pos)
    SELECT  m.name, i.id, 0
      FROM  config.record_attr_definition m,
            config.index_normalizer i
      WHERE i.func IN ('integer_or_null')
            AND m.name IN ('pubdate');

INSERT INTO config.record_attr_index_norm_map (attr,norm,pos)
    SELECT  m.name, i.id, 0
      FROM  config.record_attr_definition m,
            config.index_normalizer i
      WHERE i.func IN ('approximate_low_date')
            AND m.name IN ('date1');

INSERT INTO config.record_attr_index_norm_map (attr,norm,pos)
    SELECT  m.name, i.id, 0
      FROM  config.record_attr_definition m,
            config.index_normalizer i
      WHERE i.func IN ('approximate_high_date')
            AND m.name IN ('date2');

-- Sample Pre-due Notice --

INSERT INTO action_trigger.event_definition (id, active, owner, name, hook, validator, reactor, delay, delay_field, group_field, max_delay, template) 
    VALUES (6, 'f', 1, '3 Day Courtesy Notice', 'checkout.due', 'CircIsOpen', 'SendEmail', '-3 days', 'due_date', 'usr', '-2 days',
$$
[%- USE date -%]
[%- user = target.0.usr -%]
To: [%- params.recipient_email || user.email %]
From: [%- params.sender_email || default_sender %]
Date: [%- date.format(date.now, '%a, %d %b %Y %T -0000', gmt => 1) %]
Subject: Courtesy Notice
Auto-Submitted: auto-generated

Dear [% user.family_name %], [% user.first_given_name %]
As a reminder, the following items are due in 3 days.

[% FOR circ IN target %]
    [%- copy_details = helpers.get_copy_bib_basics(circ.target_copy.id) -%]
    Title: [% copy_details.title %]
    Author: [% copy_details.author %]
    Barcode: [% circ.target_copy.barcode %] 
    Due: [% date.format(helpers.format_date(circ.due_date), '%Y-%m-%d') %]
    Item Cost: [% helpers.get_copy_price(circ.target_copy) %]
    Library: [% circ.circ_lib.name %]
    Library Phone: [% circ.circ_lib.phone %]

[% END %]

$$);

INSERT INTO action_trigger.environment (event_def, path) VALUES 
    (6, 'target_copy.call_number'),
    (6, 'usr'),
    (6, 'circ_lib.billing_address');

-- Additional A/T Reactors

INSERT INTO action_trigger.reactor (module,description) VALUES
(   'ApplyPatronPenalty',
    oils_i18n_gettext(
        'ApplyPatronPenalty',
        'Applies the configured penalty to a patron.  Required named environment variables are "user", which refers to the user object, and "context_org", which refers to the org_unit object that acts as the focus for the penalty.',
        'atreact',
        'description'
    )
);

INSERT INTO action_trigger.reactor (module,description) VALUES
(   'SendFile',
    oils_i18n_gettext(
        'SendFile',
        'Build and transfer a file to a remote server.  Required parameter "remote_host" specifying target server.  Optional parameters: remote_user, remote_password, remote_account, port, type (FTP, SFTP or SCP), and debug.',
        'atreact',
        'description'
    )
);

-- self-check checkout receipt

INSERT INTO action_trigger.hook (key, core_type, description, passive) 
    VALUES (
        'format.selfcheck.checkout',
        'circ',
        'Formats circ objects for self-checkout receipt',
        TRUE
    );

INSERT INTO action_trigger.event_definition (id, active, owner, name, hook, validator, reactor, group_field, granularity, template )
    VALUES (
        10,
        TRUE,
        1,
        'Self-Checkout Receipt',
        'format.selfcheck.checkout',
        'NOOP_True',
        'ProcessTemplate',
        'usr',
        'print-on-demand',
$$
[%- USE date -%]
[%- SET user = target.0.usr -%]
[%- SET lib = target.0.circ_lib -%]
[%- SET lib_addr = target.0.circ_lib.billing_address -%]
[%- SET hours = lib.hours_of_operation -%]
<div>
    <style> li { padding: 8px; margin 5px; }</style>
    <div>[% date.format %]</div>
    <div>[% lib.name %]</div>
    <div>[% lib_addr.street1 %] [% lib_addr.street2 %]</div>
    <div>[% lib_addr.city %], [% lib_addr.state %] [% lib_addr.post_code %]</div>
    <div>[% lib.phone %]</div>
    <br/>

    [% user.family_name %], [% user.first_given_name %]
    <ol>
    [% FOR circ IN target %]
        [%-
            SET idx = loop.count - 1;
            SET udata =  user_data.$idx
        -%]
        <li>
            <div>[% helpers.get_copy_bib_basics(circ.target_copy.id).title %]</div>
            <div>Barcode: [% circ.target_copy.barcode %]</div>
            [% IF user_data.renewal_failure %]
                <div style='color:red;'>Renewal Failed</div>
            [% ELSE %]
                <div>Due Date: [% date.format(helpers.format_date(circ.due_date), '%Y-%m-%d') %]</div>
            [% END %]
        </li>
    [% END %]
    </ol>
    
    <div>
        Library Hours
        [%- BLOCK format_time; date.format(time _ ' 1/1/1000', format='%I:%M %p'); END -%]
        <div>
            Monday 
            [% PROCESS format_time time = hours.dow_0_open %] 
            [% PROCESS format_time time = hours.dow_0_close %] 
        </div>
        <div>
            Tuesday 
            [% PROCESS format_time time = hours.dow_1_open %] 
            [% PROCESS format_time time = hours.dow_1_close %] 
        </div>
        <div>
            Wednesday 
            [% PROCESS format_time time = hours.dow_2_open %] 
            [% PROCESS format_time time = hours.dow_2_close %] 
        </div>
        <div>
            Thursday
            [% PROCESS format_time time = hours.dow_3_open %] 
            [% PROCESS format_time time = hours.dow_3_close %] 
        </div>
        <div>
            Friday
            [% PROCESS format_time time = hours.dow_4_open %] 
            [% PROCESS format_time time = hours.dow_4_close %] 
        </div>
        <div>
            Saturday
            [% PROCESS format_time time = hours.dow_5_open %] 
            [% PROCESS format_time time = hours.dow_5_close %] 
        </div>
        <div>
            Sunday 
            [% PROCESS format_time time = hours.dow_6_open %] 
            [% PROCESS format_time time = hours.dow_6_close %] 
        </div>
    </div>
</div>
$$
);


INSERT INTO action_trigger.environment ( event_def, path) VALUES
    ( 10, 'target_copy'),
    ( 10, 'circ_lib.billing_address'),
    ( 10, 'circ_lib.hours_of_operation'),
    ( 10, 'usr');


-- items out selfcheck receipt

INSERT INTO action_trigger.hook (key, core_type, description, passive) 
    VALUES (
        'format.selfcheck.items_out',
        'circ',
        'Formats items out for self-checkout receipt',
        TRUE
    );

INSERT INTO action_trigger.event_definition (id, active, owner, name, hook, validator, reactor, group_field, granularity, template )
    VALUES (
        11,
        TRUE,
        1,
        'Self-Checkout Items Out Receipt',
        'format.selfcheck.items_out',
        'NOOP_True',
        'ProcessTemplate',
        'usr',
        'print-on-demand',
$$
[%- USE date -%]
[%- SET user = target.0.usr -%]
<div>
    <style> li { padding: 8px; margin 5px; }</style>
    <div>[% date.format %]</div>
    <br/>

    [% user.family_name %], [% user.first_given_name %]
    <ol>
    [% FOR circ IN target %]
        <li>
            <div>[% helpers.get_copy_bib_basics(circ.target_copy.id).title %]</div>
            <div>Barcode: [% circ.target_copy.barcode %]</div>
            <div>Due Date: [% date.format(helpers.format_date(circ.due_date), '%Y-%m-%d') %]</div>
        </li>
    [% END %]
    </ol>
</div>
$$
);


INSERT INTO action_trigger.environment ( event_def, path) VALUES
    ( 11, 'target_copy'),
    ( 11, 'circ_lib.billing_address'),
    ( 11, 'circ_lib.hours_of_operation'),
    ( 11, 'usr');

INSERT INTO action_trigger.hook (key, core_type, description, passive) 
    VALUES (
        'format.selfcheck.holds',
        'ahr',
        'Formats holds for self-checkout receipt',
        TRUE
    );

INSERT INTO action_trigger.event_definition (id, active, owner, name, hook, validator, reactor, group_field, granularity, template )
    VALUES (
        12,
        TRUE,
        1,
        'Self-Checkout Holds Receipt',
        'format.selfcheck.holds',
        'NOOP_True',
        'ProcessTemplate',
        'usr',
        'print-on-demand',
$$
[%- USE date -%]
[%- SET user = target.0.usr -%]
<div>
    <style> li { padding: 8px; margin 5px; }</style>
    <div>[% date.format %]</div>
    <br/>
    Holds for:<br/>
	[% user.family_name %], [% user.first_given_name %]
	
    <ol>
    [% FOR hold IN target %]
        [%-
            SET idx = loop.count - 1;
            SET udata =  user_data.$idx
        -%]
        <li>
            <div>Title: [% udata.item_title %]</div>
            <div>Author: [% udata.item_author %]</div>
            <div>Pickup Location: [% udata.pickup_lib %]</b></div>
            <div>Status: 
                [%- IF udata.ready -%]
                    Ready for pickup
                [% ELSE %]
                    #[% udata.queue_position %] of [% udata.potential_copies %] copies.
                [% END %]
            </div>
        </li>
    [% END %]
    </ol>
</div>
$$
);


INSERT INTO action_trigger.environment ( event_def, path) VALUES
    ( 12, 'bib_rec.bib_record.simple_record'),
    ( 12, 'pickup_lib'),
    ( 12, 'usr');

-- fines receipt

INSERT INTO action_trigger.hook (key, core_type, description, passive) 
    VALUES (
        'format.selfcheck.fines',
        'au',
        'Formats fines for self-checkout receipt',
        TRUE
    );

INSERT INTO action_trigger.event_definition (id, active, owner, name, hook, validator, reactor, granularity, template )
    VALUES (
        13,
        TRUE,
        1,
        'Self-Checkout Fines Receipt',
        'format.selfcheck.fines',
        'NOOP_True',
        'ProcessTemplate',
        'print-on-demand',
$$
[%- USE date -%]
[%- SET user = target -%]
<div>
    <style> li { padding: 8px; margin 5px; }</style>
    <div>[% date.format %]</div>
    <br/>

	Fines for:<br/>
    [% user.family_name %], [% user.first_given_name %]
    <ol>
    [% FOR xact IN user.open_billable_transactions_summary %]
        [% IF xact.balance_owed > 0 %]
            <li>
                <div>Details: 
                    [% IF xact.xact_type == 'circulation' %]
                        [%- helpers.get_copy_bib_basics(xact.circulation.target_copy).title -%]
                    [% ELSE %]
                        [%- xact.last_billing_type -%]
                    [% END %]
                </div>
                <div>Total Billed: [% xact.total_owed %]</div>
                <div>Total Paid: [% xact.total_paid %]</div>
                <div>Balance Owed : [% xact.balance_owed %]</div>
            </li>
        [% END %]
    [% END %]
    </ol>
</div>
$$
);

INSERT INTO action_trigger.hook (key, core_type, description, passive) 
    VALUES (
        'format.acqli.html',
        'jub',
        'Formats lineitem worksheet for titles received',
        TRUE
    );

INSERT INTO action_trigger.event_definition (id, active, owner, name, hook, validator, reactor, granularity, template)
    VALUES (
        14,
        TRUE,
        1,
        'Lineitem Worksheet',
        'format.acqli.html',
        'NOOP_True',
        'ProcessTemplate',
        'print-on-demand',
$$
[%- USE date -%]
[%- SET li = target; -%]
<div class="wrapper">
    <div class="summary" style='font-size:110%; font-weight:bold;'>

        <div>Title: [% helpers.get_li_attr("title", "", li.attributes) %]</div>
        <div>Author: [% helpers.get_li_attr("author", "", li.attributes) %]</div>
        <div class="count">Item Count: [% li.lineitem_details.size %]</div>
        <div class="lineid">Lineitem ID: [% li.id %]</div>
        <div>Open Holds: [% helpers.bre_open_hold_count(li.eg_bib_id) %]</div>
        [% IF li.cancel_reason.label %]
        <div>[% li.cancel_reason.label %]</div>
        [% END %]

        [% IF li.distribution_formulas.size > 0 %]
            [% SET forms = [] %]
            [% FOREACH form IN li.distribution_formulas; forms.push(form.formula.name); END %]
            <div>Distribution Formulas: [% forms.join(',') %]</div>
        [% END %]

        [% IF li.lineitem_notes.size > 0 %]
            Lineitem Notes:
            <ul>
                [%- FOR note IN li.lineitem_notes -%]
                    <li>
                    [% IF note.alert_text %]
                        [% note.alert_text.code -%] 
                        [% IF note.value -%]
                            : [% note.value %]
                        [% END %]
                    [% ELSE %]
                        [% note.value -%] 
                    [% END %]
                    </li>
                [% END %]
            </ul>
        [% END %]
    </div>
    <br/>
    <table>
        <thead>
            <tr>
                <th>Branch</th>
                <th>Barcode</th>
                <th>Call Number</th>
                <th>Fund</th>
                <th>Shelving Location</th>
                <th>Recd.</th>
                <th>Notes</th>
                <th>Delayed / Canceled</th>
            </tr>
        </thead>
        <tbody>
        <!-- set detail.owning_lib from fm object to org name -->
        [% FOREACH detail IN li.lineitem_details %]
            [% detail.owning_lib = detail.owning_lib.shortname %]
        [% END %]

        [% FOREACH detail IN li.lineitem_details.sort('owning_lib') %]
            [% 
                IF detail.eg_copy_id;
                    SET copy = detail.eg_copy_id;
                    SET cn_label = copy.call_number.label;
                ELSE; 
                    SET copy = detail; 
                    SET cn_label = detail.cn_label;
                END 
            %]
            <tr>
                <!-- acq.lineitem_detail.id = [%- detail.id -%] -->
                <td style='padding:5px;'>[% detail.owning_lib %]</td>
                <td style='padding:5px;'>[% IF copy.barcode   %]<span class="barcode"  >[% detail.barcode   %]</span>[% END %]</td>
                <td style='padding:5px;'>[% IF cn_label %]<span class="cn_label" >[% cn_label  %]</span>[% END %]</td>
                <td style='padding:5px;'>[% IF detail.fund %]<span class="fund">[% detail.fund.code %] ([% detail.fund.year %])</span>[% END %]</td>
                <td style='padding:5px;'>[% copy.location.name %]</td>
                <td style='padding:5px;'>[% IF detail.recv_time %]<span class="recv_time">[% detail.recv_time %]</span>[% END %]</td>
                <td style='padding:5px;'>[% detail.note %]</td>
                <td style='padding:5px;'>[% detail.cancel_reason.label %]</td>
            </tr>
        [% END %]
        </tbody>
    </table>
</div>
$$
);


INSERT INTO action_trigger.environment (event_def, path) VALUES
    ( 14, 'attributes' ),
    ( 14, 'cancel_reason' ),
    ( 14, 'lineitem_notes' ),
    ( 14, 'lineitem_notes.alert_text' ),
    ( 14, 'distribution_formulas.formula' ),
    ( 14, 'lineitem_details' ),
    ( 14, 'lineitem_details.cancel_reason' ),
    ( 14, 'lineitem_details.owning_lib' ),
    ( 14, 'lineitem_details.fund' ),
    ( 14, 'lineitem_details.location' ),
    ( 14, 'lineitem_details.eg_copy_id' ),
    ( 14, 'lineitem_details.eg_copy_id.call_number' ),
    ( 14, 'lineitem_details.eg_copy_id.location' )
;

INSERT INTO action_trigger.environment ( event_def, path) VALUES
    ( 13, 'open_billable_transactions_summary.circulation' );


INSERT INTO action_trigger.validator (module, description) 
    VALUES (
        'Acq::PurchaseOrderEDIRequired',
        oils_i18n_gettext(
            'Acq::PurchaseOrderEDIRequired',
            'Purchase order is delivered via EDI',
            'atval',
            'description'
        )
    );

INSERT INTO action_trigger.reactor (module, description)
    VALUES (
        'GeneratePurchaseOrderJEDI',
        oils_i18n_gettext(
            'GeneratePurchaseOrderJEDI',
            'Creates purchase order JEDI (JSON EDI) for subsequent EDI processing',
            'atreact',
            'description'
        )
    );


INSERT INTO action_trigger.event_definition (id, active, owner, name, hook, validator, reactor, cleanup_success, cleanup_failure, delay, delay_field, group_field, template) 
    VALUES (23, true, 1, 'PO JEDI', 'acqpo.activated', 'Acq::PurchaseOrderEDIRequired', 'GeneratePurchaseOrderJEDI', NULL, NULL, '00:00:00', NULL, NULL,
$$
[%- USE date -%]
[%
    # extract some commonly used variables

    VENDOR_SAN = target.provider.san;
    VENDCODE = target.provider.edi_default.vendcode;
    VENDACCT = target.provider.edi_default.vendacct;
    ORG_UNIT_SAN = target.ordering_agency.mailing_address.san;

    # set the vendor / provider

    VENDOR_BT      = 0; # Baker & Taylor
    VENDOR_INGRAM  = 0;
    VENDOR_BRODART = 0;
    VENDOR_MW_TAPE = 0; # Midwest Tape
    VENDOR_RB      = 0; # Recorded Books
    VENDOR_ULS     = 0; # ULS

    IF    VENDOR_SAN == '1556150'; VENDOR_BT = 1;
    ELSIF VENDOR_SAN == '1697684'; VENDOR_BRODART = 1;
    ELSIF VENDOR_SAN == '1697978'; VENDOR_INGRAM = 1;
    ELSIF VENDOR_SAN == '2549913'; VENDOR_MW_TAPE = 1;
    ELSIF VENDOR_SAN == '1113984'; VENDOR_RB = 1;
    ELSIF VENDOR_SAN == '1699342'; VENDOR_ULS = 1;
    END;

    # if true, pass the PO name as a secondary identifier
    # RFF+LI:<name>/li_id
    INC_PO_NAME = 0;
    IF VENDOR_INGRAM;
        INC_PO_NAME = 1;
    END;

    # GIR configuration --------------------------------------

    INC_COPIES = 1; # copies on/off switch
    INC_FUND = 0;
    INC_CALLNUMBER = 0;
    INC_ITEM_TYPE = 1;
    INC_LOCATION = 0;
    INC_COLLECTION_CODE = 1;
    INC_OWNING_LIB = 1;
    INC_QUANTITY = 1;
    INC_COPY_ID = 0;

    IF VENDOR_BT;
        INC_CALLNUMBER = 1;
    END;

    IF VENDOR_BRODART;
        INC_FUND = 1;
    END;

    IF VENDOR_MW_TAPE;
        INC_FUND = 1;
        INC_COLLECTION_CODE = 0;
        INC_ITEM_TYPE = 0;
    END;

    # END GIR configuration ---------------------------------

-%]
[%- BLOCK big_block -%]
{
   "recipient":"[% VENDOR_SAN %]",
   "sender":"[% ORG_UNIT_SAN %]",
   "body": [{
     "ORDERS":[ "order", {

        "po_number":[% target.id %],

        [% IF INC_PO_NAME %]
        "po_name":"[% target.name | replace('\/', ' ') | replace('"', '\"') %]",
        [% END %]

        "date":"[% date.format(date.now, '%Y%m%d') %]",

        "buyer":[
            [% IF VENDOR_BT %]
                {"id-qualifier": 91, "id":"[% ORG_UNIT_SAN %] [% VENDCODE %]"}
            [% ELSE %]
                {"id":"[% ORG_UNIT_SAN %]"},
                {"id-qualifier": 91, "id":"[% VENDACCT %]"}
            [% END %]
        ],

        "vendor":[
            "[% VENDOR_SAN %]",
            {"id-qualifier": 92, "id":"[% target.provider.id %]"}
        ],

        "currency":"[% target.provider.currency_type %]",
                
        "items":[
        [%- FOR li IN target.lineitems %]
        {
            "line_index":"[% li.id %]",
            "identifiers":[   
            [%- 
                idval = '';
                idqual = 'EN'; # default ISBN/UPC/EAN-13
                ident_attr = helpers.get_li_order_ident(li.attributes);
                IF ident_attr;
                    idname = ident_attr.attr_name;
                    idval = ident_attr.attr_value;
                    IF idname == 'isbn' AND idval.length != 13;
                        idqual = 'IB';
                    ELSIF idname == 'issn';
                        idqual = 'IS';
                    END;
                ELSE;
                    idqual = 'IN';
                    idval = li.id;
                END -%]
                {"id-qualifier":"[% idqual %]","id":"[% idval %]"}
            ],
            "price":[% li.estimated_unit_price || '0.00' %],
            "desc":[
                {"BTI":"[% helpers.get_li_attr_jedi('title',     '', li.attributes) %]"},
                {"BPU":"[% helpers.get_li_attr_jedi('publisher', '', li.attributes) %]"},
                {"BPD":"[% helpers.get_li_attr_jedi('pubdate',   '', li.attributes) %]"},
                [% IF VENDOR_ULS -%]
                {"BEN":"[% helpers.get_li_attr_jedi('edition',   '', li.attributes) %]"},
                {"BAU":"[% helpers.get_li_attr_jedi('author',    '', li.attributes) %]"}
                [%- ELSE -%]
                {"BPH":"[% helpers.get_li_attr_jedi('pagination','', li.attributes) %]"}
                [%- END %]
            ],
            [%- ftx_vals = []; 
                FOR note IN li.lineitem_notes;
                    NEXT UNLESS note.vendor_public == 't'; 
                    ftx_vals.push(note.value); 
                END; 
                IF VENDOR_BRODART; # look for copy-level spec code
                    FOR lid IN li.lineitem_details;
                        IF lid.note;
                            spec_note = lid.note.match('spec code ([a-zA-Z0-9_])');
                            IF spec_note.0; ftx_vals.push(spec_note.0); END;
                        END;
                    END;
                END; 
                IF xtra_ftx;           ftx_vals.unshift(xtra_ftx); END; 

                # BT & ULS want FTX+LIN for every LI, even if empty
                IF ((VENDOR_BT OR VENDOR_ULS) AND ftx_vals.size == 0);
                    ftx_vals.unshift('');
                END;  
            -%]

            "free-text":[ 
                [% FOR note IN ftx_vals -%] "[% note %]"[% UNLESS loop.last %], [% END %][% END %] 
            ],            

            "quantity":[% li.lineitem_details.size %]

            [%- IF INC_COPIES -%]
            ,"copies" : [
                [%- compressed_copies = [];
                    FOR lid IN li.lineitem_details;
                        fund = lid.fund.code;
                        item_type = lid.circ_modifier;
                        callnumber = lid.cn_label;
                        owning_lib = lid.owning_lib.shortname;
                        location = lid.location;
                        collection_code = lid.collection_code;
    
                        # when we have real copy data, treat it as authoritative for some fields
                        acp = lid.eg_copy_id;
                        IF acp;
                            item_type = acp.circ_modifier;
                            callnumber = acp.call_number.label;
                            location = acp.location.name;
                        END ;


                        # collapse like copies into groups w/ quantity

                        found_match = 0;
                        IF !INC_COPY_ID; # INC_COPY_ID implies 1 copy per GIR
                            FOR copy IN compressed_copies;
                                IF  (fund == copy.fund OR (!fund AND !copy.fund)) AND
                                    (item_type == copy.item_type OR (!item_type AND !copy.item_type)) AND
                                    (callnumber == copy.callnumber OR (!callnumber AND !copy.callnumber)) AND
                                    (owning_lib == copy.owning_lib OR (!owning_lib AND !copy.owning_lib)) AND
                                    (location == copy.location OR (!location AND !copy.location)) AND
                                    (collection_code == copy.collection_code OR (!collection_code AND !copy.collection_code));

                                    copy.quantity = copy.quantity + 1;
                                    found_match = 1;
                                END;
                            END;
                        END;

                        IF !found_match;
                            compressed_copies.push({
                                fund => fund,
                                item_type => item_type,
                                callnumber => callnumber,
                                owning_lib => owning_lib,
                                location => location,
                                collection_code => collection_code,
                                copy_id => lid.id, # for INC_COPY_ID
                                quantity => 1
                            });
                        END;
                    END;
                    FOR copy IN compressed_copies;

                    # If we assume owning_lib is required and set, 
                    # it is safe to prepend each following copy field w/ a ","

                    # B&T EDI requires expected GIR fields to be 
                    # present regardless of whether a value exists.  
                    # some fields are required to have a value in ACQ, 
                    # though, so they are not forced into place below.

                 %]{[%- IF INC_OWNING_LIB AND copy.owning_lib %] "owning_lib":"[% copy.owning_lib %]"[% END -%]
                    [%- IF INC_FUND AND copy.fund %],"fund":"[% copy.fund %]"[% END -%]
                    [%- IF INC_CALLNUMBER AND (VENDOR_BT OR copy.callnumber) %],"call_number":"[% copy.callnumber %]"[% END -%]
                    [%- IF INC_ITEM_TYPE AND (VENDOR_BT OR copy.item_type) %],"item_type":"[% copy.item_type %]"[% END -%]
                    [%- IF INC_LOCATION AND copy.location %],"copy_location":"[% copy.location %]"[% END -%]
                    [%- IF INC_COLLECTION_CODE AND (VENDOR_BT OR copy.collection_code) %],"collection_code":"[% copy.collection_code %]"[% END -%]
                    [%- IF INC_QUANTITY %],"quantity":"[% copy.quantity %]"[% END -%]
                    [%- IF INC_COPY_ID %],"copy_id":"[% copy.copy_id %]" [% END %]}[% ',' UNLESS loop.last -%]
                [%- END -%] [%# FOR compressed_copies -%]
            ]
            [%- END -%] [%# IF INC_COPIES %]

        }[% UNLESS loop.last %],[% END -%]

        [% END %] [%# END lineitems %]
        ],
        "line_items":[% target.lineitems.size %]
     }]  [%# close ORDERS array %]
   }]    [%# close  body  array %]
}
[% END %]
[% tempo = PROCESS big_block; helpers.escape_json(tempo) %]
$$
);

INSERT INTO action_trigger.environment (event_def, path) VALUES 
  (23, 'lineitems.attributes'), 
  (23, 'lineitems.lineitem_details.owning_lib'),
  (23, 'lineitems.lineitem_details.location'),
  (23, 'lineitems.lineitem_details.fund'),
  (23, 'lineitems.lineitem_details.eg_copy_id.location'),
  (23, 'lineitems.lineitem_details.eg_copy_id.call_number'),
  (23, 'lineitems.lineitem_notes'), 
  (23, 'ordering_agency.mailing_address'), 
  (23, 'provider'),
  (23, 'provider.edi_default');

INSERT INTO action_trigger.reactor (module, description) VALUES (
    'AstCall', 'Possibly place a phone call with Asterisk'
);

INSERT INTO
    action_trigger.event_definition (
        id, active, owner, name, hook, validator, reactor,
        cleanup_success, cleanup_failure, delay, delay_field, group_field,
        max_delay, granularity, usr_field, opt_in_setting, template
    ) VALUES (
        24,
        FALSE,
        1,
        'Telephone Overdue Notice',
        'checkout.due', 'NOOP_True', 'AstCall',
        DEFAULT, DEFAULT, '5 seconds', 'due_date', 'usr',
        DEFAULT, DEFAULT, DEFAULT, DEFAULT,
        $$
[% phone = target.0.usr.day_phone | replace('[\s\-\(\)]', '') -%]
[% IF phone.match('^[2-9]') %][% country = 1 %][% ELSE %][% country = '' %][% END -%]
Channel: [% channel_prefix %]/[% country %][% phone %]
Context: overdue-test
MaxRetries: 1
RetryTime: 60
WaitTime: 30
Extension: 10
Archive: 1
Set: eg_user_id=[% target.0.usr.id %]
Set: items=[% target.size %]
Set: titlestring=[% titles = [] %][% FOR circ IN target %][% titles.push(circ.target_copy.call_number.record.simple_record.title) %][% END %][% titles.join(". ") %]
$$
    );

INSERT INTO
    action_trigger.environment (id, event_def, path)
    VALUES
        (DEFAULT, 24, 'target_copy.call_number.record.simple_record'),
        (DEFAULT, 24, 'usr')
    ;

-- 0285.data.history_format.sql

INSERT INTO action_trigger.hook (key,core_type,description,passive) VALUES (
        'circ.format.history.email',
        'auch', 
        oils_i18n_gettext(
            'circ.format.history.email',
            'An email has been requested for a circ history.',
            'ath',
            'description'
        ), 
        FALSE
    )
    ,(
        'circ.format.history.print',
        'auch', 
        oils_i18n_gettext(
            'circ.format.history.print',
            'A circ history needs to be formatted for printing.',
            'ath',
            'description'
        ), 
        FALSE
    )
    ,(
        'ahr.format.history.email',
        'ahr', 
        oils_i18n_gettext(
            'ahr.format.history.email',
            'An email has been requested for a hold request history.',
            'ath',
            'description'
        ), 
        FALSE
    )
    ,(
        'ahr.format.history.print',
        'ahr', 
        oils_i18n_gettext(
            'ahr.format.history.print',
            'A hold request history needs to be formatted for printing.',
            'ath',
            'description'
        ), 
        FALSE
    )

;

INSERT INTO action_trigger.event_definition (
        id,
        active,
        owner,
        name,
        hook,
        validator,
        reactor,
        group_field,
        granularity,
        template
    ) VALUES (
        25,
        TRUE,
        1,
        'circ.history.email',
        'circ.format.history.email',
        'NOOP_True',
        'SendEmail',
        'usr',
        NULL,
$$
[%- USE date -%]
[%- SET user = target.0.usr -%]
To: [%- params.recipient_email || user.email %]
From: [%- params.sender_email || default_sender %]
Date: [%- date.format(date.now, '%a, %d %b %Y %T -0000', gmt => 1) %]
Subject: Circulation History
Auto-Submitted: auto-generated

    [% FOR circ IN target %]
            [% helpers.get_copy_bib_basics(circ.target_copy.id).title %]
            Barcode: [% circ.target_copy.barcode %]
            Checked Out: [% date.format(helpers.format_date(circ.xact_start), '%Y-%m-%d') %]
            Due Date: [% date.format(helpers.format_date(circ.due_date), '%Y-%m-%d') %]
            Returned: [%
                date.format(
                    helpers.format_date(circ.checkin_time), '%Y-%m-%d') 
                    IF circ.checkin_time; 
            %]
    [% END %]
$$
    )
    ,(
        26,
        TRUE,
        1,
        'circ.history.print',
        'circ.format.history.print',
        'NOOP_True',
        'ProcessTemplate',
        'usr',
        'print-on-demand',
$$
[%- USE date -%]
<div>
    <style> li { padding: 8px; margin 5px; }</style>
    <div>[% date.format %]</div>
    <br/>

    [% user.family_name %], [% user.first_given_name %]
    <ol>
    [% FOR circ IN target %]
        <li>
            <div>[% helpers.get_copy_bib_basics(circ.target_copy.id).title %]</div>
            <div>Barcode: [% circ.target_copy.barcode %]</div>
            <div>Checked Out: [% date.format(helpers.format_date(circ.xact_start), '%Y-%m-%d') %]</div>
            <div>Due Date: [% date.format(helpers.format_date(circ.due_date), '%Y-%m-%d') %]</div>
            <div>Returned: [%
                date.format(
                    helpers.format_date(circ.checkin_time), '%Y-%m-%d') 
                    IF circ.checkin_time; -%]
            </div>
        </li>
    [% END %]
    </ol>
</div>
$$
    )
    ,(
        27,
        TRUE,
        1,
        'ahr.history.email',
        'ahr.format.history.email',
        'NOOP_True',
        'SendEmail',
        'usr',
        NULL,
$$
[%- USE date -%]
[%- SET user = target.0.usr -%]
To: [%- params.recipient_email || user.email %]
From: [%- params.sender_email || default_sender %]
Date: [%- date.format(date.now, '%a, %d %b %Y %T -0000', gmt => 1) %]
Subject: Hold Request History
Auto-Submitted: auto-generated

    [% FOR hold IN target %]
            [% helpers.get_copy_bib_basics(hold.current_copy.id).title %]
            Requested: [% date.format(helpers.format_date(hold.request_time), '%Y-%m-%d') %]
            [% IF hold.fulfillment_time %]Fulfilled: [% date.format(helpers.format_date(hold.fulfillment_time), '%Y-%m-%d') %][% END %]
    [% END %]
$$
    )
    ,(
        28,
        TRUE,
        1,
        'ahr.history.print',
        'ahr.format.history.print',
        'NOOP_True',
        'ProcessTemplate',
        'usr',
        'print-on-demand',
$$
[%- USE date -%]
<div>
    <style> li { padding: 8px; margin 5px; }</style>
    <div>[% date.format %]</div>
    <br/>

    [% user.family_name %], [% user.first_given_name %]
    <ol>
    [% FOR hold IN target %]
        <li>
            <div>[% helpers.get_copy_bib_basics(hold.current_copy.id).title %]</div>
            <div>Requested: [% date.format(helpers.format_date(hold.request_time), '%Y-%m-%d') %]</div>
            [% IF hold.fulfillment_time %]<div>Fulfilled: [% date.format(helpers.format_date(hold.fulfillment_time), '%Y-%m-%d') %]</div>[% END %]
        </li>
    [% END %]
    </ol>
</div>
$$
    )

;

INSERT INTO action_trigger.environment (
        event_def,
        path
    ) VALUES 
         ( 25, 'target_copy')
        ,( 25, 'usr' )
        ,( 26, 'target_copy' )
        ,( 26, 'usr' )
        ,( 27, 'current_copy' )
        ,( 27, 'usr' )
        ,( 28, 'current_copy' )
        ,( 28, 'usr' )
;

-- 0289.data.payment_receipt_format.sql
-- 0326.data.payment_receipt_format.sql

INSERT INTO action_trigger.hook (key,core_type,description,passive) VALUES (
        'money.format.payment_receipt.email',
        'mp', 
        oils_i18n_gettext(
            'money.format.payment_receipt.email',
            'An email has been requested for a payment receipt.',
            'ath',
            'description'
        ), 
        FALSE
    )
    ,(
        'money.format.payment_receipt.print',
        'mp', 
        oils_i18n_gettext(
            'money.format.payment_receipt.print',
            'A payment receipt needs to be formatted for printing.',
            'ath',
            'description'
        ), 
        FALSE
    )
;

INSERT INTO action_trigger.event_definition (
        id,
        active,
        owner,
        name,
        hook,
        validator,
        reactor,
        group_field,
        granularity,
        template
    ) VALUES (
        29,
        TRUE,
        1,
        'money.payment_receipt.email',
        'money.format.payment_receipt.email',
        'NOOP_True',
        'SendEmail',
        'xact.usr',
        NULL,
$$
[%- USE date -%]
[%- SET user = target.0.xact.usr -%]
To: [%- params.recipient_email || user.email %]
From: [%- params.sender_email || default_sender %]
Date: [%- date.format(date.now, '%a, %d %b %Y %T -0000', gmt => 1) %]
Subject: Payment Receipt
Auto-Submitted: auto-generated

[% date.format -%]
[%- SET xact_mp_hash = {} -%]
[%- FOR mp IN target %][%# Template is hooked around payments, but let us make the receipt focused on transactions -%]
    [%- SET xact_id = mp.xact.id -%]
    [%- IF ! xact_mp_hash.defined( xact_id ) -%][%- xact_mp_hash.$xact_id = { 'xact' => mp.xact, 'payments' => [] } -%][%- END -%]
    [%- xact_mp_hash.$xact_id.payments.push(mp) -%]
[%- END -%]
[%- FOR xact_id IN xact_mp_hash.keys.sort -%]
    [%- SET xact = xact_mp_hash.$xact_id.xact %]
Transaction ID: [% xact_id %]
    [% IF xact.circulation %][% helpers.get_copy_bib_basics(xact.circulation.target_copy).title %]
    [% ELSE %]Miscellaneous
    [% END %]
    Line item billings:
        [%- SET mb_type_hash = {} -%]
        [%- FOR mb IN xact.billings %][%# Group billings by their btype -%]
            [%- IF mb.voided == 'f' -%]
                [%- SET mb_type = mb.btype.id -%]
                [%- IF ! mb_type_hash.defined( mb_type ) -%][%- mb_type_hash.$mb_type = { 'sum' => 0.00, 'billings' => [] } -%][%- END -%]
                [%- IF ! mb_type_hash.$mb_type.defined( 'first_ts' ) -%][%- mb_type_hash.$mb_type.first_ts = mb.billing_ts -%][%- END -%]
                [%- mb_type_hash.$mb_type.last_ts = mb.billing_ts -%]
                [%- mb_type_hash.$mb_type.sum = mb_type_hash.$mb_type.sum + mb.amount -%]
                [%- mb_type_hash.$mb_type.billings.push( mb ) -%]
            [%- END -%]
        [%- END -%]
        [%- FOR mb_type IN mb_type_hash.keys.sort -%]
            [%- IF mb_type == 1 %][%-# Consolidated view of overdue billings -%]
                $[% mb_type_hash.$mb_type.sum %] for [% mb_type_hash.$mb_type.billings.0.btype.name %] 
                    on [% mb_type_hash.$mb_type.first_ts %] through [% mb_type_hash.$mb_type.last_ts %]
            [%- ELSE -%][%# all other billings show individually %]
                [% FOR mb IN mb_type_hash.$mb_type.billings %]
                    $[% mb.amount %] for [% mb.btype.name %] on [% mb.billing_ts %] [% mb.note %]
                [% END %]
            [% END %]
        [% END %]
    Line item payments:
        [% FOR mp IN xact_mp_hash.$xact_id.payments %]
            Payment ID: [% mp.id %]
                Paid [% mp.amount %] via [% SWITCH mp.payment_type -%]
                    [% CASE "cash_payment" %]cash
                    [% CASE "check_payment" %]check
                    [% CASE "credit_card_payment" %]credit card
                    [%- IF mp.credit_card_payment.cc_number %] ([% mp.credit_card_payment.cc_number %])[% END %]
                    [% CASE "credit_payment" %]credit
                    [% CASE "forgive_payment" %]forgiveness
                    [% CASE "goods_payment" %]goods
                    [% CASE "work_payment" %]work
                [%- END %] on [% mp.payment_ts %] [% mp.note %]
        [% END %]
[% END %]
$$
    )
    ,(
        30,
        TRUE,
        1,
        'money.payment_receipt.print',
        'money.format.payment_receipt.print',
        'NOOP_True',
        'ProcessTemplate',
        'xact.usr',
        'print-on-demand',
$$
[%- USE date -%][%- SET user = target.0.xact.usr -%]
<div style="li { padding: 8px; margin 5px; }">
    <div>[% date.format %]</div><br/>
    <ol>
    [% SET xact_mp_hash = {} %]
    [% FOR mp IN target %][%# Template is hooked around payments, but let us make the receipt focused on transactions %]
        [% SET xact_id = mp.xact.id %]
        [% IF ! xact_mp_hash.defined( xact_id ) %][% xact_mp_hash.$xact_id = { 'xact' => mp.xact, 'payments' => [] } %][% END %]
        [% xact_mp_hash.$xact_id.payments.push(mp) %]
    [% END %]
    [% FOR xact_id IN xact_mp_hash.keys.sort %]
        [% SET xact = xact_mp_hash.$xact_id.xact %]
        <li>Transaction ID: [% xact_id %]
            [% IF xact.circulation %][% helpers.get_copy_bib_basics(xact.circulation.target_copy).title %]
            [% ELSE %]Miscellaneous
            [% END %]
            Line item billings:<ol>
                [% SET mb_type_hash = {} %]
                [% FOR mb IN xact.billings %][%# Group billings by their btype %]
                    [% IF mb.voided == 'f' %]
                        [% SET mb_type = mb.btype.id %]
                        [% IF ! mb_type_hash.defined( mb_type ) %][% mb_type_hash.$mb_type = { 'sum' => 0.00, 'billings' => [] } %][% END %]
                        [% IF ! mb_type_hash.$mb_type.defined( 'first_ts' ) %][% mb_type_hash.$mb_type.first_ts = mb.billing_ts %][% END %]
                        [% mb_type_hash.$mb_type.last_ts = mb.billing_ts %]
                        [% mb_type_hash.$mb_type.sum = mb_type_hash.$mb_type.sum + mb.amount %]
                        [% mb_type_hash.$mb_type.billings.push( mb ) %]
                    [% END %]
                [% END %]
                [% FOR mb_type IN mb_type_hash.keys.sort %]
                    <li>[% IF mb_type == 1 %][%# Consolidated view of overdue billings %]
                        $[% mb_type_hash.$mb_type.sum %] for [% mb_type_hash.$mb_type.billings.0.btype.name %] 
                            on [% mb_type_hash.$mb_type.first_ts %] through [% mb_type_hash.$mb_type.last_ts %]
                    [% ELSE %][%# all other billings show individually %]
                        [% FOR mb IN mb_type_hash.$mb_type.billings %]
                            $[% mb.amount %] for [% mb.btype.name %] on [% mb.billing_ts %] [% mb.note %]
                        [% END %]
                    [% END %]</li>
                [% END %]
            </ol>
            Line item payments:<ol>
                [% FOR mp IN xact_mp_hash.$xact_id.payments %]
                    <li>Payment ID: [% mp.id %]
                        Paid [% mp.amount %] via [% SWITCH mp.payment_type -%]
                            [% CASE "cash_payment" %]cash
                            [% CASE "check_payment" %]check
                            [% CASE "credit_card_payment" %]credit card
                            [%- IF mp.credit_card_payment.cc_number %] ([% mp.credit_card_payment.cc_number %])[% END %]
                            [% CASE "credit_payment" %]credit
                            [% CASE "forgive_payment" %]forgiveness
                            [% CASE "goods_payment" %]goods
                            [% CASE "work_payment" %]work
                        [%- END %] on [% mp.payment_ts %] [% mp.note %]
                    </li>
                [% END %]
            </ol>
        </li>
    [% END %]
    </ol>
</div>
$$
    )
;

INSERT INTO action_trigger.environment (
        event_def,
        path
    ) VALUES -- for fleshing mp objects
         ( 29, 'xact')
        ,( 29, 'xact.usr')
        ,( 29, 'xact.grocery' )
        ,( 29, 'xact.circulation' )
        ,( 29, 'xact.summary' )
        ,( 29, 'credit_card_payment')
        ,( 29, 'xact.billings')
        ,( 29, 'xact.billings.btype')
        ,( 30, 'xact')
        ,( 30, 'xact.usr')
        ,( 30, 'xact.grocery' )
        ,( 30, 'xact.circulation' )
        ,( 30, 'xact.summary' )
        ,( 30, 'credit_card_payment')
        ,( 30, 'xact.billings')
        ,( 30, 'xact.billings.btype')
;

-- 0294.data.bre_format.sql

INSERT INTO container.biblio_record_entry_bucket_type( code, label ) VALUES (
    'temp',
    oils_i18n_gettext(
        'temp',
        'Temporary bucket which gets deleted after use.',
        'cbrebt',
        'label'
    )
);

INSERT INTO action_trigger.cleanup ( module, description ) VALUES (
    'DeleteTempBiblioBucket',
    oils_i18n_gettext(
        'DeleteTempBiblioBucket',
        'Deletes a cbreb object used as a target if it has a btype of "temp"',
        'atclean',
        'description'
    )
);

INSERT INTO action_trigger.hook (key,core_type,description,passive) VALUES (
        'biblio.format.record_entry.email',
        'cbreb', 
        oils_i18n_gettext(
            'biblio.format.record_entry.email',
            'An email has been requested for one or more biblio record entries.',
            'ath',
            'description'
        ), 
        FALSE
    )
    ,(
        'biblio.format.record_entry.print',
        'cbreb', 
        oils_i18n_gettext(
            'biblio.format.record_entry.print',
            'One or more biblio record entries need to be formatted for printing.',
            'ath',
            'description'
        ), 
        FALSE
    )
;

INSERT INTO action_trigger.event_definition (
        id,
        active,
        owner,
        name,
        hook,
        validator,
        reactor,
        cleanup_success,
        cleanup_failure,
        group_field,
        granularity,
        delay,
        template
    ) VALUES (
        31,
        TRUE,
        1,
        'biblio.record_entry.email',
        'biblio.format.record_entry.email',
        'NOOP_True',
        'SendEmail',
        'DeleteTempBiblioBucket',
        'DeleteTempBiblioBucket',
        'owner',
        NULL,
        '00:00:00',
$$
[%- USE date -%]
[%- SET user = target.0.owner -%]
To: [%- params.recipient_email || user.email %]
From: [%- params.sender_email || default_sender %]
Date: [%- date.format(date.now, '%a, %d %b %Y %T -0000', gmt => 1) %]
Subject: Bibliographic Records
Auto-Submitted: auto-generated

[% FOR cbreb IN target %][% title = '' %]
[% FOR item IN cbreb.items;
    bre_id = item.target_biblio_record_entry;

    bibxml = helpers.unapi_bre(bre_id, {flesh => '{mra}'});
    FOR part IN bibxml.findnodes('//*[@tag="245"]/*[@code="a" or @code="b"]');
        title = title _ part.textContent;
    END;

    author = bibxml.findnodes('//*[@tag="100"]/*[@code="a"]').textContent;
    item_type = bibxml.findnodes('//*[local-name()="attributes"]/*[local-name()="field"][@name="item_type"]').getAttribute('coded-value');
    publisher = bibxml.findnodes('//*[@tag="260"]/*[@code="b"]').textContent;
    pubdate = bibxml.findnodes('//*[@tag="260"]/*[@code="c"]').textContent;
    isbn = bibxml.findnodes('//*[@tag="020"]/*[@code="a"]').textContent;
    issn = bibxml.findnodes('//*[@tag="022"]/*[@code="a"]').textContent;
    upc = bibxml.findnodes('//*[@tag="024"]/*[@code="a"]').textContent;
%]

[% loop.count %]/[% loop.size %].  Bib ID# [% bre_id %] 
[% IF isbn %]ISBN: [% isbn _ "\n" %][% END -%]
[% IF issn %]ISSN: [% issn _ "\n" %][% END -%]
[% IF upc  %]UPC:  [% upc _ "\n" %] [% END -%]
Title: [% title %]
Author: [% author %]
Publication Info: [% publisher %] [% pubdate %]
Item Type: [% item_type %]

[% END %]
[% END %]
$$
    )
    ,(
        32,
        TRUE,
        1,
        'biblio.record_entry.print',
        'biblio.format.record_entry.print',
        'NOOP_True',
        'ProcessTemplate',
        'DeleteTempBiblioBucket',
        'DeleteTempBiblioBucket',
        'owner',
        'print-on-demand',
        '00:00:00',
$$
<div>
    <style> li { padding: 8px; margin 5px; }</style>
    <ol>
    [% FOR cbreb IN target %][% title = '' %]
    [% FOR item IN cbreb.items;
        bre_id = item.target_biblio_record_entry;

        bibxml = helpers.unapi_bre(bre_id, {flesh => '{mra}'});
        FOR part IN bibxml.findnodes('//*[@tag="245"]/*[@code="a" or @code="b"]');
            title = title _ part.textContent;
        END;

        author = bibxml.findnodes('//*[@tag="100"]/*[@code="a"]').textContent;
        item_type = bibxml.findnodes('//*[local-name()="attributes"]/*[local-name()="field"][@name="item_type"]').getAttribute('coded-value');
        publisher = bibxml.findnodes('//*[@tag="260"]/*[@code="b"]').textContent;
        pubdate = bibxml.findnodes('//*[@tag="260"]/*[@code="c"]').textContent;
        isbn = bibxml.findnodes('//*[@tag="020"]/*[@code="a"]').textContent;
        %]

        <li>
            Bib ID# [% bre_id %] ISBN: [% isbn %]<br />
            Title: [% title %]<br />
            Author: [% author %]<br />
            Publication Info: [% publisher %] [% pubdate %]<br/>
            Item Type: [% item_type %]
        </li>
    [% END %]
    [% END %]
    </ol>
</div>
$$
    )
;

INSERT INTO action_trigger.environment (
        event_def,
        path
    ) VALUES -- for fleshing cbreb objects
         ( 31, 'owner' )
        ,( 31, 'items' )
        ,( 32, 'items' )
;

-- Use the ISO 4217 abbreviations for currency codes
INSERT INTO acq.currency_type (code, label) VALUES ('USD', oils_i18n_gettext('USD', 'US Dollars', 'acqct', 'label'));
INSERT INTO acq.currency_type (code, label) VALUES ('CAN', oils_i18n_gettext('CAN', 'Canadian Dollars', 'acqct', 'label'));
INSERT INTO acq.currency_type (code, label) VALUES ('EUR', oils_i18n_gettext('EUR', 'Euros', 'acqct', 'label'));

INSERT INTO acq.exchange_rate (from_currency,to_currency,ratio) VALUES ('USD','CAN',1.2);
INSERT INTO acq.exchange_rate (from_currency,to_currency,ratio) VALUES ('USD','EUR',0.5);

INSERT INTO acq.invoice_item_type (code,name) VALUES ('TAX',oils_i18n_gettext('TAX', 'Tax', 'aiit', 'name'));
INSERT INTO acq.invoice_item_type (code,name) VALUES ('PRO',oils_i18n_gettext('PRO', 'Processing Fee', 'aiit', 'name'));
INSERT INTO acq.invoice_item_type (code,name) VALUES ('SHP',oils_i18n_gettext('SHP', 'Shipping Charge', 'aiit', 'name'));
INSERT INTO acq.invoice_item_type (code,name) VALUES ('HND',oils_i18n_gettext('HND', 'Handling Charge', 'aiit', 'name'));
INSERT INTO acq.invoice_item_type (code,name) VALUES ('ITM',oils_i18n_gettext('ITM', 'Non-library Item', 'aiit', 'name'));
INSERT INTO acq.invoice_item_type (code,name) VALUES ('SUB',oils_i18n_gettext('SUB', 'Serial Subscription', 'aiit', 'name'));
INSERT INTO acq.invoice_item_type (code, blanket, name) VALUES (
    'BLA', TRUE, oils_i18n_gettext('BLA', 'Blanket Order', 'aiit', 'name'));


INSERT INTO acq.invoice_method (code,name) VALUES ('EDI',oils_i18n_gettext('EDI', 'EDI', 'acqim', 'name'));
INSERT INTO acq.invoice_method (code,name) VALUES ('PPR',oils_i18n_gettext('PPR', 'Paper', 'acqit', 'name'));

INSERT INTO acq.cancel_reason ( id, org_unit, label, description ) VALUES (
    1, 1, oils_i18n_gettext(1,'Canceled: Invalid ISBN', 'acqcr', 'label'), oils_i18n_gettext( 1, 'ISBN is unrecognizable', 'acqcr', 'description' ));
INSERT INTO acq.cancel_reason ( id, org_unit, label, description ) VALUES (
    2, 1, oils_i18n_gettext(2,'Canceled: Postpone', 'acqcr', 'label'), oils_i18n_gettext( 2, 'Title has been postponed', 'acqcr', 'description' ));
INSERT INTO acq.cancel_reason ( id, org_unit, label, description, keep_debits ) VALUES (
    3, 1, oils_i18n_gettext(3, 'Delayed: Delivered but Lost', 'acqcr', 'label'),
	oils_i18n_gettext( 3, 'Delivered but not received; presumed lost', 'acqcr', 'description' ), TRUE );

INSERT INTO acq.cancel_reason (keep_debits, id, org_unit, label, description) VALUES 
('f',(  2+1000), 1, oils_i18n_gettext(1002, 'Canceled: Deleted', 'acqcr', 'label'),
	oils_i18n_gettext(1002, 'The information is to be or has been deleted.', 'acqcr', 'description')),
('t',(  3+1000), 1, oils_i18n_gettext(1003, 'Delayed: Changed', 'acqcr', 'label'),
	oils_i18n_gettext(1003, 'The information is to be or has been changed.', 'acqcr', 'description')),
('t',(  4+1000), 1, oils_i18n_gettext(1004, 'Delayed: No Action', 'acqcr', 'label'),
	oils_i18n_gettext(1004, 'This line item is not affected by the actual message.', 'acqcr', 'description')),
('t',(  5+1000), 1, oils_i18n_gettext(1005, 'Delayed: Accepted without amendment', 'acqcr', 'label'),
	oils_i18n_gettext(1005, 'This line item is entirely accepted by the seller.', 'acqcr', 'description')),
('f',(  7+1000), 1, oils_i18n_gettext(1007, 'Canceled: Not Accepted', 'acqcr', 'label'),
	oils_i18n_gettext(1007, 'This line item is not accepted by the seller.', 'acqcr', 'description')),
('f',( 10+1000), 1, oils_i18n_gettext(1010, 'Canceled: Not Found', 'acqcr', 'label'),
       oils_i18n_gettext(1010, 'This line item is not found in the referenced message.', 'acqcr', 'description')),
('t',( 24+1000), 1, oils_i18n_gettext(1024, 'Delayed: Accepted with amendment', 'acqcr', 'label'),
       oils_i18n_gettext(1024, 'Accepted with changes which require no confirmation.', 'acqcr', 'description'));

INSERT INTO acq.cancel_reason (org_unit, keep_debits, id, label, description) VALUES 
(1, 't', 1211, oils_i18n_gettext(1211, 'Delayed: Split Quantity', 'acqcr', 'label'),
    oils_i18n_gettext(1211, 'Part of the whole quantity.', 'acqcr', 'description')),
(1, 't', 1221, oils_i18n_gettext(1221, 'Delayed: Ordered Quantity', 'acqcr', 'label'),
    oils_i18n_gettext(1221, '[6024] The quantity which has been ordered.', 'acqcr', 'description')),
(1, 't', 1246, oils_i18n_gettext(1246, 'Delayed: Pieces Delivered', 'acqcr', 'label'),
    oils_i18n_gettext(1246, 'Number of pieces actually received at the final destination.', 'acqcr', 'description')),
(1, 't', 1283, oils_i18n_gettext(1283, 'Delayed: Backorder', 'acqcr', 'label'),
    oils_i18n_gettext(1283, 'The quantity of goods that is on back-order.', 'acqcr', 'description')),
(1, 'f',( 85+1200), oils_i18n_gettext(1285, 'Canceled: By Vendor', 'acqcr', 'label'),
    oils_i18n_gettext(1285, 'Line item canceled by vendor', 'acqcr', 'description'));

INSERT INTO config.global_flag (name, label, enabled)
    VALUES (
        'circ.holds.usr_not_requestor',
        oils_i18n_gettext(
            'circ.holds.usr_not_requestor',
            'Holds: When testing hold matrix matchpoints, use the profile group of the receiving user instead of that of the requestor (affects staff-placed holds)',
            'cgf',
            'label'
        ),
        TRUE
    );

INSERT INTO config.global_flag (name, label, enabled)
    VALUES (
        'circ.holds.empty_issuance_ok',
        oils_i18n_gettext(
            'circ.holds.empty_issuance_ok',
            'Holds: Allow holds on empty issuances',
            'cgf',
            'label'
        ),
        TRUE
    );

INSERT INTO config.global_flag (name, label) -- defaults to enabled=FALSE
    VALUES (
        'ingest.disable_authority_linking',
        oils_i18n_gettext(
            'ingest.disable_authority_linking',
            'Authority Automation: Disable bib-authority link tracking',
            'cgf', 
            'label'
        )
    );

INSERT INTO config.global_flag (name, label) -- defaults to enabled=FALSE
    VALUES (
        'ingest.disable_authority_auto_update',
        oils_i18n_gettext(
            'ingest.disable_authority_auto_update',
            'Authority Automation: Disable automatic authority updating (requires link tracking)',
            'cgf', 
            'label'
        )
    );

INSERT INTO config.global_flag (name, label, enabled)
    VALUES (
        'cat.bib.use_id_for_tcn',
        oils_i18n_gettext(
            'cat.bib.use_id_for_tcn',
            'Cat: Use Internal ID for TCN Value',
            'cgf', 
            'label'
        ),
        TRUE
    );

INSERT INTO config.global_flag (name,label,enabled)
    VALUES (
        'history.circ.retention_age',
        oils_i18n_gettext('history.circ.retention_age', 'Historical Circulation Retention Age', 'cgf', 'label'),
        TRUE
    ),(
        'history.circ.retention_count',
        oils_i18n_gettext('history.circ.retention_count', 'Historical Circulations per Copy', 'cgf', 'label'),
        TRUE
    );

INSERT INTO config.global_flag  (name, label, enabled)
    VALUES (
        'history.hold.retention_age',
        oils_i18n_gettext('history.hold.retention_age', 'Historical Hold Retention Age', 'cgf', 'label'),
        TRUE
    ),(
        'history.hold.retention_age_fulfilled',
        oils_i18n_gettext('history.hold.retention_age_fulfilled', 'Historical Hold Retention Age - Fulfilled', 'cgf', 'label'),
        FALSE
    ),(
        'history.hold.retention_age_canceled',
        oils_i18n_gettext('history.hold.retention_age_canceled', 'Historical Hold Retention Age - Canceled (Default)', 'cgf', 'label'),
        FALSE
    ),(
        'history.hold.retention_age_canceled_1',
        oils_i18n_gettext('history.hold.retention_age_canceled_1', 'Historical Hold Retention Age - Canceled (Untarged expiration)', 'cgf', 'label'),
        FALSE
    ),(
        'history.hold.retention_age_canceled_2',
        oils_i18n_gettext('history.hold.retention_age_canceled_2', 'Historical Hold Retention Age - Canceled (Hold Shelf expiration)', 'cgf', 'label'),
        FALSE
    ),(
        'history.hold.retention_age_canceled_3',
        oils_i18n_gettext('history.hold.retention_age_canceled_3', 'Historical Hold Retention Age - Canceled (Patron via phone)', 'cgf', 'label'),
        TRUE
    ),(
        'history.hold.retention_age_canceled_4',
        oils_i18n_gettext('history.hold.retention_age_canceled_4', 'Historical Hold Retention Age - Canceled (Patron in person)', 'cgf', 'label'),
        TRUE
    ),(
        'history.hold.retention_age_canceled_5',
        oils_i18n_gettext('history.hold.retention_age_canceled_5', 'Historical Hold Retention Age - Canceled (Staff forced)', 'cgf', 'label'),
        TRUE
    ),(
        'history.hold.retention_age_canceled_6',
        oils_i18n_gettext('history.hold.retention_age_canceled_6', 'Historical Hold Retention Age - Canceled (Patron via OPAC)', 'cgf', 'label'),
        FALSE
    );

INSERT INTO config.global_flag (name, label, enabled)
    VALUES (
        'cat.maintain_control_numbers',
        oils_i18n_gettext(
            'cat.maintain_control_numbers',
            'Cat: Maintain 001/003/035 according to the MARC21 specification',
            'cgf', 
            'label'
        ),
        TRUE
    );

INSERT INTO config.global_flag (name, label, enabled)
    VALUES (
        'circ.opac_renewal.use_original_circ_lib',
        oils_i18n_gettext(
            'circ.opac_renewal.use_original_circ_lib',
            'Circ: Use original circulation library on opac renewal instead of user home library',
            'cgf',
            'label'
        ),
        FALSE
    );

INSERT INTO config.global_flag (name, label, enabled)
    VALUES (
        'circ.desk_renewal.use_original_circ_lib',
        oils_i18n_gettext(
            'circ.desk_renewal.use_original_circ_lib',
            'Circ: Use original circulation library on desk renewal instead of the workstation library',
            'cgf',
            'label'
        ),
        FALSE
    );

INSERT INTO config.global_flag (name, label, value, enabled)
    VALUES (
        'opac.use_autosuggest',
        oils_i18n_gettext(
            'opac.use_autosuggest',
            'OPAC: Show auto-completing suggestions dialog under basic search box (put ''opac_visible'' into the value field to limit suggestions to OPAC-visible items, or blank the field for a possible performance improvement)',
            'cgf',
            'label'
        ),
        'opac_visible',
        FALSE
    );

INSERT INTO config.global_flag (name, label)
    VALUES (
        'history.circ.retention_uses_last_finished',
        oils_i18n_gettext(
            'history.circ.retention_uses_last_finished',
            'Historical Circulations use most recent xact_finish date instead of last circ''s.',
            'cgf',
            'label'
        )
    ),(
        'history.circ.retention_age_is_min',
        oils_i18n_gettext(
            'history.circ.retention_age_is_min',
            'Historical Circulations are kept for global retention age at a minimum, regardless of user preferences.',
            'cgf',
            'label'
        )
    );

INSERT INTO config.global_flag (name, value, enabled, label)
VALUES (
    'opac.browse.warnable_regexp_per_class',
    '{"title": "^(a|the|an)\\s"}',
    FALSE,
    oils_i18n_gettext(
        'opac.browse.warnable_regexp_per_class',
        'Map of search classes to regular expressions to warn user about leading articles.',
        'cgf',
        'label'
    )
),
(
    'opac.browse.holdings_visibility_test_limit',
    '100',
    TRUE,
    oils_i18n_gettext(
        'opac.browse.holdings_visibility_test_limit',
        'Don''t look for more than this number of records with holdings when displaying browse headings with visible record counts.',
        'cgf',
        'label'
    )
);

INSERT INTO config.global_flag (name, enabled, label)
VALUES (
    'opac.located_uri.act_as_copy',
    FALSE,
    oils_i18n_gettext(
        'opac.located_uri.act_as_copy',
        'When enabled, Located URIs will provide visiblity behavior identical to copies.',
        'cgf',
        'label'
    )
);

INSERT INTO config.global_flag (name, label, value, enabled) VALUES (
    'opac.icon_attr',
    oils_i18n_gettext(
        'opac.icon_attr',
        'OPAC Format Icons Attribute',
        'cgf',
        'label'
    ),
    'icon_format',
    TRUE
);

INSERT INTO config.global_flag (name, label, value, enabled) VALUES (
    'opac.default_sort',
    oils_i18n_gettext(
        'opac.default_sort',
        'OPAC Default Sort (titlesort, authorsort, pubdate, popularity, poprel, or empty)',
        'cgf',
        'label'
    ),
    '',
    TRUE
);

INSERT INTO config.global_flag (name, label, value, enabled) VALUES (
    'search.max_popularity_importance_multiplier',
    oils_i18n_gettext(
        'search.max_popularity_importance_multiplier',
        'Maximum popularity importance multiplier for popularity-adjusted relevance searches (decimal value between 1.0 and 2.0)',
        'cgf',
        'label'
    ),
    '1.1',
    TRUE
);

INSERT INTO config.usr_setting_type (name,opac_visible,label,description,datatype)
    VALUES (
        'history.circ.retention_age',
        TRUE,
        oils_i18n_gettext('history.circ.retention_age','Historical Circulation Retention Age','cust','label'),
        oils_i18n_gettext('history.circ.retention_age','Historical Circulation Retention Age','cust','description'),
        'interval'
    ),(
        'history.circ.retention_start',
        FALSE,
        oils_i18n_gettext('history.circ.retention_start','Historical Circulation Retention Start Date','cust','label'),
        oils_i18n_gettext('history.circ.retention_start','Historical Circulation Retention Start Date','cust','description'),
        'date'
    );

INSERT INTO config.usr_setting_type (name,opac_visible,label,description,datatype)
    VALUES (
        'history.hold.retention_age',
        TRUE,
        oils_i18n_gettext('history.hold.retention_age','Historical Hold Retention Age','cust','label'),
        oils_i18n_gettext('history.hold.retention_age','Historical Hold Retention Age','cust','description'),
        'interval'
    ),(
        'history.hold.retention_start',
        TRUE,
        oils_i18n_gettext('history.hold.retention_start','Historical Hold Retention Start Date','cust','label'),
        oils_i18n_gettext('history.hold.retention_start','Historical Hold Retention Start Date','cust','description'),
        'interval'
    ),(
        'history.hold.retention_count',
        TRUE,
        oils_i18n_gettext('history.hold.retention_count','Historical Hold Retention Count','cust','label'),
        oils_i18n_gettext('history.hold.retention_count','Historical Hold Retention Count','cust','description'),
        'integer'
    );

-- 0311.data.query-seed-datatypes.sql
-- Define the most common datatypes in query.datatype.  Note that none of
-- these stock datatypes specifies a width or precision.

INSERT INTO query.datatype (id, datatype_name, is_numeric )
  VALUES (1, 'SMALLINT', true);
 
INSERT INTO query.datatype (id, datatype_name, is_numeric )
  VALUES (2, 'INTEGER', true);
 
INSERT INTO query.datatype (id, datatype_name, is_numeric )
  VALUES (3, 'BIGINT', true);
 
INSERT INTO query.datatype (id, datatype_name, is_numeric )
  VALUES (4, 'DECIMAL', true);
 
INSERT INTO query.datatype (id, datatype_name, is_numeric )
  VALUES (5, 'NUMERIC', true);
 
INSERT INTO query.datatype (id, datatype_name, is_numeric )
  VALUES (6, 'REAL', true);
 
INSERT INTO query.datatype (id, datatype_name, is_numeric )
  VALUES (7, 'DOUBLE PRECISION', true);
 
INSERT INTO query.datatype (id, datatype_name, is_numeric )
  VALUES (8, 'SERIAL', true);
 
INSERT INTO query.datatype (id, datatype_name, is_numeric )
  VALUES (9, 'BIGSERIAL', true);
 
INSERT INTO query.datatype (id, datatype_name, is_numeric )
  VALUES (10, 'MONEY', false);
 
INSERT INTO query.datatype (id, datatype_name, is_numeric )
  VALUES (11, 'VARCHAR', false);
 
INSERT INTO query.datatype (id, datatype_name, is_numeric )
  VALUES (12, 'CHAR', false);
 
INSERT INTO query.datatype (id, datatype_name, is_numeric )
  VALUES (13, 'TEXT', false);
 
INSERT INTO query.datatype (id, datatype_name, is_numeric )
  VALUES (14, '"char"', false);
 
INSERT INTO query.datatype (id, datatype_name, is_numeric )
  VALUES (15, 'NAME', false);
 
INSERT INTO query.datatype (id, datatype_name, is_numeric )
  VALUES (16, 'BYTEA', false);
 
INSERT INTO query.datatype (id, datatype_name, is_numeric )
  VALUES (17, 'TIMESTAMP WITHOUT TIME ZONE', false);
 
INSERT INTO query.datatype (id, datatype_name, is_numeric )
  VALUES (18, 'TIMESTAMP WITH TIME ZONE', false);
 
INSERT INTO query.datatype (id, datatype_name, is_numeric )
  VALUES (19, 'DATE', false);
 
INSERT INTO query.datatype (id, datatype_name, is_numeric )
  VALUES (20, 'TIME WITHOUT TIME ZONE', false);
 
INSERT INTO query.datatype (id, datatype_name, is_numeric )
  VALUES (21, 'TIME WITH TIME ZONE', false);
 
INSERT INTO query.datatype (id, datatype_name, is_numeric )
  VALUES (22, 'INTERVAL', false);
 
INSERT INTO query.datatype (id, datatype_name, is_numeric )
  VALUES (23, 'BOOLEAN', false);

INSERT INTO config.usr_setting_type (name, opac_visible, label, description, datatype) 
    VALUES (
        'opac.default_sort',
        TRUE,
        oils_i18n_gettext(
            'opac.default_sort',
            'OPAC Default Search Sort',
            'cust',
            'label'
        ),
        oils_i18n_gettext(
            'opac.default_sort',
            'OPAC Default Search Sort',
            'cust',
            'description'
        ),
        'string'
    );

-- 0355.data.missing_pieces_format.sql

INSERT INTO action_trigger.hook (key,core_type,description,passive) VALUES 
    (   'circ.format.missing_pieces.slip.print',
        'circ', 
        oils_i18n_gettext(
            'circ.format.missing_pieces.slip.print',
            'A missing pieces slip needs to be formatted for printing.',
            'ath',
            'description'
        ), 
        FALSE
    )
    ,(  'circ.format.missing_pieces.letter.print',
        'circ', 
        oils_i18n_gettext(
            'circ.format.missing_pieces.letter.print',
            'A missing pieces patron letter needs to be formatted for printing.',
            'ath',
            'description'
        ), 
        FALSE
    )
;

INSERT INTO action_trigger.event_definition (
        id,
        active,
        owner,
        name,
        hook,
        validator,
        reactor,
        group_field,
        granularity,
        template
    ) VALUES (
        33,
        TRUE,
        1,
        'circ.missing_pieces.slip.print',
        'circ.format.missing_pieces.slip.print',
        'NOOP_True',
        'ProcessTemplate',
        'usr',
        'print-on-demand',
$$
[%- USE date -%]
[%- SET user = target.0.usr -%]
<div style="li { padding: 8px; margin 5px; }">
    <div>[% date.format %]</div><br/>
    Missing pieces for:
    <ol>
    [% FOR circ IN target %]
        <li>Barcode: [% circ.target_copy.barcode %] Transaction ID: [% circ.id %] Due: [% circ.due_date.format %]<br />
            [% helpers.get_copy_bib_basics(circ.target_copy.id).title %]
        </li>
    [% END %]
    </ol>
</div>
$$
    )
    ,(
        34,
        TRUE,
        1,
        'circ.missing_pieces.letter.print',
        'circ.format.missing_pieces.letter.print',
        'NOOP_True',
        'ProcessTemplate',
        'usr',
        'print-on-demand',
$$
[%- USE date -%]
[%- SET user = target.0.usr -%]
[% date.format %]
Dear [% user.prefix %] [% user.first_given_name %] [% user.family_name %],

We are missing pieces for the following returned items:
[% FOR circ IN target %]
Barcode: [% circ.target_copy.barcode %] Transaction ID: [% circ.id %] Due: [% circ.due_date.format %]
[% helpers.get_copy_bib_basics(circ.target_copy.id).title %]
[% END %]

Please return these pieces as soon as possible.

Thanks!

Library Staff
$$
    )
;

INSERT INTO action_trigger.environment (
        event_def,
        path
    ) VALUES -- for fleshing circ objects
         ( 33, 'usr')
        ,( 33, 'target_copy')
        ,( 33, 'target_copy.circ_lib')
        ,( 33, 'target_copy.circ_lib.mailing_address')
        ,( 33, 'target_copy.circ_lib.billing_address')
        ,( 33, 'target_copy.call_number')
        ,( 33, 'target_copy.call_number.owning_lib')
        ,( 33, 'target_copy.call_number.owning_lib.mailing_address')
        ,( 33, 'target_copy.call_number.owning_lib.billing_address')
        ,( 33, 'circ_lib')
        ,( 33, 'circ_lib.mailing_address')
        ,( 33, 'circ_lib.billing_address')
        ,( 34, 'usr')
        ,( 34, 'target_copy')
        ,( 34, 'target_copy.circ_lib')
        ,( 34, 'target_copy.circ_lib.mailing_address')
        ,( 34, 'target_copy.circ_lib.billing_address')
        ,( 34, 'target_copy.call_number')
        ,( 34, 'target_copy.call_number.owning_lib')
        ,( 34, 'target_copy.call_number.owning_lib.mailing_address')
        ,( 34, 'target_copy.call_number.owning_lib.billing_address')
        ,( 34, 'circ_lib')
        ,( 34, 'circ_lib.mailing_address')
        ,( 34, 'circ_lib.billing_address')
;

-- 0384.data.hold_pull_list_template.sql

INSERT INTO action_trigger.hook (key,core_type,description,passive) 
    VALUES (   
        'ahr.format.pull_list',
        'ahr', 
        oils_i18n_gettext(
            'ahr.format.pull_list',
            'Format holds pull list for printing',
            'ath',
            'description'
        ), 
        FALSE
    );

INSERT INTO action_trigger.event_definition (
        id,
        active,
        owner,
        name,
        hook,
        validator,
        reactor,
        group_field,
        granularity,
        template
    ) VALUES (
        35,
        TRUE,
        1,
        'Holds Pull List',
        'ahr.format.pull_list',
        'NOOP_True',
        'ProcessTemplate',
        'pickup_lib',
        'print-on-demand',
$$
[%- USE date -%]
<style>
    table { border-collapse: collapse; }
    td { padding: 5px; border-bottom: 1px solid #888; }
    th { font-weight: bold; }
</style>
[%
    # Sort the holds into copy-location buckets
    # In the main print loop, sort each bucket by callnumber before printing
    SET holds_list = [];
    SET loc_data = [];
    SET current_location = target.0.current_copy.location.id;
    FOR hold IN target;
        IF current_location != hold.current_copy.location.id;
            SET current_location = hold.current_copy.location.id;
            holds_list.push(loc_data);
            SET loc_data = [];
        END;
        SET hold_data = {
            'hold' => hold,
            'callnumber' => hold.current_copy.call_number.label
        };
        loc_data.push(hold_data);
    END;
    holds_list.push(loc_data)
%]
<table>
    <thead>
        <tr>
            <th>Title</th>
            <th>Author</th>
            <th>Shelving Location</th>
            <th>Call Number</th>
            <th>Barcode/Part</th>
            <th>Patron</th>
        </tr>
    </thead>
    <tbody>
    [% FOR loc_data IN holds_list  %]
        [% FOR hold_data IN loc_data.sort('callnumber') %]
            [%
                SET hold = hold_data.hold;
                SET copy_data = helpers.get_copy_bib_basics(hold.current_copy.id);
            %]
            <tr>
                <td>[% copy_data.title | truncate %]</td>
                <td>[% copy_data.author | truncate %]</td>
                <td>[% hold.current_copy.location.name %]</td>
                <td>[% hold.current_copy.call_number.label %]</td>
                <td>[% hold.current_copy.barcode %]
                    [% FOR part IN hold.current_copy.parts %]
                       [% part.part.label %]
                    [% END %]
                </td>
                <td>[% hold.usr.card.barcode %]</td>
            </tr>
        [% END %]
    [% END %]
    <tbody>
</table>
$$
);

INSERT INTO action_trigger.environment (
        event_def,
        path
    ) VALUES
        (35, 'current_copy.location'),
        (35, 'current_copy.call_number'),
        (35, 'usr.card'),
        (35, 'pickup_lib'),
        (35, 'current_copy.parts'),
        (35, 'current_copy.parts.part')
;

-- 0412.data.trigger.validator.HoldIsCancelled.sql

INSERT INTO action_trigger.validator (module, description) VALUES (
    'HoldIsCancelled',
    oils_i18n_gettext(
        'HoldIsCancelled',
        'Check whether a hold request is cancelled.',
        'atval',
        'description'
    )
);

-- 0448.data.trigger.circ.staff_age_to_lost.sql

INSERT INTO action_trigger.hook (key,core_type,description,passive) VALUES 
    (   'circ.staff_age_to_lost',
        'circ', 
        oils_i18n_gettext(
            'circ.staff_age_to_lost',
            'An overdue circulation should be aged to a Lost status.',
            'ath',
            'description'
        ), 
        TRUE
    )
;

INSERT INTO action_trigger.event_definition (
        id,
        active,
        owner,
        name,
        hook,
        validator,
        reactor,
        delay_field
    ) VALUES (
        36,
        FALSE,
        1,
        'circ.staff_age_to_lost',
        'circ.staff_age_to_lost',
        'CircIsOverdue',
        'MarkItemLost',
        'due_date'
    )
;

INSERT INTO action_trigger.hook (key,core_type,description)
    VALUES ('circ.recall.target', 'circ', 'A checked-out copy has been recalled for a hold.');

INSERT INTO action_trigger.event_definition (id, owner, name, hook, validator, reactor, group_field, template)
    VALUES (37, 1, 'Item Recall Email Notice', 'circ.recall.target', 'NOOP_True', 'SendEmail', 'usr', 
$$
[%- USE date -%]
[%- user = target.0.usr -%]
To: [%- params.recipient_email || user.email %]
From: [%- params.sender_email || default_sender %]
Date: [%- date.format(date.now, '%a, %d %b %Y %T -0000', gmt => 1) %]
Subject: Item Recall Notification
Auto-Submitted: auto-generated 

Dear [% user.family_name %], [% user.first_given_name %]

The following item which you have checked out has been recalled so that
another patron can have access to the item:

[% FOR circ IN target %]
    Title: [% circ.target_copy.call_number.record.simple_record.title %] 
    Barcode: [% circ.target_copy.barcode %] 
    Now Due: [% date.format(helpers.format_date(circ.due_date), '%Y-%m-%d') %]
    Library: [% circ.circ_lib.name %]

    If this item is not returned by the new due date, fines will be assessed at
    the rate of [% circ.recurring_fine %] every [% circ.fine_interval %].
[% END %]
$$
);

INSERT INTO action_trigger.environment (event_def, path) VALUES
    (37, 'target_copy.call_number.record.simple_record'),
    (37, 'usr'),
    (37, 'circ_lib.billing_address')
;

INSERT INTO vandelay.import_error ( code, description ) VALUES ( 'general.unknown', oils_i18n_gettext('general.unknown', 'Import or Overlay failed', 'vie', 'description') );
INSERT INTO vandelay.import_error ( code, description ) VALUES ( 'import.item.duplicate.barcode', oils_i18n_gettext('import.item.duplicate.barcode', 'Import failed due to barcode collision', 'vie', 'description') );
INSERT INTO vandelay.import_error ( code, description ) VALUES ( 'import.item.invalid.circ_modifier', oils_i18n_gettext('import.item.invalid.circ_modifier', 'Import failed due to invalid circulation modifier', 'vie', 'description') );
INSERT INTO vandelay.import_error ( code, description ) VALUES ( 'import.item.invalid.location', oils_i18n_gettext('import.item.invalid.location', 'Import failed due to invalid copy location', 'vie', 'description') );
INSERT INTO vandelay.import_error ( code, description ) VALUES ( 'import.duplicate.sysid', oils_i18n_gettext('import.duplicate.sysid', 'Import failed due to system id collision', 'vie', 'description') );
INSERT INTO vandelay.import_error ( code, description ) VALUES ( 'import.duplicate.tcn', oils_i18n_gettext('import.duplicate.sysid', 'Import failed due to system id collision', 'vie', 'description') );
INSERT INTO vandelay.import_error ( code, description ) VALUES ( 'overlay.missing.sysid', oils_i18n_gettext('overlay.missing.sysid', 'Overlay failed due to missing system id', 'vie', 'description') );
INSERT INTO vandelay.import_error ( code, description ) VALUES ( 'import.auth.duplicate.acn', oils_i18n_gettext('import.auth.duplicate.acn', 'Import failed due to Accession Number collision', 'vie', 'description') );
INSERT INTO vandelay.import_error ( code, description ) VALUES ( 'import.xml.malformed', oils_i18n_gettext('import.xml.malformed', 'Malformed record cause Import failure', 'vie', 'description') );
INSERT INTO vandelay.import_error ( code, description ) VALUES ( 'overlay.xml.malformed', oils_i18n_gettext('overlay.xml.malformed', 'Malformed record cause Overlay failure', 'vie', 'description') );
INSERT INTO vandelay.import_error ( code, description ) VALUES ( 'overlay.record.quality', oils_i18n_gettext('overlay.record.quality', 'New record had insufficient quality', 'vie', 'description') );

INSERT INTO vandelay.import_error ( code, description ) VALUES ( 
    'import.item.invalid.status', oils_i18n_gettext('import.item.invalid.status', 'Invalid value for "status"', 'vie', 'description') );
INSERT INTO vandelay.import_error ( code, description ) VALUES ( 
    'import.item.invalid.price', oils_i18n_gettext('import.item.invalid.price', 'Invalid value for "price"', 'vie', 'description') );
INSERT INTO vandelay.import_error ( code, description ) VALUES ( 
    'import.item.invalid.deposit_amount', oils_i18n_gettext('import.item.invalid.deposit_amount', 'Invalid value for "deposit_amount"', 'vie', 'description') );
INSERT INTO vandelay.import_error ( code, description ) VALUES ( 
    'import.item.invalid.owning_lib', oils_i18n_gettext('import.item.invalid.owning_lib', 'Invalid value for "owning_lib"', 'vie', 'description') );
INSERT INTO vandelay.import_error ( code, description ) VALUES ( 
    'import.item.invalid.circ_lib', oils_i18n_gettext('import.item.invalid.circ_lib', 'Invalid value for "circ_lib"', 'vie', 'description') );
INSERT INTO vandelay.import_error ( code, description ) VALUES ( 
    'import.item.invalid.copy_number', oils_i18n_gettext('import.item.invalid.copy_number', 'Invalid value for "copy_number"', 'vie', 'description') );
INSERT INTO vandelay.import_error ( code, description ) VALUES ( 
    'import.item.invalid.circ_as_type', oils_i18n_gettext('import.item.invalid.circ_as_type', 'Invalid value for "circ_as_type"', 'vie', 'description') );
INSERT INTO vandelay.import_error ( code, description ) VALUES ( 
    'import.record.perm_failure', oils_i18n_gettext('import.record.perm_failure', 'Perm failure creating a record', 'vie', 'description') );
INSERT INTO vandelay.import_error ( code, description ) VALUES (
    'import.item.invalid.stat_cat_format', oils_i18n_gettext('import.item.invalid.stat_cat_format', 'Bad format for stat cat data, should be like: CAT 1|VALUE 1', 'vie', 'description') );
INSERT INTO vandelay.import_error ( code, description ) VALUES (
    'import.item.invalid.stat_cat_data', oils_i18n_gettext('import.item.invalid.stat_cat_data', 'Invalid stat cat data', 'vie', 'description') );

-- Event def for email notice for hold cancelled due to lack of target -----

INSERT INTO action_trigger.event_definition (id, active, owner, name, hook, validator, reactor, delay, delay_field, group_field, template)
    VALUES (38, FALSE, 1, 
        'Hold Cancelled (No Target) Email Notification', 
        'hold_request.cancel.expire_no_target', 
        'HoldIsCancelled', 'SendEmail', '30 minutes', 'cancel_time', 'usr',
$$
[%- USE date -%]
[%- user = target.0.usr -%]
To: [%- params.recipient_email || user.email %]
From: [%- params.sender_email || default_sender %]
Date: [%- date.format(date.now, '%a, %d %b %Y %T -0000', gmt => 1) %]
Subject: Hold Request Cancelled
Auto-Submitted: auto-generated

Dear [% user.family_name %], [% user.first_given_name %]
The following holds were cancelled because no items were found to fulfill the hold.

[% FOR hold IN target %]
    Title: [% hold.bib_rec.bib_record.simple_record.title %]
    Author: [% hold.bib_rec.bib_record.simple_record.author %]
    Library: [% hold.pickup_lib.name %]
    Request Date: [% date.format(helpers.format_date(hold.rrequest_time), '%Y-%m-%d') %]
[% END %]

$$);

INSERT INTO action_trigger.environment (event_def, path) VALUES
    (38, 'usr'),
    (38, 'pickup_lib'),
    (38, 'bib_rec.bib_record.simple_record');

INSERT INTO action_trigger.event_params (event_def, param, value)
    VALUES (38, 'check_email_notify', 1);

----------------------------------------------------------------
-- Seed data for queued record/item exports
----------------------------------------------------------------

INSERT INTO action_trigger.hook (key,core_type,description,passive) VALUES (
        'vandelay.queued_bib_record.print',
        'vqbr', 
        oils_i18n_gettext(
            'vandelay.queued_bib_record.print',
            'Print output has been requested for records in an Importer Bib Queue.',
            'ath',
            'description'
        ), 
        FALSE
    )
    ,(
        'vandelay.queued_bib_record.csv',
        'vqbr', 
        oils_i18n_gettext(
            'vandelay.queued_bib_record.csv',
            'CSV output has been requested for records in an Importer Bib Queue.',
            'ath',
            'description'
        ), 
        FALSE
    )
    ,(
        'vandelay.queued_bib_record.email',
        'vqbr', 
        oils_i18n_gettext(
            'vandelay.queued_bib_record.email',
            'An email has been requested for records in an Importer Bib Queue.',
            'ath',
            'description'
        ), 
        FALSE
    )
    ,(
        'vandelay.queued_auth_record.print',
        'vqar', 
        oils_i18n_gettext(
            'vandelay.queued_auth_record.print',
            'Print output has been requested for records in an Importer Authority Queue.',
            'ath',
            'description'
        ), 
        FALSE
    )
    ,(
        'vandelay.queued_auth_record.csv',
        'vqar', 
        oils_i18n_gettext(
            'vandelay.queued_auth_record.csv',
            'CSV output has been requested for records in an Importer Authority Queue.',
            'ath',
            'description'
        ), 
        FALSE
    )
    ,(
        'vandelay.queued_auth_record.email',
        'vqar', 
        oils_i18n_gettext(
            'vandelay.queued_auth_record.email',
            'An email has been requested for records in an Importer Authority Queue.',
            'ath',
            'description'
        ), 
        FALSE
    )
    ,(
        'vandelay.import_items.print',
        'vii', 
        oils_i18n_gettext(
            'vandelay.import_items.print',
            'Print output has been requested for Import Items from records in an Importer Bib Queue.',
            'ath',
            'description'
        ), 
        FALSE
    )
    ,(
        'vandelay.import_items.csv',
        'vii', 
        oils_i18n_gettext(
            'vandelay.import_items.csv',
            'CSV output has been requested for Import Items from records in an Importer Bib Queue.',
            'ath',
            'description'
        ), 
        FALSE
    )
    ,(
        'vandelay.import_items.email',
        'vii', 
        oils_i18n_gettext(
            'vandelay.import_items.email',
            'An email has been requested for Import Items from records in an Importer Bib Queue.',
            'ath',
            'description'
        ), 
        FALSE
    )
;

INSERT INTO action_trigger.event_definition (
        id,
        active,
        owner,
        name,
        hook,
        validator,
        reactor,
        group_field,
        granularity,
        template
    ) VALUES (
        39,
        TRUE,
        1,
        'Print Output for Queued Bib Records',
        'vandelay.queued_bib_record.print',
        'NOOP_True',
        'ProcessTemplate',
        'queue.owner',
        'print-on-demand',
$$
[%- USE date -%]
<pre>
Queue ID: [% target.0.queue.id %]
Queue Name: [% target.0.queue.name %]
Queue Type: [% target.0.queue.queue_type %]
Complete? [% target.0.queue.complete %]

    [% FOR vqbr IN target %]
=-=-=
 Title of work    | [% helpers.get_queued_bib_attr('title',vqbr.attributes) %]
 Author of work   | [% helpers.get_queued_bib_attr('author',vqbr.attributes) %]
 Language of work | [% helpers.get_queued_bib_attr('language',vqbr.attributes) %]
 Pagination       | [% helpers.get_queued_bib_attr('pagination',vqbr.attributes) %]
 ISBN             | [% helpers.get_queued_bib_attr('isbn',vqbr.attributes) %]
 ISSN             | [% helpers.get_queued_bib_attr('issn',vqbr.attributes) %]
 Price            | [% helpers.get_queued_bib_attr('price',vqbr.attributes) %]
 Accession Number | [% helpers.get_queued_bib_attr('rec_identifier',vqbr.attributes) %]
 TCN Value        | [% helpers.get_queued_bib_attr('eg_tcn',vqbr.attributes) %]
 TCN Source       | [% helpers.get_queued_bib_attr('eg_tcn_source',vqbr.attributes) %]
 Internal ID      | [% helpers.get_queued_bib_attr('eg_identifier',vqbr.attributes) %]
 Publisher        | [% helpers.get_queued_bib_attr('publisher',vqbr.attributes) %]
 Publication Date | [% helpers.get_queued_bib_attr('pubdate',vqbr.attributes) %]
 Edition          | [% helpers.get_queued_bib_attr('edition',vqbr.attributes) %]
 Item Barcode     | [% helpers.get_queued_bib_attr('item_barcode',vqbr.attributes) %]
 Import Error     | [% vqbr.import_error %]
 Error Detail     | [% vqbr.error_detail %]
 Match Count      | [% vqbr.matches.size %]

    [% END %]
</pre>
$$
    )
;

INSERT INTO action_trigger.environment ( event_def, path) VALUES (
    39, 'attributes')
    ,( 39, 'queue')
    ,( 39, 'matches')
;

INSERT INTO action_trigger.event_definition (
        id,
        active,
        owner,
        name,
        hook,
        validator,
        reactor,
        group_field,
        granularity,
        template
    ) VALUES (
        40,
        TRUE,
        1,
        'CSV Output for Queued Bib Records',
        'vandelay.queued_bib_record.csv',
        'NOOP_True',
        'ProcessTemplate',
        'queue.owner',
        'print-on-demand',
$$
[%- USE date -%]
"Title of work","Author of work","Language of work","Pagination","ISBN","ISSN","Price","Accession Number","TCN Value","TCN Source","Internal ID","Publisher","Publication Date","Edition","Item Barcode","Import Error","Error Detail","Match Count"
[% FOR vqbr IN target %]"[% helpers.get_queued_bib_attr('title',vqbr.attributes) | replace('"', '""') %]","[% helpers.get_queued_bib_attr('author',vqbr.attributes) | replace('"', '""') %]","[% helpers.get_queued_bib_attr('language',vqbr.attributes) | replace('"', '""') %]","[% helpers.get_queued_bib_attr('pagination',vqbr.attributes) | replace('"', '""') %]","[% helpers.get_queued_bib_attr('isbn',vqbr.attributes) | replace('"', '""') %]","[% helpers.get_queued_bib_attr('issn',vqbr.attributes) | replace('"', '""') %]","[% helpers.get_queued_bib_attr('price',vqbr.attributes) | replace('"', '""') %]","[% helpers.get_queued_bib_attr('rec_identifier',vqbr.attributes) | replace('"', '""') %]","[% helpers.get_queued_bib_attr('eg_tcn',vqbr.attributes) | replace('"', '""') %]","[% helpers.get_queued_bib_attr('eg_tcn_source',vqbr.attributes) | replace('"', '""') %]","[% helpers.get_queued_bib_attr('eg_identifier',vqbr.attributes) | replace('"', '""') %]","[% helpers.get_queued_bib_attr('publisher',vqbr.attributes) | replace('"', '""') %]","[% helpers.get_queued_bib_attr('pubdate',vqbr.attributes) | replace('"', '""') %]","[% helpers.get_queued_bib_attr('edition',vqbr.attributes) | replace('"', '""') %]","[% helpers.get_queued_bib_attr('item_barcode',vqbr.attributes) | replace('"', '""') %]","[% vqbr.import_error | replace('"', '""') %]","[% vqbr.error_detail | replace('"', '""') %]","[% vqbr.matches.size %]"
[% END %]
$$
    )
;

INSERT INTO action_trigger.environment ( event_def, path) VALUES (
    40, 'attributes')
    ,( 40, 'queue')
    ,( 40, 'matches')
;

INSERT INTO action_trigger.event_definition (
        id,
        active,
        owner,
        name,
        hook,
        validator,
        reactor,
        group_field,
        granularity,
        template
    ) VALUES (
        41,
        TRUE,
        1,
        'Email Output for Queued Bib Records',
        'vandelay.queued_bib_record.email',
        'NOOP_True',
        'SendEmail',
        'queue.owner',
        NULL,
$$
[%- USE date -%]
[%- SET user = target.0.queue.owner -%]
To: [%- params.recipient_email || user.email || 'root@localhost' %]
From: [%- params.sender_email || default_sender %]
Date: [%- date.format(date.now, '%a, %d %b %Y %T -0000', gmt => 1) %]
Subject: Bibs from Import Queue
Auto-Submitted: auto-generated

Queue ID: [% target.0.queue.id %]
Queue Name: [% target.0.queue.name %]
Queue Type: [% target.0.queue.queue_type %]
Complete? [% target.0.queue.complete %]

    [% FOR vqbr IN target %]
=-=-=
 Title of work    | [% helpers.get_queued_bib_attr('title',vqbr.attributes) %]
 Author of work   | [% helpers.get_queued_bib_attr('author',vqbr.attributes) %]
 Language of work | [% helpers.get_queued_bib_attr('language',vqbr.attributes) %]
 Pagination       | [% helpers.get_queued_bib_attr('pagination',vqbr.attributes) %]
 ISBN             | [% helpers.get_queued_bib_attr('isbn',vqbr.attributes) %]
 ISSN             | [% helpers.get_queued_bib_attr('issn',vqbr.attributes) %]
 Price            | [% helpers.get_queued_bib_attr('price',vqbr.attributes) %]
 Accession Number | [% helpers.get_queued_bib_attr('rec_identifier',vqbr.attributes) %]
 TCN Value        | [% helpers.get_queued_bib_attr('eg_tcn',vqbr.attributes) %]
 TCN Source       | [% helpers.get_queued_bib_attr('eg_tcn_source',vqbr.attributes) %]
 Internal ID      | [% helpers.get_queued_bib_attr('eg_identifier',vqbr.attributes) %]
 Publisher        | [% helpers.get_queued_bib_attr('publisher',vqbr.attributes) %]
 Publication Date | [% helpers.get_queued_bib_attr('pubdate',vqbr.attributes) %]
 Edition          | [% helpers.get_queued_bib_attr('edition',vqbr.attributes) %]
 Item Barcode     | [% helpers.get_queued_bib_attr('item_barcode',vqbr.attributes) %]

    [% END %]

$$
    )
;

INSERT INTO action_trigger.environment ( event_def, path) VALUES (
    41, 'attributes')
    ,( 41, 'queue')
    ,( 41, 'queue.owner')
;

INSERT INTO action_trigger.event_definition (
        id,
        active,
        owner,
        name,
        hook,
        validator,
        reactor,
        group_field,
        granularity,
        template
    ) VALUES (
        42,
        TRUE,
        1,
        'Print Output for Queued Authority Records',
        'vandelay.queued_auth_record.print',
        'NOOP_True',
        'ProcessTemplate',
        'queue.owner',
        'print-on-demand',
$$
[%- USE date -%]
<pre>
Queue ID: [% target.0.queue.id %]
Queue Name: [% target.0.queue.name %]
Queue Type: [% target.0.queue.queue_type %]
Complete? [% target.0.queue.complete %]

    [% FOR vqar IN target %]
=-=-=
 Record Identifier | [% helpers.get_queued_auth_attr('rec_identifier',vqar.attributes) %]

    [% END %]
</pre>
$$
    )
;

INSERT INTO action_trigger.environment ( event_def, path) VALUES (
    42, 'attributes')
    ,( 42, 'queue')
;

INSERT INTO action_trigger.event_definition (
        id,
        active,
        owner,
        name,
        hook,
        validator,
        reactor,
        group_field,
        granularity,
        template
    ) VALUES (
        43,
        TRUE,
        1,
        'CSV Output for Queued Authority Records',
        'vandelay.queued_auth_record.csv',
        'NOOP_True',
        'ProcessTemplate',
        'queue.owner',
        'print-on-demand',
$$
[%- USE date -%]
"Record Identifier"
[% FOR vqar IN target %]"[% helpers.get_queued_auth_attr('rec_identifier',vqar.attributes) | replace('"', '""') %]"
[% END %]
$$
    )
;

INSERT INTO action_trigger.environment ( event_def, path) VALUES (
    43, 'attributes')
    ,( 43, 'queue')
;

INSERT INTO action_trigger.event_definition (
        id,
        active,
        owner,
        name,
        hook,
        validator,
        reactor,
        group_field,
        granularity,
        template
    ) VALUES (
        44,
        TRUE,
        1,
        'Email Output for Queued Authority Records',
        'vandelay.queued_auth_record.email',
        'NOOP_True',
        'SendEmail',
        'queue.owner',
        NULL,
$$
[%- USE date -%]
[%- SET user = target.0.queue.owner -%]
To: [%- params.recipient_email || user.email || 'root@localhost' %]
From: [%- params.sender_email || default_sender %]
Date: [%- date.format(date.now, '%a, %d %b %Y %T -0000', gmt => 1) %]
Subject: Authorities from Import Queue
Auto-Submitted: auto-generated

Queue ID: [% target.0.queue.id %]
Queue Name: [% target.0.queue.name %]
Queue Type: [% target.0.queue.queue_type %]
Complete? [% target.0.queue.complete %]

    [% FOR vqar IN target %]
=-=-=
 Record Identifier | [% helpers.get_queued_auth_attr('rec_identifier',vqar.attributes) %]

    [% END %]

$$
    )
;

INSERT INTO action_trigger.environment ( event_def, path) VALUES (
    44, 'attributes')
    ,( 44, 'queue')
    ,( 44, 'queue.owner')
;

INSERT INTO action_trigger.event_definition (
        id,
        active,
        owner,
        name,
        hook,
        validator,
        reactor,
        group_field,
        granularity,
        template
    ) VALUES (
        45,
        TRUE,
        1,
        'Print Output for Import Items from Queued Bib Records',
        'vandelay.import_items.print',
        'NOOP_True',
        'ProcessTemplate',
        'record.queue.owner',
        'print-on-demand',
$$
[%- USE date -%]
<pre>
Queue ID: [% target.0.record.queue.id %]
Queue Name: [% target.0.record.queue.name %]
Queue Type: [% target.0.record.queue.queue_type %]
Complete? [% target.0.record.queue.complete %]

    [% FOR vii IN target %]
=-=-=
 Import Item ID         | [% vii.id %]
 Title of work          | [% helpers.get_queued_bib_attr('title',vii.record.attributes) %]
 ISBN                   | [% helpers.get_queued_bib_attr('isbn',vii.record.attributes) %]
 Attribute Definition   | [% vii.definition %]
 Import Error           | [% vii.import_error %]
 Import Error Detail    | [% vii.error_detail %]
 Owning Library         | [% vii.owning_lib %]
 Circulating Library    | [% vii.circ_lib %]
 Call Number            | [% vii.call_number %]
 Copy Number            | [% vii.copy_number %]
 Status                 | [% vii.status.name %]
 Shelving Location      | [% vii.location.name %]
 Circulate              | [% vii.circulate %]
 Deposit                | [% vii.deposit %]
 Deposit Amount         | [% vii.deposit_amount %]
 Reference              | [% vii.ref %]
 Holdable               | [% vii.holdable %]
 Price                  | [% vii.price %]
 Barcode                | [% vii.barcode %]
 Circulation Modifier   | [% vii.circ_modifier %]
 Circulate As MARC Type | [% vii.circ_as_type %]
 Alert Message          | [% vii.alert_message %]
 Public Note            | [% vii.pub_note %]
 Private Note           | [% vii.priv_note %]
 OPAC Visible           | [% vii.opac_visible %]

    [% END %]
</pre>
$$
    )
;

INSERT INTO action_trigger.environment ( event_def, path) VALUES (
    45, 'record')
    ,( 45, 'record.attributes')
    ,( 45, 'record.queue')
    ,( 45, 'record.queue.owner')
;

INSERT INTO action_trigger.event_definition (
        id,
        active,
        owner,
        name,
        hook,
        validator,
        reactor,
        group_field,
        granularity,
        template
    ) VALUES (
        46,
        TRUE,
        1,
        'CSV Output for Import Items from Queued Bib Records',
        'vandelay.import_items.csv',
        'NOOP_True',
        'ProcessTemplate',
        'record.queue.owner',
        'print-on-demand',
$$
[%- USE date -%]
"Import Item ID","Title of work","ISBN","Attribute Definition","Import Error","Import Error Detail","Owning Library","Circulating Library","Call Number","Copy Number","Status","Shelving Location","Circulate","Deposit","Deposit Amount","Reference","Holdable","Price","Barcode","Circulation Modifier","Circulate As MARC Type","Alert Message","Public Note","Private Note","OPAC Visible"
[% FOR vii IN target %]"[% vii.id | replace('"', '""') %]","[% helpers.get_queued_bib_attr('title',vii.record.attributes) | replace('"', '""') %]","[% helpers.get_queued_bib_attr('isbn',vii.record.attributes) | replace('"', '""') %]","[% vii.definition | replace('"', '""') %]","[% vii.import_error | replace('"', '""') %]","[% vii.error_detail | replace('"', '""') %]","[% vii.owning_lib | replace('"', '""') %]","[% vii.circ_lib | replace('"', '""') %]","[% vii.call_number | replace('"', '""') %]","[% vii.copy_number | replace('"', '""') %]","[% vii.status.name | replace('"', '""') %]","[% vii.location.name | replace('"', '""') %]","[% vii.circulate | replace('"', '""') %]","[% vii.deposit | replace('"', '""') %]","[% vii.deposit_amount | replace('"', '""') %]","[% vii.ref | replace('"', '""') %]","[% vii.holdable | replace('"', '""') %]","[% vii.price | replace('"', '""') %]","[% vii.barcode | replace('"', '""') %]","[% vii.circ_modifier | replace('"', '""') %]","[% vii.circ_as_type | replace('"', '""') %]","[% vii.alert_message | replace('"', '""') %]","[% vii.pub_note | replace('"', '""') %]","[% vii.priv_note | replace('"', '""') %]","[% vii.opac_visible | replace('"', '""') %]"
[% END %]
$$
    )
;

INSERT INTO action_trigger.environment ( event_def, path) VALUES (
    46, 'record')
    ,( 46, 'record.attributes')
    ,( 46, 'record.queue')
    ,( 46, 'record.queue.owner')
;

INSERT INTO action_trigger.event_definition (
        id,
        active,
        owner,
        name,
        hook,
        validator,
        reactor,
        group_field,
        granularity,
        template
    ) VALUES (
        47,
        TRUE,
        1,
        'Email Output for Import Items from Queued Bib Records',
        'vandelay.import_items.email',
        'NOOP_True',
        'SendEmail',
        'record.queue.owner',
        NULL,
$$
[%- USE date -%]
[%- SET user = target.0.record.queue.owner -%]
To: [%- params.recipient_email || user.email || 'root@localhost' %]
From: [%- params.sender_email || default_sender %]
Date: [%- date.format(date.now, '%a, %d %b %Y %T -0000', gmt => 1) %]
Subject: Import Items from Import Queue
Auto-Submitted: auto-generated

Queue ID: [% target.0.record.queue.id %]
Queue Name: [% target.0.record.queue.name %]
Queue Type: [% target.0.record.queue.queue_type %]
Complete? [% target.0.record.queue.complete %]

    [% FOR vii IN target %]
=-=-=
 Import Item ID         | [% vii.id %]
 Title of work          | [% helpers.get_queued_bib_attr('title',vii.record.attributes) %]
 ISBN                   | [% helpers.get_queued_bib_attr('isbn',vii.record.attributes) %]
 Attribute Definition   | [% vii.definition %]
 Import Error           | [% vii.import_error %]
 Import Error Detail    | [% vii.error_detail %]
 Owning Library         | [% vii.owning_lib %]
 Circulating Library    | [% vii.circ_lib %]
 Call Number            | [% vii.call_number %]
 Copy Number            | [% vii.copy_number %]
 Status                 | [% vii.status.name %]
 Shelving Location      | [% vii.location.name %]
 Circulate              | [% vii.circulate %]
 Deposit                | [% vii.deposit %]
 Deposit Amount         | [% vii.deposit_amount %]
 Reference              | [% vii.ref %]
 Holdable               | [% vii.holdable %]
 Price                  | [% vii.price %]
 Barcode                | [% vii.barcode %]
 Circulation Modifier   | [% vii.circ_modifier %]
 Circulate As MARC Type | [% vii.circ_as_type %]
 Alert Message          | [% vii.alert_message %]
 Public Note            | [% vii.pub_note %]
 Private Note           | [% vii.priv_note %]
 OPAC Visible           | [% vii.opac_visible %]

    [% END %]
$$
    )
;

INSERT INTO action_trigger.environment ( event_def, path) VALUES (
    47, 'record')
    ,( 47, 'record.attributes')
    ,( 47, 'record.queue')
    ,( 47, 'record.queue.owner')
;

INSERT INTO action_trigger.hook (key, core_type, description, passive)
VALUES (
    'container.biblio_record_entry_bucket.csv',
    'cbreb',
    oils_i18n_gettext(
        'container.biblio_record_entry_bucket.csv',
        'Produce a CSV file representing a book list',
        'ath',
        'description'
    ),
    FALSE
);

INSERT INTO action_trigger.reactor (module, description)
VALUES (
    'ContainerCSV',
    oils_i18n_gettext(
        'ContainerCSV',
        'Facilitates producing a CSV file representing a book list by introducing an "items" variable into the TT environment, sorted as dictated according to user params',
        'atr',
        'description'
    )
);

INSERT INTO action_trigger.event_definition (
    id, active, owner,
    name, hook, reactor,
    validator, template
) VALUES (
    48, TRUE, 1,
    'Book List CSV', 'container.biblio_record_entry_bucket.csv', 'ContainerCSV',
    'NOOP_True',
$$
[%-
# target is the book list itself. The 'items' variable does not need to be in
# the environment because a special reactor will take care of filling it in.

FOR item IN items;
    bibxml = helpers.unapi_bre(item.target_biblio_record_entry, {flesh => '{mra}'});
    title = "";
    FOR part IN bibxml.findnodes('//*[@tag="245"]/*[@code="a" or @code="b"]');
        title = title _ part.textContent;
    END;
    author = bibxml.findnodes('//*[@tag="100"]/*[@code="a"]').textContent;
    item_type = bibxml.findnodes('//*[local-name()="attributes"]/*[local-name()="field"][@name="item_type"]').getAttribute('coded-value');
    pub_date = "";
    FOR pdatum IN bibxml.findnodes('//*[@tag="260"]/*[@code="c"]');
        IF pub_date ;
            pub_date = pub_date _ ", " _ pdatum.textContent;
        ELSE ;
            pub_date = pdatum.textContent;
        END;
    END;
    helpers.csv_datum(title) %],[% helpers.csv_datum(author) %],[% helpers.csv_datum(pub_date) %],[% helpers.csv_datum(item_type) %],[% FOR note IN item.notes; helpers.csv_datum(note.note); ","; END; "\n";
END -%]
$$
);

SELECT SETVAL('authority.control_set_id_seq'::TEXT, 100);
SELECT SETVAL('authority.control_set_authority_field_id_seq'::TEXT, 1000);
SELECT SETVAL('authority.control_set_bib_field_id_seq'::TEXT, 1000);

INSERT INTO authority.control_set (id, name, description) VALUES (
    1,
    oils_i18n_gettext('1','LoC','acs','name'),
    oils_i18n_gettext('1','Library of Congress standard authority record control semantics','acs','description')
);

-- Entries that need to respect an NFI
INSERT INTO authority.control_set_authority_field (id, control_set, main_entry, tag, sf_list, display_sf_list, name, nfi) VALUES
    (4, 1, NULL, '130', 'adfgklmnoprstvxyz', 'adfgklmnoprstvxyz', oils_i18n_gettext('4','Heading -- Uniform Title','acsaf','name'), '2'),
    (24, 1, 4, '530', 'adfgiklmnoprstvwxyz4', 'adfgiklmnoprstvxyz', oils_i18n_gettext('24','See Also From Tracing -- Uniform Title','acsaf','name'), '2'),
    (44, 1, 4, '730', 'adfghklmnoprstvwxyz25', 'adfghklmnoprstvxyz', oils_i18n_gettext('44','Established Heading Linking Entry -- Uniform Title','acsaf','name'), '2'),
    (64, 1, 4, '430', 'adfgiklmnoprstvwxyz4', 'adfgiklmnoprstvxyz', oils_i18n_gettext('64','See From Tracing -- Uniform Title','acsaf','name'), '2');

INSERT INTO authority.control_set_authority_field (id, control_set, main_entry, tag, sf_list, display_sf_list, name) VALUES

-- Main entries
    (1, 1, NULL, '100', 'abcdfklmnopqrstvxyz', 'abcdefklmnopqrstvxyz',
        oils_i18n_gettext('1','Heading -- Personal Name','acsaf','name')),
    (2, 1, NULL, '110', 'abcdfgklmnoprstvxyz', 'abcdefgklmnoprstvxyz',
        oils_i18n_gettext('2','Heading -- Corporate Name','acsaf','name')),
    (3, 1, NULL, '111', 'acdefgklnpqstvxyz', 'acdefgklnpqstvxyz',
        oils_i18n_gettext('3','Heading -- Meeting Name','acsaf','name')),
    (5, 1, NULL, '150', 'abvxyz', 'abvxyz',
        oils_i18n_gettext('5','Heading -- Topical Term','acsaf','name')),
    (6, 1, NULL, '151', 'avxyz', 'avxyz',
        oils_i18n_gettext('6','Heading -- Geographic Name','acsaf','name')),
    (7, 1, NULL, '155', 'avxyz', 'avxyz',
        oils_i18n_gettext('7','Heading -- Genre/Form Term','acsaf','name')),
    (8, 1, NULL, '180', 'vxyz', 'vxyz',
        oils_i18n_gettext('8','Heading -- General Subdivision','acsaf','name')),
    (9, 1, NULL, '181', 'vxyz', 'vxyz',
        oils_i18n_gettext('9','Heading -- Geographic Subdivision','acsaf','name')),
    (10, 1, NULL, '182', 'vxyz', 'vxyz',
        oils_i18n_gettext('10','Heading -- Chronological Subdivision','acsaf','name')),
    (11, 1, NULL, '185', 'vxyz', 'vxyz',
        oils_i18n_gettext('11','Heading -- Form Subdivision','acsaf','name')),
    (12, 1, NULL, '148', 'avxyz', 'avxyz',
        oils_i18n_gettext('12','Heading -- Chronological Term','acsaf','name')),

-- See Also From tracings
    (21, 1, 1, '500', 'abcdefiklmnopqrstvwxyz4', 'abcdefiklmnopqrstvxyz', oils_i18n_gettext('21','See Also From Tracing -- Personal Name','acsaf','name')),
    (22, 1, 2, '510', 'abcdefgiklmnoprstvwxyz4', 'abcdefgiklmnoprstvxyz', oils_i18n_gettext('22','See Also From Tracing -- Corporate Name','acsaf','name')),
    (23, 1, 3, '511', 'acdefgiklnpqstvwxyz4', 'acdefgiklnpqstvxyz', oils_i18n_gettext('23','See Also From Tracing -- Meeting Name','acsaf','name')),
    (25, 1, 5, '550', 'abivwxyz4', 'abivxyz', oils_i18n_gettext('25','See Also From Tracing -- Topical Term','acsaf','name')),
    (26, 1, 6, '551', 'aivwxyz4', 'aivxyz', oils_i18n_gettext('26','See Also From Tracing -- Geographic Name','acsaf','name')),
    (27, 1, 7, '555', 'aivwxyz4', 'aivxyz', oils_i18n_gettext('27','See Also From Tracing -- Genre/Form Term','acsaf','name')),
    (28, 1, 8, '580', 'ivwxyz4', 'ivxyz', oils_i18n_gettext('28','See Also From Tracing -- General Subdivision','acsaf','name')),
    (29, 1, 9, '581', 'ivwxyz4', 'ivxyz', oils_i18n_gettext('29','See Also From Tracing -- Geographic Subdivision','acsaf','name')),
    (30, 1, 10, '582', 'ivwxyz4', 'ivxyz', oils_i18n_gettext('30','See Also From Tracing -- Chronological Subdivision','acsaf','name')),
    (31, 1, 11, '585', 'ivwxyz4', 'ivxyz', oils_i18n_gettext('31','See Also From Tracing -- Form Subdivision','acsaf','name')),
    (32, 1, 12, '548', 'aivwxyz4', 'aivxyz', oils_i18n_gettext('32','See Also From Tracing -- Chronological Term','acsaf','name')),

-- Linking entries
    (41, 1, 1, '700', 'abcdefghjklmnopqrstvwxyz25', 'abcdefghjklmnopqrstvxyz', oils_i18n_gettext('41','Established Heading Linking Entry -- Personal Name','acsaf','name')),
    (42, 1, 2, '710', 'abcdefghklmnoprstvwxyz25', 'abcdefghklmnoprstvxyz', oils_i18n_gettext('42','Established Heading Linking Entry -- Corporate Name','acsaf','name')),
    (43, 1, 3, '711', 'acdefghklnpqstvwxyz25', 'acdefghklnpqstvxyz', oils_i18n_gettext('43','Established Heading Linking Entry -- Meeting Name','acsaf','name')),
    (45, 1, 5, '750', 'abvwxyz25', 'abvxyz', oils_i18n_gettext('45','Established Heading Linking Entry -- Topical Term','acsaf','name')),
    (46, 1, 6, '751', 'avwxyz25', 'avxyz', oils_i18n_gettext('46','Established Heading Linking Entry -- Geographic Name','acsaf','name')),
    (47, 1, 7, '755', 'avwxyz25', 'avxyz', oils_i18n_gettext('47','Established Heading Linking Entry -- Genre/Form Term','acsaf','name')),
    (48, 1, 8, '780', 'vwxyz25', 'vxyz', oils_i18n_gettext('48','Subdivision Linking Entry -- General Subdivision','acsaf','name')),
    (49, 1, 9, '781', 'vwxyz25', 'vxyz', oils_i18n_gettext('49','Subdivision Linking Entry -- Geographic Subdivision','acsaf','name')),
    (50, 1, 10, '782', 'vwxyz25', 'vxyz', oils_i18n_gettext('50','Subdivision Linking Entry -- Chronological Subdivision','acsaf','name')),
    (51, 1, 11, '785', 'vwxyz25', 'vxyz', oils_i18n_gettext('51','Subdivision Linking Entry -- Form Subdivision','acsaf','name')),
    (52, 1, 12, '748', 'avwxyz25', 'avxyz', oils_i18n_gettext('52','Established Heading Linking Entry -- Chronological Term','acsaf','name')),

-- See From tracings
    (61, 1, 1, '400', 'abcdefiklmnopqrstvwxyz4', 'abcdefiklmnopqrstvxyz', oils_i18n_gettext('61','See From Tracing -- Personal Name','acsaf','name')),
    (62, 1, 2, '410', 'abcdefgiklmnoprstvwxyz4', 'abcdefgiklmnoprstvxyz', oils_i18n_gettext('62','See From Tracing -- Corporate Name','acsaf','name')),
    (63, 1, 3, '411', 'acdefgiklnpqstvwxyz4', 'acdefgiklnpqstvxyz', oils_i18n_gettext('63','See From Tracing -- Meeting Name','acsaf','name')),
    (65, 1, 5, '450', 'abivwxyz4', 'abivxyz', oils_i18n_gettext('65','See From Tracing -- Topical Term','acsaf','name')),
    (66, 1, 6, '451', 'aivwxyz4', 'aivxyz', oils_i18n_gettext('66','See From Tracing -- Geographic Name','acsaf','name')),
    (67, 1, 7, '455', 'aivwxyz4', 'aivxyz', oils_i18n_gettext('67','See From Tracing -- Genre/Form Term','acsaf','name')),
    (68, 1, 8, '480', 'ivwxyz4', 'ivxyz', oils_i18n_gettext('68','See From Tracing -- General Subdivision','acsaf','name')),
    (69, 1, 9, '481', 'ivwxyz4', 'ivxyz', oils_i18n_gettext('69','See From Tracing -- Geographic Subdivision','acsaf','name')),
    (70, 1, 10, '482', 'ivwxyz4', 'ivxyz', oils_i18n_gettext('70','See From Tracing -- Chronological Subdivision','acsaf','name')),
    (71, 1, 11, '485', 'ivwxyz4', 'ivxyz', oils_i18n_gettext('71','See From Tracing -- Form Subdivision','acsaf','name')),
    (72, 1, 12, '448', 'aivwxyz4', 'aivxyz', oils_i18n_gettext('72','See From Tracing -- Chronological Term','acsaf','name'));

-- No linking on 4xx fields for LOC
UPDATE authority.control_set_authority_field
    SET linking_subfield = '0' WHERE tag LIKE ANY (ARRAY['5%','7%']);

-- Set the default joiner for subject-ish authority fields
UPDATE authority.control_set_authority_field
    SET joiner = ' -- ' WHERE tag LIKE ANY (ARRAY['_4_','_5_','_8_']);


INSERT INTO authority.browse_axis (code,name,description,sorter) VALUES
    ('title','Title','Title axis','titlesort'),
    ('author','Author','Author axis','titlesort'),
    ('subject','Subject','Subject axis','titlesort'),
    ('topic','Topic','Topic Subject axis','titlesort');

INSERT INTO authority.browse_axis_authority_field_map (axis,field) VALUES
    ('author',  1 ),
    ('author',  2 ),
    ('author',  3 ),
    ('title',   4 ),
    ('topic',   5 ),
    ('subject', 5 ),
    ('subject', 6 ),
    ('subject', 7 ),
    ('subject', 12);

INSERT INTO authority.control_set_bib_field (tag, authority_field) 
    SELECT '100', id FROM authority.control_set_authority_field WHERE tag IN ('100')
        UNION
    SELECT '600', id FROM authority.control_set_authority_field WHERE tag IN ('100','180','181','182','185')
        UNION
    SELECT '700', id FROM authority.control_set_authority_field WHERE tag IN ('100')
        UNION
    SELECT '800', id FROM authority.control_set_authority_field WHERE tag IN ('100')
        UNION

    SELECT '110', id FROM authority.control_set_authority_field WHERE tag IN ('110')
        UNION
    SELECT '610', id FROM authority.control_set_authority_field WHERE tag IN ('110')
        UNION
    SELECT '710', id FROM authority.control_set_authority_field WHERE tag IN ('110')
        UNION
    SELECT '810', id FROM authority.control_set_authority_field WHERE tag IN ('110')
        UNION

    SELECT '111', id FROM authority.control_set_authority_field WHERE tag IN ('111')
        UNION
    SELECT '611', id FROM authority.control_set_authority_field WHERE tag IN ('111')
        UNION
    SELECT '711', id FROM authority.control_set_authority_field WHERE tag IN ('111')
        UNION
    SELECT '811', id FROM authority.control_set_authority_field WHERE tag IN ('111')
        UNION

    SELECT '130', id FROM authority.control_set_authority_field WHERE tag IN ('130')
        UNION
    SELECT '240', id FROM authority.control_set_authority_field WHERE tag IN ('130')
        UNION
    SELECT '630', id FROM authority.control_set_authority_field WHERE tag IN ('130')
        UNION
    SELECT '730', id FROM authority.control_set_authority_field WHERE tag IN ('130')
        UNION
    SELECT '830', id FROM authority.control_set_authority_field WHERE tag IN ('130')
        UNION

    SELECT '648', id FROM authority.control_set_authority_field WHERE tag IN ('148')
        UNION

    SELECT '650', id FROM authority.control_set_authority_field WHERE tag IN ('150','180','181','182','185')
        UNION
    SELECT '651', id FROM authority.control_set_authority_field WHERE tag IN ('151','180','181','182','185')
        UNION
    SELECT '655', id FROM authority.control_set_authority_field WHERE tag IN ('155','180','181','182','185')
;

-- Map between authority controlled bib fields and stock indexing metabib fields
INSERT INTO authority.control_set_bib_field_metabib_field_map (bib_field, metabib_field)
    SELECT  DISTINCT b.id AS bib_field, m.id AS metabib_field
      FROM  authority.control_set_bib_field b JOIN authority.control_set_authority_field a ON (b.authority_field = a.id), config.metabib_field m
      WHERE a.tag = '100' AND m.name = 'personal'

        UNION

    SELECT  DISTINCT b.id AS bib_field, m.id AS metabib_field
      FROM  authority.control_set_bib_field b JOIN authority.control_set_authority_field a ON (b.authority_field = a.id), config.metabib_field m
      WHERE a.tag = '110' AND m.name = 'corporate'

        UNION

    SELECT  DISTINCT b.id AS bib_field, m.id AS metabib_field
      FROM  authority.control_set_bib_field b JOIN authority.control_set_authority_field a ON (b.authority_field = a.id), config.metabib_field m
      WHERE a.tag = '111' AND m.name = 'conference'

        UNION

    SELECT  DISTINCT b.id AS bib_field, m.id AS metabib_field
      FROM  authority.control_set_bib_field b JOIN authority.control_set_authority_field a ON (b.authority_field = a.id), config.metabib_field m
      WHERE a.tag = '130' AND m.name = 'uniform'

        UNION

    SELECT  DISTINCT b.id AS bib_field, m.id AS metabib_field
      FROM  authority.control_set_bib_field b JOIN authority.control_set_authority_field a ON (b.authority_field = a.id), config.metabib_field m
      WHERE a.tag = '148' AND m.name = 'temporal'

        UNION

    SELECT  DISTINCT b.id AS bib_field, m.id AS metabib_field
      FROM  authority.control_set_bib_field b JOIN authority.control_set_authority_field a ON (b.authority_field = a.id), config.metabib_field m
      WHERE a.tag = '150' AND m.name = 'topic'

        UNION

    SELECT  DISTINCT b.id AS bib_field, m.id AS metabib_field
      FROM  authority.control_set_bib_field b JOIN authority.control_set_authority_field a ON (b.authority_field = a.id), config.metabib_field m
      WHERE a.tag = '151' AND m.name = 'geographic'

        UNION

    SELECT  DISTINCT b.id AS bib_field, m.id AS metabib_field
      FROM  authority.control_set_bib_field b JOIN authority.control_set_authority_field a ON (b.authority_field = a.id), config.metabib_field m
      WHERE a.tag = '155' AND m.name = 'genre' -- Just in case...
;

INSERT INTO authority.thesaurus (code, name, control_set) VALUES
    ('a', oils_i18n_gettext('a','Library of Congress Subject Headings','at','name'), 1),
    ('b', oils_i18n_gettext('b','LC subject headings for children''s literature','at','name'), 1), 
    ('c', oils_i18n_gettext('c','Medical Subject Headings','at','name'), 1),
    ('d', oils_i18n_gettext('d','National Agricultural Library subject authority file','at','name'), 1),
    ('k', oils_i18n_gettext('k','Canadian Subject Headings','at','name'), 1),
    ('n', oils_i18n_gettext('n','Not applicable','at','name'), 1),
    ('r', oils_i18n_gettext('r','Art and Architecture Thesaurus','at','name'), 1),
    ('s', oils_i18n_gettext('s','Sears List of Subject Headings','at','name'), 1),
    ('v', oils_i18n_gettext('v','Repertoire de vedettes-matiere','at','name'), 1),
    ('z', oils_i18n_gettext('z','Other','at','name'), 1),
    ('|', oils_i18n_gettext('|','No attempt to code','at','name'), NULL),
    (' ', oils_i18n_gettext(' ','Alternate no attempt to code','at','name'), NULL);

INSERT INTO action_trigger.hook ( key, core_type, description, passive ) VALUES (
    'reservation.available',
    'bresv',
    'A reservation is available for pickup',
    false
);

INSERT INTO action_trigger.validator ( module, description ) VALUES (
    'ReservationIsAvailable',
    'Checked that a reserved resource is available for checkout'
);

INSERT INTO container.biblio_record_entry_bucket_type (code, label) VALUES (
    'vandelay_queue',
    oils_i18n_gettext('vandelay_queue', 'Vandelay Queue', 'cbrebt', 'label')
);

INSERT INTO config.usr_setting_type (name,grp,opac_visible,label,description,datatype,fm_class) VALUES (
    'opac.default_sms_carrier',
    'sms',
    TRUE,
    oils_i18n_gettext(
        'opac.default_sms_carrier',
        'Default SMS/Text Carrier',
        'cust',
        'label'
    ),
    oils_i18n_gettext(
        'opac.default_sms_carrier',
        'Default SMS/Text Carrier',
        'cust',
        'description'
    ),
    'link',
    'csc'
);

INSERT INTO config.usr_setting_type (name,grp,opac_visible,label,description,datatype) VALUES (
    'opac.default_sms_notify',
    'sms',
    TRUE,
    oils_i18n_gettext(
        'opac.default_sms_notify',
        'Default SMS/Text Number',
        'cust',
        'label'
    ),
    oils_i18n_gettext(
        'opac.default_sms_notify',
        'Default SMS/Text Number',
        'cust',
        'description'
    ),
    'string'
);

INSERT INTO config.usr_setting_type (name,grp,opac_visible,label,description,datatype) VALUES (
    'opac.default_phone',
    'opac',
    TRUE,
    oils_i18n_gettext(
        'opac.default_phone',
        'Default Phone Number',
        'cust',
        'label'
    ),
    oils_i18n_gettext(
        'opac.default_phone',
        'Default Phone Number',
        'cust',
        'description'
    ),
    'string'
);

INSERT INTO config.usr_setting_type (name,grp,opac_visible,label,description,datatype) VALUES (
    'ui.grid_columns.circ.hold_pull_list',
    'gui',
    FALSE,
    oils_i18n_gettext(
        'ui.grid_columns.circ.hold_pull_list',
        'Hold Pull List',
        'cust',
        'label'
    ),
    oils_i18n_gettext(
        'ui.grid_columns.circ.hold_pull_list',
        'Hold Pull List Saved Column Settings',
        'cust',
        'description'
    ),
    'string'
), (
    'ui.grid_columns.actor.user.event_log',
    'gui',
    FALSE,
    oils_i18n_gettext(
        'ui.grid_columns.actor.user.event_log',
        'User Event Log',
        'cust',
        'label'
    ),
    oils_i18n_gettext(
        'ui.grid_columns.actor.user.event_log',
        'User Event Log Saved Column Settings',
        'cust',
        'description'
    ),
    'string'
), (
    'ui.grid_columns.conify.config.circ_matrix_matchpoint',
    'gui',
    FALSE,
    oils_i18n_gettext(
        'ui.grid_columns.conify.config.circ_matrix_matchpoint',
        'Circulation Policy Configuration',
        'cust',
        'label'
    ),
    oils_i18n_gettext(
        'ui.grid_columns.conify.config.circ_matrix_matchpoint',
        'Circulation Policy Configuration Column Settings',
        'cust',
        'description'
    ),
    'string'
) ;

SELECT setval( 'config.sms_carrier_id_seq', 1000 );
INSERT INTO config.sms_carrier VALUES

    -- Testing
    (
        1,
        oils_i18n_gettext(
            1,
            'Local',
            'csc',
            'region'
        ),
        oils_i18n_gettext(
            1,
            'Test Carrier',
            'csc',
            'name'
        ),
        'opensrf+$number@localhost',
        FALSE
    ),

    -- Canada & USA
    (
        2,
        oils_i18n_gettext(
            2,
            'Canada & USA',
            'csc',
            'region'
        ),
        oils_i18n_gettext(
            2,
            'Rogers Wireless',
            'csc',
            'name'
        ),
        '$number@pcs.rogers.com',
        TRUE
    ),
    (
        3,
        oils_i18n_gettext(
            3,
            'Canada & USA',
            'csc',
            'region'
        ),
        oils_i18n_gettext(
            3,
            'Rogers Wireless (Alternate)',
            'csc',
            'name'
        ),
        '1$number@mms.rogers.com',
        TRUE
    ),
    (
        4,
        oils_i18n_gettext(
            4,
            'Canada & USA',
            'csc',
            'region'
        ),
        oils_i18n_gettext(
            4,
            'Telus Mobility',
            'csc',
            'name'
        ),
        '$number@msg.telus.com',
        TRUE
    ),

    -- Canada
    (
        5,
        oils_i18n_gettext(
            5,
            'Canada',
            'csc',
            'region'
        ),
        oils_i18n_gettext(
            5,
            'Koodo Mobile',
            'csc',
            'name'
        ),
        '$number@msg.telus.com',
        TRUE
    ),
    (
        6,
        oils_i18n_gettext(
            6,
            'Canada',
            'csc',
            'region'
        ),
        oils_i18n_gettext(
            6,
            'Fido',
            'csc',
            'name'
        ),
        '$number@fido.ca',
        TRUE
    ),
    (
        7,
        oils_i18n_gettext(
            7,
            'Canada',
            'csc',
            'region'
        ),
        oils_i18n_gettext(
            7,
            'Bell Mobility & Solo Mobile',
            'csc',
            'name'
        ),
        '$number@txt.bell.ca',
        TRUE
    ),
    (
        8,
        oils_i18n_gettext(
            8,
            'Canada',
            'csc',
            'region'
        ),
        oils_i18n_gettext(
            8,
            'Bell Mobility & Solo Mobile (Alternate)',
            'csc',
            'name'
        ),
        '$number@txt.bellmobility.ca',
        TRUE
    ),
    (
        9,
        oils_i18n_gettext(
            9,
            'Canada',
            'csc',
            'region'
        ),
        oils_i18n_gettext(
            9,
            'Aliant',
            'csc',
            'name'
        ),
        '$number@sms.wirefree.informe.ca',
        TRUE
    ),
    (
        10,
        oils_i18n_gettext(
            10,
            'Canada',
            'csc',
            'region'
        ),
        oils_i18n_gettext(
            10,
            'PC Telecom',
            'csc',
            'name'
        ),
        '$number@mobiletxt.ca',
        TRUE
    ),
    (
        11,
        oils_i18n_gettext(
            11,
            'Canada',
            'csc',
            'region'
        ),
        oils_i18n_gettext(
            11,
            'SaskTel',
            'csc',
            'name'
        ),
        '$number@sms.sasktel.com',
        TRUE
    ),
    (
        12,
        oils_i18n_gettext(
            12,
            'Canada',
            'csc',
            'region'
        ),
        oils_i18n_gettext(
            12,
            'MTS Mobility',
            'csc',
            'name'
        ),
        '$number@text.mtsmobility.com',
        TRUE
    ),
    (
        13,
        oils_i18n_gettext(
            13,
            'Canada',
            'csc',
            'region'
        ),
        oils_i18n_gettext(
            13,
            'Virgin Mobile',
            'csc',
            'name'
        ),
        '$number@vmobile.ca',
        TRUE
    ),

    -- International
    (
        14,
        oils_i18n_gettext(
            14,
            'International',
            'csc',
            'region'
        ),
        oils_i18n_gettext(
            14,
            'Iridium',
            'csc',
            'name'
        ),
        '$number@msg.iridium.com',
        TRUE
    ),
    (
        15,
        oils_i18n_gettext(
            15,
            'International',
            'csc',
            'region'
        ),
        oils_i18n_gettext(
            15,
            'Globalstar',
            'csc',
            'name'
        ),
        '$number@msg.globalstarusa.com',
        TRUE
    ),
    (
        16,
        oils_i18n_gettext(
            16,
            'International',
            'csc',
            'region'
        ),
        oils_i18n_gettext(
            16,
            'Bulletin.net',
            'csc',
            'name'
        ),
        '$number@bulletinmessenger.net', -- International Formatted number
        TRUE
    ),
    (
        17,
        oils_i18n_gettext(
            17,
            'International',
            'csc',
            'region'
        ),
        oils_i18n_gettext(
            17,
            'Panacea Mobile',
            'csc',
            'name'
        ),
        '$number@api.panaceamobile.com',
        TRUE
    ),

    -- USA
    (
        18,
        oils_i18n_gettext(
            18,
            'USA',
            'csc',
            'region'
        ),
        oils_i18n_gettext(
            18,
            'C Beyond',
            'csc',
            'name'
        ),
        '$number@cbeyond.sprintpcs.com',
        TRUE
    ),
    (
        19,
        oils_i18n_gettext(
            19,
            'Alaska, USA',
            'csc',
            'region'
        ),
        oils_i18n_gettext(
            19,
            'General Communications, Inc.',
            'csc',
            'name'
        ),
        '$number@mobile.gci.net',
        TRUE
    ),
    (
        20,
        oils_i18n_gettext(
            20,
            'California, USA',
            'csc',
            'region'
        ),
        oils_i18n_gettext(
            20,
            'Golden State Cellular',
            'csc',
            'name'
        ),
        '$number@gscsms.com',
        TRUE
    ),
    (
        21,
        oils_i18n_gettext(
            21,
            'Cincinnati, Ohio, USA',
            'csc',
            'region'
        ),
        oils_i18n_gettext(
            21,
            'Cincinnati Bell',
            'csc',
            'name'
        ),
        '$number@gocbw.com',
        TRUE
    ),
    (
        22,
        oils_i18n_gettext(
            22,
            'Hawaii, USA',
            'csc',
            'region'
        ),
        oils_i18n_gettext(
            22,
            'Hawaiian Telcom Wireless',
            'csc',
            'name'
        ),
        '$number@hawaii.sprintpcs.com',
        TRUE
    ),
    (
        23,
        oils_i18n_gettext(
            23,
            'Midwest, USA',
            'csc',
            'region'
        ),
        oils_i18n_gettext(
            23,
            'i wireless (T-Mobile)',
            'csc',
            'name'
        ),
        '$number.iws@iwspcs.net',
        TRUE
    ),
    (
        24,
        oils_i18n_gettext(
            24,
            'USA',
            'csc',
            'region'
        ),
        oils_i18n_gettext(
            24,
            'i-wireless (Sprint PCS)',
            'csc',
            'name'
        ),
        '$number@iwirelesshometext.com',
        TRUE
    ),
    (
        25,
        oils_i18n_gettext(
            25,
            'USA',
            'csc',
            'region'
        ),
        oils_i18n_gettext(
            25,
            'MetroPCS',
            'csc',
            'name'
        ),
        '$number@mymetropcs.com',
        TRUE
    ),
    (
        26,
        oils_i18n_gettext(
            26,
            'USA',
            'csc',
            'region'
        ),
        oils_i18n_gettext(
            26,
            'Kajeet',
            'csc',
            'name'
        ),
        '$number@mobile.kajeet.net',
        TRUE
    ),
    (
        27,
        oils_i18n_gettext(
            27,
            'USA',
            'csc',
            'region'
        ),
        oils_i18n_gettext(
            27,
            'Element Mobile',
            'csc',
            'name'
        ),
        '$number@SMS.elementmobile.net',
        TRUE
    ),
    (
        28,
        oils_i18n_gettext(
            28,
            'USA',
            'csc',
            'region'
        ),
        oils_i18n_gettext(
            28,
            'Esendex',
            'csc',
            'name'
        ),
        '$number@echoemail.net',
        TRUE
    ),
    (
        29,
        oils_i18n_gettext(
            29,
            'USA',
            'csc',
            'region'
        ),
        oils_i18n_gettext(
            29,
            'Boost Mobile',
            'csc',
            'name'
        ),
        '$number@myboostmobile.com',
        TRUE
    ),
    (
        30,
        oils_i18n_gettext(
            30,
            'USA',
            'csc',
            'region'
        ),
        oils_i18n_gettext(
            30,
            'BellSouth',
            'csc',
            'name'
        ),
        '$number@bellsouth.com',
        TRUE
    ),
    (
        31,
        oils_i18n_gettext(
            31,
            'USA',
            'csc',
            'region'
        ),
        oils_i18n_gettext(
            31,
            'Bluegrass Cellular',
            'csc',
            'name'
        ),
        '$number@sms.bluecell.com',
        TRUE
    ),
    (
        32,
        oils_i18n_gettext(
            32,
            'USA',
            'csc',
            'region'
        ),
        oils_i18n_gettext(
            32,
            'AT&T Enterprise Paging',
            'csc',
            'name'
        ),
        '$number@page.att.net',
        TRUE
    ),
    (
        33,
        oils_i18n_gettext(
            33,
            'USA',
            'csc',
            'region'
        ),
        oils_i18n_gettext(
            33,
            'AT&T Mobility/Wireless',
            'csc',
            'name'
        ),
        '$number@txt.att.net',
        TRUE
    ),
    (
        34,
        oils_i18n_gettext(
            34,
            'USA',
            'csc',
            'region'
        ),
        oils_i18n_gettext(
            34,
            'AT&T Global Smart Messaging Suite',
            'csc',
            'name'
        ),
        '$number@sms.smartmessagingsuite.com',
        TRUE
    ),
    (
        35,
        oils_i18n_gettext(
            35,
            'USA',
            'csc',
            'region'
        ),
        oils_i18n_gettext(
            35,
            'Alltel (Allied Wireless)',
            'csc',
            'name'
        ),
        '$number@sms.alltelwireless.com',
        TRUE
    ),
    (
        36,
        oils_i18n_gettext(
            36,
            'USA',
            'csc',
            'region'
        ),
        oils_i18n_gettext(
            36,
            'Alaska Communications',
            'csc',
            'name'
        ),
        '$number@msg.acsalaska.com',
        TRUE
    ),
    (
        37,
        oils_i18n_gettext(
            37,
            'USA',
            'csc',
            'region'
        ),
        oils_i18n_gettext(
            37,
            'Ameritech',
            'csc',
            'name'
        ),
        '$number@paging.acswireless.com',
        TRUE
    ),
    (
        38,
        oils_i18n_gettext(
            38,
            'USA',
            'csc',
            'region'
        ),
        oils_i18n_gettext(
            38,
            'Cingular (GoPhone prepaid)',
            'csc',
            'name'
        ),
        '$number@cingulartext.com',
        TRUE
    ),
    (
        39,
        oils_i18n_gettext(
            39,
            'USA',
            'csc',
            'region'
        ),
        oils_i18n_gettext(
            39,
            'Cingular (Postpaid)',
            'csc',
            'name'
        ),
        '$number@cingular.com',
        TRUE
    ),
    (
        40,
        oils_i18n_gettext(
            40,
            'USA',
            'csc',
            'region'
        ),
        oils_i18n_gettext(
            40,
            'Cellular One (Dobson) / O2 / Orange',
            'csc',
            'name'
        ),
        '$number@mobile.celloneusa.com',
        TRUE
    ),
    (
        41,
        oils_i18n_gettext(
            41,
            'USA',
            'csc',
            'region'
        ),
        oils_i18n_gettext(
            41,
            'Cellular South',
            'csc',
            'name'
        ),
        '$number@csouth1.com',
        TRUE
    ),
    (
        42,
        oils_i18n_gettext(
            42,
            'USA',
            'csc',
            'region'
        ),
        oils_i18n_gettext(
            42,
            'Cellcom',
            'csc',
            'name'
        ),
        '$number@cellcom.quiktxt.com',
        TRUE
    ),
    (
        43,
        oils_i18n_gettext(
            43,
            'USA',
            'csc',
            'region'
        ),
        oils_i18n_gettext(
            43,
            'Chariton Valley Wireless',
            'csc',
            'name'
        ),
        '$number@sms.cvalley.net',
        TRUE
    ),
    (
        44,
        oils_i18n_gettext(
            44,
            'USA',
            'csc',
            'region'
        ),
        oils_i18n_gettext(
            44,
            'Cricket',
            'csc',
            'name'
        ),
        '$number@sms.mycricket.com',
        TRUE
    ),
    (
        45,
        oils_i18n_gettext(
            45,
            'USA',
            'csc',
            'region'
        ),
        oils_i18n_gettext(
            45,
            'Cleartalk Wireless',
            'csc',
            'name'
        ),
        '$number@sms.cleartalk.us',
        TRUE
    ),
    (
        46,
        oils_i18n_gettext(
            46,
            'USA',
            'csc',
            'region'
        ),
        oils_i18n_gettext(
            46,
            'Edge Wireless',
            'csc',
            'name'
        ),
        '$number@sms.edgewireless.com',
        TRUE
    ),
    (
        47,
        oils_i18n_gettext(
            47,
            'USA',
            'csc',
            'region'
        ),
        oils_i18n_gettext(
            47,
            'Syringa Wireless',
            'csc',
            'name'
        ),
        '$number@rinasms.com',
        TRUE
    ),
    (
        48,
        oils_i18n_gettext(
            48,
            'USA',
            'csc',
            'region'
        ),
        oils_i18n_gettext(
            48,
            'T-Mobile',
            'csc',
            'name'
        ),
        '$number@tmomail.net',
        TRUE
    ),
    (
        49,
        oils_i18n_gettext(
            49,
            'USA',
            'csc',
            'region'
        ),
        oils_i18n_gettext(
            49,
            'Straight Talk / PagePlus Cellular',
            'csc',
            'name'
        ),
        '$number@vtext.com',
        TRUE
    ),
    (
        50,
        oils_i18n_gettext(
            50,
            'USA',
            'csc',
            'region'
        ),
        oils_i18n_gettext(
            50,
            'South Central Communications',
            'csc',
            'name'
        ),
        '$number@rinasms.com',
        TRUE
    ),
    (
        51,
        oils_i18n_gettext(
            51,
            'USA',
            'csc',
            'region'
        ),
        oils_i18n_gettext(
            51,
            'Simple Mobile',
            'csc',
            'name'
        ),
        '$number@smtext.com',
        TRUE
    ),
    (
        52,
        oils_i18n_gettext(
            52,
            'USA',
            'csc',
            'region'
        ),
        oils_i18n_gettext(
            52,
            'Sprint (PCS)',
            'csc',
            'name'
        ),
        '$number@messaging.sprintpcs.com',
        TRUE
    ),
    (
        53,
        oils_i18n_gettext(
            53,
            'USA',
            'csc',
            'region'
        ),
        oils_i18n_gettext(
            53,
            'Nextel',
            'csc',
            'name'
        ),
        '$number@messaging.nextel.com',
        TRUE
    ),
    (
        54,
        oils_i18n_gettext(
            54,
            'USA',
            'csc',
            'region'
        ),
        oils_i18n_gettext(
            54,
            'Pioneer Cellular',
            'csc',
            'name'
        ),
        '$number@zsend.com', -- nine digit number
        TRUE
    ),
    (
        55,
        oils_i18n_gettext(
            55,
            'USA',
            'csc',
            'region'
        ),
        oils_i18n_gettext(
            55,
            'Qwest Wireless',
            'csc',
            'name'
        ),
        '$number@qwestmp.com',
        TRUE
    ),
    (
        56,
        oils_i18n_gettext(
            56,
            'USA',
            'csc',
            'region'
        ),
        oils_i18n_gettext(
            56,
            'US Cellular',
            'csc',
            'name'
        ),
        '$number@email.uscc.net',
        TRUE
    ),
    (
        57,
        oils_i18n_gettext(
            57,
            'USA',
            'csc',
            'region'
        ),
        oils_i18n_gettext(
            57,
            'Unicel',
            'csc',
            'name'
        ),
        '$number@utext.com',
        TRUE
    ),
    (
        58,
        oils_i18n_gettext(
            58,
            'USA',
            'csc',
            'region'
        ),
        oils_i18n_gettext(
            58,
            'Teleflip',
            'csc',
            'name'
        ),
        '$number@teleflip.com',
        TRUE
    ),
    (
        59,
        oils_i18n_gettext(
            59,
            'USA',
            'csc',
            'region'
        ),
        oils_i18n_gettext(
            59,
            'Virgin Mobile',
            'csc',
            'name'
        ),
        '$number@vmobl.com',
        TRUE
    ),
    (
        60,
        oils_i18n_gettext(
            60,
            'USA',
            'csc',
            'region'
        ),
        oils_i18n_gettext(
            60,
            'Verizon Wireless',
            'csc',
            'name'
        ),
        '$number@vtext.com',
        TRUE
    ),
    (
        61,
        oils_i18n_gettext(
            61,
            'USA',
            'csc',
            'region'
        ),
        oils_i18n_gettext(
            61,
            'USA Mobility',
            'csc',
            'name'
        ),
        '$number@usamobility.net',
        TRUE
    ),
    (
        62,
        oils_i18n_gettext(
            62,
            'USA',
            'csc',
            'region'
        ),
        oils_i18n_gettext(
            62,
            'Viaero',
            'csc',
            'name'
        ),
        '$number@viaerosms.com',
        TRUE
    ),
    (
        63,
        oils_i18n_gettext(
            63,
            'USA',
            'csc',
            'region'
        ),
        oils_i18n_gettext(
            63,
            'TracFone',
            'csc',
            'name'
        ),
        '$number@mmst5.tracfone.com',
        TRUE
    ),
    (
        64,
        oils_i18n_gettext(
            64,
            'USA',
            'csc',
            'region'
        ),
        oils_i18n_gettext(
            64,
            'Centennial Wireless',
            'csc',
            'name'
        ),
        '$number@cwemail.com',
        TRUE
    ),

    -- South Korea and USA
    (
        65,
        oils_i18n_gettext(
            65,
            'South Korea and USA',
            'csc',
            'region'
        ),
        oils_i18n_gettext(
            65,
            'Helio',
            'csc',
            'name'
        ),
        '$number@myhelio.com',
        TRUE
    ),

    -- Republic Wireless and Google Fi
    (
        66,
        oils_i18n_gettext(
            66,
            'USA',
            'csc',
            'region'
        ),
        oils_i18n_gettext(
            66,
            'Republic Wireless (must enable on device)',
            'csc',
            'name'
        ),
        '$number@text.republicwireless.com',
        TRUE
    ),
    (
        67,
        oils_i18n_gettext(
            67,
            'USA',
            'csc',
            'region'
        ),
        oils_i18n_gettext(
            67,
            'Google Fi',
            'csc',
            'name'
        ),
        '$number@msg.fi.google.com',
        TRUE
    )
;

INSERT INTO permission.grp_perm_map (grp, perm, depth, grantable)
    SELECT
        pgt.id, perm.id, aout.depth, TRUE
    FROM
        permission.grp_tree pgt,
        permission.perm_list perm,
        actor.org_unit_type aout
    WHERE
        pgt.name = 'Global Administrator' AND
        aout.name = 'Consortium' AND
        perm.code = 'ADMIN_SMS_CARRIER';

INSERT INTO action_trigger.reactor (
    module,
    description
) VALUES (
    'SendSMS',
    'Send an SMS text message based on a user-defined template'
);

INSERT INTO action_trigger.event_definition (
    active,
    owner,
    name,
    hook,
    validator,
    reactor,
    cleanup_success,
    delay,
    delay_field,
    group_field,
    template
) VALUES (
    true,
    1, -- admin
    'Hold Ready for Pickup SMS Notification',
    'hold.available',
    'HoldIsAvailable',
    'SendSMS',
    'CreateHoldNotification',
    '00:30:00',
    'shelf_time',
    'sms_notify',
    '[%- USE date -%]
[%- user = target.0.usr -%]
From: [%- params.sender_email || default_sender %]
Date: [%- date.format(date.now, ''%a, %d %b %Y %T -0000'', gmt => 1) %]
To: [%- params.recipient_email || helpers.get_sms_gateway_email(target.0.sms_carrier,target.0.sms_notify) %]
Subject: [% target.size %] hold(s) ready
Auto-Submitted: auto-generated

[% FOR hold IN target %][%-
  bibxml = helpers.xml_doc( hold.current_copy.call_number.record.marc );
  title = "";
  FOR part IN bibxml.findnodes(''//*[@tag="245"]/*[@code="a"]'');
    title = title _ part.textContent;
  END;
  author = bibxml.findnodes(''//*[@tag="100"]/*[@code="a"]'').textContent;
%][% hold.usr.first_given_name %]:[% title %] @ [% hold.pickup_lib.name %]
[% END %]
'
);

INSERT INTO action_trigger.environment (
    event_def,
    path
) VALUES (
    currval('action_trigger.event_definition_id_seq'),
    'current_copy.call_number.record.simple_record'
), (
    currval('action_trigger.event_definition_id_seq'),
    'usr'
), (
    currval('action_trigger.event_definition_id_seq'),
    'pickup_lib.billing_address'
);

INSERT INTO action_trigger.event_params (event_def, param, value)
    VALUES (currval('action_trigger.event_definition_id_seq'), 'check_sms_notify', 1);

INSERT INTO action_trigger.hook(
    key,
    core_type,
    description,
    passive
) VALUES (
    'acn.format.sms_text',
    'acn',
    oils_i18n_gettext(
        'acn.format.sms_text',
        'A text message has been requested for a call number.',
        'ath',
        'description'
    ),
    FALSE
);

INSERT INTO action_trigger.event_definition (
    active,
    owner,
    name,
    hook,
    validator,
    reactor,
    template
) VALUES (
    true,
    1, -- admin
    'SMS Call Number',
    'acn.format.sms_text',
    'NOOP_True',
    'SendSMS',
    '[%- USE date -%]
From: [%- params.sender_email || default_sender %]
To: [%- params.recipient_email || helpers.get_sms_gateway_email(user_data.sms_carrier,user_data.sms_notify) %]
Date: [%- date.format(date.now, ''%a, %d %b %Y %T -0000'', gmt => 1) %]
Subject: Call Number
Auto-Submitted: auto-generated

[%-
  bibxml = helpers.xml_doc( target.record.marc );
  title = "";
  FOR part IN bibxml.findnodes(''//*[@tag="245"]/*[@code="a" or @code="b"]'');
    title = title _ part.textContent;
  END;
  author = bibxml.findnodes(''//*[@tag="100"]/*[@code="a"]'').textContent;
%]
Call Number: [% target.label %]
Location: [% helpers.get_most_populous_location( target.id ).name %]
Library: [% target.owning_lib.name %]
[%- IF title %]
Title: [% title %]
[%- END %]
[%- IF author %]
Author: [% author %]
[%- END %]
'
);

INSERT INTO action_trigger.environment (
    event_def,
    path
) VALUES (
    currval('action_trigger.event_definition_id_seq'),
    'record.simple_record'
), (
    currval('action_trigger.event_definition_id_seq'),
    'owning_lib.billing_address'
);

INSERT INTO vandelay.merge_profile (id, owner, name, replace_spec, update_bib_source) 
    VALUES (1, 1, oils_i18n_gettext(1, 'Match-Only Merge', 'vmp', 'name'), '901c', false);

INSERT INTO vandelay.merge_profile (id, owner, name, preserve_spec, update_bib_source)
    VALUES (2, 1, oils_i18n_gettext(2, 'Full Overlay', 'vmp', 'name'), '901c', true);

SELECT SETVAL('vandelay.merge_profile_id_seq'::TEXT, 100);

-- user activity seed data --

INSERT INTO config.usr_activity_type (id, ewho, ewhat, ehow, egroup, label) VALUES

     -- authen/authz actions
     -- note: "opensrf" is the default ingress/ehow
     (1,  NULL, 'login',  'opensrf',      'authen', oils_i18n_gettext(1 , 'Login via opensrf', 'cuat', 'label'))
    ,(2,  NULL, 'login',  'srfsh',        'authen', oils_i18n_gettext(2 , 'Login via srfsh', 'cuat', 'label'))
    ,(3,  NULL, 'login',  'gateway-v1',   'authen', oils_i18n_gettext(3 , 'Login via gateway-v1', 'cuat', 'label'))
    ,(4,  NULL, 'login',  'translator-v1','authen', oils_i18n_gettext(4 , 'Login via translator-v1', 'cuat', 'label'))
    ,(5,  NULL, 'login',  'xmlrpc',       'authen', oils_i18n_gettext(5 , 'Login via xmlrpc', 'cuat', 'label'))
    ,(6,  NULL, 'login',  'remoteauth',   'authen', oils_i18n_gettext(6 , 'Login via remoteauth', 'cuat', 'label'))
    ,(7,  NULL, 'login',  'sip2',         'authen', oils_i18n_gettext(7 , 'SIP2 Proxy Login', 'cuat', 'label'))
    ,(8,  NULL, 'login',  'apache',       'authen', oils_i18n_gettext(8 , 'Login via Apache module', 'cuat', 'label'))

    ,(9,  NULL, 'verify', 'opensrf',      'authz',  oils_i18n_gettext(9 , 'Verification via opensrf', 'cuat', 'label'))
    ,(10, NULL, 'verify', 'srfsh',        'authz',  oils_i18n_gettext(10, 'Verification via srfsh', 'cuat', 'label'))
    ,(11, NULL, 'verify', 'gateway-v1',   'authz',  oils_i18n_gettext(11, 'Verification via gateway-v1', 'cuat', 'label'))
    ,(12, NULL, 'verify', 'translator-v1','authz',  oils_i18n_gettext(12, 'Verification via translator-v1', 'cuat', 'label'))
    ,(13, NULL, 'verify', 'xmlrpc',       'authz',  oils_i18n_gettext(13, 'Verification via xmlrpc', 'cuat', 'label'))
    ,(14, NULL, 'verify', 'remoteauth',   'authz',  oils_i18n_gettext(14, 'Verification via remoteauth', 'cuat', 'label'))
    ,(15, NULL, 'verify', 'sip2',         'authz',  oils_i18n_gettext(15, 'SIP2 User Verification', 'cuat', 'label'))

     -- authen/authz actions w/ known uses of "who"
    ,(16, 'opac',        'login',  'gateway-v1',   'authen', oils_i18n_gettext(16, 'OPAC Login (jspac)', 'cuat', 'label'))
    ,(17, 'opac',        'login',  'apache',       'authen', oils_i18n_gettext(17, 'OPAC Login (tpac)', 'cuat', 'label'))
    ,(18, 'staffclient', 'login',  'gateway-v1',   'authen', oils_i18n_gettext(18, 'Staff Client Login', 'cuat', 'label'))
    ,(19, 'selfcheck',   'login',  'translator-v1','authen', oils_i18n_gettext(19, 'Self-Check Proxy Login', 'cuat', 'label'))
    ,(20, 'ums',         'login',  'xmlrpc',       'authen', oils_i18n_gettext(20, 'Unique Mgt Login', 'cuat', 'label'))
    ,(21, 'authproxy',   'login',  'apache',       'authen', oils_i18n_gettext(21, 'Apache Auth Proxy Login', 'cuat', 'label'))
    ,(22, 'libraryelf',  'login',  'xmlrpc',       'authz',  oils_i18n_gettext(22, 'LibraryElf Login', 'cuat', 'label'))

    ,(23, 'selfcheck',   'verify', 'translator-v1','authz',  oils_i18n_gettext(23, 'Self-Check User Verification', 'cuat', 'label'))
    ,(24, 'ezproxy',     'verify', 'remoteauth',   'authz',  oils_i18n_gettext(24, 'EZProxy Verification', 'cuat', 'label'))
    -- ...
    ;

-- reserve the first 1000 slots
SELECT SETVAL('config.usr_activity_type_id_seq'::TEXT, 1000);

INSERT INTO config.org_unit_setting_type 
    (name, label, description, grp, datatype) 
    VALUES (
        'circ.fines.charge_when_closed',
         oils_i18n_gettext(
            'circ.fines.charge_when_closed',
            'Charge fines on overdue circulations when closed',
            'coust', 
            'label'
        ),
        oils_i18n_gettext(
            'circ.fines.charge_when_closed',
            'Normally, fines are not charged when a library is closed.  When set to True, fines will be charged during scheduled closings and normal weekly closed days.',
            'coust', 
            'description'
        ),
        'circ',
        'bool'
    );

INSERT INTO config.org_unit_setting_type 
    (name, label, description, grp, datatype) 
    VALUES (
        'circ.patron.usr_activity_retrieve.max',
         oils_i18n_gettext(
            'circ.patron.usr_activity_retrieve.max',
            'Max user activity entries to retrieve (staff client)',
            'coust', 
            'label'
        ),
        oils_i18n_gettext(
            'circ.patron.usr_activity_retrieve.max',
            'Sets the maxinum number of recent user activity entries to retrieve for display in the staff client.  0 means show none, -1 means show all.  Default is 1.',
            'coust', 
            'description'
        ),
        'gui',
        'integer'
    );
-- circ export csv export --

INSERT INTO action_trigger.hook (key, core_type, description, passive)
VALUES (
    'circ.format.history.csv',
    'auch',
    oils_i18n_gettext(
        'circ.format.history.csv',
        'Produce CSV of circulation history',
        'ath',
        'description'
    ),
    FALSE
);

INSERT INTO action_trigger.event_definition (
    active, owner, name, hook, reactor, validator, group_field, template) 
VALUES (
    TRUE, 1, 'Circ History CSV', 'circ.format.history.csv', 'ProcessTemplate', 'NOOP_True', 'usr',
$$
Title,Author,Call Number,Barcode,Format
[%-
FOR circ IN target;
    bibxml = helpers.unapi_bre(circ.target_copy.call_number.record, {flesh => '{mra}'});
    title = "";
    FOR part IN bibxml.findnodes('//*[@tag="245"]/*[@code="a" or @code="b"]');
        title = title _ part.textContent;
    END;
    author = bibxml.findnodes('//*[@tag="100"]/*[@code="a"]').textContent;
    item_type = bibxml.findnodes('//*[local-name()="attributes"]/*[local-name()="field"][@name="item_type"]').getAttribute('coded-value') %]

    [%- helpers.csv_datum(title) -%],
    [%- helpers.csv_datum(author) -%],
    [%- helpers.csv_datum(circ.target_copy.call_number.label) -%],
    [%- helpers.csv_datum(circ.target_copy.barcode) -%],
    [%- helpers.csv_datum(item_type) %]
[%- END -%]
$$
);

INSERT INTO action_trigger.environment (event_def, path)
    VALUES (
        currval('action_trigger.event_definition_id_seq'),
        'target_copy.call_number'
    );

INSERT INTO actor.toolbar(id,org,label,layout) VALUES
    ( 1, 1, oils_i18n_gettext(1, 'circ', 'atb', 'label'), '["circ_checkout","circ_checkin","toolbarseparator.1","search_opac","copy_status","toolbarseparator.2","patron_search","patron_register","toolbarspacer.3","hotkeys_toggle"]' ),
    ( 2, 1, oils_i18n_gettext(2, 'cat', 'atb', 'label'), '["circ_checkin","toolbarseparator.1","search_opac","copy_status","toolbarseparator.2","create_marc","authority_manage","retrieve_last_record","toolbarspacer.3","hotkeys_toggle"]' );

INSERT INTO config.global_flag (name, enabled, label) 
    VALUES (
        'opac.org_unit.non_inherited_visibility',
        FALSE,
        oils_i18n_gettext(
            'opac.org_unit.non_inherited_visibility',
            'Org Units Do Not Inherit Visibility',
            'cgf',
            'label'
        )
    );

INSERT INTO config.org_unit_setting_type ( name, label, description, datatype, grp, update_perm )
    VALUES (
        'ui.hide_copy_editor_fields',
        oils_i18n_gettext(
            'ui.hide_copy_editor_fields',
            'GUI: Hide these fields within the Item Attribute Editor',
            'coust',
            'label'
        ),
        oils_i18n_gettext(
            'ui.hide_copy_editor_fields',
            'This setting may be best maintained with the dedicated configuration'
            || ' interface within the Item Attribute Editor.  However, here it'
            || ' shows up as comma separated list of field identifiers to hide.',
            'coust',
            'description'
        ),
        'array',
        'gui',
        539
    );

INSERT into config.org_unit_setting_type 
    (name, grp, label, description, datatype) 
    VALUES ( 
        'opac.patron.auto_overide_hold_events', 
        'opac',
        oils_i18n_gettext(
            'opac.patron.auto_overide_hold_events',
            'Auto-Override Permitted Hold Blocks (Patrons)',
            'coust', 
            'label'
        ),
        oils_i18n_gettext(
            'opac.patron.auto_overide_hold_events',
            'When a patron places a hold that fails and the patron has the correct permission ' || 
            'to override the hold, automatically override the hold without presenting a message ' || 
            'to the patron and requiring that the patron make a decision to override',
            'coust', 
            'description'
        ),
        'bool'
    );

INSERT into config.org_unit_setting_type
    (name, grp, label, description, datatype)
    VALUES (
        'opac.patron.temporary_list_warn',
        'opac',
        oils_i18n_gettext(
            'opac.patron.temporary_list_warn',
            'Warn patrons when adding to a temporary book list',
            'coust',
            'label'
        ),
        oils_i18n_gettext(
            'opac.patron.temporary_list_warn',
            'Present a warning dialog to the patron when a patron adds a book to a temporary book list.',
            'coust',
            'description'
        ),
        'bool'
    );

INSERT INTO config.usr_setting_type
    (name,grp,opac_visible,label,description,datatype)
VALUES (
    'opac.temporary_list_no_warn',
    'opac',
    TRUE,
    oils_i18n_gettext(
        'opac.temporary_list_no_warn',
        'Opt out of warning when adding a book to a temporary book list',
        'cust',
        'label'
    ),
    oils_i18n_gettext(
        'opac.temporary_list_no_warn',
        'Opt out of warning when adding a book to a temporary book list',
        'cust',
        'description'
    ),
    'bool'
);

INSERT INTO config.usr_setting_type
    (name,grp,opac_visible,label,description,datatype)
VALUES (
    'opac.default_list',
    'opac',
    FALSE,
    oils_i18n_gettext(
        'opac.default_list',
        'Default list to use when adding to a list',
        'cust',
        'label'
    ),
    oils_i18n_gettext(
        'opac.default_list',
        'Default list to use when adding to a list',
        'cust',
        'description'
    ),
    'integer'
);

INSERT INTO config.org_unit_setting_type (
    name, grp, label, description, datatype
) VALUES (
    'circ.staff.max_visible_event_age',
    'circ',
    'Maximum visible age of User Trigger Events in Staff Interfaces',
    'If this is unset, staff can view User Trigger Events regardless of age. When this is set to an interval, it represents the age of the oldest possible User Trigger Event that can be viewed.',
    'interval'
);

-- kid's opac main search filter

INSERT INTO actor.search_filter_group (owner, code, label) 
    VALUES (1, 'kpac_main', 'Kid''s OPAC Search Filter');

INSERT INTO actor.search_query (label, query_text) 
    VALUES ('Children''s Materials', 'audience(a,b,c)');
INSERT INTO actor.search_query (label, query_text) 
    VALUES ('Young Adult Materials', 'audience(j,d)');
INSERT INTO actor.search_query (label, query_text) 
    VALUES ('General/Adult Materials',  'audience(e,f,g, )');

INSERT INTO actor.search_filter_group_entry (grp, query, pos)
    VALUES (
        (SELECT id FROM actor.search_filter_group WHERE code = 'kpac_main'),
        (SELECT id FROM actor.search_query WHERE label = 'Children''s Materials'),
        0
    ); INSERT INTO actor.search_filter_group_entry (grp, query, pos) VALUES (
        (SELECT id FROM actor.search_filter_group WHERE code = 'kpac_main'),
        (SELECT id FROM actor.search_query WHERE label = 'Young Adult Materials'),
        1
    );
INSERT INTO actor.search_filter_group_entry (grp, query, pos) 
    VALUES (
        (SELECT id FROM actor.search_filter_group WHERE code = 'kpac_main'),
        (SELECT id FROM actor.search_query WHERE label = 'General/Adult Materials'),
        2
    );
INSERT into config.org_unit_setting_type
    (name, grp, label, description, datatype)
    VALUES (
        'acq.fund.allow_rollover_without_money',
        'acq',
        oils_i18n_gettext(
            'acq.fund.allow_rollover_without_money',
            'Allow funds to be rolled over without bringing the money along',
            'coust',
            'label'
        ),
        oils_i18n_gettext(
            'acq.fund.allow_rollover_without_money',
            'Allow funds to be rolled over without bringing the money along.  This makes money left in the old fund disappear, modeling its return to some outside entity.',
            'coust',
            'description'
        ),
        'bool'
    );

INSERT INTO config.org_unit_setting_type
    (name, grp, label, description, datatype)
    VALUES (
        'circ.lost.xact_open_on_zero',
        'finance',
        oils_i18n_gettext(
            'circ.lost.xact_open_on_zero',
            'Leave transaction open when lost balance equals zero',
            'coust',
            'label'
        ),
        oils_i18n_gettext(
            'circ.lost.xact_open_on_zero',
            'Leave transaction open when lost balance equals zero.  This leaves the lost copy on the patron record when it is paid',
            'coust',
            'description'
        ),
        'bool'
    );

INSERT INTO config.org_unit_setting_type
    (name, grp, label, description, datatype)
    VALUES (
        'circ.patron_expires_soon_warning',
        'circ',
        oils_i18n_gettext(
            'circ.patron_expires_soon_warning',
            'Warn when patron account is about to expire',
            'coust',
            'label'
        ),
        oils_i18n_gettext(
            'circ.patron_expires_soon_warning',
            'Warn when patron account is about to expire. If set, the staff client displays a warning this many days before the expiry of a patron account. Value is in number of days, for example: 3 for 3 days.',
            'coust',
            'description'
        ),
        'integer'
    );

INSERT INTO config.org_unit_setting_type (
    name, label, grp, datatype
) VALUES (
    'circ.fines.truncate_to_max_fine',
    oils_i18n_gettext(
        'circ.fines.truncate_to_max_fine',
        'Truncate fines to max fine amount',
        'coust',
        'label'
    ),
    'circ',
    'bool'
);


INSERT INTO config.settings_group (name, label)
    VALUES (
        'url_verify',
        oils_i18n_gettext(
            'url_verify',
            'URL Verify',
            'csg',
            'label'
        )
    );

INSERT INTO config.org_unit_setting_type
    (name, grp, label, description, datatype, update_perm)
    VALUES (
        'url_verify.url_verification_delay',
        'url_verify',
        oils_i18n_gettext(
            'url_verify.url_verification_delay',
            'Number of seconds to wait between URL test attempts.',
            'coust',
            'label'
        ),
        oils_i18n_gettext(
            'url_verify.url_verification_delay',
            'Throttling mechanism for batch URL verification runs.  Each running process will wait this number of seconds after a URL test before performing the next.',
            'coust',
            'description'
        ),
        'integer',
        544
    );

INSERT INTO config.org_unit_setting_type
    (name, grp, label, description, datatype, update_perm)
    VALUES (
        'url_verify.url_verification_max_redirects',
        'url_verify',
        oils_i18n_gettext(
            'url_verify.url_verification_max_redirects',
            'Maximum redirect lookups',
            'coust',
            'label'
        ),
        oils_i18n_gettext(
            'url_verify.url_verification_max_redirects',
            'For URLs returning 3XX redirects, this is the maximum number of redirects we will follow before giving up.',
            'coust',
            'description'
        ),
        'integer',
        544
    );

INSERT INTO config.org_unit_setting_type
    (name, grp, label, description, datatype, update_perm)
    VALUES (
        'url_verify.url_verification_max_wait',
        'url_verify',
        oils_i18n_gettext(
            'url_verify.url_verification_max_wait',
            'Maximum wait time (in seconds) for a URL to lookup',
            'coust',
            'label'
        ),
        oils_i18n_gettext(
            'url_verify.url_verification_max_wait',
            'If we exceed the wait time, the URL is marked as a "timeout" and the system moves on to the next URL',
            'coust',
            'description'
        ),
        'integer',
        544
    );

INSERT INTO config.filter_dialog_interface (key, description) VALUES (
    'url_verify',
    oils_i18n_gettext(
        'url_verify',
        'All Link Checker filter dialogs',
        'cfdi',
        'description'
    )
);

INSERT INTO config.usr_setting_type (name,grp,opac_visible,label,description,datatype) VALUES (
    'ui.grid_columns.url_verify.select_urls',
    'gui',
    FALSE,
    oils_i18n_gettext(
        'ui.grid_columns.url_verify.select_urls',
        'Link Checker''s URL Selection interface''s saved columns',
        'cust',
        'label'
    ),
    oils_i18n_gettext(
        'ui.grid_columns.url_verify.select_urls',
        'Link Checker''s URL Selection interface''s saved columns',
        'cust',
        'description'
    ),
    'string'
);

INSERT INTO config.usr_setting_type (name,grp,opac_visible,label,description,datatype) VALUES (
    'ui.grid_columns.url_verify.review_attempt',
    'gui',
    FALSE,
    oils_i18n_gettext(
        'ui.grid_columns.url_verify.review_attempt',
        'Link Checker''s Review Attempt interface''s saved columns',
        'cust',
        'label'
    ),
    oils_i18n_gettext(
        'ui.grid_columns.url_verify.review_attempt',
        'Link Checker''s Review Attempt interface''s saved columns',
        'cust',
        'description'
    ),
    'string'
);

INSERT INTO config.org_unit_setting_type
    (name, grp, label, description, datatype, update_perm)
    VALUES (
        'url_verify.verification_batch_size',
        'url_verify',
        oils_i18n_gettext(
            'url_verify.verification_batch_size',
            'Number of URLs to test in parallel',
            'coust',
            'label'
        ),
        oils_i18n_gettext(
            'url_verify.verification_batch_size',
            'URLs are tested in batches.  This number defines the size of each batch and it directly relates to the number of back-end processes performing URL verification.',
            'coust',
            'description'
        ),
        'integer',
        544
    );

INSERT INTO config.org_unit_setting_type
    (name, label, description, grp, datatype, fm_class) 
VALUES (
    'acq.upload.default.create_po',
    oils_i18n_gettext(
        'acq.upload.default.create_po',
        'Upload Create PO',
        'coust',
        'label'
    ),
     oils_i18n_gettext(
        'acq.upload.default.create_po',
        'Create a purchase order by default during ACQ file upload',
        'coust',
        'description'
    ),
   'acq',
    'bool',
    NULL
), (
    'acq.upload.default.activate_po',
    oils_i18n_gettext(
        'acq.upload.default.activate_po',
        'Upload Activate PO',
        'coust',
        'label'
    ),
     oils_i18n_gettext(
        'acq.upload.default.activate_po',
        'Activate the purchase order by default during ACQ file upload',
        'coust',
        'description'
    ),
    'acq',
    'bool',
    NULL
), (
    'acq.upload.default.provider',
    oils_i18n_gettext(
        'acq.upload.default.provider',
        'Upload Default Provider',
        'coust',
        'label'
    ),
     oils_i18n_gettext(
        'acq.upload.default.provider',
        'Default provider to use during ACQ file upload',
        'coust',
        'description'
    ),
    'acq',
    'link',
    'acqpro'
), (
    'acq.upload.default.vandelay.match_set',
    oils_i18n_gettext(
        'acq.upload.default.vandelay.match_set',
        'Upload Default Match Set',
        'coust',
        'label'
    ),
     oils_i18n_gettext(
        'acq.upload.default.vandelay.match_set',
        'Default match set to use during ACQ file upload',
        'coust',
        'description'
    ),
    'acq',
    'link',
    'vms'
), (
    'acq.upload.default.vandelay.merge_profile',
    oils_i18n_gettext(
        'acq.upload.default.vandelay.merge_profile',
        'Upload Default Merge Profile',
        'coust',
        'label'
    ),
     oils_i18n_gettext(
        'acq.upload.default.vandelay.merge_profile',
        'Default merge profile to use during ACQ file upload',
        'coust',
        'description'
    ),
    'acq',
    'link',
    'vmp'
), (
    'acq.upload.default.vandelay.import_non_matching',
    oils_i18n_gettext(
        'acq.upload.default.vandelay.import_non_matching',
        'Upload Import Non Matching by Default',
        'coust',
        'label'
    ),
     oils_i18n_gettext(
        'acq.upload.default.vandelay.import_non_matching',
        'Import non-matching records by default during ACQ file upload',
        'coust',
        'description'
    ),
    'acq',
    'bool',
    NULL
), (
    'acq.upload.default.vandelay.merge_on_exact',
    oils_i18n_gettext(
        'acq.upload.default.vandelay.merge_on_exact',
        'Upload Merge on Exact Match by Default',
        'coust',
        'label'
    ),
     oils_i18n_gettext(
        'acq.upload.default.vandelay.merge_on_exact',
        'Merge records on exact match by default during ACQ file upload',
        'coust',
        'description'
    ),
    'acq',
    'bool',
    NULL
), (
    'acq.upload.default.vandelay.merge_on_best',
    oils_i18n_gettext(
        'acq.upload.default.vandelay.merge_on_best',
        'Upload Merge on Best Match by Default',
        'coust',
        'label'
    ),
     oils_i18n_gettext(
        'acq.upload.default.vandelay.merge_on_best',
        'Merge records on best match by default during ACQ file upload',
        'coust',
        'description'
    ),
    'acq',
    'bool',
    NULL
), (
    'acq.upload.default.vandelay.merge_on_single',
    oils_i18n_gettext(
        'acq.upload.default.vandelay.merge_on_single',
        'Upload Merge on Single Match by Default',
        'coust',
        'label'
    ),
     oils_i18n_gettext(
        'acq.upload.default.vandelay.merge_on_single',
        'Merge records on single match by default during ACQ file upload',
        'coust',
        'description'
    ),
    'acq',
    'bool',
    NULL
), (
    'acq.upload.default.vandelay.quality_ratio',
    oils_i18n_gettext(
        'acq.upload.default.vandelay.quality_ratio',
        'Upload Default Min. Quality Ratio',
        'coust',
        'label'
    ),
     oils_i18n_gettext(
        'acq.upload.default.vandelay.quality_ratio',
        'Default minimum quality ratio used during ACQ file upload',
        'coust',
        'description'
    ),
    'acq',
    'integer',
    NULL
), (
    'acq.upload.default.vandelay.low_quality_fall_thru_profile',
    oils_i18n_gettext(
        'acq.upload.default.vandelay.low_quality_fall_thru_profile',
        'Upload Default Insufficient Quality Fall-Thru Profile',
        'coust',
        'label'
    ),
     oils_i18n_gettext(
        'acq.upload.default.vandelay.low_quality_fall_thru_profile',
        'Default low-quality fall through profile used during ACQ file upload',
        'coust',
        'description'
    ),
    'acq',
    'link',
    'vmp'
), (
    'acq.upload.default.vandelay.load_item_for_imported',
    oils_i18n_gettext(
        'acq.upload.default.vandelay.load_item_for_imported',
        'Upload Load Items for Imported Records by Default',
        'coust',
        'label'
    ),
     oils_i18n_gettext(
        'acq.upload.default.vandelay.load_item_for_imported',
        'Load items for imported records by default during ACQ file upload',
        'coust',
        'description'
    ),
    'acq',
    'bool',
    NULL
);


INSERT INTO config.ts_config_list(id, name) VALUES
    ('simple','Non-Stemmed Simple'),
    ('danish_nostop','Danish Stemmed'),
    ('dutch_nostop','Dutch Stemmed'),
    ('english_nostop','English Stemmed'),
    ('finnish_nostop','Finnish Stemmed'),
    ('french_nostop','French Stemmed'),
    ('german_nostop','German Stemmed'),
    ('hungarian_nostop','Hungarian Stemmed'),
    ('italian_nostop','Italian Stemmed'),
    ('norwegian_nostop','Norwegian Stemmed'),
    ('portuguese_nostop','Portuguese Stemmed'),
    ('romanian_nostop','Romanian Stemmed'),
    ('russian_nostop','Russian Stemmed'),
    ('spanish_nostop','Spanish Stemmed'),
    ('swedish_nostop','Swedish Stemmed'),
    ('turkish_nostop','Turkish Stemmed');

INSERT INTO config.metabib_class_ts_map(field_class, ts_config, index_weight, always) VALUES
    ('keyword','simple','A',true),
    ('keyword','english_nostop','C',true),
    ('title','simple','A',true),
    ('title','english_nostop','C',true),
    ('author','simple','A',true),
    ('author','english_nostop','C',true),
    ('series','simple','A',true),
    ('series','english_nostop','C',true),
    ('subject','simple','A',true),
    ('subject','english_nostop','C',true),
    ('identifier','simple','A',true);

INSERT INTO config.org_unit_setting_type (
    name, label, description, datatype, fm_class, update_perm, grp
) VALUES (
    'circ.hold_capture_order',
    oils_i18n_gettext(
        'circ.hold_capture_order',
        'Best-hold selection sort order',
        'coust',
        'label'
    ),
    oils_i18n_gettext(
        'circ.hold_capture_order',
        'Defines the sort order of holds when selecting a hold to fill using a given copy at capture time',
        'coust',
        'description'
    ),
    'link',
    'cbho',
    543,
    'holds'
);

INSERT INTO config.org_unit_setting_type (
    name, label, description, datatype, update_perm, grp
) VALUES (
    'circ.hold_go_home_interval',
    oils_i18n_gettext(
        'circ.hold_go_home_interval',
        'Max foreign-circulation time',
        'coust',
        'label'
    ),
    oils_i18n_gettext(
        'circ.hold_go_home_interval',
        'Time a copy can spend circulating away from its circ lib before returning there to fill a hold (if one exists there)',
        'coust',
        'description'
    ),
    'interval',
    543,
    'holds'
);


INSERT INTO config.best_hold_order (
    name,
    approx, pprox, aprox, priority, cut, depth, rtime
) VALUES (
    'Traditional',
    1, 2, 3, 4, 5, 6, 7
);

INSERT INTO config.best_hold_order (
    name,
    hprox, approx, pprox, aprox, priority, cut, depth, rtime
) VALUES (
    'Traditional with Holds-always-go-home',
    1, 2, 3, 4, 5, 6, 7, 8
);

INSERT INTO config.best_hold_order (
    name,
    htime, approx, pprox, aprox, priority, cut, depth, rtime
) VALUES (
    'Traditional with Holds-go-home',
    1, 2, 3, 4, 5, 6, 7, 8
);

INSERT INTO config.best_hold_order (
    name,
    priority, cut, rtime, depth, pprox, hprox, aprox, htime
) VALUES (
    'FIFO',
    1, 2, 3, 4, 5, 6, 7, 8
);

INSERT INTO config.best_hold_order (
    name,
    hprox, priority, cut, rtime, depth, pprox, aprox, htime
) VALUES (
    'FIFO with Holds-always-go-home',
    1, 2, 3, 4, 5, 6, 7, 8
);

INSERT INTO config.best_hold_order (
    name,
    htime, priority, cut, rtime, depth, pprox, aprox, hprox
) VALUES (
    'FIFO with Holds-go-home',
    1, 2, 3, 4, 5, 6, 7, 8
);

INSERT INTO actor.org_unit_setting (
    org_unit, name, value
) VALUES (
    (SELECT id FROM actor.org_unit WHERE parent_ou IS NULL),
    'circ.hold_go_home_interval',
    '"6 months"'
);

INSERT INTO action_trigger.hook (
        key,
        core_type,
        description,
        passive
    ) VALUES (
        'au.barred',
        'au',
        'A user was barred by staff',
        FALSE
    );

INSERT INTO action_trigger.hook (
        key,
        core_type,
        description,
        passive
    ) VALUES (
        'au.unbarred',
        'au',
        'A user was un-barred by staff',
        FALSE
    );

INSERT INTO action_trigger.validator (
        module, 
        description
    ) VALUES (
        'PatronBarred',
        'Tests if a patron is currently marked as barred'
    );

INSERT INTO action_trigger.validator (
        module, 
        description
    ) VALUES (
        'PatronNotBarred',
        'Tests if a patron is currently not marked as barred'
    );

INSERT INTO config.org_unit_setting_type
    (name, label, description, grp, datatype) 
VALUES (
    'acq.fund.rollover_distrib_forms',
    oils_i18n_gettext(
        'acq.fund.rollover_distrib_forms',
        'Rollover Distribution Formulae Funds',
        'coust',
        'label'
    ),
     oils_i18n_gettext(
        'acq.fund.rollover_distrib_forms',
        'During fiscal rollover, update distribution formalae to use new funds',
        'coust',
        'description'
    ),
    'acq',
    'bool'
);

INSERT INTO config.z3950_index_field_map 
    (id, label, metabib_field, z3950_attr_type) VALUES 
(1, oils_i18n_gettext(1, 'Title',   'czifm', 'label'), 5,  'title'),
(2, oils_i18n_gettext(2, 'Author',  'czifm', 'label'), 8,  'author'),
(3, oils_i18n_gettext(3, 'ISBN',    'czifm', 'label'), 18, 'isbn'),
(4, oils_i18n_gettext(4, 'ISSN',    'czifm', 'label'), 19, 'issn'),
(5, oils_i18n_gettext(5, 'LCCN',    'czifm', 'label'), 30, 'lccn');

INSERT INTO config.z3950_index_field_map 
    (id, label, record_attr, z3950_attr_type) VALUES 
(6, oils_i18n_gettext(6, 'Pubdate',  'czifm', 'label'),'pubdate', 'pubdate'),
(7, oils_i18n_gettext(7, 'Item Type', 'czifm', 'label'),'item_type', 'item_type');


-- let's leave room for more stock mappings
SELECT SETVAL('config.z3950_index_field_map_id_seq'::TEXT, 1000);

INSERT INTO config.org_unit_setting_type
    (name, grp, label, description, datatype)
    VALUES (
        'cat.z3950.batch.max_parallel',
        'cat',
        oils_i18n_gettext(
            'cat.z3950.batch.max_parallel',
            'Maximum Parallel Z39.50 Batch Searches',
            'coust',
            'label'
        ),
        oils_i18n_gettext(
            'cat.z3950.batch.max_parallel',
            'The maximum number of Z39.50 searches that can be in-flight at any given time when performing batch Z39.50 searches',
            'coust',
            'description'
        ),
        'integer'
    );

INSERT INTO config.org_unit_setting_type
    (name, grp, label, description, datatype)
    VALUES (
        'cat.z3950.batch.max_results',
        'cat',
        oils_i18n_gettext(
            'cat.z3950.batch.max_results',
            'Maximum Z39.50 Batch Search Results',
            'coust',
            'label'
        ),
        oils_i18n_gettext(
            'cat.z3950.batch.max_results',
            'The maximum number of search results to retrieve and queue for each record + Z39 source during batch Z39.50 searches',
            'coust',
            'description'
        ),
        'integer'
    );

-- long overdue stuff...

INSERT INTO config.org_unit_setting_type 
    (name, grp, datatype, label, description) VALUES 
(
    'circ.longoverdue_immediately_available',
    'circ', 'bool',
    oils_i18n_gettext(
        'circ.longoverdue_immediately_available',
        'Long-Overdue Items Usable on Checkin',
        'coust',
        'label'
    ),
    oils_i18n_gettext(
        'circ.longoverdue_immediately_available',
        'Long-overdue items are usable on checkin instead of going "home" first',
        'coust',
        'description'
    )
), (
    'circ.longoverdue_materials_processing_fee',
    'finance', 'currency',
    oils_i18n_gettext(
        'circ.longoverdue_materials_processing_fee',
        'Long-Overdue Materials Processing Fee',
        'coust',
        'label'
    ),
    oils_i18n_gettext(
        'circ.longoverdue_materials_processing_fee',
        'Long-Overdue Materials Processing Fee',
        'coust',
        'description'
    )
), (
    'circ.max_accept_return_of_longoverdue',
    'circ', 'interval',
    oils_i18n_gettext(
        'circ.max_accept_return_of_longoverdue',
        'Long-Overdue Max Return Interval',
        'coust',
        'label'
    ),
    oils_i18n_gettext(
        'circ.max_accept_return_of_longoverdue',
        'Long-overdue check-in processing (voiding fees, re-instating ' ||
            'overdues, etc.) will not take place for items that have been ' ||
            'overdue for (or have last activity older than) this amount of time',
        'coust',
        'description'
    )
), (
    'circ.restore_overdue_on_longoverdue_return',
    'circ', 'bool',
    oils_i18n_gettext(
        'circ.restore_overdue_on_longoverdue_return',
        'Restore Overdues on Long-Overdue Item Return',
        'coust',
        'label'
    ),
    oils_i18n_gettext(
        'circ.restore_overdue_on_longoverdue_return',
        'Restore Overdues on Long-Overdue Item Return',
        'coust',
        'description'
    )
), (
    'circ.void_longoverdue_on_checkin',
    'circ', 'bool',
    oils_i18n_gettext(
        'circ.void_longoverdue_on_checkin',
        'Void Long-Overdue Item Billing When Returned',
        'coust',
        'label'
    ),
    oils_i18n_gettext(
        'circ.void_longoverdue_on_checkin',
        'Void Long-Overdue Item Billing When Returned',
        'coust',
        'description'
    )
), (
    'circ.void_longoverdue_proc_fee_on_checkin',
    'circ', 'bool',
    oils_i18n_gettext(
        'circ.void_longoverdue_proc_fee_on_checkin',
        'Void Processing Fee on Long-Overdue Item Return',
        'coust',
        'label'
    ),
    oils_i18n_gettext(
        'circ.void_longoverdue_proc_fee_on_checkin',
        'Void Processing Fee on Long-Overdue Item Return',
        'coust',
        'description'
    )
), (
    'circ.void_overdue_on_longoverdue',
    'finance', 'bool',
    oils_i18n_gettext(
        'circ.void_overdue_on_longoverdue',
        'Void Overdue Fines When Items are Marked Long-Overdue',
        'coust',
        'label'
    ),
    oils_i18n_gettext(
        'circ.void_overdue_on_longoverdue',
        'Void Overdue Fines When Items are Marked Long-Overdue',
        'coust',
        'description'
    )
), (
    'circ.longoverdue.xact_open_on_zero',
    'finance', 'bool',
    oils_i18n_gettext(
        'circ.longoverdue.xact_open_on_zero',
        'Leave transaction open when long overdue balance equals zero',
        'coust',
        'label'
    ),
    oils_i18n_gettext(
        'circ.longoverdue.xact_open_on_zero',
        'Leave transaction open when long-overdue balance equals zero.  ' ||
            'This leaves the lost copy on the patron record when it is paid',
        'coust',
        'description'
    )
), (
    'circ.longoverdue.use_last_activity_date_on_return',
    'circ', 'bool',
    oils_i18n_gettext(
        'circ.longoverdue.use_last_activity_date_on_return',
        'Long-Overdue Check-In Interval Uses Last Activity Date',
        'coust',
        'label'
    ),
    oils_i18n_gettext(
        'circ.longoverdue.use_last_activity_date_on_return',
        'Use the long-overdue last-activity date instead of the due_date to ' ||
            'determine whether the item has been checked out too long to ' ||
            'perform long-overdue check-in processing.  If set, the system ' ||
            'will first check the last payment time, followed by the last ' ||
            'billing time, followed by the due date.  See also ' ||
            'circ.max_accept_return_of_longoverdue',
        'coust',
        'description'
    )
);

-- mark long-overdue reactor

INSERT INTO action_trigger.reactor (module, description) VALUES
(   'MarkItemLongOverdue',
    oils_i18n_gettext(
        'MarkItemLongOverdue',
        'Marks a circulating item as long-overdue and applies configured ' ||
        'penalties.  Also creates events for the longoverdue.auto hook',
        'atreact',
        'description'
    )
);

INSERT INTO action_trigger.validator (module, description) VALUES (
    'PatronNotInCollections', 
    'Event is valid if the linked patron is not in collections processing ' ||
        'at the context org unit'
);

INSERT INTO action_trigger.event_definition 
    (id, active, owner, name, hook, validator, reactor, delay, delay_field) 
VALUES (
    49, FALSE, 1, '6 Month Overdue Mark Long-Overdue', 
    'checkout.due', 'PatronNotInCollections', 
    'MarkItemLongOverdue', '6 months', 'due_date'
);

INSERT INTO action_trigger.event_params (event_def, param, value) VALUES
    (49, 'editor', '''1''');

-- new longoverdue and longervdue.auto hook.

INSERT INTO action_trigger.hook (key,core_type,description) VALUES (
    'longoverdue',
    'circ',
    'Circulating Item marked long-overdue'
);

INSERT INTO action_trigger.hook (key,core_type,description) VALUES (
    'longoverdue.auto',
    'circ',
    'Circulating Item automatically marked long-overdue'
);

-- sample longoverdue.auto notification reactor

INSERT INTO action_trigger.event_definition 
    (id, active, owner, name, hook, validator, reactor, group_field, template) 
    VALUES (
        50, FALSE, 1, '6 Month Long Overdue Notice', 
        'longoverdue.auto', 'NOOP_True', 'SendEmail', 'usr',
$$
[%- USE date -%]
[%- user = target.0.usr -%]
To: [%- params.recipient_email || user.email %]
From: [%- params.sender_email || default_sender %]
Date: [%- date.format(date.now, '%a, %d %b %Y %T -0000', gmt => 1) %]
Subject: Overdue Items Marked Long Overdue
Auto-Submitted: auto-generated

Dear [% user.family_name %], [% user.first_given_name %]
The following items are 6 months overdue and have been marked Long Overdue.

[% FOR circ IN target %]
    [%- copy_details = helpers.get_copy_bib_basics(circ.target_copy.id) -%]
    Title: [% copy_details.title %], by [% copy_details.author %]
    Call Number: [% circ.target_copy.call_number.label %]
    Shelving Location: [% circ.target_copy.location.name %]
    Barcode: [% circ.target_copy.barcode %]
    Due: [% date.format(helpers.format_date(circ.due_date), '%Y-%m-%d') %]
    Item Cost: [% helpers.get_copy_price(circ.target_copy) %]
    Total Owed For Transaction: [% circ.billable_transaction.summary.balance_owed %]
    Library: [% circ.circ_lib.name %]

[% END %]
$$);

-- ENV for above

INSERT INTO action_trigger.environment (event_def, path) VALUES 
    (50, 'target_copy.call_number'),
    (50, 'usr'),
    (50, 'billable_transaction.summary'),
    (50, 'circ_lib.billing_address'),
    (50, 'target_copy.location');


-- Auto-cancelled, no target
INSERT INTO action_trigger.event_definition (
    id, active, owner, name, hook,
    validator, reactor, delay, delay_field,
    group_field, message_usr_path, message_library_path, message_title,
    message_template
) VALUES (
    51, FALSE, 1, 'Hold Cancelled (No Target) User Message', 'hold_request.cancel.expire_no_target',
    'HoldIsCancelled', 'NOOP_True', '30 minutes', 'cancel_time',
    'usr', 'usr', 'usr.home_ou', 'Hold Request Cancelled',
$$
[%- USE date -%]
[%- user = target.0.usr -%]
The following holds were cancelled because no items were found to fulfill them.

[% FOR hold IN target %]
    Title: [% hold.bib_rec.bib_record.simple_record.title %]
    Author: [% hold.bib_rec.bib_record.simple_record.author %]
    Library: [% hold.pickup_lib.name %]
    Request Date: [% date.format(helpers.format_date(hold.request_time), '%Y-%m-%d') %]
[% END %]

$$);

INSERT INTO action_trigger.environment (event_def, path) VALUES
    (51, 'usr'),
    (51, 'pickup_lib'),
    (51, 'bib_rec.bib_record.simple_record');


-- Cancelled by staff
INSERT INTO action_trigger.event_definition (
    id, active, owner, name, hook,
    validator, reactor, delay, delay_field,
    group_field, message_usr_path, message_library_path, message_title,
    message_template
) VALUES (
    52, FALSE, 1, 'Hold Cancelled (Staff) User Message', 'hold_request.cancel.staff',
    'HoldIsCancelled', 'NOOP_True', '30 minutes', 'cancel_time',
    'usr', 'usr', 'usr.home_ou', 'Hold Request Cancelled',
$$
[%- USE date -%]
[%- user = target.0.usr -%]
The following holds were cancelled by a staff member.

[% FOR hold IN target %]
    Title: [% hold.bib_rec.bib_record.simple_record.title %]
    Author: [% hold.bib_rec.bib_record.simple_record.author %]
    Library: [% hold.pickup_lib.name %]
    Request Date: [% date.format(helpers.format_date(hold.request_time), '%Y-%m-%d') %]
    Cancellation Note: [% hold.cancel_note %]
[% END %]

$$);

INSERT INTO action_trigger.environment (event_def, path) VALUES
    (52, 'usr'),
    (52, 'pickup_lib'),
    (52, 'bib_rec.bib_record.simple_record');


-- Shelf expired
INSERT INTO action_trigger.event_definition (
    id, active, owner, name, hook,
    validator, reactor, delay, delay_field,
    group_field, message_usr_path, message_library_path, message_title,
    message_template
) VALUES (
    53, TRUE, 1, 'Hold Cancelled (Shelf-expired) User Message', 'hold_request.cancel.expire_holds_shelf',
    'HoldIsCancelled', 'NOOP_True', '30 minutes', 'cancel_time',
    'usr', 'usr', 'usr.home_ou', 'Hold Request Cancelled',
$$
[%- USE date -%]
[%- user = target.0.usr -%]
The following holds were cancelled because they were never picked up.

[% FOR hold IN target %]
    Title: [% hold.bib_rec.bib_record.simple_record.title %]
    Author: [% hold.bib_rec.bib_record.simple_record.author %]
    Library: [% hold.pickup_lib.name %]
    Request Date: [% date.format(helpers.format_date(hold.request_time), '%Y-%m-%d') %]
    Pickup By: [% date.format(helpers.format_date(hold.shelf_expire_time), '%Y-%m-%d') %]
[% END %]

$$);

INSERT INTO action_trigger.environment (event_def, path) VALUES
    (53, 'usr'),
    (53, 'pickup_lib'),
    (53, 'bib_rec.bib_record.simple_record');

-- 30 Day Pre Expire A/T Notice - Notify customers before their account expires

INSERT INTO action_trigger.hook (key, core_type, description, passive)
    VALUES ('au.expired', 'au', 'A user account has expired', 't');
	
INSERT INTO action_trigger.event_definition (
    active, owner, name, hook,
    validator, reactor, delay, delay_field,
    max_delay, repeat_delay, template
) VALUES (
    'f', '1', '30 Day Account Expiration Courtesy Notice','au.expired',
    'NOOP_True', 'SendEmail', '-30 days', 'expire_date', '-29 days', '30 days',
$$
[%- USE date -%]
[%- user = target -%]
[%- lib = target.home_ou -%]
To: [%- params.recipient_email || user.email %]
From: [%- helpers.get_org_setting(target.home_ou.id, 'org.bounced_emails') || lib.email || params.sender_email || default_sender %]
Date: [%- date.format(date.now, '%a, %d %b %Y %T -0000', gmt => 1) %]
Reply-To: [%- helpers.get_org_setting(target.home_ou.id, 'org.bounced_emails') || lib.email || params.sender_email || default_sender %]
Subject: Courtesy Notice - Library Account Expiration in 30 days
Auto-Submitted: auto-generated

Dear [% user.first_given_name %] [% user.family_name %],

Our records indicate your library account is due to expire in 30 days.  Please visit your local library at your convenience to renew your account in order to avoid a disruption in access to library service.

Sincerely,
[% lib.name %]

Contact your library for more information:

[% lib.name %]
[%- SET addr = lib.mailing_address -%]
[%- IF !addr -%] [%- SET addr = lib.billing_address -%] [%- END %]
[% addr.street1 %] [% addr.street2 %]
[% addr.city %], [% addr.state %]
[% addr.post_code %]
[% lib.phone %]

$$);

INSERT INTO action_trigger.environment (event_def, path) VALUES
    (currval('action_trigger.event_definition_id_seq'), 'home_ou.mailing_address'),
    (currval('action_trigger.event_definition_id_seq'), 'home_ou.billing_address');

--Start new patron welcome email notice/action -----------
--create hook for actor.usr.create_date
INSERT INTO action_trigger.hook (key, core_type, description, passive)
    VALUES ('au.created', 'au', 'A user was created', 't');
	
--SQL to create event definition for new account creation notice
--Inactive, owned by top of org tree by default.  Modify to suit needs.

INSERT INTO action_trigger.event_definition (
    active, owner, name, hook, 
    validator, reactor, delay, delay_field,
    max_delay, template
)  VALUES (
    'f', '1', 'New User Created Welcome Notice', 'au.created',
    'NOOP_True', 'SendEmail', '10 seconds', 'create_date',
    '1 day',
$$
[%- USE date -%]
[%- user = target -%]
[%- lib = target.home_ou -%]
To: [%- params.recipient_email || user.email %]
From: [%- helpers.get_org_setting(target.home_ou.id, 'org.bounced_emails') || lib.email || params.sender_email || default_sender %]
Date: [%- date.format(date.now, '%a, %d %b %Y %T -0000', gmt => 1) %]
Reply-To: [%- helpers.get_org_setting(target.home_ou.id, 'org.bounced_emails') || lib.email || params.sender_email || default_sender %]
Subject: New Library Account Sign-up - Welcome!
Auto-Submitted: auto-generated

Dear [% user.first_given_name %] [% user.family_name %],

Thank you for signing up for an account with the [% lib.name %] on [% user.create_date.substr(0, 10) %].

This email is your confirmation that your account is set up and ready as well as testing to see that we have your correct email address.

If you did not sign up for an account at the library and have received this email in error, please reply and let us know.

You can access your account online at http://catalog/eg/opac/login. From that site you can search the catalog, request materials, renew materials, leave comments, leave suggestions for titles you would like the library to purchase and update your account information.

Sincerely,
[% lib.name %]

Contact your library for more information:

[% lib.name %]
[%- SET addr = lib.mailing_address -%]
[%- IF !addr -%] [%- SET addr = lib.billing_address -%] [%- END %]
[% addr.street1 %] [% addr.street2 %]
[% addr.city %], [% addr.state %]
[% addr.post_code %]
[% lib.phone %]
[% lib.email %]

$$);
       
--insert environment values
INSERT INTO action_trigger.environment (event_def, path) VALUES
    (CURRVAL('action_trigger.event_definition_id_seq'), 'home_ou.mailing_address'),
    (CURRVAL('action_trigger.event_definition_id_seq'), 'home_ou.billing_address');
-- End new patron welcome message notice -----------

-- OUS's for patron self-reg
INSERT INTO config.org_unit_setting_type
    (name, grp, datatype, label, description)
VALUES (
    'opac.allow_pending_user',
    'opac',
    'bool',
    oils_i18n_gettext(
        'opac.allow_pending_user',
        'Allow Patron Self-Registration',
        'coust',
        'label'
    ),
    oils_i18n_gettext(
        'opac.allow_pending_user',
        'Allow patrons to self-register, creating pending user accounts',
        'coust',
        'description'
    )
), (
    'opac.pending_user_expire_interval',
    'opac',
    'interval',
    oils_i18n_gettext(
        'opac.pending_user_expire_interval',
        'Patron Self-Reg. Expire Interval',
        'coust',
        'label'
    ),
    oils_i18n_gettext(
        'opac.pending_user_expire_interval',
        'If set, this is the amount of time a pending user account will ' ||
        'be allowed to sit in the database.  After this time, the pending ' ||
        'user information will be purged',
        'coust',
        'description'
    )
), (
    'ui.patron.edit.aua.county.show',
    'gui',
    'bool',
    oils_i18n_gettext(
        'ui.patron.edit.aua.county.require',
        'Show county field on patron registration',
        'coust',
        'label'
    ),
    oils_i18n_gettext(
        'ui.patron.edit.aua.county.require',
        'The county field will be shown on the patron registration screen',
        'coust',
        'description'
    )
);

-- vandelay item import defaults
INSERT INTO config.org_unit_setting_type
    (grp, name, label, description, datatype, fm_class)
VALUES (
    'vandelay',
    'vandelay.item.barcode.auto',
    oils_i18n_gettext(
        'vandelay.item.barcode.auto',
        'Vandelay Generate Default Barcodes',
        'coust', 'label'),
    oils_i18n_gettext(
        'vandelay.item.barcode.auto',
        'Auto-generate deault item barcodes when no item barcode is present',
        'coust', 'label'),
    'bool',
    NULL
), (
    'vandelay',
    'vandelay.item.barcode.prefix',
    oils_i18n_gettext(
        'vandelay.item.barcode.prefix',
        'Vandelay Default Barcode Prefix',
        'coust', 'label'),
    oils_i18n_gettext(
        'vandelay.item.barcode.prefix',
        'Apply this prefix to any auto-generated item barcodes',
        'coust', 'label'),
    'string',
    NULL
), (
    'vandelay',
    'vandelay.item.call_number.auto',
    oils_i18n_gettext(
        'vandelay.item.call_number.auto',
        'Vandelay Generate Default Call Numbers',
        'coust', 'label'),
    oils_i18n_gettext(
        'vandelay.item.call_number.auto',
        'Auto-generate default item call numbers when no item call number is present',
        'coust', 'label'),
    'bool',
    NULL
), (
    'vandelay',
    'vandelay.item.call_number.prefix',
    oils_i18n_gettext(
        'vandelay.item.call_number.prefix',
        'Vandelay Default Call Number Prefix',
        'coust', 'label'),
    oils_i18n_gettext(
        'vandelay.item.call_number.prefix',
        'Apply this prefix to any auto-generated item call numbers',
        'coust', 'label'),
    'string',
    NULL
), (
    'vandelay',
    'vandelay.item.copy_location.default',
    oils_i18n_gettext(
        'vandelay.item.copy_location.default',
        'Vandelay Default Copy Location',
        'coust', 'label'),
    oils_i18n_gettext(
        'vandelay.item.copy_location.default',
        'Default copy location value for imported items',
        'coust', 'label'),
    'link',
    'acpl'
), (
    'vandelay',
    'vandelay.item.circ_modifier.default',
    oils_i18n_gettext(
        'vandelay.item.circ_modifier.default',
        'Vandelay Default Circulation Modifier',
        'coust', 'label'),
    oils_i18n_gettext(
        'vandelay.item.circ_modifier.default',
        'Default circulation modifier value for imported items',
        'coust', 'label'),
    'link',
    'ccm'
);


INSERT into config.org_unit_setting_type 
    (name, grp, label, description, datatype)
VALUES ( 
    'opac.holds.org_unit_not_pickup_lib', 
    'opac',
    oils_i18n_gettext('opac.holds.org_unit_not_pickup_lib',
        'OPAC: Org Unit is not a hold pickup library',
        'coust', 'label'),
    oils_i18n_gettext('opac.holds.org_unit_not_pickup_lib',
        'If set, this org unit will not be offered to the patron as an '||
        'option for a hold pickup location.  This setting has no affect '||
        'on searching or hold targeting',
        'coust', 'description'),
    'bool'
);


INSERT INTO config.standing_penalty
    (id, name, label, block_list, staff_alert)
VALUES (
    35,
    'PATRON_EXCEEDS_LONGOVERDUE_COUNT',
    oils_i18n_gettext(
        35,
        'Patron Exceeds Max Long-Overdue Threshold',
        'csp',
        'label'
    ),
    'CIRC|FULFILL|HOLD|CAPTURE|RENEW',
    TRUE
);


INSERT INTO config.org_unit_setting_type
    (name, grp, datatype, label, description)
VALUES (
    'opac.self_register.timeout',
    'opac',
    'integer',
    oils_i18n_gettext(
        'opac.self_register.timeout',
        'Patron Self-Reg. Display Timeout',
        'coust',
        'label'
    ),
    oils_i18n_gettext(
        'opac.self_register.timeout',
        'Number of seconds to wait before reloading the patron self-'||
        'registration interface to clear sensitive data',
        'coust',
        'description'
    )
);


INSERT INTO config.org_unit_setting_type 
    (name, grp, datatype, label, description)
VALUES (
    'ui.circ.items_out.longoverdue', 'gui', 'integer',
    oils_i18n_gettext(
        'ui.circ.items_out.longoverdue',
        'Items Out Long-Overdue display setting',
        'coust',
        'label'
    ),
    oils_i18n_gettext(
        'ui.circ.items_out.longoverdue',
'Value is a numeric code, describing which list the circulation '||
'should appear while checked out and whether the circulation should '||
'continue to appear in the bottom list, when checked in with '||
'oustanding fines.  '||
'1 = top list, bottom list.  2 = bottom list, bottom list.  ' ||
'5 = top list, do not display.  6 = bottom list, do not display.',
        'coust',
        'description'
    )
), (
    'ui.circ.items_out.lost', 'gui', 'integer',
    oils_i18n_gettext(
        'ui.circ.items_out.lost',
        'Items Out Lost display setting',
        'coust',
        'label'
    ),
    oils_i18n_gettext(
        'ui.circ.items_out.lost',
'Value is a numeric code, describing which list the circulation '||
'should appear while checked out and whether the circulation should '||
'continue to appear in the bottom list, when checked in with '||
'oustanding fines.  '||
'1 = top list, bottom list.  2 = bottom list, bottom list.  ' ||
'5 = top list, do not display.  6 = bottom list, do not display.',
        'coust',
        'description'
    )
), (
    'ui.circ.items_out.claimsreturned', 'gui', 'integer',
    oils_i18n_gettext(
        'ui.circ.items_out.claimsreturned',
        'Items Out Claims Returned display setting',
        'coust',
        'label'
    ),
    oils_i18n_gettext(
        'ui.circ.items_out.claimsreturned',
'Value is a numeric code, describing which list the circulation '||
'should appear while checked out and whether the circulation should '||
'continue to appear in the bottom list, when checked in with '||
'oustanding fines.  '||
'1 = top list, bottom list.  2 = bottom list, bottom list.  ' ||
'5 = top list, do not display.  6 = bottom list, do not display.',
        'coust',
        'description'
    )
);

-- YAOUS patron credit disable
INSERT INTO config.org_unit_setting_type 
    (grp, name, datatype, label, description) 
VALUES (
    'finance',
    'circ.disable_patron_credit',
    'bool',
    oils_i18n_gettext(
        'circ.disable_patron_credit',
        'Disable Patron Credit',
        'coust',
        'label'
    ),
    oils_i18n_gettext(
        'circ.disable_patron_credit',
        'Do not allow patrons to accrue credit or pay fines/fees with accrued credit',
        'coust',
        'description'
    )
);

INSERT INTO config.floating_group(name) VALUES ('Everywhere');
INSERT INTO config.floating_group_member(floating_group, org_unit) VALUES (1, 1);

INSERT INTO config.global_flag (name, label, value, enabled) VALUES (
    'opac.metarecord.holds.format_attr', 
    oils_i18n_gettext(
        'opac.metarecord.holds.format_attr',
        'OPAC Metarecord Hold Formats Attribute', 
        'cgf',
        'label'
    ),
    'mr_hold_format', 
    TRUE
);

-- until we have a custom attribute for the selector, 
-- default to the icon_format attribute
INSERT INTO config.global_flag (name, label, value, enabled) VALUES (
    'opac.format_selector.attr', 
    oils_i18n_gettext(
        'opac.format_selector.attr', 
        'OPAC Format Selector Attribute', 
        'cgf',
        'label'
    ),
    'search_format', 
    TRUE
);

INSERT INTO config.global_flag (name, value, label, enabled)
    VALUES (
        'search.max_facets_per_field',
        '1000',
        oils_i18n_gettext(
            'search.max_facets_per_field',
            'Search: maximum number of facet values to retrieve for each facet field',
            'cgf', 
            'label'
        ),
        TRUE
    );

INSERT INTO config.org_unit_setting_type
    (name, grp, label, description, datatype)
    VALUES
        ('circ.void_lost_on_claimsreturned',
         'circ',
         oils_i18n_gettext('circ.void_lost_on_claimsreturned',
             'Void lost item billing when claims returned',
             'coust', 'label'),
         oils_i18n_gettext('circ.void_lost_on_claimsreturned',
             'Void lost item billing when claims returned',
             'coust', 'description'),
         'bool'),
        ('circ.void_lost_proc_fee_on_claimsreturned',
         'circ',
         oils_i18n_gettext('circ.void_lost_proc_fee_on_claimsreturned',
             'Void lost item processing fee when claims returned',
             'coust', 'label'),
         oils_i18n_gettext('circ.void_lost_proc_fee_on_claimsreturned',
             'Void lost item processing fee when claims returned',
             'coust', 'description'),
         'bool');

INSERT INTO config.org_unit_setting_type
    (name, grp, label, description, datatype)
    VALUES
        ('circ.void_longoverdue_on_claimsreturned',
         'circ',
         oils_i18n_gettext('circ.void_longoverdue_on_claimsreturned',
             'Void longoverdue item billing when claims returned',
             'coust', 'label'),
         oils_i18n_gettext('circ.void_longoverdue_on_claimsreturned',
             'Void long overdue item billing when claims returned',
             'coust', 'description'),
         'bool'),
        ('circ.void_longoverdue_proc_fee_on_claimsreturned',
         'circ',
         oils_i18n_gettext('circ.void_longoverdue_proc_fee_on_claimsreturned',
             'Void longoverdue item processing fee when claims returned',
             'coust', 'label'),
         oils_i18n_gettext('circ.void_longoverdue_proc_fee_on_claimsreturned',
             'Void long overdue item processing fee when claims returned',
             'coust', 'description'),
         'bool');

INSERT INTO config.org_unit_setting_type
    (name, grp, label, description, datatype)
    VALUES
        ('org.restrict_opt_to_depth',
         'sec',
         oils_i18n_gettext('org.restrict_opt_to_depth',
            'Restrict patron opt-in to home library and related orgs at specified depth',
            'coust', 'label'),
         oils_i18n_gettext('org.restrict_opt_to_depth',
            'Patrons at this library can only be opted-in at org units which are within the '||
            'library''s section of the org tree, at or below the depth specified by this setting. '||
            'They cannot be opted in at any other libraries.',
            'coust', 'description'),
        'integer');

INSERT INTO config.org_unit_setting_type
( name, grp, label, description, datatype )
VALUES
('circ.patron_search.diacritic_insensitive',
 'circ',
 oils_i18n_gettext('circ.patron_search.diacritic_insensitive',
     'Patron search diacritic insensitive',
     'coust', 'label'),
 oils_i18n_gettext('circ.patron_search.diacritic_insensitive',
     'Match patron last, first, and middle names irrespective of usage of diacritical marks or spaces. (e.g., Ines will match Inés; de la Cruz will match Delacruz)',
     'coust', 'description'),
  'bool');

INSERT INTO actor.org_unit_setting (
    org_unit, name, value
) VALUES (
    (SELECT id FROM actor.org_unit WHERE parent_ou IS NULL),
    'circ.patron_search.diacritic_insensitive',
    'true'
);

INSERT INTO config.global_flag (name, enabled, label) VALUES (
    'ingest.disable_authority_auto_update_bib_meta',  FALSE, 
    oils_i18n_gettext(
        'ingest.disable_authority_auto_update_bib_meta',
        'Authority Automation: Disable automatic authority updates ' ||
            'from modifying bib record editor and edit_date',
        'cgf',
        'label'
    )
);

-- email checkout receipts
INSERT INTO config.usr_setting_type (
    name,
    opac_visible,
    label,
    description,
    datatype
) VALUES (
    'circ.send_email_checkout_receipts',
    TRUE,
    oils_i18n_gettext('circ.send_email_checkout_receipts', 'Email checkout receipts by default?', 'cust', 'label'),
    oils_i18n_gettext('circ.send_email_checkout_receipts', 'Email checkout receipts by default?', 'cust', 'description'),
    'bool'
);

INSERT INTO action_trigger.hook (key, core_type, description, passive)
VALUES (
    'circ.checkout.batch_notify',
    'circ',
    oils_i18n_gettext(
        'circ.checkout.batch_notify',
        'Notification of a group of circs',
        'ath',
        'description'
    ),
    FALSE
);

INSERT INTO action_trigger.hook (key, core_type, description, passive)
VALUES (
    'circ.checkout.batch_notify.session',
    'circ',
    oils_i18n_gettext(
        'circ.checkout.batch_notify.session',
        'Notification of a group of circs at the end of a checkout session',
        'ath',
        'description'
    ),
    FALSE
);

INSERT INTO action_trigger.event_definition (
    active,
    owner,
    name,
    hook,
    validator,
    reactor,
    usr_field,
    opt_in_setting,
    group_field,
    template
) VALUES (
    TRUE,
    1,
    'Email Checkout Receipt',
    'circ.checkout.batch_notify.session',
    'NOOP_True',
    'SendEmail',
    'usr',
    'circ.send_email_checkout_receipts',
    'usr',
    $$[%- USE date -%]
[%- user = target.0.usr -%]
To: [%- params.recipient_email || user.email %]
From: [%- helpers.get_org_setting(target.0.circ_lib.id, 'org.bounced_emails') || params.sender_email || default_sender %]
Subject: Checkout Receipt
Auto-Submitted: auto-generated

You checked out the following items:

[% FOR circ IN target %]
    [%- copy_details = helpers.get_copy_bib_basics(circ.target_copy.id) -%]
    Title: [% copy_details.title %]
    Author: [% copy_details.author %]
    Call Number: [% circ.target_copy.call_number.label %]
    Barcode: [% circ.target_copy.barcode %]
    Due: [% date.format(helpers.format_date(circ.due_date), '%Y-%m-%d') %]
    Library: [% circ.circ_lib.name %]

[% END %]
$$);

INSERT INTO action_trigger.environment (
    event_def,
    path
) VALUES (
    currval('action_trigger.event_definition_id_seq'),
    'target_copy.call_number'
), (
    currval('action_trigger.event_definition_id_seq'),
    'target_copy.location'
), (
    currval('action_trigger.event_definition_id_seq'),
    'usr'
), (
    currval('action_trigger.event_definition_id_seq'),
    'circ_lib'
);

INSERT INTO config.org_unit_setting_type
(name, grp, label, description, datatype)
VALUES
('circ.in_house_use.copy_alert',
 'circ',
 oils_i18n_gettext('circ.in_house_use.copy_alert',
     'Display copy alert for in-house-use',
     'coust', 'label'),
 oils_i18n_gettext('circ.in_house_use.copy_alert',
     'Display copy alert for in-house-use',
     'coust', 'description'),
 'bool'),
('circ.in_house_use.checkin_alert',
 'circ',
 oils_i18n_gettext('circ.in_house_use.checkin_alert',
     'Display copy location checkin alert for in-house-use',
     'coust', 'label'),
 oils_i18n_gettext('circ.in_house_use.checkin_alert',
     'Display copy location checkin alert for in-house-use',
     'coust', 'description'),
 'bool');
