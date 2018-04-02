public class wrapExample_con {
  public List<wrapProduct2OLI> lstWarpper{set;get;}
   
    
    public class wrapProduct2OLI {
        public Item__c item {get; set;}
        public Label__c label {get; set;}

        public wrapProduct2OLI(Item__c i) {
            item = i;
            label = new Label__c();
        }
} 
}