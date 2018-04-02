public with sharing class CreateCandidateRecord {
    @AuraEnabled
public static void createRecord (Customer__c candidate){
        
        try{
            System.debug('CreateCandidateRecord::createRecord::candidate'+candidate);
            
            if(candidate != null){
                upsert candidate;
            }
            
        } catch (Exception ex){
            
        }
        
    }
    
 @AuraEnabled
    public static List<Customer__c> findAll() {
        return [SELECT id, name, Phone__c,Email__c,Address__c FROM Customer__c LIMIT 50];
    }  
    
     @AuraEnabled
    public static List<Customer__c> findByName( String searchKey) {
    String name = '%' + searchKey + '%';
    return [SELECT id, name, Phone__c,Email__c,Address__c FROM Customer__c WHERE name LIKE :name LIMIT 50];

    }
    
    
 @AuraEnabled
    public static void deleteData() {
        system.debug('==m here');
        try {
            List<Customer__c> evG = [SELECT id, name, Phone__c,Email__c,Address__c  FROM Customer__c  LIMIT 20];
              if(Schema.sObjectType.Customer__c.isDeletable())
            delete evG;
        } catch (Exception e) {
            throw new AuraHandledException('Unable to delete auth: ' + e.getMessage());
        }
    }
   

}