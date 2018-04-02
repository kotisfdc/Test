trigger amountupdt on Account (after insert) {
    
    for(account a: trigger.new)
    {
        if(a.amount__c>=5000)
        {
            insert a;
        }
            }

}