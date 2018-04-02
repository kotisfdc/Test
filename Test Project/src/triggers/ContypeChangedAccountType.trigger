trigger ContypeChangedAccountType on Contact (before insert) {
    set<Id> AccIds = new set<Id>();
    for(Contact con :trigger.new) {
        if(con.AccountId != null){
          AccIds.add(con.AccountId); 
        }
    }
    if(AccIds.size()>0) {
        map<id,Account> mapAcc = new map<id,Account>([select id, Name, Type from Account where Id IN:AccIds]);
        for(contact con :trigger.new){
            if(con.AccountId != null && mapAcc.containsKey(con.AccountId)) {
                con.Type__c = mapAcc.get(con.AccountId).Type;
            }
            
            system.assertEquals('Prospecting', mapAcc.get(con.AccountId).Type);
        }
    }
}