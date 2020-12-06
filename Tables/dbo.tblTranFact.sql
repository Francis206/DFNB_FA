/*****************************************************************************************************************
NAME:   dbo.tblTranFact
PURPOSE: Create transaction fact table

SUPPORT: 


MODIFICATION LOG:
Ver       Date         Author       Description
-------   ----------   ----------   -----------------------------------------------------------------------------
1.0       12/3/2020   FAgballog      1. Built tables for project 2 of transaction fact
2.0		   12/5/2020  FAgballog       1. adding pk

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

--Drop table dbo.tblTranFact

SET ANSI_NULLS ON;
GO

SET QUOTED_IDENTIFIER ON;
GO

CREATE TABLE dbo.tblTranFact
(branch_id    SMALLINT NOT NULL
, acct_id      INT NOT NULL
, tran_date    [DATE] NOT NULL
, tran_time    [TIME](7) NOT NULL
, tran_type_id SMALLINT NOT NULL
, tran_amt     INT NOT NULL
, tran_fee_amt DECIMAL(15, 3) NOT NULL
, tran_id      INT IDENTITY(1, 1) NOT NULL
, CONSTRAINT PK_tblTranFact PRIMARY KEY CLUSTERED(tran_id ASC)
  WITH(PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
ON [PRIMARY];
GO