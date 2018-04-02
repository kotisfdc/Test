public with sharing class CreateCandidateRecord1 {
    @AuraEnabled
    public static List<Customer__c> findAll() {
        return [SELECT id, name, Phone__c,Email__c,Address__c FROM Customer__c LIMIT 50];
    }  
    
    
    @AuraEnabled
    public static void deleteData( Id recordId) {
        system.debug('=================m here'+recordId);
        try {
            List<Customer__c> evG = [SELECT id, name, Phone__c,Email__c,Address__c  FROM Customer__c where id=:recordId];
            if(Schema.sObjectType.Customer__c.isDeletable())
                delete evG;
        } catch (Exception e) {
            throw new AuraHandledException('Unable to delete auth: ' + e.getMessage());
        }
    }
    
    @AuraEnabled
    public static Customer__c getCustomer(Id recordId){
               system.debug('=================k here'+recordId);
 
        Customer__c lstCustomer = [SELECT Id, name,Email__c,Phone__c,Address__c FROM Customer__c WHERE id=:recordId];
        return lstCustomer;
        
    }
    
    @AuraEnabled
public static void createRecord(Customer__c candidate){
        
        try{
            System.debug('CreateCandidateRecord::createRecord::candidate'+candidate);
            
            if(candidate != null){
                upsert candidate;
            }
            
        } catch (Exception ex){
            
        }
    }
    
    
    @AuraEnabled
    public static List<Customer__c> findByName(String searchKey) {
        String name = '%' + searchKey + '%';
        return [SELECT Id, name,Email__c,Phone__c,Address__c FROM Customer__c WHERE name LIKE :name LIMIT 50];
    }
}