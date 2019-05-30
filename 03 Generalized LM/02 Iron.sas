/*********************************************************
Data from Econ. Geology, 1964, p. 1025-1057
iron from four types of formation:
1= carbonate
2= silicate
3= magnetite
4= hematite
Y=amount
*********************************************************/
data iron;
input type amount @@;
cards;
1 20.5 1 28.1 1 27.8 1 27.0 1 28.0
1 25.2 1 25.3 1 27.1 1 20.5 1 31.3
2 26.3 2 24.0 2 26.2 2 20.2 2 23.7
2 34.0 2 17.1 2 26.8 2 23.7 2 24.9
3 29.5 3 34.0 3 27.5 3 29.4 3 27.9
3 26.2 3 29.9 3 29.5 3 30.0 3 35.6
4 36.5 4 44.2 4 34.1 4 30.3 4 31.4
4 33.1 4 34.1 4 32.9 4 36.3 4 25.5

proc print;

proc glm;
class type;
model amount = type;
means type/ tukey scheffe bon;
means type /tukey scheffe bon cldiff;
estimate 't1-t2' type 1-1;
estimate 't1-t3' type 1+0-1;
estimate 't1-t4' type 1+0+0-1;
estimate 't2-t3' type 0+1-1;
estimate 't2-t4' type 0+1-0-1;
estimate 't3-t4' type 0+0+1-1;
estimate '(t1+t2)/2-(t3+t4)/2' type 0.5+0.5-0.5-0.5;
run;
