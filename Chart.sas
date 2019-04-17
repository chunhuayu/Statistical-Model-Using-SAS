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

* using Hbar statement replacing Vbar, there is frequency table showing up by the right side of the bar
proc chart data= htwt;
title "Bar chart from Proc Chart";
Hbar height / Midpoints=60 to 74 by 2;  
run;


Data Emart;
input YEAR DEPT $ SALES;
datalines;
2001  TOYS 5000 
2001  TOYS 4500 
2001  TOYS 5500 
2001  FOOD 4100 
2001  FOOD 3300 
2002  TOYS 6344 
2002  TOYS 4567 
2002  TOYS 4567 
2002  TOYS 4567 
2002  TOYS 4300 
2002  FOOD 3700 
2002  FOOD 3900 
2003  TOYS 7000 
2003  TOYS 7200 
2003  TOYS 6000 
2003  TOYS 7900
2003  FOOD 4000  
2003  FOOD 5800 
2003  FOOD 5600 
;
Proc chart Data=Emart;
title "Simple Frequency Bar Chart";
vbar dept;
run;
proc chart data=emart;
title "Bar Chart on a Numerical Variable (Sales)";
VBAR sales;
run;

pattern value=L2 color=black;
proc chart data=emart;
title "Distributiion of sales by Department";
Vbar sales /Group= Dept Midpoints=4500 to 5500 by 1000;
format sales dollar8.0;
run;

proc chart data=emart;
title "Sum of Sales by Year";
vbar year /sumvar=sales type=sum discrete;
format sales dollar8.;
run;
