({
    doInit : function(cmp) {
        var action = cmp.get("c.retrieveContacts");
        action.setCallback(this, function(a) {
            cmp.set("v.lstContacts", a.getReturnValue());
        });
        $A.enqueueAction(action);
    },
    createContact : function(cmp) {
        /*var fName = document.getElementById("fnameId").value;
        var lName = document.getElementById("lnameId").value;
        var email = document.getElementById("emailId").value;
        var phone = document.getElementById("phoneId").value;*/
        
        var ContactJSON = cmp.get("v.newContact");
       console.log('======contact details====',ContactJSON);
        var action = cmp.get("c.createCon");
        action.setParams({"ConDetails" :ContactJSON});
         action.setCallback(this, function(a) {
           var state = a.getState();
            if (state === "SUCCESS") {
               alert("Record is Created Successfully");
                location.reload(true);
            }
        });
         $A.enqueueAction(action);
        
    }
})