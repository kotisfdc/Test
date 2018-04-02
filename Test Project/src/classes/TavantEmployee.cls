public class TavantEmployee {
    //DRY
    
    public ID createCompany(string name){
        Account acc= new Account();
        acc.Name = name;
        insert acc;
        return acc.Id;
    }
    public void createEmployee( String name,String email, string companyName){
        Id compId;
        list<TestTestClass__c> csList = [Select Id, Name, isTrue__c From TestTestClass__c where isTrue__c=true Limit 1];
        if(csList.size()>0 ){
            List<account> acList = [select id,name from Account where name=:companyName limit 1];
            if(acList.size()>0  ){  
                compId =acList[0].Id;
                
            }else {
                compId = createCompany(companyName);
                
            }
        }
        else{
            
            List<account> acList = [select id,name from Account where name=:companyName limit 1];    
            compId = acList[0].Id;
        }
        
        Contact  con = new Contact();
        con.LastName = name;
        con.Email = email;
        con.AccountId = compId;
        insert con;
    }
    ID returnedId = createCompany('Tavant');
    
}