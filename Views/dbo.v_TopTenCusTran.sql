/*****************************************************************************************************************
NAME:   view
PURPOSE: creating view for Project 2

SUPPORT: 


MODIFICATION LOG:
Ver       Date         Author       Description
-------   ----------   ----------   -----------------------------------------------------------------------------
1.0       12/3/2020   FAgballog     create view for top 10 ten customers

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

SELECT TOP 10 tc.first_name +' '+tc.last_name AS Customer,
count(tt.tran_date) AS Total_Transactions
FROM dbo.tblTranFact tt
JOIN dbo.tblAcctDim ta ON tt.acct_id = ta.acct_id
JOIN dbo.tblCustDim tc ON ta.pri_cust_id= tc.cust_id
JOIN dbo.tblBranchDim tb ON ta.branch_id = tb.branch_id
GROUP BY 
tc.first_name, tc.last_name
ORDER BY count(tt.tran_date) desc;
