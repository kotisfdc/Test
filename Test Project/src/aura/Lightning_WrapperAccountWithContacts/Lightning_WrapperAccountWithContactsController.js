({
    getInput : function(component, event) {
        var enterName = component.get("v.name");
        var action = component.get("c.getSearchList");
        action.setParams({  "aName" : enterName });
        action.setCallback(this, function(response) {
            var state = response.getState();
            console.log(state)
            if (state === "SUCCESS") {
                console.log('response===',response.getReturnValue());
                component.set("v.accounts", response.getReturnValue());
                console.log('accounts===', component.get("v.accounts"));
            }
        });
        $A.enqueueAction(action);
    },
    getAccountEmail : function(component, event){
        var accdetails = component.get("v.accounts");
        var action = component.get("c.getselectedRecord");
        console.log('accdetails',JSON.stringify(accdetails));
        action.setParams({
            "listToSaveString" : JSON.stringify(accdetails),
        });
        action.setCallback(this,function(a){
            //get the response state
            var state = a.getState();
            
            //check if result is successfull
            if(state == "SUCCESS"){
                console.log(a.getReturnValue());
                component.set("v.selectAccounts", a.getReturnValue());
                console.log('selected accounts===', component.get("v.selectAccounts"));
               alert('Success ');

            } else if(state == "ERROR"){
                alert('Error in calling server side action');
            }
        });
        $A.enqueueAction(action);
        
    }
})