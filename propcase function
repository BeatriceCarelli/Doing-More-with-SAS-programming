data weather_japan_clean;
	set pg2.weather_japan;
	Location=compbl(Location);
	City=propcase(scan(Location, 1, ','), ' ');  /*use the propcase function*/
	*Prefecture=scan(Location, 2, ',');   /* non correct */
	Prefecture=strip(scan(Location, 2, ','));   /* When the SCAN function extracts Prefecture from Location, only a comma is specified as a delimiter. The leading space is included in the returned value. 
                                                     Adding a space as a delimiter works if there are no spaces embedded in City or Prefecture. Prefecture=scan(Location, 2,', ');
                                                     The STRIP function removes leading and training blanks.*/

     	putlog Prefecture $quote20.;
	*if Prefecture="Tokyo";    /*with this condition the rows are 0*/
run;
