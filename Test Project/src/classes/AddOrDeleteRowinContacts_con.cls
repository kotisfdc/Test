public class AddOrDeleteRowinContacts_con {
    @AuraEnabled
    public static List<Contact> getContacts() {
        return [Select Id, Name, Birthdate, AccountId, Account.Name, Email, Title, Phone 
                From Contact order by LastModifiedDate desc
                limit 10];
    }
    @AuraEnabled
    public static Contact deleteContact(Contact contact) {
        // Perform isDeletable() check here 
        delete contact;
        return contact;
    }
}