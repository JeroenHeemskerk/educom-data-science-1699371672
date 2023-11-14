SELECT S.name, S.straat, S.huisnr, S.postcode, G.lat, G.lng
FROM mhl_suppliers AS S
INNER JOIN pc_lat_long AS G ON G.pc6 = S.postcode
ORDER BY lat DESC
LIMIT 5;