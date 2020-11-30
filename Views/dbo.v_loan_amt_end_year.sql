/*****************************************************************************************************************
NAME:   View
PURPOSE: Create the dbo.v_balance_year view

SUPPORT: 

MODIFICATION LOG:
Ver       Date         Author       Description
-------   ----------   ----------   -----------------------------------------------------------------------------
1.0       11/18/2019   FAgballog      1. Build a view to see the loan amount end of the year.


RUNTIME: 
Approx. 0 min

NOTES:
Build a view to see the loan amount end of the year.

LICENSE: This code is covered by the GNU General Public License which guarantees end users
the freedom to run, study, share, and modify the code. This license grants the recipients
of the code the rights of the Free Software Definition. All derivative work can only be
distributed under the same license terms.
 
******************************************************************************************************************/
--Drop view dbo.v_loan_amt_end_year 
USE DFNB2

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW dbo.v_loan_amt_end_year AS
     SELECT tad.acct_id
          , year(taf.as_of_date) as Year
          , sum(tad.loan_amt) TotalLoan
       FROM dbo.tblAcctDim AS tad
            join
            tblAcctFact AS taf ON tad.acct_id = taf.acct_id
			WHERE month(as_of_date)=12
			group by 
          tad.acct_id,
		  taf.as_of_date
		  go

