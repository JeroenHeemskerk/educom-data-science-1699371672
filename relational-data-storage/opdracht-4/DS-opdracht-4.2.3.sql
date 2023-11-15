SELECT R2.id, IFNULL(R1.name, R2.name) AS hoofdrubriek, IF(ISNULL(R1.name), '', R2.name) AS subrubriek
FROM mhl_rubrieken AS R1
RIGHT JOIN mhl_rubrieken AS R2 on R1.id = R2.parent
ORDER BY hoofdrubriek, subrubriek;