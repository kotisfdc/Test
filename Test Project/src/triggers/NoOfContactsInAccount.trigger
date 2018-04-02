trigger NoOfContactsInAccount on Contact (after insert,after delete,after update) {
    
    if(trigger.IsInsert && trigger.IsAfter)
    {
       NoOfContactsInAccountHandlerCls obj = new NoOfContactsInAccountHandlerCls();
        obj.onAfterInsert(Trigger.new);
    }
    
    if(trigger.IsUpdate && trigger.IsAfter)
    {
       NoOfContactsInAccountHandlerCls obj = new NoOfContactsInAccountHandlerCls();
        obj.onAfterInsert(Trigger.new);
        System.debug('trigger==='); 
    }
    
    
}