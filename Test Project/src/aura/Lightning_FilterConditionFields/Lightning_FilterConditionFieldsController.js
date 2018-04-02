({
    doInit : function(component, event, helper) {
        var opts = [
            { class: "optionClass", label: "--None--", value: "--None--" },
            { class: "optionClass", label: "equals", value: "equals" },
            { class: "optionClass", label: "not equal to", value: "not equal to" },
            { class: "optionClass", label: "less than", value: "less than" },
            { class: "optionClass", label: "greater than", value: "greater than" },
            { class: "optionClass", label: "less or equal", value: "less or equal" },
            { class: "optionClass", label: "greater or equal", value: "greater or equal " }
        ];
        component.find("InputSelectDynamic").set("v.options", opts);
    },
    
    //picklist values change
    onSelectChange : function(component, event, helper){
        var selectedField = component.find("levels").get("v.value");
        console.log("=======",selectedField);
        component.set("v.FieldAttr",selectedField);
        helper.fireEvents(component);
        /** Send Field Name to event**/
       /* var evt = $A.get("e.c:ResultField");
        console.log(evt);
        evt.setParams({"PassFieldName" : selectedField});
        evt.fire();*/
        
        var action = component.get("c.getDataTypeValues");
        action.setParams({  "FieldName" : selectedField });
        action.setCallback(this, function(response) {
            var state = response.getState();
            console.log(state);
            if (state === "SUCCESS") {
                console.log('response===',response.getReturnValue());
                var selectedReturn = response.getReturnValue(); 
                console.log('return response===',selectedReturn);
                if(selectedReturn === "STRING"){
                    component.set("v.isString", true);
                    component.set("v.isDate", false);
                }
                if(selectedReturn === "PICKLIST"){
                    component.set("v.isString", true);
                    component.set("v.isDate", false);
                }
                
                if(selectedReturn == 'DATE'){
                    component.set("v.isDate", true);
                    component.set("v.isString", false);  
                } 
            }
        });
        $A.enqueueAction(action);
        
    },
    //Operator values change
    onOperatorChange : function(component, event, helper) {
        var selectOperator = component.find("InputSelectDynamic").get("v.value");
        console.log("==========selectOperator============",selectOperator);
        if(selectOperator == "greater or equal")
        {
            component.set("v.operator", ">=");
            console.log(component.get("v.operator"));
            component.set("v.OperatorAttr", ">=");
        }
        if(selectOperator == "equals")
        {
            component.set("v.operator", "=");  
            console.log(component.get("v.operator"));
            component.set("v.OperatorAttr", "=");
            
        }
        if(selectOperator == "not equal to")
        { 
            component.set("v.operator", "!=");  
            console.log(component.get("v.operator"));
            component.set("v.OperatorAttr", "!=");
        }
        if(selectOperator == "less than")
        {
            component.set("v.operator", "<");  
            console.log(component.get("v.operator"));
            component.set("v.OperatorAttr", "<");
        }
        if(selectOperator == "greater than")
        {
            component.set("v.operator", ">");  
            console.log(component.get("v.operator"));
            component.set("v.OperatorAttr", ">");
        }
        if(selectOperator == "less or equal")
        {
            component.set("v.operator", "<=");  
            console.log(component.get("v.operator"));
            component.set("v.OperatorAttr", "<=");
        }
        helper.fireEvents(component);
    },
    
    //Input  values Enter
    changeInputString : function(component, event, helper) {
        //var whichOne = event.getSource().getLocalId();
        //console.log('clicked', whichOne);
       helper.fireEvents(component);
        //alert("test");
        //this.fireEvents(component);
        //console.log(this);
       /* var enterName = component.get("v.myText");
        console.log('%%%%%%%%%%%%%%%%%%Input value%%%%%%%%%%================',enterName);
        var evt = $A.get("e.c:ResultValue");
        evt.setParams({"PassInputValue" : enterName});
        evt.fire();*/
    },
    dateChange : function(component, event, helper)
    {
        var dateval= component.get("v.date");
        console.log('Hiii=======',dateval);
        component.set("v.myText",dateval);
        console.log('Return =======',component.get("v.myText"));
        helper.fireEvents(component);
    },
  
})