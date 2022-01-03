proc print data=pg2.np_2017camping(obs=5);
run;

proc transpose data=pg2.np_2017camping 
NAME=Loacation out=work.camping2017_t (rename=(COL1=COUNT));
by ParkName;
var Tent RV;

run;
