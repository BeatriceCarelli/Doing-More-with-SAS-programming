/*Add a RENAME= data set option to the SET         *;
*        statement to rename the ParkCode column to Start *;
*        and the Type column to Label*/

data type_lookup  ;
/* create the FmtName column with a value of  $TypeFmt */
    retain FmtName $TypeFmtM.; 
    set pg2.np_codeLookup (rename =(Parkcode=Start Type=Label));
    keep Start Label FmtName;
run;

/*In the PROC FORMAT statement, add a CNTLIN= option  *;
*     to build a format from the type_lookup table*/
proc format ctnlin=type_lookup;
run;

title 'Traffic Statistics';
proc means data=pg2.np_monthlyTraffic maxdec=0 mean sum nonobs;
    var Count;
    class ParkCode Month;
    label ParkCode='Name';
/*    add a FORMAT statement so   *;
*     that the $TypeFmt format is applied to the ParkCode *;
*     column.      */           
    format Parkcode $TypeFmt. ;
run;
title;
