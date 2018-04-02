public class CommonWrapperClass {
    /*******************************************/
    /* Wrapper class to display Position      */
    /*****************************************/
    
    public class DisplayAccountRecords {
        
        @AuraEnabled public boolean isSelected;
        @AuraEnabled public string Name;
        @AuraEnabled public string rating;
        @AuraEnabled public string accountId;
        
        public DisplayAccountRecords(){
            isSelected = false;
            Name = '';
            rating = '';
        }
    }

}