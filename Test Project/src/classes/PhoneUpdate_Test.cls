@isTest
public class PhoneUpdate_Test {
    testmethod static void validPhone()
    {
        Account acc = new Account();
        acc.Name = 'Raghava';
        acc.Industry = 'Banking';
        insert acc;
        Account a =[select id,name,industry,phone from account where id=:acc.Id];
        //system.assertEquals(a.Phone, '9999');
    }

}