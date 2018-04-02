public class StringToTimeFormat {
    
    public static string timeFormatFromString(String timeValue)
    {
        String mode='';
        String timeFormat ='';
        system.debug('timeValue '+timeValue +' timeValue size '+timeValue.length());
        if(timeValue.length() >= 5)
        {
            system.debug('timeValue '+timeValue);
            string hours = timeValue.substring(0, 2);
            /*
integer stringToInteger = Integer.valueOf(hours.trim());
system.debug('Time format in Integer::'+stringToInteger);
if(stringToInteger >12 && stringToInteger<25){
mode = 'PM';
hours = String.valueOf(stringToInteger -12);
}
else
{
mode = 'AM';  
}
*/
            system.debug('hours '+hours);
            string minutes = timeValue.substring(2, 4);
            system.debug('minutes '+minutes);
            string seconds = timeValue.substring(4, 6);
            system.debug('seconds '+seconds);
            timeFormat = hours + ':' + minutes + ':' + seconds + ':' + mode;
            system.debug('timeFormat '+timeFormat); 
        }
        return timeFormat;
    }
    
}