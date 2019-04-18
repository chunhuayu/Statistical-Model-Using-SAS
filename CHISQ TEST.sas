DATA CHISQ;
 INPUT GROUP $ OUTCOME $ COUNT;
 DATALINES;
 DRUG ALIVE 90
 DRUG DEAD 10 
 PLACEBO ALIVE 80
 PLACEBO DEAD 20
 ;
 
 * the weight statement plays an important role in the Chisq test. If remove weight statement, the frequency will be 1 for each cell;
 * the value of the variable which is in weight statement will be used directly in the table;
 PROC FREQ DATA=CHISQ;
 TABLES GROUP*OUTCOME /CHISQ;
 WEIGHT COUNT;
 RUN;

*---------------------------------------------------------------------*
data awt5;
do i= 1 to 10;
do j= 1 to 2;
input x @;
output;
end;
end;
cards;
3  2.30
5  1.90
5   1.00
7   0.70
7   0.30
7   1.00
8   1.05
9   0.45
10  0.70
11  0.30
;
proc print data=awt5;
run;
proc freq data=awt5;
tables i*j /chisq;
weight x;
run;
