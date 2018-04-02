public class PicklistwithDocGeneratePdf_con {
   Id recordid = apexpages.currentpage().getparameters().get('id');

    public list<Epic__c> lstEpic {set;
                                     get{
                                         lstEpic = [select name,id,(select id,name,Priority__c,Subject__c,Sprint__c,Description__c from work__r) from Epic__c where id =:recordid];
                                         return lstEpic;
                                     }
                                 }
    public list<Sprint__c> lstSprint {set;
                                      get{
        								lstSprint = [select name,id,(select id,name,Priority__c,Subject__c,Description__c,Epic__c from work__r) from Sprint__c where id =:recordid];
                                        return lstSprint;
                                      }
                                     }

    public PicklistwithDocGeneratePdf_con()
    {
        lstEpic = new list<Epic__c>();
        lstSprint = new list<Sprint__c>();

        /*lstEpic = new list<Epic__c>();
        system.debug('===============record id'+recordid);
        lstEpic = [select name,id,(select id,name,Priority__c,Subject__c from work__r) from Epic__c where id =:recordid];
        
        lstSprint = new list<Sprint__c>();
        lstSprint = [select name,id,(select id,name,Priority__c,Subject__c from work__r) from Sprint__c where id =:recordid];*/

    }

}