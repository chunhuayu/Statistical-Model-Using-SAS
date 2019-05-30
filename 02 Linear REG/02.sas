data airfreight; 
     input y x;
cards;
16 1
9 0
17 2
12 0
22 3
13 1
8 0
15 1
19 2
11 0
;

proc reg;
     model y=x;
     output out=a p=predict;
proc print data=a;
proc plot data=a;
     plot predict*x='+' y*x='*'/overlay;
run;
