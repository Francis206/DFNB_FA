/*****************************************************************************************************************
NAME:    dbo.tblBranchLoanGoal
PURPOSE: Create the dbo.tblBranchLoanGoal
MODIFICATION LOG:
Ver      Date        Author                 Description
-----   ----------   ----------------       -------------------------------------------------------------------------------
1.0     12/19/2020   Francis     1. Built this table for DFNB2 Project 3
RUNTIME: 
Approx. 0 min
NOTES:
The t_branch_goal_dim hosts the annual goal for consmer loans for each branch.
 
******************************************************************************************************************/



DROP TABLE dbo.tblBranchLoanGoal
GO

SET ANSI_NULLS ON;
GO

SET QUOTED_IDENTIFIER ON;
GO

CREATE TABLE dbo.tblBranchLoanGoal
( branch_id      SMALLINT NOT NULL
, branch_name    VARCHAR(100) NOT NULL
, TotalLoan      DECIMAL(20, 4) NOT NULL
, goal_year      INT NOT NULL
, BestScenerio    DECIMAL(20, 4) NOT NULL
, WorseScenerio  DECIMAL(20, 4) NOT NULL

)
ON [PRIMARY];
GO