public class OpportunityLimit {

    public void OpportunityInsert( list<Opportunity> lo)
    {
       OpportunityInsertMethod(lo);
      
    }
     public static void OpportunityInsertMethod(list<Opportunity> lo)
     {
    map<id,opportunity>OppKey = new map<id,opportunity>();
    set<id> setAccountId = new set<id>();
    for(opportunity opp : lo)
    {
      setAccountId.add(opp.AccountId); 
    }
    list<Opportunity> lstOpp = [select id,name,accountid from opportunity where accountid =:setAccountId];
    for(Opportunity opp : lstOpp)
    {
      OppKey.put(opp.AccountId, opp);
    }
    for(Opportunity Oppnew :lo)
    {
        if(OppKey.containsKey(Oppnew.accountid))
        {
            Oppnew.addError('Account already exists Opportunity');
        }
    }
     }
}