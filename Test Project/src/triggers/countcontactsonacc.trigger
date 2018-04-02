trigger countcontactsonacc on Contact (after insert,after update, after delete) 
{
    countcontactsacctrigger obj = new countcontactsacctrigger();
   if(trigger.IsInsert )
    {
         obj.InsertMethod(trigger.new);
   
    }
    else if(trigger.IsDelete)
    {
        obj.DeleteMethod(trigger.old);
    }  
}