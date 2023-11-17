SELECT
DATE_FORMAT(joindate, '%d-%m-%Y') AS joindate,
id
FROM mhl_suppliers
WHERE DAY(LAST_DAY(joindate) - DAY(joindate)) <= 7;