package net.kayarocks;

/**
 * Hello world!
 *
 */
public class App 
{
    public static void main( String[] args )
    {
        System.out.println( String.format("Hello World! You have %d dollars", getBalance()) );

        System.out.println("This is the best unit test program of all time.");
    }

    public static int getBalance() {
        return 100;
    }
}
