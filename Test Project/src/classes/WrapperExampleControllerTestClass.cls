@isTest
public class WrapperExampleControllerTestClass {
    static testMethod void accountListTest() {
        List<Account> lstAcc = new List<Account>();
        Account Acc = new Account();
        Acc.Name='Test1';
        Acc.Rating ='Hot';
        lstAcc.add(Acc);
        
        Account Acc1 = new Account();
        Acc1.Name='Test1';
        Acc1.Rating ='Hot';
        lstAcc.add(Acc1);
        
        Account Acc2 = new Account();
        Acc2.Name='Test1';
        Acc2.Rating ='Hot';
        lstAcc.add(Acc2);
        
        insert lstAcc;
        
        list<Account> lstAccounts= [SELECT id, Name FROM Account where Rating = 'Hot'];
        test.startTest();
        WrapperExampleController obj = new WrapperExampleController();
        obj.getAccounts();
        test.stopTest();
    }
    static testMethod void getHeaderTest() {
        WrapperExampleController obj = new WrapperExampleController();
        obj.getHeadWrap();
    }
    static testMethod String valueAddTest() {
        String str='TEST';
        WrapperExampleController.RowWrapper obj = new WrapperExampleController.RowWrapper();
        obj.addValue(str);
        return str;
    }
    
    static testMethod void getRowWrappersTest() {
        WrapperExampleController obj = new WrapperExampleController();
        obj.getRowWrappers();
    }
    static testMethod void getRowWrappersTest2() {
        List<Account> lstAcc = [select id, name from Account where rating ='Hot'];
        WrapperExampleController obj = new WrapperExampleController();
        obj.getRowWrappers();
    }
}