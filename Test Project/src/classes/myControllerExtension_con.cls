public class myControllerExtension_con {
    
    public List<innerClass> lstInner{get;set;}
    public myControllerExtension_con(ApexPages.StandardController ctlr){
        lstInner = new List<innerClass>();
        
    }
    public class innerClass{               
        
        public String recCount{get;set;}                
        
        public Account acct{get;set;}
        
        
        
        Public contact con{get;set;}
        
        public innerClass(Integer intCount){
            
            recCount = String.valueOf(intCount);                                
            
            con = new contact();            
            
        }
        
    }
}