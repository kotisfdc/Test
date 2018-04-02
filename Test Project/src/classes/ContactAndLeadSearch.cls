public class ContactAndLeadSearch {
    public static list<list<sObject>> searchContactsAndLeads( String text)
    {
        list<list<Sobject>> searchlist = [find :text IN All Fields returning contact(FirstName,LastName),lead(FirstName,LastName)];
       
        system.debug('=========='+searchlist);
        return searchlist;  
    }

}