({
    AND_RadioBUTTON : function (cmp,evt) {
        console.log("AND AND OR component Value");
       var selected = evt.getSource().get("v.label");
        console.log("selected=============",selected);
        cmp.set("v.AndORAttr",selected);
        console.log("sending value=============",cmp.get("v.AndORAttr"));
        var SelectedAND_OR = cmp.get("v.AndORAttr");
        console.log("Recieving value=============",SelectedAND_OR);
        var myEvt = $A.get("e.c:And_Or_Event");
        myEvt.setParams({"AndOrResult" : SelectedAND_OR});
        myEvt.fire(); 
    },
    
})