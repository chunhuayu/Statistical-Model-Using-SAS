data heart;
     infile 'CANVEG.DAT';
     input week y x1 x2;
     x12=x1*x2;

proc print;

proc corr; /* get the correlation matrix */
var y x1 x2 x12;

proc reg;
     model y=x12;
output out=a student=student p=predict r=resid;

proc plot;        /* or you can draw the scatter plot matrix */
     plot resid*predict;
     plot resid*week;

proc reg;
     model y=x1 x2 x12/cli clm;
output out=b student=student p=predict r=resid;


proc rank normal=blom; /* check the normality */
     var resid;
     ranks nscore;

proc plot;        /* or you can draw the scatter plot matrix */
     plot resid*predict;
     plot resid*x1;
     plot resid*x2;
     plot resid*x12;
     plot resid*nscore;

proc corr; /* the correlation test for normality */
var resid nscore;



run;
