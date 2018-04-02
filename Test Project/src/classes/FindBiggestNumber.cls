public class FindBiggestNumber {
public void findBig(integer a,integer b,integer c,integer d)
{
    if(a>b && a>c && a>d){
        system.debug('A is Big Number');
    } 
    else if(b>a && b>c && b>d){
         system.debug('B is Big Number');
    }
    else if(c>a && c>b && c>d){
         system.debug('C is Big Number');
    }
    else
    {
        system.debug('D is Big Number');
    }
}
}