/*****************************************************************************************************************
NAME:   View
PURPOSE: Create the dbo.v_balance_year view

SUPPORT: 

MODIFICATION LOG:
Ver       Date         Author       Description
-------   ----------   ----------   -----------------------------------------------------------------------------
1.0       11/18/2019   FAgballog      1. Build a view to see the balance end of the year.


RUNTIME: 
Approx. 0 min

NOTES:
Build a view to see the balance end of the year.

LICENSE: This code is covered by the GNU General Public License which guarantees end users
the freedom to run, study, share, and modify the code. This license grants the recipients
of the code the rights of the Free Software Definition. All derivative work can only be
distributed under the same license terms.
 
******************************************************************************************************************/


CREATE VIEW dbo.v_balance_month_Dec
AS
     SELECT acct_id
          , as_of_date
          , cur_bal
       FROM DFNB2.dbo.tblAcctFact taf
      WHERE MONTH(as_of_date) = 12
      GROUP BY acct_id
             , as_of_date
			 , cur_bal;

