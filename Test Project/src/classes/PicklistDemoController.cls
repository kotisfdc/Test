public class PicklistDemoController {
    @AuraEnabled
    public static list<wrapper> wrapList {set;get;}
    @AuraEnabled
    public static list<wrapper> getAccounts()
    {
        
        wrapList= new list<wrapper>();
        String type='Account';
        Map<String, Schema.SObjectType> schemaMap = Schema.getGlobalDescribe();
        Schema.SObjectType leadSchema = schemaMap.get(type);
        Map<String, Schema.SObjectField> fieldMap = leadSchema.getDescribe().fields.getMap();
        
        for (String fieldName: fieldMap.keySet()) {
            System.debug('##Field API Name='+fieldName);// list of all field API name
             wrapper w = new wrapper();
            w.LabelName = fieldMap.get(fieldName).getDescribe().getLabel();//It provides to get the object fields label.
            w.ApiName = fieldName;
            wrapList.add(w);
        }
        return wrapList;
    }
    
    
    public class wrapper{
        @AuraEnabled public String ApiName{set;get;}
        @AuraEnabled public String LabelName{set;get;}
       
    }
    
       
    
}