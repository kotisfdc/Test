trigger ContactCreateAccountCreate on Contact (after insert) {
    list<Account> lstAcc = new list<Account>();
for(Contact Con:trigger.new)
{
    account ac= new account();
    ac.Name= con.lastName;
    ac.phone = con.phone;
    lstAcc.add(ac);
}
    system.debug('=======k===='+lstAcc);
    insert lstAcc;
   system.debug('=======rrrrrrrr===='+lstAcc);

}