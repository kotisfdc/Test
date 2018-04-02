global class CustomButtonClass {
    public List<ProcessInstanceWorkitem> workItems{set;get;}
    webservice static String PendingRecords( ) 
        {
           list<string> lstStr = new list<string>(); 
          List<ProcessInstanceWorkitem> workItems = new List<ProcessInstanceWorkitem>();
           workItems =  [SELECT Id, ProcessInstance.targetobjectId FROM ProcessInstanceWorkitem]; 
           system.debug('=============k==='+workItems);
            
           return  null;
        }
    
}