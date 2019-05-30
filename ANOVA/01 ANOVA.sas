     /* Data on the lifetime of three brands of batteries (in weeks). 
      Response = lifetime; factor= brand */
data life;
input brand  lifetime d1 d2 d3 d4;
cards;
1 100  1  0  1   0
1  96  1  0  1   0
1  92  1  0  1   0
1  96  1  0  1   0    
1  92  1  0  1   0   
2  76  0  1  0   1    
2  80  0  1  0   1    
2  75  0  1  0   1    
2  84  0  1  0   1    
2  82  0  1  0   1    
3 108 -1 -1 -1 -.5    
3 100 -1 -1 -1 -.5     
3  96 -1 -1 -1 -.5     
3  98 -1 -1 -1 -.5     
3 100 -1 -1 -1 -.5     
;

proc print data=life;
run;

proc anova;
class brand;
model lifetime=brand;
means brand;

proc reg;             /* unweighted */
model lifetime=d1 d2;
run;
proc reg;             /* weighted with w1=0.4, w2=0.2 w3=0.4 */
model lifetime=d3 d4;
run;
