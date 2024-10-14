package net.kayarocks.banking;

import org.junit.Before;
import org.junit.Test;
import org.junit.Assert;

public class BankAccountTest {
    private BankAccount account;

    @Before
    public void setUp() {
        account = new BankAccount();
        account.createAccount("John Doe");
    }

    @Test
    public void testCreateAccount() {
        Assert.assertEquals(0.0, account.getBalance(), 0.01);
    }

    @Test
    public void testDeposit() {
        account.deposit(100.0);
        Assert.assertEquals(100.0, account.getBalance(), 0.01);
    }

    @Test
    public void testWithdraw() {
        account.deposit(100.0);
        account.withdraw(50.0);
        Assert.assertEquals(50.0, account.getBalance(), 0.01);
    }

    @Test
    public void testWithdrawInsufficientBalance() {
        account.deposit(50.0);
        account.withdraw(100.0);
        Assert.assertEquals(50.0, account.getBalance(), 0.01);
    }

    @Test
    public void testInvalidDeposit() {
        account.deposit(-10.0);
        Assert.assertEquals(0.0, account.getBalance(), 0.01);
    }

    @Test
    public void testInvalidWithdraw() {
        account.withdraw(-10.0);
        Assert.assertEquals(0.0, account.getBalance(), 0.01);
    }
}