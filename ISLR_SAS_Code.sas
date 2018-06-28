/******************************************************************************
 * Title: ISLR_SAS_Code
 * Abstract: SAS versions of programs developed for self-study and exercises
 * in the "Introduction to Statistical Learning" text.
 * 
 * Analyst: Michael S. Johnson (UCDA/PO, michael.s.johnson@kp.org, 510-593-8272)
 * Bitbucket URL:
 * Update Log: 
 * 
 *****************************************************************************/
libname ISLR base '/gpfsFS2/sasdata/sasusers/s913732/profdev/ISLR/Data';

*** Chapter 1;
** figure 1.1;
filename filref '/gpfsFS2/sasdata/sasusers/s913732/profdev/ISLR/Data/Wage.csv';
proc import datafile=filref 
	dbms=CSV
	out=ISLR.Wages;
	getnames=yes;
run;
ods graphics / reset imagemap height=640px width=480px;
proc sgplot data=ISLR.Wages;
	/*--Fit plot settings--*/
	reg x=age y=wage / nomarkers name='Regression';
	pbspline x=age y=wage / nomarkers name='PBSpline';
	/*--Scatter plot settings--*/
	scatter x=age y=wage / transparency=.75 name='Scatter';
	/*--X Axis--*/
	xaxis grid;
	/*--Y Axis--*/
	yaxis grid;
run;
ods graphics / reset;
