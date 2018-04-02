public class JavaForEachLoop {
    private static final Integer DEFAULT_SIZE = 10;
    Integer size;
    public JavaForEachLoop() {
        //this(DEFAULT_SIZE); // Using this(...) calls the one argument constructor
        system.debug('default value'+DEFAULT_SIZE);
    }
    public JavaForEachLoop(Integer ObjectSize) {
        size = ObjectSize; 
        system.debug('passing value'+size);
        
    }
}