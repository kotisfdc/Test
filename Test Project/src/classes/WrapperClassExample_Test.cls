@isTest
public class WrapperClassExample_Test {
    //test setup method 
    @testSetup static void methodName() {
        Contact con = new Contact();
        con.LastName ='Test';
        con.Phone = '7702467702';
        insert con;
    }
    //This method  for initialization
    testmethod static void testCheckboxWrapperCheckbox_False(){
        test.startTest();
        WrapperClassExample wc = new WrapperClassExample();
        test.stopTest();
    }
    //This method  for checkbox is true
    testmethod static void testCheckboxWrapperCheckbox_True(){
        
        WrapperClassExample wc = new WrapperClassExample();
        WrapperClassExample.wrap wp = new WrapperClassExample.wrap();
        list<WrapperClassExample.wrap> lstWp = new list<WrapperClassExample.wrap>();
        wp.chkbox = true;
        lstWp.add(wp);
        wc.wrapList = lstWp;
        test.startTest();
        wc.SelectContact();
        test.stopTest();
    }
    
}