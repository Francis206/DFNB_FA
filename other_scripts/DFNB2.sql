/*****************************************************************************************************************
NAME:    DFNB2
PURPOSE:  Script that creates the entire DFNB2 schema

SUPPORT: 

MODIFICATION LOG:
Ver       Date         Author       Description
-------   ----------   ----------   -----------------------------------------------------------------------------
1.0		11/30/2020		FAgballog	DFNB2 schema


RUNTIME: 1 min


NOTES: 
 Script that creates the entire DFNB2 schema

LICENSE: 
This code is covered by the GNU General Public License which guarantees end users
the freedom to run, study, share, and modify the code. This license grants the recipients
of the code the rights of the Free Software Definition. All derivative work can only be
distributed under the same license terms.
*****************************************************************************************************************/

USE DFNB2
-- Area table
SET ANSI_NULLS ON;
GO

SET QUOTED_IDENTIFIER ON;
GO

CREATE TABLE dbo.tblAreaDim
(acct_area_id INT NOT NULL
)
ON [PRIMARY];
GO

--account dimension
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tblAcctDim](
	[acct_id] [int] NOT NULL,
	[pri_cust_id] [smallint] NOT NULL,
	[prod_id] [smallint] NOT NULL,
	[open_date] [date] NOT NULL,
	[close_date] [date] NOT NULL,
	[open_close_code] [varchar](1) NOT NULL,
	[branch_id] [smallint] NOT NULL,
	[loan_amt] [decimal](20, 4) NOT NULL,
 CONSTRAINT [PK_tblAccountDim] PRIMARY KEY CLUSTERED 
(
	[acct_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- account fact table

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE dbo.tblAcctFact(
	 [acct_id] [int] NOT NULL,
	 [as_of_date] [date] NOT NULL,
	 [cur_bal] [decimal](20, 4) NOT NULL
	
) ON [PRIMARY]
GO

-- Address Dimemnsion table
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

-- Branch Dimension table

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE dbo.tblBranchDim(
[branch_id] [smallint] NOT NULL
,[branch_name] varchar(100) NOT NULL
,[add_id] [int] NOT NULL
,[region_id] [int] NOT NULL
	
) ON [PRIMARY]
GO

-- Customer Account Dimemsion table

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


--Customer Accounr Role Dimemsion table

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE dbo.tblCustAcctRolDim (
	[acct_cust_role_id] [smallint] NOT NULL,

) ON [PRIMARY]
GO

-- Customer Dimemsion Talbe
SET ANSI_NULLS ON;
GO

SET QUOTED_IDENTIFIER ON;
GO

CREATE TABLE dbo.tblCustDim
(cust_id         SMALLINT NOT NULL
, last_name       VARCHAR(100) NOT NULL
, first_name      VARCHAR(100) NOT NULL
, gender          VARCHAR(1) NOT NULL
, birth_date      [DATE] NOT NULL
, cust_since_date [DATE] NOT NULL
, pri_branch_id   SMALLINT NOT NULL
, cust_rel_id     SMALLINT NOT NULL
, cust_add_id     INT NOT NULL
, CONSTRAINT PK_tblCustDim PRIMARY KEY CLUSTERED(cust_id ASC)
  WITH(PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
ON [PRIMARY];
GO

-- Product Dimemsion table

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

-- Region Dimemsion Table

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE dbo.tblRegDim(
	 [acct_region_id] [int] NOT NULL,
	 [acct_area_id] [int] NOT NULL

	
) ON [PRIMARY]
GO