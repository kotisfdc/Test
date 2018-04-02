public class SumOfOddNumbers {
    public void sum(integer n)
    {
        integer sumE = 0;
        integer sumO = 0;
        integer i;
        
        for(i = 1 ; i <= n ; i = i + 2) 
            sumO = sumO + i ; 
        for(i = 2 ; i <= n ; i = i + 2) 
            sumE = sumE + i ; 
        system.debug('sum of odd numbers:'+sumO);
        system.debug('sum of Even numbers:'+sumE);
        
    }
}