SELECT C1.name, C2.name, C1.id, C2.id, C1.commune_id, C2.commune_id
FROM mhl_cities AS C1
INNER JOIN mhl_cities AS C2
WHERE (C1.name = C2.name) AND (C1.id > C2.id)
ORDER BY C1.name;