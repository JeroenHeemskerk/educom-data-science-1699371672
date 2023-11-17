SELECT
C.name,
CASE
	WHEN C.name LIKE "'_%"
    THEN CONCAT(SUBSTRING(C.name, 1, 3), UCASE(LEFT(SUBSTRING(C.name, 4), 1)), SUBSTRING(C.name, 5))
	ELSE CONCAT(UCASE(LEFT(C.name, 1)), SUBSTRING(C.name, 2))
END AS nice_name
FROM mhl_cities AS C
ORDER BY C.name;