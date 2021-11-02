data storm_id;
	set pg2.storm_final;
	keep StormID: ;
	Day=StartDate-intnx('year', StartDate, 0);
	StormID1=cat(Name, Season, Day); /* concatenates strings, does not remove or trailing blanks */
	StormID2=cats(Name, Season, Day); /*Concatenates strings together, removes leading or trailing blanks from each string.*/
	StormID3=catx('-', Name, Season, Day); /*Concatenates strings together, removes leading or trailing blanks from each string, 
	                                         and inserts the delimiter between each string.*/
run;
