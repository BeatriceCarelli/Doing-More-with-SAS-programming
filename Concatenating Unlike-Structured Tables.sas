data work.np_combine;
    set pg2.np_2015 pg2.np_2016 pg2.np_2014 (rename=(Park=ParkCode Type=ParkType));
    CampTotal=sum(of Camping:);
    where Month in(6, 7, 8) and ParkType='National Park' and ParkCode='ACAD';
    format CampTotal comma15.;
    drop Camping:;
run;

proc sort data=np_combine;
	by descending  ParkType ParkCode Year Month;
run;
