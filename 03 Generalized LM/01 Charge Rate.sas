 /* ch08t1.sas 
  Data from  Table 8.1 of Neter (5th ed): Data-Power cells example
    x1 = charge rate
    x2 = Temperature
    y = # of cycles (the life time)
	EU= cell 
    The goal is to fit the data using multiple polynomial regression. */

  options ls=80;
  data brand;
     input y x1 x2;
     tx1=(x1-1)/0.4;  /* the coded variable, 1 is the mean of x and 0.4 is diff between two adjacent value */
	 tx2=(x2-20)/10;
	 tx1s=tx1**2;
	 tx2s=tx2**2;
     tx12=tx1*tx2;
  cards;
  150  0.6  10
   86  1.0  10
   49  1.4  10
  288  0.6  20
  157  1.0  20
  131  1.0  20
  184  1.0  20
  109  1.4  20
  279  0.6  30
  235  1.0  30
  224  1.4  30
  ;
  
  proc print; run;
  run;

  proc glm;
  model y=tx1 tx2 tx1s tx2s tx12;
  run;

  proc glm;  /* the F-test for lack of fit */
  class x1 x2;
  model y=x1|x2;
  run;

  proc reg; /* test for the first order model */
  model y=tx1 tx2;
  run;

  proc reg;
  model y=x1 x2;
  run;
