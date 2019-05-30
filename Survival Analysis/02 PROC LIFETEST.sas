/*SAS code for problem 2 in Chapter 7, it is actually Problem 7.6 on page 240 */
data azt;
input time censor @@;
trt='azt	';
lines;
85 1 32 1 38 0 45 1 4 0 84 1 49 1 180 0 87 1 75 1 102 1 39 1 12 1 11 1 80 1 35 1 6 1
;
data aztcomb;
input time censor @@;
trt='aztcomb';
lines;
22 1 2 1 48 1 85 1 160 1 238 1 56 0 94 0 51 0 12 1 171 1 80 1 180 1 4 1 90 1 180 0 3 1
;
data prob7_6; set azt aztcomb;
proc print;

/*Two sample tests*/
proc lifetest data=prob7_6 plots=(s) graphics;
time time*censor(0);
strata trt;
symbol1 v=none color=black line=1;
symbol2 v=none color=black line=2;
run;
