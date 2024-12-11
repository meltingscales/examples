//**Explanation**
//
//In this example, we have an interface `Gay` that defines two methods: `dance()` and `sing()`. We then create a class `YourMomGay` that implements the `Gay` interface. This means that `YourMomGay` must provide its own implementations for the `dance()` and `sing()` methods.
//
//        Next, we create a subclass `MyMomGay` that extends `YourMomGay`. This allows `MyMomGay` to inherit all the fields and methods of `YourMomGay`, including the implementation of the `Gay` interface. We then override the `dance()` and `sing()` methods in `MyMomGay` to add our own twist.


public class Main {
    public static void main(String[] args) {
        MyMomGay mymom = new MyMomGay();
        YourMomGay yourmom = new YourMomGay();

        mymom.dance();
        mymom.sing();

        yourmom.dance();
        yourmom.sing();
    }
}