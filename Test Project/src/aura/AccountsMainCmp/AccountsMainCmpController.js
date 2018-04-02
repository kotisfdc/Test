({
    doInit : function(component, event, helper) {
        var action = component.get("c.findAll");
        action.setCallback(this, function(a) {
            component.set("v.Accounts", a.getReturnValue());
        });
        $A.enqueueAction(action);
    },
    searchKeyChange : function(component, event, helper) {
        console.log("Search Parent");
        var searchKey = event.getParam("searchKey");
        console.log("return value",searchKey);
        var action = component.get("c.findByName");
         action.setParams({"searchKey": searchKey });
        action.setCallback(this, function(response) {
            var state = response.getState();
            console.log(state);
            if (state === "SUCCESS") {
                console.log('response===',response.getReturnValue());
                component.set("v.Accounts", response.getReturnValue());
                console.log('accounts===', component.get("v.Accounts"));
            }
        });
        $A.enqueueAction(action);  
    }
})