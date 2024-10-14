package net.kayarocks.banking;

/**
 * Hello world!
 *
 */
public class App 
{
    public static void main( String[] args )
    {
        System.out.println( String.format("Hello World! You have %d dollars", getBalance()) );
    }

    public static int getBalance() {
        return 100; // Example balance
    }
}
