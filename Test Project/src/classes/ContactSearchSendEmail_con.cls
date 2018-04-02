public class ContactSearchSendEmail_con {
    public boolean pblock1{set;get;}
    public boolean pblock2{set;get;}
    
    public String conName{set;get;}
    public list<contact> lstContacts{set;get;}
    public list<wrapConClass> wraplist{set;get;}
    // public list<contact> selectedContacts{set;get;}
    public ContactSearchSendEmail_con()
    {
        lstContacts = new list<contact>();  
        pblock1=true;
        pblock2=false;
        
    }
    
    public pagereference Search(){
        pblock2=true;
        
        if(conName == Null || conName =='')
        {
            ApexPages.AddMessage(new ApexPages.Message(ApexPages.Severity.INFO,'Please enter record details!'));     
            
        }
        else{
            wraplist = new list<wrapConClass>();
            for(contact con : [select id,name,email,phone from contact where name=:conName])
            {
                wrapConClass w = new wrapConClass(con);
                //w.conRec=con;
                //w.chkbox=false;
                wraplist.add(w);
                
            }
        }
        return null;
        
    }
    
    
    public class wrapConClass{
        public contact conRec{set;get;}
        public Boolean chkbox{set;get;}
        public  wrapConClass(contact con)
        {
            chkbox=false;
            conRec=con;
        }
    }
    public pagereference sendEmail()
    {
        //selectedContacts = new list<Contact>();
        for(wrapConClass wr:wraplist)
        {
            if(wr.chkbox == true)
            {
                system.debug('============='+wr.conrec.email);
                // selectedContacts.add(wr.conRec); 
                messaging.SingleEmailMessage message = new messaging.SingleEmailMessage();
                string str= wr.conrec.email; 
                system.debug('=============k==='+str);
                message.toAddresses = new String[] { str};
                    message.optOutPolicy = 'FILTER';
                message.subject = 'Subject Test Message';
                message.plainTextBody = 'This is the message body.';
                Messaging.SingleEmailMessage[] messages =   new List<Messaging.SingleEmailMessage> {message};
                    Messaging.SendEmailResult[] results = Messaging.sendEmail(messages);
                // system.debug('=============results==='+results);
                ApexPages.AddMessage(new ApexPages.Message(ApexPages.Severity.CONFIRM,'Record Created Successfully.Thank you!'));     
            }
        }
        return null; 
        
    }
    
    
    
    
}