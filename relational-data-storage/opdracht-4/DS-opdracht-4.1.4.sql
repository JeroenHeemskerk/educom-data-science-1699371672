SELECT S.name, S.straat, S.huisnr, S.postcode
FROM mhl_yn_properties AS P
INNER JOIN mhl_propertytypes AS PT ON PT.id = P.propertytype_ID
INNER JOIN mhl_suppliers AS S ON S.id = P.supplier_ID
WHERE PT.name = "specialistische leverancier" OR PT.name = "ook voor particulieren";