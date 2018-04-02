public with sharing class NoOfContactsInAccountHandlerCls {
    public  void onAfterInsert(List <Contact> conList){
        Set<Id> accIds  = new Set<Id>();
        for (Contact c: conList)  {
            accIds.add(c.AccountId);
        }
        Map<id,Account> mapAcc = new Map<id,Account>([Select Name,number_of_contacts__c,(Select Id from Contacts)  from Account WHERE Id in: accIds ]);
        for (Account a: mapAcc.values()) {
            mapAcc.get(a.Id).number_of_contacts__c =a.Contacts.size();
            System.debug('Number of contacts:'+mapAcc.get(a.Id).number_of_contacts__c); 
            
        }
        update mapAcc.values();   
        
    }
}