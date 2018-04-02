({
	searchKeyChange : function(component, event, helper) {
        var myEvent = $A.get("e.c:SearchKeyChange1");
		myEvent.setParams({"searchKey": event.target.value});
        myEvent.fire();
	}
})