({
    doInit : function(component, event, helper) {
        helper.getAccount(component);
    },
    
    
    doSomething : function(component, event, helper) {
        var lstAccounts = component.get("v.lstAccounts");
        //To check if list is not empty or null
        if(!$A.util.isEmpty(lstAccounts) && !$A.util.isUndefined(lstAccounts)){
            
            //Calling the Apex Function
            var action = component.get("c.performAction");
            //Json Encode to send the data to Apex Class
            
            var accountRecords = JSON.stringify(lstAccounts);
            console.log('accountRecords===>',accountRecords);
            //Setting the Apex Parameter
            action.setParams({
                accountRecords : accountRecords
            });
            
            //Setting the Callback
            action.setCallback(this,function(a){
                //get the response state
                var state = a.getState();
                
                //check if result is successfull
                if(state == "SUCCESS"){
                    
                    var result = a.getReturnValue();
                    //console.log('lstAcc with return values===>',result);
                    component.set("v.lstAccounts",result);
                    //console.log('lstAccounts===>',component.get("v.lstAccounts"));
                    alert('Success in calling server side action');
                    
                } else if(state == "ERROR"){
                    alert('Error in calling server side action');
                }
            });
            
            
            //adds the server-side action to the queue        
            $A.enqueueAction(action);
            
        }
    },
   checkAllCheckboxes : function(component, event, helper) {
        var checkboxes = component.find("DependentCheckbox");
        for (var i = 0; i < checkboxes.length; i++){
            checkboxes[i].set("v.value",true);
        }
    }, 
    checkNoneCheckboxes : function(component, event, helper) {
        var checkboxes = component.find("DependentCheckbox");
        for (var i = 0; i < checkboxes.length; i++){
            checkboxes[i].set("v.value",false);
        }
    }, 
})