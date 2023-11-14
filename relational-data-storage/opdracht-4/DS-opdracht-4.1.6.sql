SELECT H.hitcount, S.name AS leverancier, CITIES.name AS stad, COMMUNES.name AS gemeente, DISTRICTS.name AS provincie
FROM mhl_suppliers AS S
INNER JOIN mhl_hitcount AS H ON H.supplier_ID = S.id AND H.year = 2014 AND H.month = 1
INNER JOIN mhl_cities AS CITIES ON S.city_ID = CITIES.id
INNER JOIN mhl_communes AS COMMUNES ON CITIES.commune_ID = COMMUNES.id
INNER JOIN mhl_districts AS DISTRICTS ON COMMUNES.district_ID = DISTRICTS.id
WHERE DISTRICTS.name = "Limburg" OR DISTRICTS.name = "Noord-Brabant" OR DISTRICTS.name = "Zeeland";