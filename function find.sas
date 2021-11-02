data storm_damage2;
	set pg2.storm_damage;
	drop Date Cost;
	CategoryLoc=find(Summary, 'category', 'I');

	if CategoryLoc > 0 then
		Category=substr(Summary, CategoryLoc, 10);

	/*crea una nuova colonna category*/
run;

proc print data=storm_damage2;
	var Event Summary Cat:;
run;
