public class Lightning_searchNameAndEmail_con {
 @AuraEnabled 
 public static list<Account> getAndFunction(String aName,String aEmail)
 {
     system.debug('===name==='+aName);
     system.debug('===email==='+aEmail);

list<Account> lstAcc= new list<Account>();     
  String sql = 'Select Name,Email__c From Account WHERE Name LIKE \'%' + aName + '%\' AND Email__c LIKE \'%' + aEmail + '%\''; 
    lstAcc = database.query(sql); 
    system.debug('===result==='+lstAcc);

 return lstAcc;
     
 }
    @AuraEnabled 
 public static list<Account> getOrFunction(String aName,String aEmail)
 {
     system.debug('===name==='+aName);
     system.debug('===email==='+aEmail);

list<Account> lstAcc= new list<Account>();     
  String sql = 'Select Name,Email__c From Account WHERE Name LIKE \'%' + aName + '%\' OR Email__c LIKE \'%' + aEmail + '%\''; 
    lstAcc = database.query(sql); 
    system.debug('===result==='+lstAcc);

 return lstAcc;
     
 }
}