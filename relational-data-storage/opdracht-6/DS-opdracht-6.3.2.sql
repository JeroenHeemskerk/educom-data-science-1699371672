SELECT
S.name,
CASE
	WHEN S.name LIKE '%&euml;%'
		THEN REPLACE(S.name, '&euml;', 'ë')
    WHEN S.name LIKE '&Uuml;%'
		THEN REPLACE(S.name, '&Uuml;', 'Ü')
    WHEN S.name LIKE '%&ouml;%'
		THEN REPLACE(S.name, '&ouml;', 'ö')
    WHEN S.name LIKE '%&iuml;%'
		THEN REPLACE(S.name, '&iuml;', 'ï')
	WHEN S.name LIKE '%&auml;%'
		THEN REPLACE(S.name, '&auml;', 'ä')
	WHEN S.name LIKE '%&acirc;%'
		THEN REPLACE(S.name, '&acirc;', 'ã')
	WHEN S.name LIKE '%&eacute;%'
		THEN REPLACE(S.name, '&eacute;', 'é')
	WHEN S.name LIKE '%&egrave;%'
		THEN REPLACE(S.name, '&egrave;', 'è')
END as nicename
FROM mhl_suppliers AS S
WHERE S.name LIKE '%&%;%'
LIMIT 25;