/*****************************************************************************************************************
NAME:   dbo.tblTranTypeDim
PURPOSE: Create transaction Type Dimension table

SUPPORT: 


MODIFICATION LOG:
Ver       Date         Author       Description
-------   ----------   ----------   -----------------------------------------------------------------------------
1.0       12/3/2019   FAgballog      1. Built tables for project 2 of transaction Type Dimension


RUNTIME: 
Approx. 1 min

NOTES:



LICENSE: This code is covered by the GNU General Public License which guarantees end users
the freedom to run, study, share, and modify the code. This license grants the recipients
of the code the rights of the Free Software Definition. All derivative work can only be
distributed under the same license terms.
 
******************************************************************************************************************/

USE DFNB2

--Drop table dbo.tblTranTypeDim
SET ANSI_NULLS ON;
GO

SET QUOTED_IDENTIFIER ON;
GO

CREATE TABLE dbo.tblTranTypeDim
(tran_type_id     SMALLINT NOT NULL
, tran_type_code   VARCHAR(5) NOT NULL
, tran_type_desc   VARCHAR(100) NOT NULL
, tran_fee_prct    DECIMAL(4, 3) NOT NULL
, cur_cust_req_ind VARCHAR(1) NOT NULL
)
ON [PRIMARY];
GO