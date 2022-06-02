--zadanie1

WITH TempEmployeeInfo(BusinessEntityID,Rate)
AS( SELECT  BusinessEntityID,Rate FROM HumanResources.EmployeePayHistory )
SELECT    t.BusinessEntityID ,t.Rate,e.NationalIDNumber,e.LoginID,e.CurrentFlag,e.BirthDate,e.Gender,e.VacationHours,e.BirthDate,e.CurrentFlag,e.SalariedFlag
FROM TempEmployeeInfo t JOIN HumanResources.Employee e ON t.BusinessEntityID = e.BusinessEntityID


--zadanie2

WITH REV( FirstName ,LastName ,CompanyName, TotalDue) AS
( SELECT FirstName, LastName, CompanyName, TotalDue FROM SalesLT.Customer c
JOIN SalesLT.SalesOrderHeader ON  SalesLT.SalesOrderHeader.CustomerID = c.CustomerID)
Select CONCAT( CompanyName ,' ( ', FirstName, ' ', LastName ,' ) ') AS CompanyContact, TotalDue AS Revenue 
FROM REV ORDER BY CompanyContact


--zadanie3

WITH TK (Name, OrderQty, UnitPrice) AS
( SELECT c.Name, OrderQty, UnitPrice FROM SalesLT.ProductCategory c
JOIN  SalesLT.Product p ON p.ProductCategoryID = c.ProductCategoryID
JOIN  SalesLT.SalesOrderDetail d ON d.ProductID = p.ProductID )
SELECT Name AS 'Category' , CAST(SUM(OrderQty * UnitPrice)AS NUMERIC (10,2)) AS SalesValue FROM TK
GROUP BY Name