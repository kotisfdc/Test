@istest 
public class WrapperClassExampleTest {
    
    testmethod static void constructorTest()
    {
        List<WrapperClassExample.wrap> lst = new List<WrapperClassExample.wrap>();
        
        contact cons = new contact();
        cons.LastName = 'TestContact';
        cons.Phone = '9999999';
        insert cons;
        
        
        WrapperClassExample wc = new WrapperClassExample();
        wc.SelectContact();
        WrapperClassExample.wrap wrp = new WrapperClassExample.wrap();
        
    }
    
}