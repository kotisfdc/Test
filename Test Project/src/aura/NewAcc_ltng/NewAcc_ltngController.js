({
    doInit : function(component, event) {
        var action = component.get("c.getAccounts");
        action.setCallback(this, function(a) {
            component.set("v.accounts", a.getReturnValue());
        });
        $A.enqueueAction(action);
    }
})