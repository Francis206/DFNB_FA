/*****************************************************************************************************************
NAME:   LoadDFNB_p1
PURPOSE: Create the dbo.Prodecut Dimension  Table

SUPPORT: 


MODIFICATION LOG:
Ver       Date         Author       Description
-------   ----------   ----------   -----------------------------------------------------------------------------
1.0       11/18/2019   FAgballog      1. Building tblProductrDimension Table


RUNTIME: 
Approx. 1 min

NOTES:
Creating tblProdDim and adding keys

LICENSE: This code is covered by the GNU General Public License which guarantees end users
the freedom to run, study, share, and modify the code. This license grants the recipients
of the code the rights of the Free Software Definition. All derivative work can only be
distributed under the same license terms.
 
******************************************************************************************************************/

USE [DFNB2];
GO

DROP TABLE dbo.tblProdDim;
GO

SET ANSI_NULLS ON;
GO

SET QUOTED_IDENTIFIER ON;
GO

CREATE TABLE dbo.tblProdDim
(prod_id   SMALLINT NOT NULL
, CONSTRAINT PK_tblProdDim PRIMARY KEY CLUSTERED(prod_id ASC)
  WITH(PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
ON [PRIMARY];
GO