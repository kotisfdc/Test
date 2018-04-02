({
    doInit : function(component,event,helper){
        var action = component.get("c.getAccounts");
        console.log(action);
        action.setCallback(this, function(a) {
            console.log(a.getReturnValue());
            component.set("v.AccountRec", a.getReturnValue());
        });
        $A.enqueueAction(action);
    },
    addNewRow : function(cmp){
        var idValue = cmp.get("v.Counter");
        console.log("================cmp==========id",idValue);
        idValue++;
        console.log("================cmp==========id",idValue);
        cmp.set("v.Counter",idValue);      
        $A.createComponents([
            ["c:And_Or_ConditionComponent",{
            }],
            ["c:Lightning_FilterConditionFields",{
                "AccountRec" : cmp.get("v.AccountRec")
            }]
        ],
                            function(components, status, errorMessage){
                                if (status === "SUCCESS") {
                                    var and_or = components[0];
                                    var maincmp = components[1];
                                    var body = cmp.get("v.body");
                                    // set the body of the ui:message to be the ui:outputText
                                    body.push(and_or);
                                    body.push(maincmp);
                                    
                                    cmp.set("v.body", body);
                                    
                                }
                                else if (status === "INCOMPLETE") {
                                    console.log("No response from server or client is offline.")
                                    // Show offline error
                                }
                                    else if (status === "ERROR") {
                                        console.log("Error: " + errorMessage);
                                        // Show error message
                                    }
                            }
                           );
    },
    DelRow : function(components){
        var and_or = components[0];
        var maincmp = components[1];
        var idValue = components.get("v.Counter");
        console.log("================cmp==========id",idValue);
        idValue--;
        console.log("================cmp==========id",idValue);
        components.set("v.Counter",idValue);    
        var body = components.get("v.body");
        body.pop(and_or);
        body.pop(maincmp);
        components.set("v.body", body);  
    },
    searchParentRecord : function(component, event) {
        var ShowFieldValue = event.getParam("PassField");
        console.log("Select Field value====",ShowFieldValue);
        
        var action = component.get("c.getDataTypeValues");
        action.setParams({  "FieldName" : ShowFieldValue });
        action.setCallback(this, function(response) {
            var state = response.getState();
            console.log(state);
            if (state === "SUCCESS") {
                console.log('main component response===',response.getReturnValue());
                var selectedReturn = response.getReturnValue(); 
                console.log('main component return response===',selectedReturn);
               
               var arr = component.get("v.dataTypeStrore");
                arr.push(selectedReturn);
                component.set("v.dataTypeStrore",selectedReturn);
                console.log('===',component.get("v.dataTypeStrore"));
            }
        });
        $A.enqueueAction(action);   
        var ShowOperatorValue = event.getParam("PassOperator");
        console.log("Select Operator ==========",ShowOperatorValue);
        
        var ShowResultValue = event.getParam("PassResult");
        console.log("Enter value=========",ShowResultValue);
        
        var singleQuoteVal = '\'' + ShowResultValue+ '\'';
        console.log("single quote value========",singleQuoteVal);
        

        var idValue = component.get("v.Counter");
        var query = {
            "id" : idValue,
            "Field" : ShowFieldValue,
            "Operator" : ShowOperatorValue,
            "value" : ((component.get("v.dataTypeStrore")) == ("STRING" ||"PICKLIST") ? ShowResultValue:singleQuoteVal)
        };  
        console.log("value============",query.value);
        
        var jsonStringArr = component.get("v.queryArray");
        if(query.id !=null && query.Field !=null && query.Operator !=null && query.value !=null )
        {
            jsonStringArr.push(JSON.stringify(query));   
        }
        //jsonStringArr.push(JSON.stringify(query));
        
        console.log("jsonStringArr",jsonStringArr);
        component.set("v.queryArray",jsonStringArr);
        
    },
    
    searchAndOR : function(component, event) {
        console.log("Search search AndOR");
        var ShowAndOR = event.getParam("AndOrResult");
        component.set("v.ANDORRec",ShowAndOR);
    },
    
    SearchRecord : function(component) {
        var searchQueryArray = component.get("v.queryArray");
        var queryString = '';
        var AND_OR =  component.get("v.ANDORRec");
        for(var i=0;i<searchQueryArray.length;i++)
        {
            var queryObj =  JSON.parse(searchQueryArray[i]);
           
              queryString =  queryString + ' ' + queryObj.Field +' '+ queryObj.Operator +' '+  queryObj.value ;
            
            if(i !== searchQueryArray.length-1)
            {
                queryString = queryString +' '+ AND_OR ;
            }   
           
        }
       console.log("query string",queryString); 
        var action = component.get("c.getSearchList");
        action.setParams({"query" : queryString});
        action.setCallback(this, function(response) {
            var state = response.getState();
            console.log(state);
            if (state === "SUCCESS") {
                console.log('response===',response.getReturnValue());
                component.set("v.accounts", response.getReturnValue());
                component.set("v.Section2", true);
                console.log('=====accounts=====', component.get("v.accounts"));
            }
        });
        $A.enqueueAction(action);
    },
})