({
    doInit : function(component, event, helper) {
        var action = component.get("c.getContacts");
        action.setCallback(this, function(data) {
            console.log(data.getReturnValue());
            component.set("v.contacts", data.getReturnValue());
        });
        $A.enqueueAction(action);
    }
    ,
    addContact : function(component, event, helper){
       var contacts = component.get("v.contacts");
        alert(contacts);
        var len = contacts.length;
         alert(len);

        contacts.push({
            'Name':'Test Contact - '+len,
            'Phone':'123'+len
        });
        component.set("v.contacts",contacts);
    }
    ,
    removeContact : function(component, event, helper){
       var selCont = event.getParam("selectedContact");
       var contacts = component.get("v.contacts")
       var index = contacts.indexOf(selCont);
       if (index > -1) {
            contacts.splice(index, 1);
       }
       component.set("v.contacts",contacts);
    },
    deleteContact : function(component, event, helper) {
        var event = component.getEvent("deleteContact");
        event.setParams({
            'selectedContact':component.get("v.contactRec")
        });
        event.fire();
    }
})