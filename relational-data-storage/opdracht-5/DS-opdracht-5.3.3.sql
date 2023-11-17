SELECT
S.name AS name,
IFNULL(D.department, 'tav directie') AS contact,
V.adres AS adres,
V.postcode AS postcode,
V.stad AS stad
FROM mhl_suppliers AS S
LEFT JOIN directie AS D ON D.id = S.id
INNER JOIN verzendlijst AS V ON V.id = S.id;