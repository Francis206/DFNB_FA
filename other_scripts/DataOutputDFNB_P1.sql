/*****************************************************************************************************************
NAME:    DataOutputDFNB_p1
PURPOSE: Create the output for all views created on project 01
SUPPORT: 
MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     12/5/2020    Francisco Agballog  1. Data output from the views
 
RUNTIME: 
Approx. 1 min
NOTES:
Runs alll data from the views
******************************************************************************************************************/

SELECT *
  FROM dbo.v_AcctClosed;

SELECT *
  FROM dbo.v_AcctOpen;

SELECT *
  FROM dbo.v_balance_month_Dec;

SELECT *
  FROM dbo.v_balnce_month_jan;

SELECT *
  FROM dbo.v_loan_amt_end_year
