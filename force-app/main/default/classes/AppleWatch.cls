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
     /*Comment to test smart resolved in 2nd gen*/
     /*Comment MOD 4th try here resolved Manually*/
   }
  }
 }
