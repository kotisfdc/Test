trigger contactTest on Contact (before insert, before update) {
   Set<Id> accountIds = new Set<Id>();
    for(Contact con :trigger.new) {
        accountIds.add(con.AccountId);
    }
 list<Account> lstAcc = [select id, name, billingcity from Account where Id IN:accountIds];
}