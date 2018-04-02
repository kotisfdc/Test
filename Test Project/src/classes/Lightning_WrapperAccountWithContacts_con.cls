public class Lightning_WrapperAccountWithContacts_con {
@AuraEnabled   
    public static List<WrapperAccounts> getSearchList(String aName) 
    {
        list<WrapperAccounts> WrapList = new list<WrapperAccounts>();
        list<Account>lstAcc = new list<Account>();
        String sql = 'Select Name,Email__c From Account WHERE Name LIKE \'%' + aName + '%\'';
        lstAcc = database.query(sql);
        system.debug('==========k==='+lstAcc);
        for(Account acc :lstAcc)
        {
            WrapperAccounts w = new WrapperAccounts();
            w.accRec = acc;
            w.chkbox = false;
            WrapList.add(w);
        }
        system.debug('===WrapList'+WrapList);
        return WrapList;
    }
    
    
    @AuraEnabled
    public static list<Contact> getselectedRecord(String listToSaveString) {
        
        list<Contact> lstSelect= new list<Contact>();
        List<WrapperAccounts> lstAcc = (List<WrapperAccounts>)JSON.deserialize(listToSaveString, List<WrapperAccounts>.class);
        system.debug('=======H======'+lstAcc);
        for(WrapperAccounts ws : lstAcc )
        {
            system.debug('=======ws======'+ws);
            if(ws.chkbox ==true)
            {
                system.debug('=============Record id========='+ws.accRec.id);
                 lstSelect = [Select id,Name,Email,accountid From Contact WHERE accountid=:ws.accRec.id];
                system.debug('===result======'+lstSelect);
            }
        }
        return lstSelect;
    }
    public class WrapperAccounts{
        @AuraEnabled   
        public Account accRec{set;get;}
        @AuraEnabled 
        public Boolean chkbox{set;get;}
    }
}