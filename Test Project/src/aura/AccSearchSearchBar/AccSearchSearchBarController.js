({
	searchKeyChange : function(component, event, helper) {
        var searchName = component.get("v.myText");
        console.log(searchName);
        var evt = $A.get("e.c:SearchValue");
        console.log("event pass",+evt);
        evt.setParams({"searchKey": searchName })
        evt.fire();
	},
})