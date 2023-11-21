	-- TASK 4
	--SELECT W.Surname as 'Soyad' , W.Name as 'Ad', W.FatherName AS 'Ata adı', COUNT(S.ProductId) AS 'Satdığı məhsul sayı'
	--FROM Sale AS S
	--JOIN Worker AS W ON S.WorkerId = W.Id
	--GROUP BY   W.Surname,W.Name,W.FatherName Order by W.Name

	--Task 5

	--SELECT  MAX(SatılanMehsulSayi) as MaxCount FROM
	--(SELECT F.Name AS 'Filial adı', COUNT(S.ProductId) AS SatılanMehsulSayi,S.Sale_history as 'Cari gun '
	--FROM Sale AS S
	--JOIN Branch AS F ON S.BranchId= F.Id
	--JOIN Product AS P ON S.ProductId = P.Id
	--WHERE DAY(S.Sale_history) = DAY(GETDATE())
	--GROUP BY F.Name,S.Sale_history) as table1
	 	 

	-- Task 6

	-- SELECT MAX(SatilanMehsulsayi) as MaxCount FROM

	-- (SELECT  P.Name AS EnCoxSatilanMehsul, COUNT(S.ProductId) AS SatilanMehsulsayi, S.Sale_history as 'Cari ay '
	--FROM Sale AS S
	--JOIN Product AS P ON S.ProductId = P.Id
	--WHERE MONTH(S.Sale_history) = MONTH(GETDATE())
	--GROUP BY P.Name,S.Sale_history) as table1
