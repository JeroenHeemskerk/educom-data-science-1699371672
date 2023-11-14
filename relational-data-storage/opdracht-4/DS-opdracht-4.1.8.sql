SELECT C1.name, C1.id, C2.id, gemeente1.id, gemeente2.id, gemeente1.name, gemeente2.name
FROM mhl_cities AS C1
INNER JOIN mhl_cities AS C2
INNER JOIN mhl_communes AS gemeente1 ON C1.commune_ID = gemeente1.id
INNER JOIN mhl_communes AS gemeente2 ON C2.commune_ID = gemeente2.id
WHERE (C1.name = C2.name) AND (C1.id > C2.id) AND gemeente1.name IS NOT NULL
ORDER BY C1.name;