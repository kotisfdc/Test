public class NewCaseListController {
    public list<case> newCases{set;get;}
    public List<Case> getNewCases(){
        list<case>  newCases = [select id,CaseNumber from case where status='New'];
    return newCases;
    }

}