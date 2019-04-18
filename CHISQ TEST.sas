DATA CHISQ;
 INPUT GROUP $ OUTCOME $ COUNT;
 DATALINES;
 DRUG ALIVE 90
 DRUG DEAD 10 
 PLACEBO ALIVE 80
 PLACEBO DEAD 20
 ;
 
 * the weight statement plays an important role in the Chisq test. If remove weight statement, the frequency will be 1 for each cell;
 * the value of the variable which is in weight statement will be used directly in the table;
 PROC FREQ DATA=CHISQ;
 TABLES GROUP*OUTCOME /CHISQ;
 WEIGHT COUNT;
 RUN;
