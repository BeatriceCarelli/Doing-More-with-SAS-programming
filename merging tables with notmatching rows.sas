proc sort data=pg2.storm_final out=storm_final_sort;
	by Season Name;
run;

data storm_damage;
	set pg2.storm_damage;
	Season=Year(date);
	Name=upcase(scan(Event, -1));
	format Date date9. Cost dollar16.;
	drop event;
run;

proc sort data=storm_damage;
	by Season Name;
run;

data damage_detail ;
	merge storm_final_sort(in=inFinal) storm_damage(in=inDamage) ;
	keep Season Name BasinName MaxWindMPH MinPressure Cost;
	*by Season Name;
	if inDamage=1 and inFinal=1 then output damage_detail;
	*Add ELSE statement;
run;

data storm_others;
    merge storm_final_sort(in=inFinal) storm_damage(in=inDamage) ;
	keep Season Name BasinName MaxWindMPH MinPressure ;
	*by Season Name;
	if inDamage=0 
	/*and inFinal=0 */
	then output storm_others;
run;
