/***********************************************************************
One-way anova: Tensile strength of synthetc fiber for men's shirts which is affected by 
percent of cotton.
Response = tensile strength; Factor = cotton percent;
************************************************************************/
data cotton;
input percent y;
p2=percent**2;
p3=percent**3;
cards;
15	7
15	7
15	15
15	11
15	9
20	12
20	17
20	12
20	18
20	18
25	14
25	18
25	18
25	19
25	19
30	19
30	25
30	22
30	19
30	23
35	7
35	10
35	11
35	15
35	11
;
     
proc print; run;

proc plot;    /* scatter plot. Not linear, constant variance */
plot y*percent; run;

proc anova;      /* factor = percent */
     class percent;
     model y = percent;
     means percent;
	 run;

proc reg;    /* polynomial regression as percent is also numerical. */
model y=percent p2 p3;
run;
