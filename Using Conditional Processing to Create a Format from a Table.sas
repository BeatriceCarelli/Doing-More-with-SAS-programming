
data np_lookup;
    retain FmtName $RegLbl.;
    set pg2.np_codeLookup  (rename=(Parkcode=Start));
    if Region ne ' ' then Label=Region;   /*use of if-then */
    else if Label='Unknown';
       
    keep  Start Label Region FmtName ;
run;

proc format cntlin=np_lookup;
run;

data np_endanger;
    set pg2.np_species;
    where Conservation_Status='Endangered';
    Region =put(ParkCode , $RegLbl.);
run;

title 'Number of Endangered Species by Region';
proc freq data=np_endanger;
    tables Region / nocum;
run;
title;
