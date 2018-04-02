trigger BeroreInsert on Account (before insert) {
set<string> AccName= new set<string>();
    for(Account ac : Trigger.new)
    {
        AccName.add(ac.name);
    }
    list<Account> la = [select id,name from Account where name =: AccName];
}