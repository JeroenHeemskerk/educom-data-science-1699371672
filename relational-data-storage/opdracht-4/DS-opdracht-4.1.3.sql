SELECT A.name, S.name, S.straat, S.huisnr, S.postcode, A.name
FROM mhl_suppliers AS S 
INNER JOIN mhl_cities AS C ON S.city_ID = C.id
INNER JOIN mhl_suppliers_mhl_rubriek_view AS SRV ON S.id = SRV.mhl_suppliers_id
INNER JOIN mhl_rubrieken AS A ON SRV.mhl_rubriek_view_ID = A.id
LEFT JOIN mhl_rubrieken AS B ON B.id = A.parent
WHERE C.name = 'amsterdam' AND (A.name = 'drank' OR B.name = 'drank')
ORDER BY A.name, S.name;