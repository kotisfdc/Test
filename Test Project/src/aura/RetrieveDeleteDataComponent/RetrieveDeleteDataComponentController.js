{
    doInit : function(component, event) {
        var action = component.get("c.findAll");
        action.setCallback(this, function(a) {
            component.set("v.Customer", a.getReturnValue());
           
        });
        $A.enqueueAction(action);
    },
        //Delete function
        delete : function(component){
            var action = component.get("c.deleteData");
            //var recordId = component.get("v.recordId");
            
            var entryId = event.currentTarget.id;
            var entryId1 = event.target;
            
            console.log(entryId);
            action.setParams({
                "recordId" : entryId
            })
            action.setCallback(this, function(response){
                var state = response.getState();
                if (state === "SUCCESS") {
                    component.set("v.Customer", response.getReturnValue());
                    alert('Record deleted SuccessFully');
                    window.location.reload();
                }
            });
            $A.enqueueAction(action);
        },
            //edit function         
            edit : function(component) {
                var action = component.get("c.getCustomer");
                var entryId = event.currentTarget.id;
                console.log(entryId);
                action.setParams({
                    "recordId" : entryId
                })
                action.setCallback(this, function(response) {
                    var state = response.getState();
                    if(component.isValid() && state == "SUCCESS"){
                        var c = response.getReturnValue();
                        component.set("v.Customer1", c);
                        component.set("v.Customer", c);
                        component.set("v.sec1", false);
                        component.set("v.sec2", true);
                        
                        alert('Are you Update Record');           
                        
                    } else {
                        console.log('There was a problem : '+response.getError());
                    }
                });
                $A.enqueueAction(action);
            },
                
                //Update
                updateDetails : function(component, event, helper) {
                    var cand = component.get("v.Customer1");
                    console.log('=======k',cand);
                    var action = component.get("c.createRecord");
                    action.setParams({
                        candidate : cand
                    });
                    action.setCallback(this,function(a){
                        var state = a.getState();
                        if(state == "SUCCESS"){
                            var newCandidate = {'sobjectType': 'Customer__c',
                                                'Name': '',
                                                'Phone__c': '',
                                                'Email__c': '', 
                                                'Address__c': ''
                                               };
                            component.set("v.Customer1",newCandidate);
                            window.location.reload();
                            
                            alert('Record is Updated Successfully');
                        }else if(state == "ERROR"){
                            alert('Error in calling server side action');
                        }
                        
                    });
                    $A.enqueueAction(action);
                    
                },
                    
                    /*create a record */
                    
                    new : function(component, event, helper) {
                        component.set("v.sec1", false);
                        component.set("v.sec2", false);
                        component.set("v.sec3", true);
                    },
                        
                        create : function(component, event, helper) {
                            var cand = component.get("v.Customer2");
                            console.log('=======k',cand);
                            var action = component.get("c.createRecord");
                            action.setParams({
                                candidate : cand
                            });
                            action.setCallback(this,function(a){
                                var state = a.getState();
                                if(state == "SUCCESS"){
                                    var newCandidate = {'sobjectType': 'Customer__c',
                                                        'Name': '',
                                                        'Phone__c': '',
                                                        'Email__c': '', 
                                                        'Address__c': ''
                                                       };
                                    component.set("v.Customer2",newCandidate);
                                    window.location.reload();
                                    
                                    alert('Record is Updated Successfully');
                                }else if(state == "ERROR"){
                                    alert('Error in calling server side action');
                                }
                                
                            });
                            $A.enqueueAction(action);
                            
                        },
                            
                            
                            //searchkey function
                            searchKeyChange: function(component, event) {
                                var searchKey = event.getParam("searchKey");
                                var action = component.get("c.findByName");
                                action.setParams({
                                    "searchKey": searchKey
                                });
                                action.setCallback(this, function(a) {
                                    component.set("v.Customer", a.getReturnValue());
                                });
                                $A.enqueueAction(action);
                            }
    
})