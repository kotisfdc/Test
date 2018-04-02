({
    doInit: function(cmp)
    {
        var cnts = cmp.get("v.contacts");
        cmp.set("v.contacts", cnts);
    },
    
    addNewRow : function(cmp){
        var count = cmp.get("v.countAura");
        count++;
        var AuraId = 'count'+count;
        $A.createComponent(
            "c:Task_AddorDeleteINLightningfields",
            {
                "contactsRec": cmp.get("v.contacts"),
                "auraId" : AuraId,
            },
            function(newButton, status, errorMessage){
                //Add the new button to the body array
                if (status === "SUCCESS") {
                    var body = cmp.get("v.body");
                    body.push(newButton);
                    cmp.set("v.body", body);
                }
            }
        );
        cmp.set("v.countAura",count)
    },
   
})