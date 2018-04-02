public class vf_AddORDelete_con {
    public list<Account>AccountAddList{set;get;}  
   // public list<Account>lstAcc {set;get;}
    
    public vf_AddORDelete_con()
    {
     //   String sql = 'SELECT Name,Phone,Rating from Account';
     //   lstAcc = database.query(sql);
        AccountAddList = new list<Account>();
        AccountAddList.add(new Account());
    }
    public void addRow()
    {
        AccountAddList.add(new Account());
        
    }
}