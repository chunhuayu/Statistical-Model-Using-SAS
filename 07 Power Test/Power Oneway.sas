   /* power_oneway.sas
    In one-way anova, find a sample size of each group for a given power 
    or to find the power for a given group sample size.
    Here assume a balanced design. */
    options ls=72;

    proc power;  /* use the battery example */
    onewayanova test=overall  
    alpha=0.05 /* the test level */
    groupmeans=(96,80,100)   /* the cell means */
    stddev=4   /* the standard deviation */
    npergroup=3 4 5  6 7 8 9/* equal sample size and each sample has a size of 3, 4 or 5, etc*/
    power=.;  /* find the power for each group sample size*/
    run;

    proc power;
    onewayanova test=overall  
    alpha=0.05 /* the test level */
    groupmeans=(-4.5,4.5,0)  /* the maximum difference is 9 */ 
    stddev=3   /* the standard deviation */
    power=0.8
    npergroup=.;  /*find the sample size of each group*/
    run;
