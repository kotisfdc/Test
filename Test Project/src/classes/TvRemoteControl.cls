public class TvRemoteControl {
    Integer Volume;
    static final Integer MAX_Volume = 50;
    public TvRemoteControl(Integer v) {
        Volume = v;
    }
    public Integer increaseVolume(Integer amount) {
        volume += amount;
        if(volume > MAX_Volume){
            volume =  MAX_Volume;
        }
        return volume;
    }
    public Integer decreaseVolume(Integer amount) {
        volume -= amount;
        if(volume < 0){
            volume =  0;
        }
        return volume;
        
    }
    public static string getMenuOptions() {
        return 'Audio Settings - Video Settings';
    }
}