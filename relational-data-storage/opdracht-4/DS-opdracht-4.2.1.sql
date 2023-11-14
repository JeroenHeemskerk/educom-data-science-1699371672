SELECT C.name AS plaatsnaam, C.commune_ID, G.name AS gemeente
FROM mhl_communes AS G
RIGHT JOIN mhl_cities AS C on G.id = C.commune_ID
WHERE G.name IS NULL;