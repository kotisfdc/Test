public class selectedSizeWorkaround {
        ApexPages.StandardSetController setCon;
    public selectedSizeWorkaround(ApexPages.StandardSetController  controller)
    {
        setCon = controller;
    }
    public integer getmySelectedSize(){
        return setCon.getSelected().size();
    }
    public integer getmyRecordsSize()
    {
        return setCon.getRecords().size();
    }

}