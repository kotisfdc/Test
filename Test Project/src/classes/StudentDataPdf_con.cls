public class StudentDataPdf_con {
    Id id = apexpages.currentpage().getparameters().get('id');
    public list<Student__c> lstStd{set;get;}
public StudentDataPdf_con()
{
  lstStd = new list<Student__c>();
  lstStd = [select id,name,RollNumber__c,Branch__c,Percentage__c,TotalMarks__c,Subject1__c,Subject2__c,Subject3__c,Subject4__c,Subject5__c from Student__c
                where id =:id];
}
}