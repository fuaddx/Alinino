
---- Creating Tables

--CREATE TABLE Worker (
--    Id int identity Primary key,
--    Surname varchar(10) NOT NULL DEFAULT('XXX'),
--	Name varchar(15) NOT NULL DEFAULT('XXX'),
--	FatherName varchar(10) NOT NULL,
--    PositionId INT,
--    Salary DECIMAL
--)

--CREATE TABLE Position (
--     Id int identity Primary key,
--    Name VARCHAR(50)
--);

--CREATE TABLE Branch (
--    Id int identity Primary key,
--    Name VARCHAR(20)
--);

--CREATE TABLE Product (
--    Id int identity Primary key,
--    Name VARCHAR(25),
--    Purchase_price DECIMAL,
--    Sell_Price DECIMAL
--);

--CREATE TABLE Sale(
--    Id int identity Primary key,
--	Sale_history DATE,
--	BranchId int REFERENCES Branch(id),
--    ProductId int REFERENCES Product(Id),
--	WorkerId int REFERENCES Worker(Id)
--);

--CREATE Table WorkerPosition(
--	Id int identity Primary key,
--	PositionId int REFERENCES Position(Id),
--	WorkerId int References Worker(id)
--)

---- Inserting Data 

--INSERT INTO Worker VALUES 
--('Doe', 'John', 'Michael', 1, 500),
--('Smith', 'Jane', 'Elizabeth', 2, 450),
--('Johnson', 'Alice', 'Williams', 3, 480),
--('Bohnson', 'Klice', 'Lilliams', 1, 490)


--INSERT INTO Position VALUES 
--('Manager'),
--('Salesperson'),
--('Creditor')


--INSERT INTO Branch  VALUES 
--('Filial A'),
--('Filial B')


--INSERT INTO Product  VALUES 
--('Product A', 50.00, 80.00),
--('Product B', 30.00, 45.00),
--('Product C', 70.00, 100.00);


--INSERT INTO Sale  VALUES 
--('2023-11-15', 1, 2, 1),
--('2023-11-16', 2, 2, 4),
--('2023-11-17', 1, 3, 3),
--('2023-11-17', 1, 3, 2),
--('2023-11-17', 1, 2, 4)


--INSERT INTO WorkerPosition VALUES 
--(1, 1),
--(2, 2),
--(1, 3),
--(3,4)

---- Queries

-- --Task 1

--SELECT CONCAT(I.Surname, ' ', I.Name, ' ', I.FatherName) AS 'İşçi(SAA)', M.Name AS 'Məhsul adı', F.Name AS 'Filial adı', M.Purchase_price AS 'Alış qiyməti',
--M.Sell_Price AS 'Satış qiyməti'
--FROM Sale S
--JOIN Worker AS I ON S.WorkerId = I.Id
--JOIN Product AS M ON S.ProductId = M.Id
--JOIN Branch AS F ON S.BranchId = F.Id

----Task 2

--SELECT CONCAT(W.Surname, ' ', W.Name, ' ', W.FatherName) AS 'İşçi(SAA)',P.Name As 'Vəzifə', COUNT(S.ProductId) AS 'Satdığı məhsul sayı', 
--SUM(M.Sell_Price) AS 'Satışların cəmi'
--FROM Sale AS S
--JOIN Worker AS W ON S.WorkerId = W.Id
--JOIN Product AS M ON S.ProductId = M.Id
--JOIN Branch AS F ON S.BranchId = F.Id
--JOIN Position AS P On S.WorkerId = P.Id
--GROUP BY CONCAT(W.Surname, ' ', W.Name, ' ', W.FatherName),P.Name

----Task 3

--SELECT CONCAT(W.Surname, ' ', W.Name, ' ', W.FatherName) AS 'İşçi(SAA)',SUM(M.Sell_Price) AS 'Cari ay satışı cəmi'
--FROM Sale AS S
--JOIN Product AS M ON S.ProductId = M.Id
--JOIN Worker AS W ON S.WorkerId = W.Id
--WHERE MONTH(S.Sale_history) = MONTH(GETDATE())
--GROUP BY CONCAT(W.Surname, ' ', W.Name, ' ', W.FatherName)
