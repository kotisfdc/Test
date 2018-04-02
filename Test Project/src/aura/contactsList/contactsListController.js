({
    doInit : function(component, event, helper) {
        helper.loadContacts(component);
    },
    
    handleSelect : function(component, event, helper)
    {
        var contacts = component.get("v.contacts");
        var contactList = component.get("v.contactList");
        
        var selected = event.getSource().get("v.value");
        
        var filter = [];
        for (var i=0; i<contactList.length; i++){
            var c = contactList[i];
            if (selected != "All"){
                if(c.LeadSource == selected) {
                    filter[i] = c;
                }
            }
            else {
                filter = contactList;
            }
        }
        component.set("v.contacts", filter);
        helper.updateTotal(component);
        
    }
})