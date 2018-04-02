public class Lightning_FilterCondition_con {
    @AuraEnabled
    public static list<WrapperAccounts> wrapList{set;get;} 
    @AuraEnabled
    public static list<WrapperAccounts> getAccounts()
    {
        wrapList = new list<WrapperAccounts>();
        
        String type='Account';
        Map<String, Schema.SObjectType> schemaMap = Schema.getGlobalDescribe();
        Schema.SObjectType leadSchema = schemaMap.get(type);
        Map<String, Schema.SObjectField> fieldMap = leadSchema.getDescribe().fields.getMap();
        
        
        for (String fieldName: fieldMap.keySet()) {
            //System.debug('##Field API Name='+fieldName);// list of all field API name
            WrapperAccounts w = new WrapperAccounts();
            w.ApiName = fieldName;
            W.LabelName = fieldMap.get(fieldName).getDescribe().getLabel();
            w.dataTypeValue = string.valueOf(fieldMap.get(fieldName).getDescribe().getType());
            // System.debug('#########################Field DataType=**********************'+w.dataTypeValue);// list of all field API name
            wrapList.add(W);
            
        }
        
        return wrapList;   
    }
    
    @AuraEnabled  
    public static List<Account> getSearchList (String query) {
    
        System.debug('#########################Query=**********************'+query);
        
       

        List<Account> lstAcc = new List<Account>();
        
        String sql = 'Select id,name,Phone,Rating,Email__c From Account where '+query+'';
        system.debug('=============================sql======================'+sql);
        lstAcc = database.query(sql);
        return lstAcc;
    }
    
    @AuraEnabled
    public static String getDataTypeValues(String FieldName) {
        system.debug('=====================datatype of field================='+FieldName);
        
        String type='Account';
        Map<String, Schema.SObjectType> schemaMap = Schema.getGlobalDescribe();
        Schema.SObjectType leadSchema = schemaMap.get(type);
        Map<String, Schema.SObjectField> fieldMap = leadSchema.getDescribe().fields.getMap();
        String FieldType = string.valueOf(fieldMap.get(fieldName).getDescribe().getType());
        system.debug('===================FieldType==================='+FieldType);
        return FieldType;   
    }  
    
    
    public class WrapperAccounts{
        
        @AuraEnabled public String ApiName{set;get;}
        @AuraEnabled public String LabelName{set;get;}
        @AuraEnabled public String dataTypeValue{set;get;}
        
    }
}