({
    doInit : function(component, event, helper) {
        var action = component.get("c.findAll");
        action.setCallback(this, function(a) {
            console.log("=======return values",a.getReturnValue());
            component.set("v.Customer", a.getReturnValue());
        });
        $A.enqueueAction(action);
    }
})