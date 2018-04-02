({
    deleteContact : function(component, event, helper) {
        alert("listItem");
        var event = component.getEvent("deleteContact");
        event.setParams({
            'selectedContact':component.get("v.contactRec")
        });
        event.fire();
    }
})