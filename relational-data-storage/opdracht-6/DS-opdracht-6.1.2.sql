SELECT
TOTAL.gemeente,
TOTAL.leverancier,
TOTAL.totaal,
AVERAGE.gemiddelde

FROM
	(SELECT
	communes.id,
    communes.name AS gemeente,
	S.name AS leverancier,
	SUM(H.hitcount) AS totaal
	FROM mhl_hitcount AS H
	INNER JOIN mhl_suppliers AS S ON S.id = H.supplier_ID
    INNER JOIN mhl_cities AS cities ON cities.id = S.city_ID
    INNER JOIN mhl_communes AS communes ON communes.id = cities.commune_ID
	GROUP BY S.name) AS TOTAL
    
    INNER JOIN
    
    (SELECT
	communes.id,
    communes.name AS gemeente,
	S.name,
	AVG(H.hitcount) AS gemiddelde
	FROM mhl_hitcount AS H
	INNER JOIN mhl_suppliers AS S ON S.id = H.supplier_ID
    INNER JOIN mhl_cities AS cities ON cities.id = S.city_ID
    INNER JOIN mhl_communes AS communes ON communes.id = cities.commune_ID
	GROUP BY S.name) AS AVERAGE ON TOTAL.id = AVERAGE.id
