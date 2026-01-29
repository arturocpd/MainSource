Public with sharing Class AppleWatch{
 Public Static void appleWatchmethod(list<Opportunity> lopt ){
    for (Opportunity opp : lopt) {
        Task t        = new Task();
        t.Subject     = 'Apple Watch Promo' ;
        t.Description = 'Send them one ASAP' ;
        t.Priority    = 'High' ;
        t.WhatId      = opp.Id;
      //t.Activity_Custom_field_3__c = true;
        insert t;
     /*Comment to test rollback*/
     /*Comment Test smart bug validation one more try*/
     /*Additional line in main*/
   }
  }
 }
