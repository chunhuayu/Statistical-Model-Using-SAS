data htwt;
input subject gender $ height weight;
datalines;
1 M 68.5 155
2 F 61.2 99
3 F 63.0 115
4 M 70.0 205
5 M 68.6 170
6 F 65.1 125
7 M 72.4 220
8 M .    188
;
proc print data=htwt noobs;
run;

proc plot data=htwt;
title1 "Scatter Plot of Weight By Height";
title2 "Using all the Default";
plot weight*height;
run;

proc sort data=htwt;
by gender;
run;
proc plot data=htwt;
title "Separate Plots by Gender";
By Gender;
Plot Weight* Height;             * y axis=Weight ~ x axis=Height ;
Run;

proc plot data=htwt;
title "Separate Plots by Gender";
Plot Weight* Height=gender;
Run;
