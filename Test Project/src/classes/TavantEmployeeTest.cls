@isTest
public class TavantEmployeeTest {
    testmethod Static void testAccInsert()
    {
        TavantEmployee te = new TavantEmployee();
        te.createCompany('Test');
        
    }
        //companyName  Not existing
    testmethod Static void testConInsert()
    {
        TestTestClass__c cs = new TestTestClass__c();
        cs.isTrue__c=true;
        cs.name='cssetting';
        insert cs;
        
        account acc = new account();
        acc.Name ='Test';
        insert acc;
        
        test.startTest();
        TavantEmployee te = new TavantEmployee();
        te.createEmployee('testname', 'abc@email.com', 'Test00');
        test.stopTest();

    } 
    //companyName  existing
    testmethod Static void testConInsertExistingCompany()
    {
        TestTestClass__c cs = new TestTestClass__c();
        cs.isTrue__c=true;
        cs.name='cssetting';
        insert cs;
        
        account acc = new account();
        acc.Name ='Test';
        insert acc;
        
        test.startTest();
        TavantEmployee te = new TavantEmployee();
        te.createEmployee('testname', 'abc@email.com', 'Test');
        test.stopTest();

    }
   //Custom Settings are false
    testmethod Static void testConInsertExistingCompanyCustomSettingsFalse()
    {
        TestTestClass__c cs = new TestTestClass__c();
        cs.isTrue__c=false;
        cs.name='cssettingfalse';
        insert cs;
        
        account acc = new account();
        acc.Name ='Test';
        insert acc;
        
        test.startTest();
        TavantEmployee te = new TavantEmployee();
        te.createEmployee('testname', 'abc@email.com', 'Test');
        test.stopTest();

    }  

}