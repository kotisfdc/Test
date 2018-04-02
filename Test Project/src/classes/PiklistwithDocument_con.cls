public class PiklistwithDocument_con {
    public string SelectObject{set;get;}
    
        public boolean pb2Rendered{get;set;} // true -> show pb2
        public boolean pb3Rendered{get;set;} // true -> show pb3
    
    
    
    public List<SelectOption> getItems() {

	            List<SelectOption> options = new List<SelectOption>();
				options.add(new SelectOption('None','None'));
	            options.add(new SelectOption('Epic__c','Epic'));
	            options.add(new SelectOption('Sprint__c','Sprint'));
        	    options.add(new SelectOption('Schedule_Build__c','Schedule Build'));

	            return options;

	        }
    public list<Epic__c> lstEpicsearch{set;get;}
    
    public list<Sprint__c> lstSprintsearch{set;get;}

    public PiklistwithDocument_con()
    {
       lstEpicsearch = new list<Epic__c>(); 
      lstSprintsearch = new list<Sprint__c>();
    }
    
    public void onChangeFnCall()
    {
        if( SelectObject == 'Epic__c')
        {
            
           lstEpicsearch = [select id, name from Epic__c ]; 
            pb2Rendered = true;
	        pb3Rendered = false;

        }
        else if(SelectObject == 'Sprint__c')
        {
		lstSprintsearch = [select name from Sprint__c ]; 
          pb2Rendered = false;
	      pb3Rendered = true;
        }
        else{
	            pb2Rendered = false;
	            pb3Rendered = false;
	        }
    
    }

}