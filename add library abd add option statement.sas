proc format /*add a LIBRARY= option*/ library=pg2.formats;
	value $reg 'C'='Complete' 
	           'I'='Incomplete'
	            other='Miscoded';
	value hght low-<58='Below Average' 
          58-60='Average'
	      60<-high='Above Average';
run;

*add an OPTIONS statement;
options fmtsearch=(pg2.formats sashelp);

proc print data=pg2.class_birthdate noobs;
	where Age=12;
	var Name Registration Height;
	format Registration $reg. Height hght.;
run;
