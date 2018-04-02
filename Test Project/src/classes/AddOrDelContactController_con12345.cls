public class AddOrDelContactController_con12345 {
    @AuraEnabled
    public static List<Contact> getContacts() {
        return [Select Id, Name, Birthdate, AccountId, Account.Name, Email, Title, Phone 
                From Contact order by LastModifiedDate desc
                limit 10];
    }
}