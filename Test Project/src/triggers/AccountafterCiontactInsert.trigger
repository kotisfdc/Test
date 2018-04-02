trigger AccountafterCiontactInsert on Account (after insert) {
    list<contact>lstCon = new list<contact>(); 
for(account acc :trigger.new)
{
    contact con = new contact();
    con.lastname = acc.name;
    con.accountid = acc.id;
    lstCon.add(con);
}
    insert lstCon;
}