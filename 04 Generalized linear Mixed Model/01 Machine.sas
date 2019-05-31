data machine;
do operator = 1 to 3;
do machine = 1 to 4;
do rep = 1 to 2;
input y @@; output; end; end; end;
cards;
109 110 110 115 108 109 110 108 
110 112 110 111 111 109 114 112 
116 114 112 115 114 119 120 117 
;

proc print;
run;

proc glm;
class operator machine;
model y = operator | machine;
random operator operator*machine/test;
output out=check r=resid p=yhat;
run;

proc univariate normal plot data=check;
var resid;
proc plot data=check;
plot resid*yhat/vref=0;
proc print;
run;

proc mixed data=machine method=type1;
class operator machine;
model y = machine;
random operator operator*machine; 
run;
