@istest
public class AccountUpdateBatchJob_TestClass {
    testmethod static void TestAccountUpdate() {
        
        
        Account acc1 = new Account();
        acc1.Name = 'Test1';
        Insert acc1;
        
        Account acc2 = new Account();
        acc2.Name = 'Test2';
        insert acc2;
        
        test.startTest();
        AccountUpdateBatchJob obj = new AccountUpdateBatchJob();
        Database.executeBatch(obj);
        test.stopTest();

            }
}