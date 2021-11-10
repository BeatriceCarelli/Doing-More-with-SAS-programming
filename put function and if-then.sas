proc format;
    value $region 'NA'='Atlantic'
                  'WP','EP','SP'='Pacific'
                  'NI','SI'='Indian'
                  ' '='Missing'
                  other='Unknown';
run;

data storm_summary;
    set pg2.storm_summary;
    Basin=upcase(Basin);
    *Delete the IF-THEN/ELSE statements and replace them with an assignment statement;
   /* if Basin='NA' then BasinGroup='Atlantic';
    else if Basin in ('WP','EP','SP') then BasinGroup='Pacific';
    else if Basin in ('NI','SI') then BasinGroup='Indian';
    else if Basin=' ' then BasinGroup='Missing';
    else BasinGroup='Unknown';*/
   BasinGroup=put(Basin, $region.);    /*use the put function instead if-then*/
run;
