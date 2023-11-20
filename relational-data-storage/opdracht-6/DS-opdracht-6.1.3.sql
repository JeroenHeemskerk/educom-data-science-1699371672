SELECT RUBRIEKEN.name, SUPPLIER_COUNT.amount_of_suppliers
FROM
	(SELECT IF(child.parent = 0 OR parent.name IS NULL, child.name, CONCAT(parent.name, ' - ', child.name)) AS name,
    child.id as id
	FROM mhl_rubrieken AS child
	LEFT JOIN mhl_rubrieken AS parent ON parent.id = child.parent
	ORDER BY name) AS RUBRIEKEN

	INNER JOIN (SELECT SR.mhl_rubriek_view_ID AS rubriek_id, COUNT(SR.id) AS amount_of_suppliers
	FROM mhl_suppliers_mhl_rubriek_view AS SR
	GROUP BY rubriek_id
	ORDER BY rubriek_id) AS SUPPLIER_COUNT ON RUBRIEKEN.id = SUPPLIER_COUNT.rubriek_id

ORDER BY RUBRIEKEN.name;