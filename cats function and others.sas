data storm_id;
	set pg2.storm_final;
	keep StormID: ;
	Day=StartDate-intnx('year', StartDate, 0);
	StormID1=cat(Name, Season, Day);
	StormID2=cats(Name, Season, Day);
	StormID3=catx('-', Name, Season, Day);
run;
