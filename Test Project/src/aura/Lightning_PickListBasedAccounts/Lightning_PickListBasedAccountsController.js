({
    doInit: function (component, event, helper) {
        var action = component.get("c.getAccountFieldValues");
        action.setCallback(this, function(a) {
            console.log(a.getReturnValue());
            component.set("v.AccountRec", a.getReturnValue());                
        });
        $A.enqueueAction(action);
    },
    
    getInput : function (component, event, helper) {
        var enterName = component.get("v.name");
        alert('enterName');
        var action = component.get("c.getSearchList");
        action.setParams({  "aName" : enterName });
        alert('enterName');
        action.setCallback(this, function(response) {
            var state = response.getState();
            console.log(state);
            if (state === "SUCCESS") {
                console.log('response===',response.getReturnValue());
                component.set("v.accounts", response.getReturnValue());
                console.log('accounts===', component.get("v.accounts"));
            }
        });
        $A.enqueueAction(action);
    },
    addNewRow : function(cmp){
        console.log('test');
        $A.createComponent(
            "c:fieldsComponent",
            {
                "AccountRec": cmp.get("v.AccountRec"),
            },
           function(newButton, status, errorMessage){
                //Add the new button to the body array
                if (status === "SUCCESS") {
                    var bdy = cmp.get("v.bdy");
                    bdy.push(newButton);
                    cmp.set("v.bdy", bdy);
                }
                
            }
        );
    },
})