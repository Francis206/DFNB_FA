/*****************************************************************************************************************
NAME:   view
PURPOSE: creating view for Project 2

SUPPORT: 


MODIFICATION LOG:
Ver       Date         Author       Description
-------   ----------   ----------   -----------------------------------------------------------------------------
1.0       12/3/2020   FAgballog     create view for top 10 ten customers
2.0		  12/3/2020	  FAgballog		adding info to find out customer transac in other branches
RUNTIME: 
Approx. 1 min

NOTES:



LICENSE: This code is covered by the GNU General Public License which guarantees end users
the freedom to run, study, share, and modify the code. This license grants the recipients
of the code the rights of the Free Software Definition. All derivative work can only be
distributed under the same license terms.
 
******************************************************************************************************************/

CREATE VIEW dbo.v_TopTenCusTran
AS
     SELECT DISTINCT tc.first_name + ' ' + tc.last_name AS Customer
            , tb.BranchDim
            , COUNT(tt.tran_date) AS Total_Transactions
  FROM dbo.tblTranFact AS tt
       Inner JOIN
       dbo.tblAcctDim AS ta ON tt.acct_id = ta.acct_id
       Inner JOIN
       dbo.tblCustDim AS tc ON ta.pri_cust_id = tc.cust_id
       Inner JOIN
       dbo.tblBranchDim AS tb ON ta.branch_id = tb.branch_id
 WHERE tc.first_name + ' ' + tc.last_name IN
                                            (
                                             'Amelia Hughes'
                                           , 'Amelia Lee'
                                           , 'Aria Diaz'
                                           , 'Bella Patterson'
                                           , 'Grace Ramirez'
                                           , 'Sofia Lewis'
                                           , 'Amelia Wright'
                                           , 'Amelia Walker'
                                           , 'Amelia Phillips'
                                           , 'Abigail Mitchell'
                                            )
 GROUP BY tc.first_name
        , tc.last_name
        , tb.branch_id
      ORDER BY COUNT(tt.tran_date) DESC;