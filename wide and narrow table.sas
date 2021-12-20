data class_wide;
    set pg2.class_test_narrow;
    by name;
    retain Name Math Reading;
    keep Name Math Reading;
    if TestSubject="Reading" then Reading=TestScore;
    else if TestSubject="Math" then Math=TestScore;
      if last.name=1 then output;   /*Add a subsetting IF statement to include only the last row per student in the output table.*/
run;
