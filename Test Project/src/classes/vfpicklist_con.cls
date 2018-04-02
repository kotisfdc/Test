public class vfpicklist_con {
    public string selected{set;get;}
    public List<SelectOption> getTypes()
  {
    List<SelectOption> option=new List<SelectOption>();
    List<Account> acclst=[Select id,name from Account];
    
    option.add(new SelectOption('-None-','-None-'));
    for(Account ob:acclst)
    {
      option.add(new SelectOption(ob.id,ob.name));
    }
    
    return option;
  }
}