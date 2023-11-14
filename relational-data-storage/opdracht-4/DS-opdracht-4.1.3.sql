SELECT mhl_suppliers.name, mhl_suppliers.straat, mhl_suppliers.huisnr, mhl_suppliers.postcode
FROM mhl_suppliers
INNER JOIN mhl_cities ON mhl_suppliers.city_ID = mhl_cities.id AND mhl_cities.name = 'amsterdam'
INNER JOIN mhl_suppliers_mhl_rubriek_view ON mhl_suppliers.id = mhl_suppliers_mhl_rubriek_view.mhl_suppliers_id
INNER JOIN mhl_rubrieken AS A ON mhl_suppliers_mhl_rubriek_view.mhl_rubriek_view_ID = A.id
LEFT JOIN mhl_rubrieken AS B ON B.parent = A.id
WHERE A.name = 'drank' OR ((B.parent = A.id) AND A.name = 'drank')
ORDER BY A.name, mhl_suppliers.name;