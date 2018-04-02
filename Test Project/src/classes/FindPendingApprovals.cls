global class FindPendingApprovals {
    webservice static Boolean duplicateRec(id accid)
    {
        Boolean dup = false;
        list<Id>lstAccDetails = new list<Id>();
        Account lstAcc = [select id,name,rating,Email__c from account where id=:accid];
        for(ProcessInstanceWorkitem PIWI: [SELECT processInstance.targetobjectid FROM ProcessInstanceWorkitem ])
        {
            lstAccDetails.add(PIWI.processInstance.targetobjectid);   
        }
        for(Account Acc : [select id,name,rating,Email__c from account where id=:lstAccDetails])
        {
            if(Acc.Email__c == lstAcc.Email__c) 
            {
                system.debug('==========NewAccount=============='+Acc.Name);
                system.debug('==========Existing Account=============='+lstAcc.Name);
                
                return true;
            }   
        }
        return false;  
    }
    
     webservice static void submitForApproval(id accid)
     {
         Approval.ProcessSubmitRequest req1 = new Approval.ProcessSubmitRequest(); 
                 //req1.setComments('Submitting request for approval.');
                 req1.setObjectId(accid);
                 req1.setProcessDefinitionNameOrId('AccountApproval');
                 req1.setSkipEntryCriteria(false);
                 Approval.ProcessResult result = Approval.process(req1);
                 System.assert(result.isSuccess());
         
         System.assertEquals('Pending', result.getInstanceStatus(),
	            'Instance Status'+result.getInstanceStatus());
     }

}