/* power-t.sas: compute the power or the sample size for the one-sample t-test */


proc power; 
  onesamplemeans test=t  sides=L  /* sides =L, H_a: less than; sides=U: H_a: greater than; nothing: H_a: not equal to */
  nullmean = .4 
  mean  = 0.5
  stddev = 2.74
  alpha = 0.05
  power = .                       /* power=0.8 */
  ntotal = 10 to 14 by 1;      /* ntotal = .;*/
run;
