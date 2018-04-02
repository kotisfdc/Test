({
	create : function(component, event, helper) {
       var candidate = component.get("v.candidate");
        var action = component.get("c.createRecord");
		action.setParams({
            candidate : candidate
        });
		action.setCallback(this,function(a){
         var state = a.getState();
          if(state == "SUCCESS"){
         var newCandidate = {'sobjectType': 'Customer__c',
                                    'Name': '',
                                    'Phone__c': '',
                                    'Email__c': '', 
                                    'Address__c': ''
                                   };
         component.set("v.candidate",newCandidate);
         alert('Record is Created Successfully');
        }else if(state == "ERROR"){
                alert('Error in calling server side action');
            }

	});
$A.enqueueAction(action);

    }
})