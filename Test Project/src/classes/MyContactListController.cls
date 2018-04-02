public class MyContactListController {
@AuraEnabled
    public static list<Contact> getContacts(){
        return [select id,name,email,phone,title from contact];
    }
}