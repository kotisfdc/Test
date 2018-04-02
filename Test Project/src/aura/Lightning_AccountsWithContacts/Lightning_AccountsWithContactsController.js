({
	myAction : function(component, event, helper) {
		var action = component.get("c.getAllAccounts");
        console.log(action);
         action.setCallback(this,function(a){
                //get the response state
                var state = a.getState();
                          console.log(state);
                //check if result is successfull
                if(state == "SUCCESS"){
                  var wrapdata = a.getReturnValue();
                  console.log("The wrapdata is: " ,wrapdata);
                  component.set("v.accounts",wrapdata);
                  console.log("accounts" ,component.get("v.accounts"));   
                }
        });
        $A.enqueueAction(action);
	}
})