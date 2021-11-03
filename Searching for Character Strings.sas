data parks;
    set pg2.np_monthlytraffic;
    where ParkName like '%NP';
    Park=substr(ParkName, 1, find(ParkName,'NP')-2);
    Location=compbl(propcase(Location));
    Gate=tranwrd(Location, 'Traffic Count At ', ' ');
    GateCode=catx('-', ParkCode, Gate);
run;

proc print data=parks;
    var Park GateCode Month Count;
run;
