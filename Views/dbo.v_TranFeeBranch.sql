/*****************************************************************************************************************
NAME:  dbo.v_TranFeeBranch
PURPOSE: View to Find out top 10 branch fee amt

SUPPORT: 

MODIFICATION LOG:
Ver       Date         Author       Description
-------   ----------   ----------   -----------------------------------------------------------------------------
1.0       12/12/20		Francis		creating a view for transaction fees
2.0       12/19/20		Francis		adding branch name, type desc, fee prct

RUNTIME: 1 min


NOTES: 


LICENSE: 
This code is covered by the GNU General Public License which guarantees end users
the freedom to run, study, share, and modify the code. This license grants the recipients
of the code the rights of the Free Software Definition. All derivative work can only be
distributed under the same license terms.
*****************************************************************************************************************/
USE DFNB2
GO

SET ANSI_NULLS ON;
GO
--DROP VIEW dbo.v_TranfeeBranch
SET QUOTED_IDENTIFIER ON;
GO

CREATE VIEW dbo.v_TranFeeBranch
AS
     SELECT DISTINCT 
            ttf.branch_id
          , tbd.branch_name
          , tttd.tran_type_desc
          , SUM(tttd.tran_fee_prct) AS totalFeeprct
          , SUM(ttf.tran_fee_amt) AS TotalFeeAmt
       FROM dbo.tblTranFact AS ttf
            INNER JOIN
            dbo.tblTranTypeDim AS tttd ON ttf.tran_type_id = tttd.tran_type_id
            INNER JOIN
            dbo.tblBranchDim AS tbd ON ttf.branch_id = tbd.branch_id
      GROUP BY ttf.branch_id
             , tbd.branch_name
             , tttd.tran_type_desc
      ORDER BY 5 DESC;

	  GO