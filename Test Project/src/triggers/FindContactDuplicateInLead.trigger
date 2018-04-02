trigger FindContactDuplicateInLead on Lead (before insert) {
    for(lead ld : trigger.new) {
        if(ld.Email != null) {
            list<Contact> lstCon = [select id from Contact where email=:ld.Email];
            if(lstCon.size()>0)
            {
              ld.Duplicate__c = lstcon[0].id;
            }
        }
    }

}