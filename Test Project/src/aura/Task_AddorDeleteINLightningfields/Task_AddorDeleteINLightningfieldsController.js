({
    DelRow : function(cmp){
        //alert(contacts);
        var body = cmp.get("v.body");
        body.pop();
        cmp.set("v.body", body);
    }
})