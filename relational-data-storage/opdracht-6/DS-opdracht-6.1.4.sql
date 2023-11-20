SELECT RUBRIEKEN.name, IFNULL(SUM(HITCOUNT.hitcount), 'Geen hits') AS total
FROM
	(SELECT IF(child.parent = 0 OR parent.name IS NULL, child.name, CONCAT(parent.name, ' - ', child.name)) AS name,
    SR.mhl_suppliers_ID AS supplier_id
	FROM mhl_rubrieken AS child
	LEFT JOIN mhl_rubrieken AS parent ON parent.id = child.parent
    LEFT JOIN mhl_suppliers_mhl_rubriek_view AS SR ON SR.mhl_rubriek_view_ID = child.id
	ORDER BY name) AS RUBRIEKEN
    
    LEFT JOIN (SELECT S.id AS id, S.name, SUM(H.hitcount) AS hitcount
    FROM mhl_suppliers AS S
    INNER JOIN mhl_hitcount AS H ON H.supplier_id = S.id
    GROUP BY S.id) AS HITCOUNT ON HITCOUNT.id = RUBRIEKEN.supplier_id
    
GROUP BY RUBRIEKEN.name
ORDER BY RUBRIEKEN.name;