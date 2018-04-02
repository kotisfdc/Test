@isTest
public class LeadStatusTestClass {
     @isTest static void testTaskPriority() {
        String pri = LeadStatus.getTaskPriority('NY');
        System.assertEquals('Normal', pri);
    }
     @isTest static void testTaskHighPriority() {
        String pri = LeadStatus.getTaskPriority('CA');
        System.assertEquals('High', pri);
    }
    /*@isTest static void testTaskPriorityInvalid() {
        String pri = LeadStatus.getTaskPriority('Montana');
        System.assertEquals(null, pri);
    }
    /*Static testMethod  void testLeadTest2() {
       String pri = LeadStatus.getTaskPriority('NY'); 
        system.assertEquals('Normal', pri);
    }*/
    /*testMethod Static void testLeadTest3() {
       String pri = LeadStatus.getTaskPriority('Montana'); 
        system.assertEquals('null', pri);
    }*/

}