public with sharing class SearchPageController
{
    public String SelectFieldType{set;get;}
    public list<SelectOption> getFields()
    {
        List<SelectOption> options = new List<SelectOption>();
        options.add(new SelectOption('---NONE---','---NONE---'));
        options.add(new SelectOption('Name','AccountName'));
        options.add(new SelectOption('Rating','Rating'));
        options.add(new SelectOption('Industry','Industry'));
        return options;
    }
}