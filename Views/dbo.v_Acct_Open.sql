*****************************************************************************************************************
NAME:   View
PURPOSE: Create the dbo.v_Acct_Open view

SUPPORT: 

MODIFICATION LOG:
Ver       Date         Author       Description
-------   ----------   ----------   -----------------------------------------------------------------------------
1.0       11/18/2019   FAgballog      1. Build a view to see the account Open .


RUNTIME: 
Approx. 0 min

NOTES:


LICENSE: This code is covered by the GNU General Public License which guarantees end users
the freedom to run, study, share, and modify the code. This license grants the recipients
of the code the rights of the Free Software Definition. All derivative work can only be
distributed under the same license terms.
 
******************************************************************************************************************/
USE DFNB2
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO
--Drop view dbo.v_AccountsOpen
CREATE VIEW	dbo.v_AcctOpen AS

SELECT COUNT(tad.open_date) AS AccountsOpen
     , tad.branch_id
     , YEAR(tad.open_date) AS YearOpen
  FROM dbo.tblAcctDim AS tad
 WHERE YEAR(tad.open_date) IN
                             (
                              2019
                            , 2018
                            , 2017
                             )
 GROUP BY tad.branch_id
        , YEAR(tad.open_date)