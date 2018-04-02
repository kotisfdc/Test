public class WrapperClassExample {
    public list<Contact> SelectedConList{set;get;}
    public list<wrap> wrapList{set;get;}
    public WrapperClassExample()
    {
        Integer sn = 1;
        wrapList = new list<wrap>();
        list<Contact> conRecs = [select Lastname,Phone from Contact limit 10];
        for(Contact c : conRecs)
        {
            wrap w = new wrap();
            w.chkbox = false;
            w.sno = sn;
            w.con = c;
            wrapList.add(w);
            sn++;
        }
    }
    
    public void selectContact() {
        SelectedConList = new list<Contact>();
        for( wrap ws: wrapList)
        {
            if(ws.chkbox == true){
                SelectedConList.add(ws.con);
                
            }
        }
    
    }
    
    public class wrap {
        public Boolean chkbox{set;get;}
        public integer sno{set;get;}
        public Contact con{set;get;}
        
    }
}