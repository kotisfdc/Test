@isTest
public class AccountDeleteTest {
    @isTest static void TestDeleteAccountWithOneOpportunity() {
      
        Account Acc = new Account();
        Acc.Name ='Test';
        insert Acc;
        
        Opportunity Opp = new Opportunity();
        Opp.AccountId = Acc.Id;
        Opp.StageName = 'Prospecting';
        Opp.Amount =10000;
        Opp.Name = 'TestOpp';
        Opp.CloseDate = system.today();
        insert Opp;
        test.startTest();
        Database.DeleteResult result = Database.delete(Acc, false);

        test.stopTest();
       /* system.assert(!result.isSuccess());
        system.assert(result.getErrors().size()>0);
        system.assertEquals('Cannot delete account with related opportunities.', result.getErrors()[0].getMessage());*/

        
    }


}