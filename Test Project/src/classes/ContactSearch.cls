public class ContactSearch {
    public static list<Contact> searchForContacts(String LastName, String MailingPostalCode)
    {
        list<Contact> lstContact= new list<Contact>();
        lstContact = [select id,name,MailingPostalCode from contact];
        return lstContact;
    }

}