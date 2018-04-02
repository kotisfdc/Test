public class Contact_AddOrDel_con {
    public list<Contact>AddConList{set;get;}
    public Integer rowNum{get;set;}
    public Contact_AddOrDel_con()
    {
        AddConList = new list<Contact>();
        AddConList.add(new Contact());
    }
    public void addRow()
    {
        AddConList.add(new Contact());
        
    }
     public void delRow()
    {
        rowNum = Integer.valueOf(apexpages.currentpage().getparameters().get('index'));
        AddConList.remove(rowNum);   
    }
}