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

/-----------------------------------------------------------------------------------
  sort the data by gender
  Remember there are many process in sas using by statement
  make sure sort the data by the specific variable before using it in other process;
-------------------------------------------------------------------------------------/
proc sort data=htwt;
by gender;
run;
proc means data=htwt N mean Maxdec=2 std stderr min max clm;
title "Simple Descriptive Statistics";
var height weight;
by gender; * this is the statement that gives the breakdown;
run;
