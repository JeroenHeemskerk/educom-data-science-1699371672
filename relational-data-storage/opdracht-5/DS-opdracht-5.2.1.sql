SELECT S.name AS leverancier,
	IFNULL(C.name, 'tav directie') AS aanhef, 
	IF(S.p_address <> '', S.p_address, CONCAT(S.straat, ' ', S.huisnr)) AS adres, 
	IF(S.p_address <> '', S.p_postcode, S.postcode) AS postcode,
	cities.name AS stad,
	districts.name AS provincie
FROM mhl_suppliers AS S
LEFT JOIN mhl_contacts AS C ON C.supplier_ID = S.id AND C.department = 3
LEFT JOIN mhl_cities AS cities ON IF(S.p_address <> '', S.p_city_ID, S.city_ID)
= cities.id
LEFT JOIN mhl_communes AS communes ON communes.id = cities.commune_ID
LEFT JOIN mhl_districts AS districts ON districts.id = communes.district_ID
ORDER BY provincie, stad, leverancier;