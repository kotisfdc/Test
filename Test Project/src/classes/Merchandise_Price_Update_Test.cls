@isTest
public class Merchandise_Price_Update_Test {
    testmethod static void testMerchandise_Price() {
        list<Merchandise__c> lstMerchandise = new list<Merchandise__c>();
        Merchandise__c mer1 = new Merchandise__c();
        mer1.name = 'test1';
        mer1.Discount_Type__c = 'Normal Price';
        mer1.Original_Price__c = 100;
        lstMerchandise.add(mer1);
        
        Merchandise__c mer2 = new Merchandise__c();
        mer2.name = 'test2';
        mer2.Discount_Type__c = 'Discount Price';
        mer2.Original_Price__c = 100;
        lstMerchandise.add(mer2);
        
        Merchandise__c mer3 = new Merchandise__c();
        mer3.name = 'test3';
        mer3.Discount_Type__c = 'Half Price';
        mer3.Original_Price__c = 100;
        lstMerchandise.add(mer3);
        
        insert lstMerchandise;
        
        lstMerchandise = [select id,Discounted_Price__c from Merchandise__c];
        for(Merchandise__c mer : lstMerchandise)
        {
            if(mer.id == mer1.Id)
            {
               //system.assertEquals(mer.Discounted_Price__c,100);  
            } else if(mer.id == mer2.Id){
               // system.assertEquals(mer.Discounted_Price__c,70);
            }
            else if(mer.id == mer3.Id){
                //system.assertEquals(mer.Discounted_Price__c,50);
            }
        }
    }
}