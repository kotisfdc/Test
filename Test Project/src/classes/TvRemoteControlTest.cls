@isTest 
public class TvRemoteControlTest {
    //Increase volume
    testmethod static void testTvRemoteIncreaseVolume(){
        TvRemoteControl tc = new TvRemoteControl(10);
        Integer newVol = tc.increaseVolume(15);
        system.assertEquals(25, newVol);
        
    }
    //Decrease volume
    testmethod static void testTvRemoteDecreaseVolume(){
        TvRemoteControl tc = new TvRemoteControl(20);
        Integer newVol = tc.decreaseVolume(5);
        system.assertEquals(15, newVol);
        
    }
    //Max volume
    testmethod static void testTvRemoteMaxVolume(){
        TvRemoteControl tc = new TvRemoteControl(20);
        Integer newVol = tc.increaseVolume(40);
        system.assertEquals(50, newVol);
        
    }
    //MIn volume
    testmethod static void testTvRemoteMinVolume(){
        TvRemoteControl tc = new TvRemoteControl(10);
        Integer newVol = tc.decreaseVolume(100);
        system.assertEquals(0, newVol);
        
    }
    //Menu items
    testmethod static void testTvRemoteMenuItems(){
        String menu = TvRemoteControl.getMenuOptions();
        system.assertNotEquals(null, menu);    
    }
    
}