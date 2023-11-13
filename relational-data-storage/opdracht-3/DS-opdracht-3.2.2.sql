SELECT mhl_suppliers.name, mhl_suppliers.straat, mhl_suppliers.huisnr, mhl_suppliers.postcode
FROM mhl_suppliers
INNER JOIN mhl_membertypes ON mhl_suppliers.membertype = mhl_membertypes.id
WHERE mhl_membertypes.name = 'Gold' OR 'Silver' OR 'Bronze' OR 'GEEN INTERESSE';