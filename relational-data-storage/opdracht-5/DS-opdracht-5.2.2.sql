SELECT C.name AS stad,
	COUNT(IF(S.membertype = 1, 1, NULL)) AS Gold,
    COUNT(IF(S.membertype = 2, 1, NULL)) AS Silver,
    COUNT(IF(S.membertype = 3, 1, NULL)) AS Bronze,
    COUNT(IF(S.membertype NOT IN (0, 1, 2, 3), 1, NULL)) AS Other
FROM mhl_cities AS C
LEFT JOIN mhl_suppliers AS S ON S.city_ID = C.id
GROUP BY C.id
ORDER BY Gold DESC, Silver DESC, Bronze DESC;