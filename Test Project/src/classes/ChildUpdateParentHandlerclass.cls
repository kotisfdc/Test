public class ChildUpdateParentHandlerclass {
    public void UpdateParent(list<Contact> lstContacts)
    {
        ChildUpdateParent(lstContacts);
    }
    public static void ChildUpdateParent(list<Contact> lstContacts)
    {
        list<account> lstaccupdt = new list<account>();
    map<id,string> MapCon = new map<id,string>();
    set<id> AccountIds = new set<id>();
    for(Contact con :lstContacts)
    {
       AccountIds.add(con.AccountId);
    }
    for(Contact con:[select id,accountid,phone from contact where accountid IN :AccountIds ])
    {
        MapCon.put(con.AccountId, con.Phone);
    }
    for(Account ac : [select id,phone from account where Id IN: MapCon.keySet() ])
    {
        ac.Phone = MapCon.get(ac.Id);
        lstaccupdt.add(ac);
           }
    update lstaccupdt;
    }

}