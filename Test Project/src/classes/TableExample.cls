public class TableExample {
public integer tableValues(integer n, integer s)
{
integer c=0;
 for( integer i=1;i<s+1;i++)   
 {
     c = n*i;
     system.debug(c);
 }
return c;
}
}