SELECT
S.name,
REPLACE (
	REPLACE (
		REPLACE (
			REPLACE (
				REPLACE (
					REPLACE (
						REPLACE (name, '&euml;', 'ë'),
                        '&ouml;', 'ö'),
					'&Uuml;', 'Ü'),
				'&eacute;', 'é'),
			'&egrave;', 'è'),
		'&iuml;', 'ï'),
	'&acirc;', 'ã') AS nicename
FROM mhl_suppliers AS S
WHERE S.name LIKE '%&%;%'
LIMIT 25;