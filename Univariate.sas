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
proc means data=htwt N mean Maxdec=2 std stderr min max clm;
title "Simple Descriptive Statistics";
var height weight;
run;

* Using pro univariate process displays more descriptive statistics;
proc univariate data=htwt;
title "More Descritpive Statistics no option";
var height weight;
run;

* add more options in proc univariate process;
* Normal and plot are the common used as options in proc univariate;
proc univariate data= htwt Normal plot;
title "More Descriptive Statistics (sample)";
var height weight;
run;

* add histogram statement to display the histogram of height variable;
proc univariate data=htwt normal plot;
title "More Descriptive Statistics";
var height weight;
histogram height / midpoints=60 To 75 by 5 normal;
run;
