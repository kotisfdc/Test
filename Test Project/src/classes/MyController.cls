public class MyController {
    public string AccountName{set;get;}
    public list<account> lstAccount{set;get;}
    public List<SelectOption> getItems() 
    {
     List<SelectOption> options = new List<SelectOption>();
     options.add(new selectOption('001', '001'));
     options.add(new selectOption('002', '002'));
     options.add(new selectOption('003', '003'));
     options.add(new selectOption('004', '004'));
    
     return options;
    }
    public MyController(){
      lstAccount = new list<account>();
      AccountName = '';
    } 
public void fetchAccounts()
{
  lstAccount = [select name,id,rating,phone from account where name =:AccountName ];  
}
}