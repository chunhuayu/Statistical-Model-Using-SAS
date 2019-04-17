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
proc means data=htwt N mean Maxdec=2 std stderr min max clm;
title "Simple Descriptive Statistics";
var height weight;
run;
proc print data=htwt noobs;
run;
proc univariate data=htwt;
title "More Descritpive Statistics no option";
var height weight;
run;

proc univariate data=htwt Normal;
title "More Descritpive Statistics";
var height weight;
run;

proc univariate data=htwt Normal plot NEXTROBS=3;
title "More Descritpive Statistics with Normal plot";
var height weight;
run;
