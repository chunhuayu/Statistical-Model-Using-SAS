/* SAS code for Problem 3 of Chapter 7 hw problems, it is also Prob7.7 in the textbook*/
data control;/*create data set for untreated group*/
input time censor @@;
trt='controp';
lines;
20 1 21 1 23 1 24 1 24 1 26 1 26 1 27 1 28 1 30
;
data rad; /*create data set for the radiated group*/
input time censor @@;
trt='rad';
lines;
26 1 28 1 29 1 29 1 30 1 30 1 31 1 31 1 32 1 35 0
;
data radbpa; /*Create data set for the raduated + BPA group*/
input time censor @@;
trt='radbpa';
lines;
31 1 32 1 34 1 35 1 36 1 38 1 38 1 39 1 42 0 42 0
;
data prob7_7; set control rad radbpa; /*Combine all these three samples*/
grp1=(trt='rad');
grp2=(trt='radbpa');
title 'Problem 7_7, page 240 --Boron neutron capture therapy';
title3 'grp1=rad, grp2=radbpa';
proc print;
/*Compare three groups, plot the survival functions and hazard functions*/
proc lifetest data=prob7_7 plots=(s,h) graphics;
time time*censor(0);
strata trt/adjust=bon;
symbol1 v=none color=black line=1;
symbol2 v=none color=black line=2;
symbol3 v=none color=black line=3;
run;
