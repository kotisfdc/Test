({
    deleteContact : function(component, event, helper) {
        var contact = component.get("v.contacts");
        console.log(contact);
        var event1 = component.getEvent("deleteContact");
        console.log("events===="+event1);
        event1.setParams({
            'contact':contact
        }).fire();
    }
})