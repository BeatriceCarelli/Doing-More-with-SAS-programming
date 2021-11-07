
data work.stocks2;
    set pg2.stocks2(rename=(Volume=CharVolume Date=CharDate));
    Volume=input(CharVolume,comma12.);
    Date=input(CharDate,date9.);
    drop Char:;
run;
