*****************************************************************************************************************
NAME:   View
PURPOSE: Create the dbo.v_Acct_Close view

SUPPORT: 

MODIFICATION LOG:
Ver       Date         Author       Description
-------   ----------   ----------   -----------------------------------------------------------------------------
1.0       11/18/2019   FAgballog      1. Build a view to see the account CLOSE .


RUNTIME: 
Approx. 0 min

NOTES:


LICENSE: This code is covered by the GNU General Public License which guarantees end users
the freedom to run, study, share, and modify the code. This license grants the recipients
of the code the rights of the Free Software Definition. All derivative work can only be
distributed under the same license terms.
 
******************************************************************************************************************/

USE [DFNB2]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW	dbo.v_AcctClosed AS

SELECT COUNT(tad.close_date) AS AccountsClosed
     , tad.branch_id
     , YEAR(tad.close_date) AS Yeardate
  FROM dbo.tblAcctDim AS tad
 WHERE YEAR(tad.close_date) IN
                             (
                              2019
                            , 2017
                            , 2016
							, 2018
                             )
 GROUP BY tad.branch_id
        , YEAR(tad.close_date)

