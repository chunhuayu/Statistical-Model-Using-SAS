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
* (c= colors the whole area including outline and the filled area)
* i "interpol", j "join"
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
* Set the graphics environment.
goptions reset=global gunit=pct border cback=white
         colors=(black blue green red)
         ftext=swissb htitle=6 htext=3;
* Create the data set. 
* STOCKS contains yearly highs and lows for the Dow Jones Industrial Average, and the dates of the high and low values each year.
data stocks;
   input year @7 hdate date9. @17 high
         @26 ldate date9. @36 low;
   format hdate ldate date9.;
   datalines;
1955  30DEC1955  488.40  17JAN1955 388.20
1956  06APR1956  521.05  23JAN1956  462.35
...more data lines...
1994  31JAN1994 3978.36  04APR1994 3593.35
1995  13DEC1995 5216.47  30JAN1995 3832.08
;

* Restructure the data so that it defines a closed area. Create two temporary data sets HIGH and LOW with year and value variables;
data high(keep=year value)
     low(keep=year value);
     set stocks;
     value=high; output high;
     value=low; output low;
run;

* Reverse order of the observations in LOW;
proc sort data=low;
   by descending year;

* Concatenate HIGH and LOW to create data set AREA by using "set A-dataset B-dataset ;" format statement;
data area;
   set high low;
title1 'Dow Jones Industrial Average';
title2  h=4 'Highs and Lows From 1955 to 1995';
footnote j=l ' Source: 1997 World Almanac'
         j=r 'GR08N05  ';

* Define symbol characteristics. 
* INTERPOL= specifies a map/plot pattern to fill the polygon formed by the data points. "Can use i=specifies for short"
* The pattern consists of medium-density parallel lines at 90 degrees. 
* CV= colors the pattern fill. CO= colors the outline of the area. (If CO= were not used, the outline would be the color of the area.)
symbol interpol=m3n90
       cv=red
       co=blue;
* Define axis characteristics. ORDER= places the major tick marks at 5-year intervals.
axis1 order=(1955 to 1995 by 5)
      label=none
      major=(height=2)
      minor=(number=4 height=1)
      offset=(2,2)
      width=3;
axis2 order=(0 to 5500 by 500)
      label=none
      major=(height=1.5) offset=(0,0)
      minor=(number=1 height=1);

* Generate the plot using data set AREA. vref= adding the vertical reference lines;
proc gplot data=area;
   plot value*year / haxis=axis1
                     vaxis=axis2
                     vref=(1000 3000 5000);
run;
quit;
