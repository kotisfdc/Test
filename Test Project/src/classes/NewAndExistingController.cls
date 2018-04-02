public class NewAndExistingController {
    
    public Account account{set;get;}
    public NewAndExistingController()
    {
       Id id = ApexPages.currentPage().getParameters().get('id');
        account =(Id==null)? new Account():[select id,name,phone,industry from account where Id =:id];
    }
    
    public pagereference save()
    {
        try
        {
            upsert account;
        }catch(system.DmlException e)
        {
          ApexPages.addMessages(e);
	            return null;   
        }
PageReference redirectSuccess = new ApexPages.StandardController(Account).view();
	        return (redirectSuccess);   
    }
    

}