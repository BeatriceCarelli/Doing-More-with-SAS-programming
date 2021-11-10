proc format;
value $HIGHREG 'IM'='Intermountain'
               'PW'='Pacific West'
               'SE'='Southeast'
               other ='All Other Regions';
run;

title 'High Frequency Regions';
proc freq data=pg2.np_summary order=freq;
    tables Reg;
    label Reg='Region';
    FORMAT Reg $HIGHREG. ; 
    
    /* Add a FORMAT statement to the PROC FREQ step so     *;
*      that the $HIGHREG format is applied to the Reg      *;
*     column.*/

run;
title;
