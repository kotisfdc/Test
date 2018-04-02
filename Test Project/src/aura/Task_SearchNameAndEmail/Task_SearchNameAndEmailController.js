({
    onAndFunction : function(component, event, helper) {
        var selected = event.getSource().get("v.label");
        alert(selected);
        var enterName = component.get("v.name");
        alert(enterName);
        var enterEmail = component.get("v.email");
        alert(enterEmail);
        var action = component.get("c.getAndFunction");
        action.setParams({  "aName" : enterName,"aEmail" : enterEmail });
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
    onOrFunction : function(component, event, helper) {
        var selected = event.getSource().get("v.label");
        alert(selected);
        var enterName = component.get("v.name");
        alert(enterName);
        var enterEmail = component.get("v.email");
        alert(enterEmail); 
        var action = component.get("c.getOrFunction");
        action.setParams({  "aName" : enterName,"aEmail" : enterEmail });
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
        
    }
})