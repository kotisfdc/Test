@isTest
public class Opportunity_Controller_Test {
    testmethod static void CloneTest() {
        
        Opportunity opp = new Opportunity();
        opp.Name = 'test';
        opp.StageName = 'Prospecting';
        opp.CloseDate = system.today();
        insert opp;
        
        //Create a new instance of standard controller
        ApexPages.StandardController sc = new ApexPages.standardController(opp);
        
        Opportunity_Controller controller = new Opportunity_Controller(sc);
        
        controller.cloneOpportunity();
    }
     testmethod static void CloneTest_Catch() {
        
        Opportunity opp = new Opportunity();
        opp.Name = 'test';
        opp.StageName = 'test';
        opp.CloseDate = system.today();
        insert opp;
        
        //Create a new instance of standard controller
        ApexPages.StandardController sc = new ApexPages.standardController(opp);
        
        Opportunity_Controller controller = new Opportunity_Controller(sc);
        
       // controller.cloneOpportunity();
         controller.cloneOpportunity();
    }
    
}