public class wrapperclassForDependentObjects_con {
    public list<Item__c> lstItems {set;get;}
    public list<Label__c> lstLabels {set;get;}

    public list<wrapperClass> wrapList{set;get;}
    public wrapperclassForDependentObjects_con()
    {
        lstItems = new list<Item__c>();
        lstItems = [select id,name,Status__c from Item__c];
        lstLabels = new list<Label__c>();
        lstLabels = [select id,name,Phone__c,State__c,Item__c from Label__c where Item__c IN:lstItems ];
        wrapList = new list<wrapperClass>();
        wrapList.add(new wrapperClass(  lstLabels, lstItems)) ;

        
       /* wraplist = new list<wrapperClass>();
        
        
        for(Item__c i : [select id,name,Status__c,(select id,name,Phone__c,State__c from Labels__r) from Item__c])
        {
            wrapperClass w = new wrapperClass(i);
             wrapList.add(w);
        

            for(Label__c l : [select id,name,Phone__c,State__c,Item__c from Label__c where Label__c.Item__c =:i.Name ])
			{
            wrapperClass w1 = new wrapperClass(l);
            wrapList.add(w1);
        	}
        }*/
            
       
        
    }
    
    public class wrapperClass{
        public list<Item__c> items{set;get;}
        public list<Label__c> labels{set;get;}
        public wrapperClass(list<Label__c> l,list<Item__c> i)
        {
                        labels =l;  
            items =i;  

        }
        public wrapperClass(Label__c l)
        {
        }
    }
    
}