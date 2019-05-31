data gas;
do TempA = 60 to 90 by 15;
do OperB = 1 to 4;
do PressC = 1 to 3;
do rep = 1 to 2;
input y @@; output; end; end; end; end;
cards;
-2 -3 -6 4 -1 -2 
0 -9 -5 -1 -4 -8 
-1 -8 -8 -2 0 -7 
4 4 -3 -7 -2 4 
14 14 22 24 20 16 
6 0 8 6 2 0 
1 2 6 2 3 0 
-7 6 -5 2 -5 -1 
-8 -8 -8 3 -2 -1 
-2 20 1 -7 -1 -2 
-1 -2 -9 -8 -4 -7 
-2 1 -8 3 1 3 
;
proc print;
run;
proc mixed data=gas method=type1;
class TempA OperB PressC;
model y=;
random TempA|OperB|PressC;
run;
proc mixed data=gas method=reml;
class TempA OperB PressC;
model y=;
random TempA|OperB|PressC;
run;
