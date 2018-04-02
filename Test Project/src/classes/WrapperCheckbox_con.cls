public class WrapperCheckbox_con {
    public list<Account> selectedAccountRecs{set;get;								}
    public list<Wrapper> wrapList {set;get;} 
    
    public list<Account> lstAccounts{set;get;}
public WrapperCheckbox_con()
{
    wraplist = new list<Wrapper>();
    lstAccounts = new list<Account>();
    lstAccounts = [select id,name,rating,phone from account limit 10];
   for(Account acc:lstAccounts )
   {
    Wrapper w =new Wrapper(acc);
    //w.accRec = ;
    //w.chkbox = false;
    wraplist.add(w);
}
}
    // Button method
   public PageReference  selectMethod()
   {
    selectedAccountRecs = new list<account>();   
       selectedAccountRecs.clear();
       for( Wrapper ws: wrapList)
       {
           if(ws.chkbox == true)
           {
            selectedAccountRecs.add(ws.accRec);
               system.debug('=========id======'+ws.accRec.id);
            PageReference acctPage = new PageReference('/'+ws.accRec.id+'/e?retURL=%2Fa'+ws.accRec.id);
                acctPage.setRedirect(true);
               return acctPage;
           }
       }
       return null;
   }
    
    
    // wrapper class
    public class Wrapper{
        public account accRec {set;get;}
        public boolean  chkbox {set;get;}
        public Wrapper( account acc){
            accRec = acc;
            chkbox = false;
        }
    }
}