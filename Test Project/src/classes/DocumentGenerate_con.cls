public class DocumentGenerate_con {
    public string imageURL{set;get;}
    public list<Contact> lstContact{set;get;}
    public DocumentGenerate_con()
    {
        lstContact = new list<Contact>();
        String strFilterType = apexpages.currentpage().getparameters().get('filterType');
        String strSelectedId = apexpages.currentPage().getParameters().get('selectedId');
        imageURL='/servlet/servlet.FileDownload?file=';
        List<document> documentList=[select name from document where 
                                        Name='developerslogo'];
        if(documentList.size()>0)
        {
          imageURL=imageURL+documentList[0].id;
        }
        
         if(String.isNotBlank(strFilterType) && String.isNotBlank(strSelectedId))
        {
            String strFilterTypeTemp = '';
            if(strFilterType == 'Account')
                strFilterTypeTemp = 'Account';
            
            
            
            String strQuery = 'Select ID,Name,account.name from contact where '+strFilterTypeTemp+'=\''+ strSelectedId+'\'';
            
            /*if(String.isNotBlank(strWorkId))
            {
                strQuery += ' and Id =\''+ strWorkId+'\'';
            }*/
			  
                lstContact = database.query(strQuery); 
        }

    }
}