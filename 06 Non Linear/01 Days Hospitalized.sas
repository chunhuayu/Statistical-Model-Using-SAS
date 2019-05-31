/**************************************************************************
ch13-patient-nonlinear.sas
Textbook: Applied Linear Statistical Model
Data from Kutner et al. (5th), p.515
A hospital  administrator wished  to develop  a regression  model  for  predicting the degree
of long-term  recovery  after discharge  from  the hospital  for severely  injured patients. 
The predictor variable  (X)  is number  of days of  hospitalization (X), 
The response variable (Y) is a prognostic  index for  long-term  recovery,  with large values of e index 
reflecting a good prognosis.  

Data for  15 patients (n) were studied  and are presented Table 13.1. 

A scatter  plot of the data  is shown  in Figure 13.2 and is nonlinear.  

Related earlier studies found the relationship between X and Y is as follows

y=a0*exp(a1*X)+e, where a and b are unknown parameters.

We also compare this model with a model of ln(Y)=b0+b1*X+e
****************************************************************************/
data patient;
input prog days;
lnprog=log(prog);
cards;
  54   2
  50   5
  45   7
  37  10
  35  14
  25  19
  20  26
  16  31
  18  34
  13  38
   8  45
  11  52
   8  53
   4  60
   6  65
   ;

proc nlin alpha=0.1; 
parameters a0=10        /* an initial guess */ 
           a1=-1;  /* try a1=-4 */
   model prog = a0*exp(a1*days);
   output out=a p=p r=resid lcl=lci ucl=uci lclm=l90 uclm=u90; /* provide 90 PI's and  CI's*/
run;

proc print data=a;
run;

proc plot;    /* seem a rectangle shape */
plot resid*p;
run;

/* below we generate some nice picture */
goptions reset=global gunit=pct border cback=white
         colors=(black blue green red)
         ftitle=swissb ftext=swiss htitle=4 htext=4;
title1 'Prognostic index versus Days';
symbol1 color=red
        interpol=none
        value=dot
        height=3;
symbol2 color=red
        interpol=join;
 axis1 label=('Days')
          order=(0 to 70 by 10)
          width=3;
   axis2 label=('Pyrene')
         order=(0 to 60 by 10)
		 width=3;

proc gplot data=a;  /* see the scatter plot */
   plot prog*days/ haxis=axis1 vaxis=axis2;
   run;

proc gplot data=a;  /* see the fit */
   plot prog*days p*days/ overlay haxis=axis1 vaxis=axis2;
   run;
quit;


proc reg;  /* here we try log transformation on Y. i.e., use ln(Y) vs X*/
model lnprog=days;
   output out=b p=pln r=residln;
run;

proc plot;         /* the constant variance seems not true */
plot residln*pln;
run;
