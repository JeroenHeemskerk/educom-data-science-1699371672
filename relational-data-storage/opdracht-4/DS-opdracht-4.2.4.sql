SELECT S.name, PT.name, IFNULL(YN.content, "NOT SET")
FROM mhl_suppliers AS S
CROSS JOIN mhl_propertytypes AS PT ON PT.proptype = "A"
LEFT JOIN mhl_yn_properties AS YN ON S.id = YN.supplier_ID AND PT.id = YN.propertytype_ID
INNER JOIN mhl_cities AS C ON S.city_ID = C.id AND C.name = "amsterdam";