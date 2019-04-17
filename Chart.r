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

proc chart data= htwt;
title "Bar chart from Proc Chart";
Vbar gender;
run;

proc chart data= htwt;
title "Bar chart from Proc Chart";
Vbar height / Midpoints=60 to 74 by 2;
run;

