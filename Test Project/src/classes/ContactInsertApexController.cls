public with sharing class ContactInsertApexController {
    @AuraEnabled
    public static Contact CreateCon(Contact con) {
        upsert con;
        return con;
    }

}