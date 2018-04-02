({
    doInit : function(component,event,helper){
        var action = component.get("c.getAccounts");
                    console.log(action);

        action.setCallback(this, function(a) {
            console.log(a.getReturnValue());
            component.set("v.AccountRec", a.getReturnValue());                
        });
        $A.enqueueAction(action);
        
        var opts = [
            { value: "", label: "Select Operator" },
			{ value: "Equal", label: "Equal" },
			{ value: "NotEqual", label: "NotEqual" },
        	{ value: "greaterthan", label: "greaterthan" },
            { value: "lessthan", label: "lessthan" },

];
				component.set("v.options", opts);

   },
    
})