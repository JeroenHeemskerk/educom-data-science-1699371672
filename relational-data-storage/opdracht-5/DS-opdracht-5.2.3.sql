SELECT year AS Jaar,
	SUM(IF(month IN (1, 2, 3), hitcount, NULL)) AS 'Eerste kwartaal',
    SUM(IF(month IN (4, 5, 6), hitcount, NULL)) AS 'Tweede kwartaal',
    SUM(IF(month IN (7, 8, 9), hitcount, NULL)) AS 'Derde kwartaal',
    SUM(IF(month IN (10, 11, 12), hitcount, NULL)) AS 'Vierde kwartaal',
    SUM(hitcount) AS Totaal
FROM mhl_hitcount
GROUP BY year;