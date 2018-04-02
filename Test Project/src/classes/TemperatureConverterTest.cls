@isTest
public class TemperatureConverterTest {
    testMethod static void testWarmTemp() {
        Decimal celsius = TemperatureConverter.ForeheitToCelsius(70);
        //system.assertEquals(21.11, celsius);
    }
    testMethod static void testWarmTempNegative() {
        Decimal celsius = TemperatureConverter.ForeheitToCelsius(-20);
        //system.assertEquals(-28.89, celsius);
    }
    testMethod static void testWarmTempNegative_Zero() {
        Decimal celsius = TemperatureConverter.ForeheitToCelsius(0);
        //system.assertEquals(-17.78, celsius);
    }
    @isTest static void testBoilingPoint() {
        Decimal celsius = TemperatureConverter.ForeheitToCelsius(212);       
        //System.assertEquals(0,celsius,'Boiling point temperature is not expected.');
    }


}