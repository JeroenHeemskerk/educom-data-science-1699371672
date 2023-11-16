CREATE VIEW VERZENDLIJST AS
SELECT
S.id,
IF(S.p_address <> '', S.p_address, CONCAT(S.straat, ' ', S.huisnr)) AS adres,
IF(S.p_address <> '', S.p_postcode, S.postcode) AS postcode,
IF(S.p_address <> '', PC.name, C.name) AS stad
FROM mhl_suppliers AS S
LEFT JOIN mhl_cities AS C ON C.id = S.city_ID
LEFT JOIN mhl_cities AS PC ON PC.id = S.p_city_ID;