PROC FORMAT;
VALUE $SEXFMT    '1'= 'Male'
                 '2'= 'Female'
              Other = 'Miscoded'
VALUE $RACE      '1'= 'White'
                 '2'= 'African AM.'
                 '3'= 'Hispanic'
				 '4'= 'Other'
VALUE $OSCAR     '1'= 'Single'
                 '2'= 'Married'
				 '3'= 'Widowed'
				 '4'= 'Divorced'
VALUE $EDUC      '1'= 'High Sch or Less'
                 '2'= 'Two Yr. College'
				 '3'= 'Four Yr. college'
				 '4'= 'Graduate Degree'
VALUE LIKERT     '1'= 'Str Disagree'
                 '2'= 'Disagree'
				 '3'= 'No opinion'
				 '4'= 'Agree'
				 '5'= 'Str Agree';
run;

DATA QUEST;
input ID        $ 1-3
      AGE         4-5
      GENDER    $   6
      RACE      $   7
      MARITAL   $   8
      EDUCATION $   9
      PRESIDENT    10
      ARMS         11
      CITIES       12;
LABEL MARITAL      ="Marital Status"
      EDUCATION    ="Education Level"
      PRESIDENT    ="President Doing a Good Job"
      ARMS         ="Arms Budget Increase"
      CITIES       ="Federal Aid to Cities";
FORMAT GENDER    $SEXFMT.
       RACE      $RACE.
       MARITAL   $OSCAR.
       EDUCATION $EDUC.
       PRESIDENT ARMS CITIES LIKERT.;

DATALINES;
001091111232
002452222422
003351324442
004271111121
005682132333
006651243425
;
PROC MEANS DATA=QUEST MAXDEC=2 N MEAN STD CLM;
TITLE "Questionnaire Analysis";
VAR AGE;
RUN:
PROC FREQ DATA=QUEST;
TITLE "Frequency Counts for categorical Variables";
TABLES GENDER RACE MARITAL EDUCATION PRESIDENT ARMS CITIES;
RUN;
