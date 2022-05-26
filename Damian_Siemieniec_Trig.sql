--Zadanie1

CREATE FUNCTION FIBONACCI(@n int)
RETURNS @konc TABLE(val INT) AS BEGIN
DECLARE @x INT
DECLARE @y INT
DECLARE @z INT
DECLARE @tem INT
SET @x = 0 SET @y = 1 SET @z = 0 SET @tem = 3
INSERT INTO @konc(val) values(@x),(@y)
WHILE(1=1) BEGIN  SET @z = @x + @y
INSERT INTO @konc(val) values(@z)
SET @x = @y 
SET @y = @z
IF @tem = @n BEGIN BREAK;
END
SET @tem = @tem + 1
END
RETURN END
GO
CREATE PROCEDURE FIBONACCI_P(@n INT) AS BEGIN 
SELECT * FROM FIBONACCI(@n)
END
GO
EXEC FIBONACCI_P @n = 18;
GO

--Zadanie2
CREATE TRIGGER TRig
ON Person.Person AFTER UPDATE  AS BEGIN UPDATE Person.Person
SET LastName=UPPER(LastName)
END;
UPDATE Person.Person
SET LastName=LOWER(LastName)
SELECT * FROM Person.Person
INSERT INTO Person.Person (BusinessEntityID,FirstName,MiddleName,LastName,PersonType) VALUES (20780,'Damian','D','Dymak','SC')
GO
INSERT INTO Person.BusinessEntity(rowguid) VALUES(newid())
SELECT * FROM Person.BusinessEntity
SELECT * FROM Person.Person

--Zadanie3

CREATE TRIGGER taxRateMxonitoring
ON Sales.SalesTaxRate AFTER UPDATE AS BEGIN
DECLARE @Nowy INT, @TaxRate INT
SELECT @Nowy = TaxRate FROM INSERTED SalesTaxRate
SELECT @TaxRate = TaxRate FROM DELETED
IF @Nowy > 1.3*@TaxRate
PRINT 'Zmiana wartości w polu ‘TaxRate’ o więcej niż 30%.'
END GO