/*Create the $SBFMT format for subbasin codes*/
data sbdata;
    retain FmtName '$sbfmt';
    set pg2.storm_subbasincodes(rename=(Sub_Basin=Start 
                                        SubBasin_Name=Label));
    keep Start Label FmtName;
run;

proc format cntlin=sbdata;
run;

/*Create the CATFMT format for storm categories*/
data catdata;
    retain FmtName "catfmt";
    set pg2.storm_categories(rename=(Low=Start 
                                     High=End
                                     Category=Label));
    keep FmtName Start End Label;
run;

*proc format cntlin=catdata;
*run;

proc format fmtlib library=work;
 select $sbfmt catfmt;
run;
