@isTest
public class ContactControllerTest {
    
    //negative test for get contacts 
    testmethod static void getContacts_NegTest(){
        
        test.startTest();
        ContactController1.getContacts();
        test.stopTest();
    }
    
    //positive test for get contacts 
    testmethod static void getContacts_PosTest(){
        Contact con = new Contact();
        con.LastName='test';
        insert con;
        
        test.startTest();
        list<contact> lstcon =ContactController1.getContacts();
        test.stopTest();
        system.assertEquals(lstcon.size(), 1);
    }
    
}