/*****************************************************************************************************************
NAME:   LoadDFNB_p2
PURPOSE: Project 2

SUPPORT: 


MODIFICATION LOG:
Ver       Date         Author       Description
-------   ----------   ----------   -----------------------------------------------------------------------------
1.0       12/3/2020   FAgballog      1. Built tables for project 2 for all related tables 
2.0       12/5/2020   FAgballog       2. fixing the cur_cust_req_ind and adding order by

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
