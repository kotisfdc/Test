public with sharing class SFDCSignuppage_con {
     @AuraEnabled
    public static list<Contact> retrieveContacts (){
        return[select FirstName,LastName,Phone,email From Contact order by createdDate DESC limit 10];
    }
    
    /*@AuraEnabled
    public static void createCon (String FirstName, String LastName, String Phone, String Email){
        Contact con = new Contact();
        con.FirstName = FirstName;
        con.LastName = LastName;
        con.Phone = Phone;
        con.Email = Email;
        insert con;
    }*/
    @AuraEnabled
    public static void createCon (Contact ConDetails){
        insert ConDetails;
    }
}