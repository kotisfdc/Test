public class AccountAuraClr {
   
    @AuraEnabled
    public static List<Account> getAccounts()
    {
        return [SELECT id, Name, Rating, Phone FROM Account Where rating='Hot' limit 5];
    }
    
}