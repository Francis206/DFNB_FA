/*****************************************************************************************************************
NAME:   DataOutPutDFNB_p3
PURPOSE: Project 3

SUPPORT: 


MODIFICATION LOG:
Ver       Date         Author       Description
-------   ----------   ----------   -----------------------------------------------------------------------------
1.0       12/19/2020   FAgballog      1. Built tables for project 3 for all related tables 

RUNTIME: 
Approx. 1 min

NOTES:



LICENSE: This code is covered by the GNU General Public License which guarantees end users
the freedom to run, study, share, and modify the code. This license grants the recipients
of the code the rights of the Free Software Definition. All derivative work can only be
distributed under the same license terms.
 
******************************************************************************************************************/
-- 2.1 loand into table dbo.tblTranTypeDim

USE DFNB2;

TRUNCATE TABLE dbo.tblTranTypeDim;

INSERT INTO dbo.tblTranTypeDim
SELECT DISTINCT 
       tran_type_id
     , tran_type_code
     , tran_type_desc
     , tran_fee_prct
	 , cur_cust_req_ind
  FROM dbo.stg_p2 AS stg
 ORDER BY  1 ;

-- 2.2  loand into table dbo.tblTranFact


USE DFNB2;

TRUNCATE TABLE dbo.tblTranFact;

INSERT INTO dbo.tblTranFact
SELECT DISTINCT 
       [branch_id]
      ,[acct_id]
      ,[tran_date]
      ,[tran_time]
      ,[tran_type_id]
      ,[tran_amt]
      ,[tran_fee_amt]
  FROM [DFNB2].[dbo].[stg_p2]
  ORDER BY [branch_id]

  --01 Table AcctDim

TRUNCATE TABLE dbo.tblAcctDim;

INSERT INTO dbo.tblAcctDim
SELECT DISTINCT 
       s.acct_id
     , s.pri_cust_id
     , s.prod_id
     , s.open_date
     , s.close_date
     , s.open_close_code
     , s.branch_id
     , s.loan_amt
  FROM dbo.stg_p1 AS s
 WHERE s.acct_cust_role_id <> 2
 ORDER BY s.acct_id;

--02 CustAcctDim

TRUNCATE TABLE dbo.tblCustAcctDim;

INSERT INTO dbo.tblCustAcctDim
--CREATE TABLE dbo.tblCustAcctDim
SELECT DISTINCT 
       s.acct_id
     , s.cust_id
     , s.acct_cust_role_id
  FROM dbo.stg_p1 AS s
 ORDER BY s.acct_id;

-- 10 Table AcctCustRolDim

USE DFNB2;

TRUNCATE TABLE dbo.tblCustAcctRolDim;

INSERT INTO dbo.tblCustAcctRolDim
--CREATE TABLE dbo.tblAcctCustRolDim
SELECT DISTINCT 
       s.acct_cust_role_id
  FROM dbo.stg_p1 AS s;


--03 Table AcctFact

TRUNCATE TABLE dbo.tblAcctFact;

INSERT INTO dbo.tblAcctFact
--CREATE TABLE dbo.tblAcctFact
SELECT DISTINCT 
       s.acct_id
     , s.as_of_date
     , s.cur_bal
  FROM dbo.stg_p1 AS s
 ORDER BY acct_id;
       

--04 Table AddressDim

DROP TABLE dbo.tblAddDim;

TRUNCATE TABLE dbo.tblAddDim;

SET ANSI_NULLS ON;
GO

SET QUOTED_IDENTIFIER ON;
GO

WITH s
     AS (SELECT acct_branch_add_id AS add_id
              , acct_branch_add_type AS add_type
              , s.acct_branch_lat AS lat
              , s.acct_branch_lon AS lon
           FROM dbo.stg_p1 AS s
         UNION
         SELECT cust_add_id
              , s.cust_add_type
              , s.cust_add_lat
              , s.cust_add_lon
           FROM dbo.stg_p1 AS s)
     SELECT *
     INTO dbo.tblAddDim
       FROM s;


-- 05 Table AreaDim

USE DFNB2;

TRUNCATE TABLE dbo.tblAreaDim;

INSERT INTO dbo.tblAreaDim
SELECT DISTINCT 
       acct_area_id
  FROM dbo.stg_p1;

--06 Table BranchDim

TRUNCATE TABLE dbo.tblBranchDim;

INSERT INTO dbo.tblBranchDim
--CREATE TABLE dbo.tblBranchDim

SELECT DISTINCT 
       branch_id
     , acct_branch_desc
     , acct_branch_add_id
     , acct_region_id
  FROM dbo.stg_p1 AS stg
 ORDER BY branch_id;

--07 table CustDim

USE DFNB2;

TRUNCATE TABLE dbo.tblCustDim;

INSERT INTO dbo.tblCustDim
--CREATE TABLE dbo.tblCustDim
SELECT DISTINCT 
       cust_id
     , last_name
     , first_name
     , gender
     , birth_date
     , cust_since_date
     , pri_branch_id
     , cust_rel_id
     , cust_add_id
  FROM dbo.stg_p1 AS stg
 ORDER BY cust_id;

--08 table ProdDim

USE DFNB2;

TRUNCATE TABLE dbo.tblProdDim;

INSERT INTO dbo.tblProdDim
--CREATE TABLE dbo.tblProdDim
SELECT DISTINCT 
       s.prod_id
  FROM dbo.stg_p1 AS s;

-- 09 Table RegionDim

USE DFNB2;

TRUNCATE TABLE dbo.tblRegDim;
--CREATE TABLE dbo.tblRegionDim

INSERT INTO dbo.tblRegDim
SELECT DISTINCT 
       s.acct_region_id AS region_id
     , s.acct_area_id AS area_id
  FROM dbo.stg_p1 AS s;


  -- Create Branch Loan Goal

  USE DFNB2;

TRUNCATE TABLE dbo.tblBranchLoanGoal

INSERT INTO dbo.tblBranchLoanGoal
SELECT DISTINCT sp.branch_id

, sum(sp.loan_amt) TotalLoan
, year(sp.as_of_date) Year
, sum (sp.loan_amt)*1.1 AS BestScn
, sum (sp.loan_amt)*0.9 AS WorseScn

from dbo.stg_p1 sp

GROUP BY sp.branch_id, year(sp.as_of_date)

ORDER BY 1

-- create Fact Sum Current Balance
USE DFNB2

TRUNCATE TABLE dbo.tblFactSumCurBal

INSERT INTO dbo.tblFactSumCurBal
SELECT DISTINCT sp.branch_id
, year(sp.as_of_date) 'year'
,sum (sp.cur_bal) TotalCurBal

FROM dbo.stg_p1 sp

GROUP BY sp.branch_id
, year(sp.as_of_date) 

-- create total Transac Fee and Amt per Branch

USE DFNB2 

TRUNCATE TABLE dbo.tblFactSumTransFeeAmt
INSERT into dbo.tblFactSumTransFeeAmt
SELECT DISTINCT sp.branch_id, sum (sp.tran_fee_amt) TotalFee
, Sum(sp.tran_amt) TotalTranAmt, 
year(sp.tran_date) 'year'

from dbo.stg_p2 sp
GROUP BY sp.branch_id, year(sp.tran_date) 

-- create dbo.tblTotalActRegBranch

USE DFNB2 

TRUNCATE TABLE dbo.tblTotalActReg
INSERT INTO dbo.tblTotalActReg
SELECT DISTINCT sp.branch_id
,sp.acct_branch_desc
,Count (sp.acct_id) TotalAcct
,sp.acct_region_id, sp.acct_area_id
from dbo.stg_p1 sp
GROUP BY  sp.branch_id
,sp.acct_branch_desc
,sp.acct_region_id, sp.acct_area_id