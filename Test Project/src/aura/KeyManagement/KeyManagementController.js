({
    clickMasterKey : function(cmp) 
    {
        var action = cmp.get("c.generateMasterKey");
        action.setCallback(this, function(a) {
            if (a.getState() === "SUCCESS") {
                alert(a.getReturnValue());
                cmp.set("v.masterKey", a.getReturnValue());
                cmp.set("v.Block2", true);
                cmp.set("v.Block3", false);
            } 
        });
        $A.enqueueAction(action);
    },
    
    validateMaster : function(cmp)
    {
        var storeMasterKey = cmp.get("v.masterKey");
        console.log(storeMasterKey);
        var inputmasterKey = cmp.get("v.newMasterKey");
        console.log(inputmasterKey);
        if(storeMasterKey == inputmasterKey)
        {
            alert("both keys are equal");
            cmp.set("v.Block3", true);
            cmp.set("v.Block2", false);
            cmp.set("v.Block1", false);
            
        } else
        {
            alert("both keys are Notequal");  
        }
    },
    
    handleChange : function(cmp, event)
    {
    var changeValue = event.getParam("value");
        alert(changeValue);
        cmp.set("v.apps", changeValue);
        console.log(cmp.get("v.apps"));
    },
    
    clickUserKey : function(cmp,event) 
    {
        var Apps = cmp.get("v.apps");
        console.log("Apps====>"+Apps);
        var action = cmp.get("c.generateUserKey");
        action.setParams({apps : JSON.stringify(Apps)});
        console.log("sending applications====>"+apps);
        action.setCallback(this, function(a) {
            if (a.getState() === "SUCCESS") {
                
                alert(a.getReturnValue());
                cmp.set("v.userKey", a.getReturnValue());
                alert(a.getReturnValue());
                cmp.set("v.Block4", true);
                cmp.set("v.Block3", true);
                cmp.set("v.Block2", false);
                cmp.set("v.Block1", false);
            } 
        });
        $A.enqueueAction(action);
    },
    
    validateUser : function(cmp)
    {
        
        var storeUserKey = cmp.get("v.userKey");
        console.log(storeUserKey);
        var inputUserKey = cmp.get("v.newUserKey");
        console.log(inputUserKey);
        if(storeUserKey == inputUserKey)
        {
            alert("both keys are equal");
            cmp.set("v.Block4", true);
            cmp.set("v.Block3", true);
            cmp.set("v.Block2", false);
            cmp.set("v.Block1", false);
            
        } else
        {
            alert("both keys are Notequal");  
        }
    },
})