public class schemademo2 {   
  public string selectedobject{get;set;}
  public List<selectoption> objname{get;set;}
  public string selectedfield{get;set;}
  public List<selectoption> fldname{get;set;}
  public string selectedvalue{get;set;}
  public List<selectoption> valname{get;set;}
  public boolean pb1{get;set;}
  Map<string,schema.sobjectType> mobj = schema.getGlobalDescribe();
public schemademo2(){
  objname = new List<selectoption>();
  Map<string,schema.sobjectType> mobj = schema.getGlobalDescribe();
  List<string> entities = new List<string>(mobj.keyset());
  entities.sort();
  objname.add(new selectoption('---Select Object---','----Select Object---'));  
  for(string f:entities){ 
   if (f.contains('__c')) 
  // if (!f.contains('__c'))  
  objname.add(new selectoption(f,f));
 }
 }
public PageReference searchFields() {
  Map<string,sobjectField> mfld = mobj.get(selectedobject).getDescribe().fields.getMap();
  fldname = new List<selectoption>();
  List<string> fldentities = new List<string>(mfld.keyset());
  pb1=true;
  fldentities.sort();
  fldname.add(new selectoption('---Select Field---','----Select Field---'));
  for(string sf:fldentities){
    fldname.add(new selectoption(sf,sf));
 }
    return null;
}    
   public PageReference searchValues() {
     string dquery = 'select '+selectedfield+' from '+selectedobject;         
     List<Sobject> vals = Database.query(dquery);
     valname= new List<selectoption>();
           for(sobject val:vals){
      if(val.get(selectedfield)!=null)
       valname.add(new selectoption(string.valueof(val.get(selectedfield)),string.valueof(val.get(selectedfield))));
       } 
       return null;
       }
       }