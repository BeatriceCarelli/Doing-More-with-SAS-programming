
data work.stocks2;
    set pg2.stocks2(rename=(Volume=CharVolume Date=CharDate));
    Volume=input(CharVolume,comma12.);  /* convert string to number*/
    Date=input(CharDate,date9.);     /* convert string to number*/
    drop Char:;
run;
