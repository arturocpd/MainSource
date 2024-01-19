trigger ReqRevLongTrigger on copado__Pull_Request__c (before insert, before update) {

for (copado__Pull_Request__c record : Trigger.new) {

// Copy contents from copado__Requested_Reviewers__c to Requested_Reviewers_Long__c

record.Requested_Reviewers_Long__c = record.copado__Requested_Reviewers__c;

// Delete contents from copado__Requested_Reviewers__c

record.copado__Requested_Reviewers__c = null;

}

}