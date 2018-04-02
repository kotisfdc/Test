public class wrapperclassForDifferentObjects_con {
    public list<wrapperClass> wrapList{set;get;}
    
    
 public wrapperclassForDifferentObjects_con()
 {	
     List <Item__c> lstTemp = new list<Item__c>(); 
     Map<String, List<Item__c>> mapItems = new Map<String, List<Item__c>>();
     wrapList = new list<wrapperClass>(); 
     
     for(Item__c i:[select id,name,Status__c from Item__c])
     {
         lstTemp.add(i);
         
     }
     mapItems.put('Items', lstTemp);
     
      for(Label__c l:[select id,name,Phone__c,State__c from Label__c] )
         {
             wrapperClass w = new wrapperClass();
             w.items = mapItems.get('Items');
             w.labels = l;
             wrapList.add(w) ;
         }
     /*for(Label__c l:[select id,name,Phone__c,State__c from Label__c] )
     {
         
     }*/
     system.debug('===wrapList'+wrapList);
 }
    
    
    
    
    
    public class wrapperClass{
        public List<Item__c> items{set;get;}
        public Label__c labels{set;get;}
        /*public wrapperClass(Item__c i)
        {
          items = i;
          //labels = l;  
        }
        public wrapperClass(Label__c l)
        {
          labels = l;  
       */

    }

}