public class Wrapper_AccountsWithContacts_con {
    public list<Contact> selectedContacttRecs{set;get;}
    public list<Wrapper> wrapList {set;get;} 
    public list<Account> lstAccounts{set;get;}
    public Wrapper_AccountsWithContacts_con()
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
 //get contacts
public void selectMethod()
{
    selectedContacttRecs = new list<Contact>();
    selectedContacttRecs.clear();
    for(Wrapper ws: wraplist)
    {
       if(ws.chkbox == true)
       {
         list<Contact> lstCon = [select id,lastname,email,accountid from contact where accountid=:ws.accRec.id];
           for(Contact con :lstCon)
           {
             selectedContacttRecs.add(con);
           }
       }
       
    }

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