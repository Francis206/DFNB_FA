/*****************************************************************************************************************
NAME:  dbo.v_TranCountBranch
PURPOSE: View to Find out top 10 branch transac Frequency 

SUPPORT: 

MODIFICATION LOG:
Ver       Date         Author       Description
-------   ----------   ----------   -----------------------------------------------------------------------------
1.0       12/12/20		Francis		creating a view for branch total transaction 
2.0		  12/19/20		Francis	    adding info to see more brach info

RUNTIME: 1 min


NOTES: 


LICENSE: 
This code is covered by the GNU General Public License which guarantees end users
the freedom to run, study, share, and modify the code. This license grants the recipients
of the code the rights of the Free Software Definition. All derivative work can only be
distributed under the same license terms.
*****************************************************************************************************************/

USE DFNB2;

SET ANSI_NULLS ON;
GO

SET QUOTED_IDENTIFIER ON;
GO

CREATE VIEW dbo.v_TranCountBranch
AS
    SELECT TOP 100 ttf.branch_id
             , tbd.branch_name
             , tbd.region_id
             , COUNT(ttf.tran_date) AS TotalTransac
  FROM dbo.tblTranFact AS ttf
       INNER JOIN
       dbo.tblBranchDim AS tbd ON ttf.branch_id = tbd.branch_id
 GROUP BY ttf.branch_id
        , tbd.branch_name
        , tbd.region_id
 ORDER BY 4 DESC;