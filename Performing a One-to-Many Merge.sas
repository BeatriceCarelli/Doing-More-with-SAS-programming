proc sort data=pg2.np_codelookup out=work.codesort;
	by ParkCode;
run;

proc sort data=pg2.np_2016traffic (rename=(Code=ParkCode))
          out=work.traf2016Sort ;
	by ParkCode month;
run;

data WORK.TRAFFICSTATS;
     merge work.codesort work.traf2016Sort;
     by ParkCode;
     drop Name_Code;
run;
