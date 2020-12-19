/*****************************************************************************************************************
NAME:   DataOutPutDFNB_P3
PURPOSE: creates project 3 data scripts

SUPPORT: 

MODIFICATION LOG:
Ver       Date         Author       Description
-------   ----------   ----------   -----------------------------------------------------------------------------
1.0	       12/19/20    Francis		create tables for project3


RUNTIME: 1 min


NOTES: 


LICENSE: 
This code is covered by the GNU General Public License which guarantees end users
the freedom to run, study, share, and modify the code. This license grants the recipients
of the code the rights of the Free Software Definition. All derivative work can only be
distributed under the same license terms.
*****************************************************************************************************************/
USE [DFNB2]
GO

SELECT * FROM dbo.v_TranAmtBranch vtab
SELECT * FROM dbo.v_TranTypesYear vtty
SELECT * FROM dbo.v_TranFeeBranch vtfb
