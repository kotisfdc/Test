public class StudentResult_con {
    public string RollNumber{set;get;}
    public list<Student__c> lstStd{set;get;}
    
    public boolean pb2Rendered{set;get;}
    public StudentResult_con()
    {
        lstStd = new list<Student__c>();
        pb2Rendered =false;
    }
    public void search()
    {
        if(RollNumber == Null || RollNumber == '')
        {
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.WARNING, 'Enter RollNumber'));
        }
      
       
            lstStd = [select id,name,RollNumber__c,Branch__c,Percentage__c,TotalMarks__c,Subject1__c,Subject2__c,Subject3__c,Subject4__c,Subject5__c from Student__c
                      where RollNumber__c =:RollNumber]; 
            pb2Rendered =true;
            
        if(lstStd.size()> 0)
        {
            for(Student__c lst :lstStd)
            {
                
                
                if(lst.TotalMarks__c <= 250 || lst.Subject1__c <= 24 || lst.Subject2__c <= 28 || lst.Subject3__c <= 28 || lst.Subject4__c <=30 ||lst.Subject5__c <=34 )
                {
                    ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.WARNING,'Student Was fail '));
                    ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.INFO, 'Grade E'));
                    
                }
                else
                {
                    ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.INFO, 'Student  Was Pass'));
                    if(lst.TotalMarks__c >= 450)
                    {
                        ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.INFO, 'Grade A'));
                    }
                    else if (lst.TotalMarks__c >= 400)
                    {
                        ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.INFO, 'Grade B'));
                        
                    }
                    else if (lst.TotalMarks__c >= 350)
                    {
                        ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.INFO, 'Grade C'));
                        
                    }
                    else if (lst.TotalMarks__c >= 250)
                    {
                        ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.INFO, 'Grade D'));
                        
                    }
                    
                    
                }
            }
        }
        else
        {
			ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.WARNING, 'Incorrect rollnumber'));

        }
          
    }
    public PageReference cancel() {
        PageReference newpage = new PageReference(System.currentPageReference().getURL());
        newpage.setRedirect(true);
        return newpage;
    }
    
}