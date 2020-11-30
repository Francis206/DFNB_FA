/*****************************************************************************************************************
NAME:   LoadDFNB_p1
PURPOSE: Create the dbo.Region Dimension  Table

SUPPORT: 


MODIFICATION LOG:
Ver       Date         Author       Description
-------   ----------   ----------   -----------------------------------------------------------------------------
1.0       11/18/2019   FAgballog      1. Building tblRegionDimension Table


RUNTIME: 
Approx. 1 min

NOTES:
Creating tblRegDim and adding keys

LICENSE: This code is covered by the GNU General Public License which guarantees end users
the freedom to run, study, share, and modify the code. This license grants the recipients
of the code the rights of the Free Software Definition. All derivative work can only be
distributed under the same license terms.
 
******************************************************************************************************************/

USE DFNB2

DROP TABLE dbo.tblRegDim

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE dbo.tblRegDim(
	 [acct_region_id] [int] NOT NULL,
	 [acct_area_id] [int] NOT NULL

	
) ON [PRIMARY]
GO