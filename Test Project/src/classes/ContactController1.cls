public with sharing  class ContactController1 {
    @AuraEnabled
    public static list<Contact> getContacts()
    {
        list<Contact> lstContacts= [SELECT Id, Name, MailingStreet, Phone, Email, LeadSource FROM Contact];
        if(lstContacts.size()>0) {
            return lstContacts;
        } 
        return null;
    }
    
}