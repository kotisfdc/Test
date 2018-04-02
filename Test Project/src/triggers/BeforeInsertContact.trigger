trigger BeforeInsertContact on Contact (Before Insert)
{
    set<String> ContactEmail = new set<String>();

for(Contact con : Trigger.new)
{
   ContactEmail.add(con.Email); 
}
list<Contact> lstCon = [select id,name,email from contact where email IN : ContactEmail];

Map <String,Contact> mKeyToContactId = new Map<String,Contact>(); 

for(Contact con :lstCon)
{
   mKeyToContactId.put(con.email, con); 
}
 for(Contact connew : Trigger.new)
 {
     if(mKeyToContactId.containsKey(connew.email))
     {
         connew.addError('Email already Exists');
     }
 }
}