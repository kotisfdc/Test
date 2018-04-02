@isTest
public class FindContactDuplicateInLeadTest {
    testmethod static void duplicateLeadTest() {
        Contact con = new Contact();
        con.LastName = 'testcontact';
        con.Email = 'koti.skht@gmail.com';
        insert con;
        
        Lead myLead = new Lead();
        myLead.Email = 'koti.skht@gmail.com';
        myLead.lastName = 'testlead';
        myLead.Company = 'HCL';
        insert myLead;
    }

}