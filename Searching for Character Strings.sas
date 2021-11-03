data parks;
    set pg2.np_monthlytraffic;
    where ParkName like '%NP';
    Park=substr(ParkName, 1, find(ParkName,'NP')-2); 
    
    /* Use the SUBSTR function to create a new column   *;
*        named Park that reads each ParkName value and    *;
*        excludes the NP code at the end of the string.   *;
*        Note: Use the FIND function to identify the      *;
*        position number of the NP string. That value can *;
*        be used as the third argument of the SUBSTR      *;
*        function to specify how many characters to read. */

    Location=compbl(propcase(Location)); 
    
    /* Convert the Location column to proper case. Use  *;
*        the COMPBL function to remove any extra blanks   *;
*        between words */

    Gate=tranwrd(Location, 'Traffic Count At ', ' ');
    
    /* Use the TRANWRD function to create a new column  *;
*        named Gate that reads Location and converts the  *;
*        string Traffic Count At to a blank*/

    GateCode=catx('-', ParkCode, Gate);
    /* Create a new column names GateCode that          *;
*        concatenates ParkCode and Gate together with a   *;
*        single hyphen between the strings. */

run;

proc print data=parks;
    var Park GateCode Month Count;
run;
