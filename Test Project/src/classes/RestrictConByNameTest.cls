@isTest
public class RestrictConByNameTest {
        @isTest static void RestrictContactName() {
            Contact con = new Contact();
            con.LastName = 'INVALIDNAME';
            insert con;
            
        }


}