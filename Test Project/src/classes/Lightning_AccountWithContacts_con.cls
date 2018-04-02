public class Lightning_AccountWithContacts_con {
@auraEnabled 
    public static List<WrapperAccounts> getAllAccounts()
    {
        list<WrapperAccounts> WrapList = new list<WrapperAccounts>();
        for(Account accs:[select id,name,phone,rating from account]){
            WrapperAccounts w = new WrapperAccounts();
            w.AccRec = accs;
            w.chkbx = false;
            WrapList.add(w);
        }
        
       
        system.debug('=======kkkkkkkkkkkk====='+ WrapList);

     return WrapList;
    }
    public class WrapperAccounts{
        @AuraEnabled public Account AccRec {set;get;}
        @AuraEnabled public Boolean chkbx {set;get;}

    }
}