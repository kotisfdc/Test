trigger oppLimit on Opportunity (before insert,before update) 
{
    /*for(opportunity op : trigger.new)
    {
      list<Opportunity> lstOpp=[select id,name,accountid from Opportunity where accountid=:op.accountid];
       if(lstOpp.size()>0)
       {
           op.addError('Already opportunity Exists containing with account name ');
       }

    }*/
    
    // Map programming
    
    /*map<id,opportunity>OppKey = new map<id,opportunity>();
    set<id> setAccountId = new set<id>();
    for(opportunity opp : trigger.new)
    {
      setAccountId.add(opp.AccountId); 
    }
    list<Opportunity> lstOpp = [select id,name,accountid from opportunity where accountid =:setAccountId];
    for(Opportunity opp : lstOpp)
    {
      OppKey.put(opp.AccountId, opp);
    }
    for(Opportunity Oppnew :trigger.new)
    {
        if(OppKey.containsKey(Oppnew.accountid))
        {
            Oppnew.addError('Account already exists Opportunity');
        }
    }*/
    
    OpportunityLimit obj = new OpportunityLimit();
    if(trigger.IsBefore && trigger.IsInsert)
    {
        obj.OpportunityInsert(trigger.new);
    }
    if(trigger.IsBefore && trigger.IsUpdate)
    {
        obj.OpportunityInsert(trigger.new);
    }
}