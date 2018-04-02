@isTest
public class ContypechangeAccountTypeTest {
  
    testmethod static void contactTypeTest() {
          
        Account acc = new Account();
        acc.Name = 'test';
        acc.Type = 'Accounttype';
        insert acc;
        
        Contact con = new Contact();
        con.AccountId = acc.id;
        con.LastName = 'testcontact';
        insert con;
    
    }

}