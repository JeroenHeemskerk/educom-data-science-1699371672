SELECT C.name AS plaatsnaam, IFNULL(G.name, 'INVALID')
FROM mhl_cities AS C
RIGHT JOIN mhl_communes AS G on G.id = C.commune_ID;