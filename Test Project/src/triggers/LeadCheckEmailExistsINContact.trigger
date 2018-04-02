trigger LeadCheckEmailExistsINContact on Lead (before insert, before update) {
    
    for(Lead myLead : Trigger.new) {
        if(myLead != null)
        {
        List<Contact> lstCon = [SELECT id, Name FROM Contact where Email =:myLead.email ];
        if(lstCon.size()>0)
        {
         myLead.addError('Email Already existed');   
        }  
        }
       
    }

}