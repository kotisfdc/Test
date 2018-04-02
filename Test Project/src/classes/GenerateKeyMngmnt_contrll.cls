public class GenerateKeyMngmnt_contrll {
    @AuraEnabled
    public static String generateMasterKey(){
        Integer len = 5;
        Blob blobKey = crypto.generateAesKey(128);
        system.debug('blobKey=====>'+blobKey);
        String masterKey = EncodingUtil.convertToHex(blobKey);
        system.debug('key=====>'+masterKey);
        
        /*Send a email to administrator*/
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        String[] toAddresses = new String[] {'koti.skht@gmail.com'}; 
            mail.setToAddresses(toAddresses);
        mail.setSubject('Master Key Generate');
        mail.setPlainTextBody('Your Master Key: '+masterKey);
        Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
        
        /* Insert Master Key Into Customsettings */
        KeyManagement__c keyMngmt = new KeyManagement__c();
        keyMngmt.Name = 'Test';
        keyMngmt.MasterKey__c = masterKey;
        Insert keyMngmt;
        
        system.debug('masterKey===>'+masterKey);
        return masterKey;
        
    }
    
    @AuraEnabled
    public static String generateUserKey(String apps){
        List<String> lstApps=(List<String>)JSON.deserialize(apps, List<String>.class);
        system.debug('======apps===>'+lstApps);
        
        String strSobjects = ' ';   
        for(String obj : lstApps){
            strSobjects = strSobjects  + ','+JSON.Serialize(obj);
        }
        
        
        Integer len = 5;
        Blob blobKey = crypto.generateAesKey(128);
        system.debug('blobKey=====>'+blobKey);
        String userKey = EncodingUtil.convertToHex(blobKey);
        system.debug('key=====>'+userKey);
        
        /*Send a email to administrator*/
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        String[] toAddresses = new String[] {'koti.skht@gmail.com'}; 
            mail.setToAddresses(toAddresses);
        mail.setSubject('User Key Generate');
        mail.setPlainTextBody('Your User Key: '+userKey);
        Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
        
        /* update user Key Into Customsettings */
        KeyManagement__c s = KeyManagement__c.getall().values();
        s.UserKey__c = userKey;
        s.Apps__c = strSobjects;
        update s;
        system.debug('====KeyManagement===>'+s);
        system.debug('userKey===>'+userKey);
        return userKey;
        
    }
    
}