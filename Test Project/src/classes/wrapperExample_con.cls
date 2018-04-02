public class wrapperExample_con {
    public string a{set;get;}
    public string a1{set;get;}
    public string a2{set;get;}

    public string b{set;get;}
    public string b1{set;get;}

    public wrapperExample_con()
    {
        Label__c l= [select id,name,Phone__c,State__c from Label__c limit 1];
        a= l.Name;
        a1= l.Phone__c;
        a2=l.State__c;
        Item__c i = [select id,name,Status__c from Item__c limit 1];
        b= i.Name;
        b1=i.Status__c;
    }

}