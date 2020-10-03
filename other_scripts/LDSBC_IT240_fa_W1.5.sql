-- By Order Quantity, what were the five most popular products sold in 2014
--include these data points in the output:
--Order Date Year
--Product ID
--Product Name
--Product Number
--Product Color
--Sales Order Count
--Order Quantity
--Sales Order Line total
USE AdventureWorks2017;

SELECT top 5 YEAR(oh.OrderDate) AS Order_Date
           , pp.ProductID
           , pp.ProductNumber AS Product_Number
           , pp.Name AS Product_Name
           , pp.Color AS Color
           , COUNT(od.SalesOrderID) AS OrderID
           , SUM(od.LineTotal) AS SOLTotalSum
           , SUM(od.OrderQty) AS QytSUM
  FROM production.product AS pp
       JOIN
       Sales.SalesOrderDetail AS od ON pp.ProductID = od.ProductID
       JOIN
       Sales.SalesOrderHeader AS oh ON od.SalesOrderID = oh.SalesOrderID
 WHERE YEAR(oh.OrderDate) = 2014
 GROUP BY YEAR(oh.OrderDate)
        , pp.ProductID
        , pp.ProductNumber
        , pp.Color
        , pp.Name
 ORDER BY 7 desc

-- How long are the 7 longest Person names and to whom do they belong? Rank by Full Name length, Last Name Length, First Name Length
--Include these data points in the output:
--Business Entity ID
--Full Name
--Full Name Length
--First Name
--First Name Length
--Middle Name
--Last Name
--Last Name Length
USE AdventureWorks2017;

SELECT TOP 7 p.BusinessEntityID
           , LEN(CONCAT(p.FirstName, ' ', p.MiddleName, ' ', p.LastName)) AS FullNameLength
           , CONCAT(p.FirstName, ' ', p.MiddleName, ' ', p.LastName) AS Fullname
           , p.FirstName
           , LEN(p.Firstname) AS FNL
           , p.MiddleName
           , LEN(p.MiddleName) AS MNL
           , p.LastName
           , LEN(p.LastName) AS LNL
  FROM Person.Person AS p
 ORDER BY 2 desc
        , 5 desc
        , 7 desc
        , 9 desc



-- Which Department pays its female workers on average the most per year?
--Include these fields:
--Department ID
--Department Name
--Gender
--Total Yearly Pay
--Business Entity ID Count
--Average Yearly Pay
USE AdventureWorks2017
 SELECT 