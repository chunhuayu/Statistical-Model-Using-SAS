/***************************************
Adenosine triphosphate (ATP) molecule and industrial waste water and its relation to pH
(Source: Arretxe et al 1997)
column 1: pH
column 2: ATP(mg/g)
****************************************/

data atp;
input ph atp;
ph2=ph**2;
ph3=ph**3;
cards;
2 0.16
5 0.31
8 0.32
9 0.26
11 0.07
;


proc print;
run;

proc reg;
model atp = ph;

proc reg;
model atp = ph ph2;

proc reg;
model atp = ph ph2 ph3;

run;
