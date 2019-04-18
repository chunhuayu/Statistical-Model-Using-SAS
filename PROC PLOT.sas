* Display standard normal distribution and t1,t5,t30 distribution plot in one plot;
data t1;
   do x=-10 to 10 by 0.1;
     pdf_n=pdf('normal', x,0,1);
     pdf_t1=pdf('t', x,1);
     pdf_t5=pdf('t', x,5);
     pdf_t30=pdf('t', x,30);
     output;
    end;
run;
* draw more than one plots in one coordinate by using overlay;
symbol i=j c=red;    
symbol2 i=j c=black; 
symbol3 i=j c=green; 
symbol4 i=j c=orange;
proc gplot data=t1;
plot (pdf_n  pdf_t1 pdf_t5 pdf_t30) *x /overlay;
run;
quit;
*---------------------------------------------------------------------------------------*
goptions reset=all border;
title "Study of Height vs Weight";
footnote1 j=l "Source: T. Lewis & L. R. Taylor";
footnote2 j=l "Introduction to Experimental Ecology";
proc gplot data=sashelp.class;
   plot height*weight;
run;
footnote1; /* this clears footnote1 and footnote2 */
symbol1 interpol=rcclm95
       value=circle
       cv=darkred
       ci=black
       co=blue
       width=2;
   plot height*weight / haxis=45 to 155 by 10
                        vaxis=48 to 78 by 6
                        hminor=1
                        regeqn;
run;
quit;
*-------------------------------------------------------------------------------------------------*
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
proc print data=htwt noobs;
run;

proc plot data=htwt;
title1 "Scatter Plot of Weight By Height";
title2 "Using all the Default";
plot weight*height;
run;

proc sort data=htwt;
by gender;
run;
proc plot data=htwt;
title "Separate Plots by Gender";
By Gender;
Plot Weight* Height;             * y axis=Weight ~ x axis=Height ;
Run;

proc plot data=htwt;
title "Separate Plots by Gender";
Plot Weight* Height=gender;
Run;

*-------------------------------------------------------------------------------------------*