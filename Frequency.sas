* Data step;
* create two new variables: Final and Grade;
* Using if-else (if) statement to assign the value of Grade;
Data example;
input Subject 1-2 Gender $ 4 Exam1 6-8 Exam2 10-12 HW_Grade $ 14;
Final= (Exam1+ Exam2)/2;
If final ge 0 and final lt 65 then Grade='F';
else if final ge 65 and final lt 75 then Grade='C';
else if final ge 75 and final lt 85 then Grade= 'B';
Else if final Ge 85 then Grade='A';
Datalines;
10 M 80  84  A
7  M 85  89  A
4  F 90  86  B
20 M 82  85  B
25 F 94  94  A
14 F 88  84  C
;

* show out the raw data;
proc print data= example;
run;

* sort the data by subject in increasing order;
proc sort data=example;
by subject;
run;

* id statement can specify a variable as the first column of table replacing Obs;
proc print data=example;
title "Roster in Student Number Order";
id subject;
var exam1 exam2 final Hw_grade grade;
run; 

proc means data=test N mean std STDERR maxdec=1;
var exam1 exam2;
run;

* Proc Freq + Tables statementn can specify the content for each table;
* table gender has only 1 variable, showing the different levels in the first column, the column is Frequency, Percent, Cumulative
Frequency, Cumulative percent;
* In grade Table won't display the percent and cumulative frequency
* table gender*grade: row is gender, column is grade. the content for each cell is including Frequency, Percent, Cumulative
Frequency, Cumulative percent;
Proc Freq Data=example;
Tables gender Hw_grade gender*grade;
Tables grade / nocum nopercent;
run;
