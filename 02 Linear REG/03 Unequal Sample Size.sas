data heart;
input sex race wt;
if sex=1 then do;
x1=1;
end;
if sex=2 then do;
x1=-1;
end;
if race=1 then do ;
x2=1;
end;
if race=2 then do;
x2=-1;
end;
x12=x1*x2;
cards;
1	1	280
1	1	420
1	1	340
1	1	370
1	1	390
1	1	440
1	1	510
1	1	300
1	1	480
1	2	335
1	2	715
1	2	440
1	2	620
1	2	520
1	2	600
1	2	540
1	2	345
1	2	380
1	2	270
1	2	485
1	2	500
1	2	485
1	2	620
1	2	360
2	1	205
2	1	280
2	1	195
2	1	380
2	1	200
2	2	210
2	2	390
2	2	360
2	2	320
2	2	350
;
proc print;
run;
proc glm;
class sex race;
model wt=sex|race;
means sex|race; /* incorrect output for unbalance treatments */
lsmeans sex|race; /* correct way in calculating mean */
output out=a p=pred r=resid;
proc plot;
plot resid*pred;
proc rank normal=blom;
var resid;
ranks nscore;
proc plot;
plot resid*nscore;
proc means nway noprint;
class sex race;
var wt;
output out=means mean=;
proc plot;
plot wt*sex=race;
plot wt*race=sex;
run;
proc reg data=heart;
model wt=x1 x2 x12;
model wt=x1 x2;
model wt=x1 x12;
model wt=x2 x12;
model wt=x2; 
model wt=x1;
run;
