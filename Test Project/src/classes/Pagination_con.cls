public class Pagination_con {
    public Integer rec { get; set; }
    public Integer tot { get; set; }
    integer totalRecs = 0;
    integer count= 0;
    integer LimitSize= 5;
    
    // page number 
    public Integer x {set;get;}
    public Integer getPageNumber()
    {
        x = count/LimitSize +1;
        return x;
    }
    
  // controller   
    public Pagination_con()
    {
        tot=totalRecs = [select count() from account];
    }
    
    public list<Account> Accounts = new list<Account>();
    public list<Account> getAccounts()
    {
        list<Account> lstAcc = [select id,name,phone,rating from account LIMIT:limitsize OFFSET:count];
        return lstAcc;
    }
    
    public pagereference Firstbtn()
    {
        count=0;
        return null;
    }
    public pagereference prvbtn()
    {
        count=count-limitsize;
        return null;
    }
    public pagereference Nxtbtn()
    { 
        count=count+limitsize;
        return null;
    }
    public pagereference lstbtn()
    {
        count= totalrecs - math.mod(totalRecs,LimitSize);
        return null;
    }
    
    public Boolean getPrv() {
        if(count == 0)
            return true;
        else
            return false;
    }
    public Boolean getNxt() {
        if((count + LimitSize) > totalRecs)
            return true;
        else
            return false;
    }
}