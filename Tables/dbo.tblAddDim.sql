/*****************************************************************************************************************
NAME:   LoadDFNB_p1
PURPOSE: Create the dbo.tblAddressDimension table

SUPPORT: 


MODIFICATION LOG:
Ver       Date         Author       Description
-------   ----------   ----------   -----------------------------------------------------------------------------
1.0       11/18/2019   FAgballog      1. Building dbo.tblAddDim Table


RUNTIME: 
Approx. 1 min

NOTES:
Creating dbo.tblAddDim and adding keys

LICENSE: This code is covered by the GNU General Public License which guarantees end users
the freedom to run, study, share, and modify the code. This license grants the recipients
of the code the rights of the Free Software Definition. All derivative work can only be
distributed under the same license terms.
 
******************************************************************************************************************/

USE [DFNB2]
GO

DROP TABLE dbo.tblAddDim
GO

SET ANSI_NULLS ON
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