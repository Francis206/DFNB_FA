/*****************************************************************************************************************
NAME:   dbo.v_LoanRegYear
PURPOSE: creating a view for project 3

SUPPORT: 

MODIFICATION LOG:
Ver       Date         Author       Description
-------   ----------   ----------   -----------------------------------------------------------------------------
1.0		12/19/20	Francis			creating a view for loan Region per year


RUNTIME: 1 min


NOTES: 


LICENSE: 
This code is covered by the GNU General Public License which guarantees end users
the freedom to run, study, share, and modify the code. This license grants the recipients
of the code the rights of the Free Software Definition. All derivative work can only be
distributed under the same license terms.
*****************************************************************************************************************/

CREATE VIEW dbo.v_LoanRegYear AS
SELECT sp.acct_rel_id AS RegionID
     
     , YEAR(sp.open_date) AS 'year'
     , SUM(sp.loan_amt) AS 'TotalLoanAmt'
  FROM dbo.stg_p1 sp
	   WHERE YEAR(open_date) IN (2016, 2017, 2018,2019)
 GROUP BY sp.acct_rel_id
		,YEAR(sp.open_date)