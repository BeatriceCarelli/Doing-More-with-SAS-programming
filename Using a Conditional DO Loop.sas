data IncreaseDayVisits;  
    set pg2.np_summary;
    where Reg='NE' and DayVisits<100000 and ParkName="African Burial Ground National Monument";
    IncrDayVisits=DayVisits;
    Year=0;
    do until (IncrDayVisits>100000);
    Year+1;
       IncrDayVisits=IncrDayVisits*1.06;
       output;
    end;
    format IncrDayVisits comma12.;
    keep ParkName DayVisits IncrDayVisits;
run;

proc sort data=IncreaseDayVisits;
    by ParkName;
run;

title1 'Years Until Northeast National Monuments Exceed 100,000 Visitors';
title2 'Based on Annual Increase of 6%';
proc print data=IncreaseDayVisits label;
    label DayVisits='Current Day Visitors'
          IncrDayVisits='Increased Day Visitors';
run;
title;
