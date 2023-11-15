SELECT S.name AS name, SUM(H.hitcount) AS totalhits, COUNT(H.month) AS amountofmonths,
ROUND(AVG(H.hitcount), 0) AS gemiddelde
FROM mhl_hitcount AS H
INNER JOIN mhl_suppliers AS S ON S.id = H.supplier_ID
GROUP BY S.name
ORDER BY totalhits DESC;