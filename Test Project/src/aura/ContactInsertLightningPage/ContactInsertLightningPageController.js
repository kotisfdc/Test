({
	createContact : function(cmp) {
        var newCon = cmp.get("v.newContact");
        var action = cmp.get("c.CreateCon");
        action.setParams({"con" : newCon});
        action.setCallback(this, function(a) {
           var state = a.getState();
            if (state === "SUCCESS") {
               alert("Record is Created Successfully");
                location.reload(true);
            }
        });
    $A.enqueueAction(action)
	}
})