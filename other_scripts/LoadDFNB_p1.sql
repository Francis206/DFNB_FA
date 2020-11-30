/*****************************************************************************************************************
NAME:   LoadDFNB_p1
PURPOSE: Project 1

SUPPORT: 


MODIFICATION LOG:
Ver       Date         Author       Description
-------   ----------   ----------   -----------------------------------------------------------------------------
1.0       11/18/2019   FAgballog      1. Built tables for project 1 for all related tables 


RUNTIME: 
Approx. 1 min

NOTES:
  Builting tables for project 1 for 10 related tables in alphabet order


LICENSE: This code is covered by the GNU General Public License which guarantees end users
the freedom to run, study, share, and modify the code. This license grants the recipients
of the code the rights of the Free Software Definition. All derivative work can only be
distributed under the same license terms.
 
******************************************************************************************************************/

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