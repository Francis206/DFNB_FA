/*****************************************************************************************************************
NAME:  dbo.v_TranTypesYear
PURPOSE: View to Find out  branch transac Types of year 

SUPPORT: 

MODIFICATION LOG:
Ver       Date         Author       Description
-------   ----------   ----------   -----------------------------------------------------------------------------
1.0       12/12/20		Francis		creating a view for branch trans types


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

CREATE VIEW dbo.v_TranTypesYear
AS
      SELECT DISTINCT 
                   ttf.branch_id
                 , tttd.tran_type_desc
                 , YEAR(ttf.tran_date) AS YearTrans
				 , count(ttf.tran_date) AS TotalTrans
              FROM dbo.tblTranFact AS ttf
                   INNER JOIN
                   dbo.tblTranTypeDim AS tttd ON ttf.tran_type_id = tttd.tran_type_id
             GROUP BY ttf.branch_id
                    , tttd.tran_type_desc
					,YEAR(ttf.tran_date)
order by 4 DESC
GO