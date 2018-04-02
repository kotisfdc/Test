public with sharing class countcontactsacctrigger {
    public void InsertMethod(list<Contact> lstContacts)
    {
        RollUpSummary(lstContacts);
    }
    public static void RollUpSummary(list<Contact> lstContacts)
    {
        list<account> lstAccount = new list<account>();
        map<id,integer>MapCount = new map<id,integer>();
        integer Count = 1;
        set<id> SetAccountIDs = new set<id>();
       for(Contact con : lstContacts)
       {
         SetAccountIDs.add(con.AccountId);  
       }
        for(contact con : [select id,accountid from contact where accountid IN: SetAccountIDs])
        {
            if(MapCount.containsKey(con.AccountId)){
               Count++;   
              MapCount.put(con.AccountId, Count);
            }
            else
            {
              MapCount.put(con.AccountId, Count);  
            }
        }
        for(account acc : [select id,name from account where ID IN: MapCount.keySet()])
        {
          acc.number_of_contacts__c = MapCount.get(acc.Id);
           lstAccount.add(acc);
        }
        if(lstAccount.size()>0)
            update lstAccount;
   }
      public void DeleteMethod(list<Contact> lstContacts)
      {
        RollUpSummary2(lstContacts);
  
      }
  public static void RollUpSummary2(list<Contact> lstContacts)
    {
        list<account> lstAccount = new list<account>();
        map<id,integer>MapCount = new map<id,integer>();
        integer Count = 1;
        set<id> SetAccountIDs = new set<id>();
       for(Contact con : lstContacts)
       {
         SetAccountIDs.add(con.AccountId);  
       }
        for(contact con : [select id,accountid from contact where accountid IN: SetAccountIDs])
        {
            if(MapCount.containsKey(con.AccountId)){
               Count++;   
              MapCount.put(con.AccountId, Count);
            }
            else
            {
              MapCount.put(con.AccountId, Count);  
            }
        }
        for(account acc : [select id,name from account where ID IN: MapCount.keySet()])
        {
          acc.number_of_contacts__c = MapCount.get(acc.Id);
           lstAccount.add(acc);
        }
        if(lstAccount.size()>0)
            update lstAccount;
   }
    
}