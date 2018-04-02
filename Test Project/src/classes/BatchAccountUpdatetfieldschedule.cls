global with sharing class BatchAccountUpdatetfieldschedule implements Schedulable 
{
    global void execute(SchedulableContext sc)    
    {
       AccountUpdateBatchJob obj = new AccountUpdateBatchJob();
       database.executebatch(obj);
    }
}