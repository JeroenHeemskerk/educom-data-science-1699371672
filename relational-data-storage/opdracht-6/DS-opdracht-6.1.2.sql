SELECT AVERAGE.gemeente, TOTAL.leverancier, TOTAL.totaal, AVERAGE.gemiddelde
FROM
	(SELECT	communes.id, S.name AS leverancier,	SUM(H.hitcount) AS totaal
	FROM mhl_hitcount AS H
	INNER JOIN mhl_suppliers AS S ON S.id = H.supplier_ID
    INNER JOIN mhl_cities AS cities ON cities.id = S.city_ID
    INNER JOIN mhl_communes AS communes ON communes.id = cities.commune_ID
    INNER JOIN mhl_districts AS districts ON districts.id = communes.district_ID
    WHERE districts.country_ID = 
		(SELECT id
		FROM mhl_countries
        WHERE name = 'Nederland')
	GROUP BY S.name) AS TOTAL
    
    INNER JOIN (SELECT communes.id, communes.name AS gemeente, AVG(H.hitcount) AS gemiddelde
	FROM mhl_hitcount AS H
	INNER JOIN mhl_suppliers AS S ON S.id = H.supplier_ID
    INNER JOIN mhl_cities AS cities ON cities.id = S.city_ID
    INNER JOIN mhl_communes AS communes ON communes.id = cities.commune_ID
    INNER JOIN mhl_districts AS districts ON districts.id = communes.district_ID
    WHERE districts.country_ID = 
		(SELECT id
		FROM mhl_countries
        WHERE name = 'Nederland')
    GROUP BY communes.id) AS AVERAGE ON TOTAL.id = AVERAGE.id

GROUP BY AVERAGE.id, TOTAL.leverancier
HAVING TOTAL.totaal > AVERAGE.gemiddelde
ORDER BY AVERAGE.gemeente, (TOTAL.totaal - AVERAGE.gemiddelde) DESC
