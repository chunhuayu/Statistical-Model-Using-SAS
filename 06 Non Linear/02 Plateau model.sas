/* ch13-fig2.02new.sas, to fit left plateau model, nonlinear regression;*/
 data lizard;
   input length mass @@;
 datalines;
 22.87  0.294     23.45  0.302     23.49  0.265     23.65  0.297
 23.76  0.294     24.36  0.338     24.44  0.295     24.44  0.347
 24.51  0.338     24.61  0.333     24.91  0.358     24.95  0.350
 24.95  0.331     25.00  0.327     25.16  0.345     25.26  0.334
 25.26  0.323     25.36  0.353     25.47  0.354     25.52  0.350
 25.61  0.361     25.76  0.362     25.82  0.327     25.86  0.354
 25.91  0.309     25.96  0.361     25.96  0.366     26.15  0.344
 26.20  0.358     26.27  0.348     27.12  0.371     27.28  0.421
;


 proc nlin;
   parameters b0 = 0.2904  b1 = 0.0189  tau = 23.44;/* change to tau=24.06 */
   if length <= tau then do;                *left plateau;
      model mass = b0;
   end;
   else do;                                 *post-threshold;
      model mass = b0 + b1*(length-tau);
   end;
   output out=a p=p;
   run;

   goptions reset=global gunit=pct border cback=white
         colors=(black blue green red)
         ftitle=swissb ftext=swiss htitle=4 htext=4;
title1 'Mass vs Length with the fit';
symbol1 color=red
        interpol=none
        value=dot
        height=3;
symbol2 color=red
        interpol=join;
 axis1 label=('Length (mm)')
          order=(22 to 28 by 1)
          width=3;
   axis2 label=('Mass (g)')
         order=(0.25 to .45 by 0.05)
		 width=3;
proc gplot data=a;
   plot mass*length/ haxis=axis1 vaxis=axis2;
   run;


proc gplot data=a;
   plot mass*length p*length/ overlay haxis=axis1 vaxis=axis2;
   run;
quit;
  run;
