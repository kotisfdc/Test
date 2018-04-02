//@isTest
public class JO_DashboardTestDataFactory {
    
    //Create User Method
    public static User createUser(String ProfileName, String UserName) {
        //Retrieve the Profile 
        Profile p = [SELECT Id,Name FROM Profile WHERE Name=:ProfileName];
        //system.debug('Profile===>'+p);
        
        //Craete User
        User u = new User();
        u.Alias = 'stand';
        u.Email = 'test@abc.com';
        u.EmailEncodingKey = 'UTF-8';
        u.LastName = 'Test';
        u.LanguageLocaleKey = 'en_US';
        u.LocaleSidKey = 'en_US';
        u.ProfileId = p.id;
        u.TimeZoneSidKey ='America/Los_Angeles';
        u.Username = UserName;
        //u.FederationIdentifier = '12345';
        Insert u;
        system.debug('User===>'+u);
        return u;
    }
   public static void addUserTolistOfPermissionSets(ID UserId, List<String> PermissionSetNames) {
       List<PermissionSet> updtlstPs = new List<PermissionSet>();
        for(String psName:PermissionSetNames)
        {
         List<PermissionSet> lstPs = [Select id,Name From PermissionSet where Name=:psName];
          if(lstPs.size()>0)
        {
            PermissionSetAssignment pm = new PermissionSetAssignment();
            pm.AssigneeId=UserId;
            pm.PermissionSetId=lstPs[0].id;
            insert pm;              
        }
            else
            {
             String PName = psName.replace(' ', '_');
            //Create PermissionSet
            PermissionSet ps = new PermissionSet();
            ps.Label = psName;
            ps.Name = PName;
            Insert ps;
            updtlstPs.add(ps); 
            //update lstPs;
            
            //Assign user to PermissionSetAssignment
            PermissionSetAssignment pm = new PermissionSetAssignment();
            pm.AssigneeId=UserId;
            pm.PermissionSetId=ps.id;
            insert pm;      
            }
        }
      System.debug('updtlstPs==>'+updtlstPs);   
    }  
      
    
    
    
    
    
    
    
    
    
    
  /*  
    public static void addUserToPermissionSets(ID UserId, String PermissionSetName) {
        List<PermissionSet> updtlstPs = new List<PermissionSet>();
        List<PermissionSet> lstPs = [Select id,Name From PermissionSet where Name=:PermissionSetName];
        if(lstPs.size()>0)
        {
            PermissionSetAssignment pm = new PermissionSetAssignment();
            pm.AssigneeId=UserId;
            pm.PermissionSetId=lstPs[0].id;
            insert pm;              
        }
        else
        {
            String PSName = PermissionSetName.replace(' ', '_');
            //Create PermissionSet
            PermissionSet ps = new PermissionSet();
            ps.Label = PermissionSetName;
            ps.Name = PSName;
            Insert ps;
            updtlstPs.add(ps); 
            //update lstPs;
            
            //Assign user to PermissionSetAssignment
            PermissionSetAssignment pm = new PermissionSetAssignment();
            pm.AssigneeId=UserId;
            pm.PermissionSetId=ps.id;
            insert pm;   
        }
        System.debug('updtlstPs==>'+updtlstPs);
    } 
*/
   
    /* 
public static void addUserToPermissionSets(ID UserId, String PermissionSetName) {
List<PermissionSet> updtlstPs = new List<PermissionSet>();
List<PermissionSetAssignment> lstPsa = [Select Id,AssigneeId,PermissionSetId From PermissionSetAssignment where AssigneeId=:UserId];
Set<Id> permissionSetIDs = new Set<Id>();
if(lstPsa.size()>1) 
{
for(PermissionSetAssignment psa:lstPsa)
{
permissionSetIDs.add(psa.PermissionSetId);   
}
List<PermissionSet> lstPs = [Select id,Name From PermissionSet where Id IN:permissionSetIDs];

if(lstPs[0].Name !=PermissionSetName)
{
String PSName = PermissionSetName.replace(' ', '_');
//Create PermissionSet
PermissionSet ps = new PermissionSet();
ps.Label = PermissionSetName;
ps.Name = PSName;
Insert ps;
updtlstPs.add(ps); 
//update lstPs;

//Assign user to PermissionSetAssignment
PermissionSetAssignment pm = new PermissionSetAssignment();
pm.AssigneeId=UserId;
pm.PermissionSetId=ps.id;
insert pm;   
}

}
else 
{
String PSName = PermissionSetName.replace(' ', '_');
//Create PermissionSet
PermissionSet ps = new PermissionSet();
ps.Label = PermissionSetName;
ps.Name = PSName;
Insert ps; 
updtlstPs.add(ps);             
System.debug('User with New PermissionSet ==>'+ps);
//Assign user to PermissionSetAssignment
PermissionSetAssignment pm = new PermissionSetAssignment();
pm.AssigneeId=UserId;
pm.PermissionSetId=ps.id;
insert pm;  
System.debug('PermissionSetAssignment with Existing User==>'+pm);

}
System.debug('list of Permission sets==>'+updtlstPs);  
}
*/  
}