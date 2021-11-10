proc format;
 value PSIZE low-<10000 ='Small'
             10000-<50000 ='Average'
             50000<-high ='Large';
run;

data np_parksize;
    set pg2.np_acres;
    format GrossAcres comma16.;
    ParkSize=put(GrossAcres, PSIZE.);   /* remember the . at the end of format! */ 
    keep Region Parkcode GrossAcres ParkSize;
run;
