public class DisplayAccWithCheckBoxLtng {
    @AuraEnabled
    public static List<CommonWrapperClass.DisplayAccountRecords> getAccountRecords() {
        
        List<CommonWrapperClass.DisplayAccountRecords> lstAccountRecords = new List<CommonWrapperClass.DisplayAccountRecords>();
        
        List<Account> lstAccounts =  [SELECT Id, Name, Rating
                                      FROM Account Where Rating IN('Hot','Warm','cold') limit 5];
        
        if(lstAccounts != null && lstAccounts.size() > 0){
            
            for(Account account : lstAccounts){
                CommonWrapperClass.DisplayAccountRecords accountRecord = new CommonWrapperClass.DisplayAccountRecords();
                List<Custom_Account__c> lstCA = [Select id from Custom_Account__c where Parent_Account__c =:account.Id];
                if(lstCA.size()> 0)
                {
                    accountRecord.isSelected =true;
                    accountRecord.accountId = account.Id;
                    accountRecord.Name= account.Name;
                    accountRecord.rating = account.rating;
                    
                    lstAccountRecords.add(accountRecord);
                }
                else
                {
                accountRecord.isSelected =false;
                accountRecord.accountId = account.Id;
                accountRecord.Name= account.Name;
                accountRecord.rating = account.rating;
                
                lstAccountRecords.add(accountRecord);
                }
            }
            
        }
        System.debug('Initialisation list===>'+lstAccountRecords);
        return lstAccountRecords;
        
    }
    @AuraEnabled
    public static List<CommonWrapperClass.DisplayAccountRecords> performAction(String accountRecords) 
    {
        List<CommonWrapperClass.DisplayAccountRecords> updtAccountRecords = 
            new List<CommonWrapperClass.DisplayAccountRecords>();
        if(!string.isBlank(accountRecords)){
            
            List<CommonWrapperClass.DisplayAccountRecords> lstAccountRecords = (List<CommonWrapperClass.DisplayAccountRecords>)
                System.JSON.deserialize(accountRecords,List<CommonWrapperClass.DisplayAccountRecords>.class);
            system.debug('Debug for Dsiplaying all the records : lstAccountRecords'+lstAccountRecords);    
            //Perform Operation with records 
            for(CommonWrapperClass.DisplayAccountRecords objPositionRecords:lstAccountRecords)
            {
                updtAccountRecords.add(objPositionRecords);
                if(objPositionRecords.isSelected == true)
                {
                    //Play with selected Records here                   
                    system.debug('Selected Record====>:'+objPositionRecords.accountId);
                    Custom_Account__c CA = new Custom_Account__c();
                    CA.Name = objPositionRecords.Name;
                    CA.Rating__c = objPositionRecords.rating;
                    CA.Parent_Account__c = objPositionRecords.accountId;
                    Upsert CA;
                    //system.debug('Inserted record===>'+CA);
                }
                else
                {
                  List<Custom_Account__c> lca = [select id from Custom_Account__c where Parent_Account__c =:objPositionRecords.accountId];
                    delete lca;
                }
            } 
        }
        system.debug('updtAccountRecords====>'+updtAccountRecords);
        return updtAccountRecords;   
    }
}