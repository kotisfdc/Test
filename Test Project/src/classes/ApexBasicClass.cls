public class ApexBasicClass {
    private Integer carMiles =0;
    public String carColor;
    public String carMaker;
    
    public void enterMiles(Integer M) {
       carMiles = carMiles + M; 
        System.debug('carMiles====>'+carMiles);
    }    
    
    
}