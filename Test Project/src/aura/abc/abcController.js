({
    onSelectChange : function(component, event, helper) {
        var selected = component.find("levels").get("v.value");
        //do something else
        alert(selected);
    }

})