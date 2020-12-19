/*****************************************************************************************************************
NAME:   dbo.v_LoanBranYear
PURPOSE: creating a view for project 3

SUPPORT: 

MODIFICATION LOG:
Ver       Date         Author       Description
-------   ----------   ----------   -----------------------------------------------------------------------------
1.0		12/19/20	Francis			creating a view for loan branch per year


RUNTIME: 1 min


NOTES: 


LICENSE: 
This code is covered by the GNU General Public License which guarantees end users
the freedom to run, study, share, and modify the code. This license grants the recipients
of the code the rights of the Free Software Definition. All derivative work can only be
distributed under the same license terms.
*****************************************************************************************************************/

CREATE VIEW dbo.v_LoanBranYear AS
SELECT tad.branch_id
     , tbd.branch_name
     , YEAR(tad.open_date) AS 'year'
     , SUM(tad.loan_amt) AS 'TotalLoanAmt'
  FROM dbo.tblAcctDim tad 
       INNER JOIN
       dbo.tblBranchDim tbd ON tad.branch_id = tbd.branch_id
	   WHERE YEAR(open_date) IN (2016, 2017, 2018,2019)
 GROUP BY tad.branch_id
        , tbd.branch_name
		,YEAR(tad.open_date)