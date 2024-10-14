package net.kayarocks.banking;

import org.junit.Before;
import org.junit.Test;
import org.junit.Assert;

public class BankAccountTest {
    private BankAccount account;

    //we use setUp to create a new account before each test
    // this is to ensure that each test is independent of the other
    // this is important because if one test fails, it should not affect the other tests
    // the setUp method is called EACH TIME before a test is run, so like 7 times in this case
    @Before
    public void setUp() {
        account = new BankAccount();
        account.createAccount("John Doe");
    }

    // this test checks if the createAccount method works by checking if the balance is 0.0
    @Test
    public void testCreateAccount() {
        Assert.assertEquals(0.0, account.getBalance(), 0.01);
    }

    //this test works by calling the deposit method and then checking if the balance is equal to the amount deposited
    @Test
    public void testDeposit() {
        account.deposit(100.0);
        Assert.assertEquals(100.0, account.getBalance(), 0.01);
    }

    // this test checks if the withdraw method works by depositing 100.0 and then withdrawing 50.0
    @Test
    public void testWithdraw() {
        account.deposit(100.0);
        account.withdraw(50.0);
        Assert.assertEquals(50.0, account.getBalance(), 0.01);
    }

    // this test checks if the withdraw method works by depositing 50.0 and then withdrawing 100.0
    // the balance should remain 50.0
    @Test
    public void testWithdrawInsufficientBalance() {
        account.deposit(50.0);
        account.withdraw(100.0);
        Assert.assertEquals(50.0, account.getBalance(), 0.01);
    }


    // this test checks if the deposit method works by depositing -10.0
    // the balance should remain 0.0
    @Test
    public void testInvalidDeposit() {
        account.deposit(-10.0);
        Assert.assertEquals(0.0, account.getBalance(), 0.01);
    }

    // this test checks if the withdraw method works by withdrawing -10.0
    // the balance should remain 0.0
    @Test
    public void testInvalidWithdraw() {
        account.withdraw(-10.0);
        Assert.assertEquals(0.0, account.getBalance(), 0.01);
    }
}