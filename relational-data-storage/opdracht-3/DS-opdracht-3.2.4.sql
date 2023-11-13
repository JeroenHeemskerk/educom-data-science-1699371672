SELECT mhl_suppliers.name, mhl_suppliers.straat, mhl_suppliers.huisnr, mhl_suppliers.postcode
FROM mhl_suppliers
INNER JOIN mhl_cities ON mhl_suppliers.city_ID = mhl_cities.id
WHERE mhl_cities.name = 'amsterdam' OR mhl_suppliers.p_city_ID = 104;