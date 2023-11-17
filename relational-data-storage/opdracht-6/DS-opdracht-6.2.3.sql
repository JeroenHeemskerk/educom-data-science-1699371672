SELECT
DAYNAME(joindate) AS 'Dag van de week',
COUNT(id) AS 'Aantal meldingen'
FROM mhl_suppliers
GROUP BY DAYOFWEEK(joindate);