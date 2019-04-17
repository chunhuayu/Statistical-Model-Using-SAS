# input the data
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

# proc means statement, the column of output table : Variable N Mean Std Dev Minimum Maximum 
proc means data=test;
run;

# specify the variables of output table: exam1 and exam2
proc means data=test;
var exam1 exam2;
run;

# specify the column of output table: N, mean, standard deviation, standard error. Also, specify the decimal point digit is 1
proc means data=test N mean std stderr maxdec=1;
var exam1 exam2;
run;
