proc format;
	value $regfmt 'C'='Complete' 
	              'I'='Incomplete';
	*modify the following VALUE statement;
	value HRANGE 50-57='Below Average'
	             58-60='Average' 
	             61–70='Above Average';
run;

proc print data=pg2.class_birthdate noobs;
	where Age=12;
	var Name Registration Height;
	*add to the following FORMAT statement;
	format Registration $regfmt. Height HRANGE.;
run;
