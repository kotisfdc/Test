trigger AccountInsertwithContact on Account (after Insert) {
        list<Contact> lstCont = new List<Contact>();

for(Account ac : trigger.new)
{
    Contact con = new Contact();
    con.Lastname = ac.name;
    con.phone =ac.phone;
    con.Accountid = ac.id;
 lstCont.add(con);
}
insert lstCont;
}