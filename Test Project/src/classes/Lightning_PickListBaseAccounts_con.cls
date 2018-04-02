public class Lightning_PickListBaseAccounts_con {
 @AuraEnabled
 public static list<WrapperAccounts> getAccountFieldValues()
    {
        list<WrapperAccounts> WrapList = new list<WrapperAccounts>();
        String type='Account';
        Map<String, Schema.SObjectType> schemaMap = Schema.getGlobalDescribe();
        Schema.SObjectType leadSchema = schemaMap.get(type);
        Map<String, Schema.SObjectField> fieldMap = leadSchema.getDescribe().fields.getMap();
        for (String fieldName: fieldMap.keySet()) {
          WrapperAccounts w = new WrapperAccounts();
            w.ApiName = fieldName;
            w.LabelName = fieldMap.get(fieldName).getDescribe().getLabel();
            WrapList.add(w);
        }

     return WrapList;
 }
  @AuraEnabled
    public static list<Account> getSearchList(String aName)
    {
        list<Account> lstAcc = new list<Account>();
        String sql = 'Select Name,Email__c From Account WHERE Name LIKE \'%' + aName + '%\'';
        lstAcc = DataBase.query(sql);
        return lstAcc;
    }
    
    public class WrapperAccounts{
        @AuraEnabled public String ApiName {set;get;} 
        @AuraEnabled public String LabelName {set;get;}    

    }
}