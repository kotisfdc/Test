public class FilterByRecords_con {

    public String SelectField{set;get;}
    
    public list<selectOption> getItems()
    {
        list<SelectOption> Options = new list<SelectOption>();
        options.add(new SelectOption('---NONE---','---NONE---'));
        options.add(new SelectOption('Name','Name'));
        options.add(new SelectOption('Rating','Rating'));
        options.add(new SelectOption('Phone','Phone'));
        options.add(new SelectOption('Industry','Industry'));
        return Options;
    }
    
    
        public String SelectOperator{set;get;}
    public list<selectOption> getValues()
    {
        list<SelectOption> Options = new list<SelectOption>();
        options.add(new SelectOption('---NONE---','---NONE---'));
        options.add(new SelectOption('Equals','Equals'));
        options.add(new SelectOption('NotEquals','NotEquals'));
        options.add(new SelectOption('Greaterthan','Greaterthan'));
        options.add(new SelectOption('Lessthan','Lessthan'));
        return Options;
    }
    
    public void addRow()
    {
        
    }

}