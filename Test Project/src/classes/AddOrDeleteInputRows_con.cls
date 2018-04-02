public class AddOrDeleteInputRows_con {
    @AuraEnabled
    public static List<Contact> getContacts() {
        return [Select Id, Name, Birthdate, AccountId, Account.Name, Email, Title, Phone 
                From Contact limit 10];
    }
}