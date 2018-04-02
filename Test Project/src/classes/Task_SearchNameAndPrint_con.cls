public class Task_SearchNameAndPrint_con {
    public list<Account>lstAcc{set;get;}
    public String aName{set;get;}
    public void searchByNames()
    {
      lstAcc = new list<Account>();
        
        String sql = 'Select Name From Account WHERE Name LIKE \'%' + aName + '%\'';
        
       lstAcc = database.query(sql);
        system.debug('================k==========='+lstAcc);
    }
}