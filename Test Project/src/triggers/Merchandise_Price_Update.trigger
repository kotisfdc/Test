trigger Merchandise_Price_Update on Merchandise__c (before insert) {
    for(Merchandise__c mer : trigger.new) {
        if(mer.Discount_Type__c == 'Normal Price'){
          mer.Discounted_Price__c = mer.Original_Price__c;  
        } else if(mer.Discount_Type__c == 'Discount Price') {
            mer.Discounted_Price__c = mer.Original_Price__c * 0.7;
        } else if(mer.Discount_Type__c == 'Half Price') {
            mer.Discounted_Price__c = mer.Original_Price__c * 0.5;
        }
        
    }

}