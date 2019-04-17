* input the data;
Data test;
input Subject 1-2 Gender $ 4 Exam1 6-8 Exam2 10-12 HW_Grade $ 14;
Datalines;
10 M 80  84 A
7  M 85  89 A
4  F 90  86 B
20 M 82  85 B
25 F 94  94 A
14 F 88  84 C
;

* option= noobs, remove obs column from the default print output table;
proc print data=test/ noobs;
run;

* proc means statement, the column of output table : Variable N Mean Std Dev Minimum Maximum; 
* option=noprint, do not display the mean table;
proc means data=test / noprint;
run;

* specify the variables of output table: exam1 and exam2;
proc means data=test;
var exam1 exam2;
run;

* specify the column of output table: N, mean, standard deviation, standard error. Also, specify the decimal point digit is 1;
proc means data=test N mean std stderr maxdec=1;
var exam1 exam2;
run;

* sort gender in increasing order, for qualitative variable, the increasing order is based on the alphabet;
proc sort data=test;
by gender;
run;

* proc mean process has var, class, by statement. As for the variables in by statement, it should be sorted in advanced;
proc means data=test N mean std STDERR maxdec=1;
var exam1 exam2;
class HW_grade;
by gender;
run;

*---------------------------------------------------*
| option for mean process:                          |
| N, NMISS, MEAN, MEDIAN, STD, STDERR, MAXDEC=N     |
| CLM, LCLM, UCLM,                                  |
| MIN, MAX, SUM, VAR,                               |
| Q1, Q3                                            |
| QRANGE                                            |
| CV                                                |
| SKEWNESS                                          |
| KURTOSIS                                          |
| T： T test for total mean=0                       |
| PRT                                               |
*---------------------------------------------------*;
