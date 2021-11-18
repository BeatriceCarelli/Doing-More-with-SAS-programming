data class_current;
    set sashelp.class pg2.class_new2 (rename=(student=Name));  /* concatenating tables and rename one column different*/
run;

proc contents data=sashelp.class;
run;

proc contents data=pg2.class_new2;
run;
