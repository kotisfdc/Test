Public without sharing class AccountDetails 
{
    public string selectedName {set;get;}
    public List<Account> accts = new List<Account>();
    public Account matchedAccount{set;get;}
    public list<selectoption> getNames() {
        
        list<selectoption> accoptions = new list<selectoption>();
        for (account acc : [select id, name from account]){
            accoptions.add(new selectoption(acc.id, acc.name));
        }  
        return accoptions;
    } 
    /*public List<SelectOption> names
    {
        get
        {
            accts = [Select u.name, u.Id From Account u];
            
            names = new List<SelectOption>();
            
            for(Account tempacct: accts)
            {
                names.add(new SelectOption(tempacct.Id, tempacct.Name));
            }
            return names;
        }
        set;
    }
    Public AccountDetails(){
        
    }*/
    public void fetchAccount()
    {
        matchedAccount = new Account();
      matchedAccount = [select id,name,phone,rating from account where id =: selectedName] ; 
        system.debug('======accc===='+matchedAccount);
    }
    
    public PageReference renderAsPdf() {
        return Page.vftablepdf;
      	/*PageReference pageRef = new PageReference('https://www.google.com');
        pageRef.setRedirect(true);
        return pageRef;*/
   }

}