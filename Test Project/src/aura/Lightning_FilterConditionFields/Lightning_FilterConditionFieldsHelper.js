({
    fireEvents : function(component){
        var enterName = component.get("v.myText");
        console.log("enter value===",enterName);
        var fieldValue = component.get("v.FieldAttr");
        var opratorValue = component.get("v.OperatorAttr");
        if(fieldValue != null && opratorValue != null && enterName !=null )
        {
          var evt = $A.get("e.c:Result");
            evt.setParams({"PassResult" : enterName,"PassField" : fieldValue,"PassOperator" : opratorValue});
        evt.fire();   
        }
       
    }
})