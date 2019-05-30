data renyi1;
do id=1 to 45;
input days censor @@; output;
end;
cards;
1 0 63 0 105 0 129 0 182 0 216 0 250 0 262 0 301 0 301 0 342 0 354 0
356 0 358 0 380 0 383 0 383 0 338 0 394 0 408 0 460 0 489 0 499 0 523 0
524 0 535 0 562 0 569 0 675 0 676 0 748 0 778 0 786 0 797 0 953 0 968 0
1000 0 1245 0 1271 0 1420 0 1551 0 1694 0 2363 0 2754 1 2950 1
;
data renyi1; set renyi1; group=1;
data renyi2;
do id=1 to 45;
input days censor @@; output;
end;
cards;
17 0 42 0 44 0 48 0 60 0 72 0 74 0 95 0 103 0 108 0 122 0 144 0
167 0 170 0 183 0 185 0 193 0 195 0 197 0 208 0 234 0 235 0 254 0 307 0
315 0 401 0 445 0 464 0 484 0 528 0 542 0 547 0 577 0 580 0 795 0 855 0
1366 0 1577 0 2060 0 2412 1 2486 1 2796 1 2802 1 2934 1 2988 1
;
data renyi2; set renyi2; group=2;
title 'Example 7.9, page 211, Klein & Moeschberger';

data renyi; set renyi1 renyi2;
proc print;
proc lifetest method=life data=renyi plots=(s,h) graphics;
title 'Gastrointestinal Tumor Study Group (1982)';
title2 'Gastric cancer survival: 1=chemotherapy vs 2=chemotherapy+radiotherapy';
time days*censor(1);
strata group;
symbol1 v=none color=red line=1;
symbol3 v=none color=black line=3;


run;
