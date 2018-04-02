public class AccountHandler {
    public static Account insertNewAccount(String name)
    {
        Account Acc = new Account();
        Acc.Name = name;
        try
        {
            insert Acc;
        }
        catch(Dmlexception e)
        {
            return null;
        }
        return Acc;
    }
}