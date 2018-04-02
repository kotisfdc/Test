public class dynamicApex5 {
    public string strChoosenFilterType{set;get;}  
    public String searchTerm {get; set;}
    public String selectedName {get; set;}

    public List<SelectOption> getTypes() {
        List<SelectOption> options = new List<SelectOption>();
        options.add(new SelectOption('---NONE---','---NONE---'));
        options.add(new SelectOption('Account','Account'));
        /*options.add(new SelectOption('opportunity','opportunity'));
        options.add(new SelectOption('case','case'));*/

        return options;
    } 
    
    // JS Remoting action called when searching for a epics
    @RemoteAction
    public static List<sObject> searchEpic(String searchTerm, String strChoosenFilterType)
    {
      System.debug('strChoosenFilterType: '+strChoosenFilterType );
      System.debug('searchTerm: '+searchTerm );
		
        if(strChoosenFilterType != '---NONE---')
        {
            String strQuery = 'Select Id, Name From '+strChoosenFilterType+ ' where name like \'%' + String.escapeSingleQuotes(searchTerm) + '%\'';
            system.debug('------------query====='+strQuery);
            //List<sObject> lstSobject= Database.query('Select Id, Name from agf__ADM_Epic__c where name like \'%' + String.escapeSingleQuotes(searchTerm) + '%\'');
            List<sObject> lstSobject= Database.query(strQuery);
            return lstSobject;
        }
       return null; 
    }
}