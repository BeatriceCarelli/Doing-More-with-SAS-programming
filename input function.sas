data work.stocks2;
    set pg2.stocks2;
    Date2=input(Date,date9.); /* convert date in a number*/
    Volume2=input(Volume, comma12.);  /* convert number 5,972,252 in 5972252 */
	
run;
