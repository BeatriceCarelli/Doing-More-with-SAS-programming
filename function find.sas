data storm_damage2;
	set pg2.storm_damage;
	drop Date Cost;
	CategoryLoc=find(Summary, 'category', 'I');  /* I= case insensitive*/

	if CategoryLoc > 0 then
		Category=substr(Summary, CategoryLoc, 10);

	/*create new column category, The SUBSTR function starts at the number stored in CategoryLoc and reads 10 characters, and returns the string to Category.*/
run;

proc print data=storm_damage2;
	var Event Summary Cat:;
run;
