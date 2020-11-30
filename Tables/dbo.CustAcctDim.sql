/*****************************************************************************************************************
NAME:   LoadDFNB_p1
PURPOSE: Create the dbo.Customer Account Dimension Table

SUPPORT: 


MODIFICATION LOG:
Ver       Date         Author       Description
-------   ----------   ----------   -----------------------------------------------------------------------------
1.0       11/18/2019   FAgballog      1. Building Customer Account Dimension Table


RUNTIME: 
Approx. 1 min

NOTES:
Creating dbo.tlbCustAcctDim and adding keys

LICENSE: This code is covered by the GNU General Public License which guarantees end users
the freedom to run, study, share, and modify the code. This license grants the recipients
of the code the rights of the Free Software Definition. All derivative work can only be
distributed under the same license terms.
 
******************************************************************************************************************/
USE [DFNB2];
GO

DROP TABLE dbo.tblCustAcctDim;
GO

SET ANSI_NULLS ON;
GO

SET QUOTED_IDENTIFIER ON;
GO

CREATE TABLE dbo.tblCustAcctDim
(acct_cust_id      INT IDENTITY(1, 1) NOT NULL
, acct_id           INT NOT NULL
, cust_id           SMALLINT NOT NULL
, acct_cust_role_id SMALLINT NOT NULL
, CONSTRAINT PK_Customers_Accounts PRIMARY KEY CLUSTERED(acct_cust_id ASC)
  WITH(PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
ON [PRIMARY];
GO

CREATE UNIQUE NONCLUSTERED INDEX APK_Customers_Accounts ON dbo.tblCustAcctDim(acct_id ASC, cust_id ASC) WITH(PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY];
GO
