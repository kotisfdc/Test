public class myControllerExtension {
    private final account acc;
    public myControllerExtension(ApexPages.StandardController stdController)
    {
     this.acc = (Account)stdController.getRecord(); 
    }
    public string getGreeting()
    {
        return 'Hello ' + acc.name + ' (' + acc.id + ')';
    }

}