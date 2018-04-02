@isTest
public class LeadCheckEmailExistsINContact {
    testMethod Static void emailTest() {
        Contact con = new Contact();
        con.LastName ='TestContact';
        Con.Email = 'abc@hotmail.com';
        Insert Con;
        Lead myLead = new Lead();
        myLead.LastName = 'test';
        myLead.Email = 'abc@hotmail.com';
        myLead.Company = 'HCL';
        Insert myLead;
        system.assertEquals('abc@hotmail.com', myLead.Email);
    }

}