CREATE VIEW DIRECTIE
AS
SELECT C.supplier_ID AS ID, C.name AS contact, C.contacttype AS functie, IFNULL(D.name, 'nvt') AS department
FROM mhl_contacts as C
LEFT JOIN mhl_departments as D ON D.id = C.department
WHERE C.department = 'Directie' OR C.contacttype LIKE '%directeur%';