data YearlySavings;
   Amount=200;
   do Month=1 to 12;
      Savings+Amount;
	  *add a SUM Statement;
	  Savings=Savings+(Savings*0.02/12);
	  output;
   end;
   format Savings 12.2;
run;
