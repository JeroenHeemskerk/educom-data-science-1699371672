SET lc_time_names = 'nl_NL';
SELECT
H.year AS jaar,
CONCAT(UCASE(LEFT(MONTHNAME(CONCAT('2000-', H.month, '-01')), 1)), SUBSTRING(MONTHNAME(CONCAT('2000-', H.month, '-01')), 2)) AS maand,
COUNT(H.supplier_ID) AS 'aantal leveranciers',
SUM(H.hitcount) AS 'totaal aantal hits'
FROM mhl_hitcount AS H
GROUP BY jaar, maand
ORDER BY jaar DESC, maand;