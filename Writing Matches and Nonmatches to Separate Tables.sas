proc sort data=pg2.np_CodeLookup
          out=work.sortedCodes;
    by ParkCode;
run;

proc sort data=pg2.np_2016
          out=work.sorted_code_2016;
    by ParkCode;
run;

data work.parkStats(keep=ParkCode ParkName Year Month DayVisits)
     work.parkOther(keep=ParkCode ParkName);
    merge work.sorted_code_2016(in=inStats) work.sortedCodes;
    by ParkCode;
    if inStats=1 then output work.parkStats;
    else output work.parkOther;
run;
