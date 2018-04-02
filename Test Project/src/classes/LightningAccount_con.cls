public class LightningAccount_con {
@AuraEnabled
    public static List<Account> findAll() {
        return [SELECT id, name, phone FROM Account LIMIT 50];
    }
    @AuraEnabled
    public static List<Account> findByName(String searchKey) {
        return [SELECT id, name, phone FROM Account where name=:searchKey];
    }
}