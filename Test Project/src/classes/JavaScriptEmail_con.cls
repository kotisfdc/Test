public class JavaScriptEmail_con {
    public String sub{set;get;}
    public String body{set;get;}
    public list<lead> lstLeads{set;get;}
    public Id Recid;// = apexpages.currentpage().getparameters().get('id');
    
    public JavaScriptEmail_con()
    {
       lstLeads =new list<lead>(); 
        Recid = apexpages.currentpage().getparameters().get('id');
           system.debug('=============='+Recid);
    }
    public void sent(){
       // lstLeads = [select id,name,email from Contact where id=:Recid ];
        Messaging.Singleemailmessage mail = new Messaging.Singleemailmessage();
        mail.setToAddresses(new String[] {'koti.sfdc99@gmail.com'});
        mail.setSubject(sub);
        mail.setPlainTextBody('body');
        system.debug('@@@@ sendEmail - mail : ' + mail);
        Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
        
    }
}