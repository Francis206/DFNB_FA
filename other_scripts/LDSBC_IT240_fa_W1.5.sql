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
USE AdventureWorks2017
SELECT TOP 5 year(oh.OrderDate) AS Order_Date, pp.ProductID, pp.ProductNumber AS Product_Numver , pp.Name AS Product_Name

from production.product pp JOIN sales.SalesOrderDetail od ON pp.ProductID = od.ProductID JOIN sales.SalesOrderHeader oh ON od.SalesOrderID = oh.SalesOrderID





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
USE AdventureWorks2017


-- Which Department pays its female workers on average the most per year?
--Include these fields:
--Department ID
--Department Name
--Gender
--Total Yearly Pay
--Business Entity ID Count
--Average Yearly Pay
USE AdventureWorks2017
 