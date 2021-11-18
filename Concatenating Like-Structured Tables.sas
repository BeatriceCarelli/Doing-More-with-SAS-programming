data work.np_combine;
	set pg2.np_2015 pg2.np_2016;
	where Month in (6, 7, 8) and ParkCode='ACAD';
	CampTotal=sum(CampingOther, CampingTent, CampingRV, CampingBackcountry);
	format CampTotal comma10.;
	drop Camping;
run;

proc sort data=np_combine;
	by descending ParkCode year;
run;
