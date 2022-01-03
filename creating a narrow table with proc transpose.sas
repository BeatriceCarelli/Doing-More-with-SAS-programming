title "Storm Wide";
proc print data=pg2.storm_top4_wide(obs=5);
run;

proc transpose data=pg2.storm_top4_wide out=storm_top4_narrow;
	by Season Basin Name;
	*Add a VAR statement;
	var Wind1 Wind2;
run;

title "Storm Narrow";
proc print data=storm_top4_narrow(obs=10);
run;
title;
