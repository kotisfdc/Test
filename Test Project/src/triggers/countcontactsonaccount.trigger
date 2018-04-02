trigger countcontactsonaccount on Account (before insert) 
{
if(trigger.IsBefore && trigger.IsInsert)
{
    
}
}