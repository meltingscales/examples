package net.kayarocks.banking;


// this class represents a bank account :)
public class BankAccount {
    private String accountHolder;
    private double balance;

    // constructor
    public void createAccount(String accountHolder) {
        this.accountHolder = accountHolder;
        this.balance = 0.0;
        System.out.println("Account created for " + accountHolder);
    }

    // deposit money into the account
    public void deposit(double amount) {
        if (amount > 0) {
            balance += amount;
            System.out.println("Deposited: " + amount);
        } else {
            System.out.println("Invalid deposit amount");
        }
    }

    // withdraw money from the account
    public void withdraw(double amount) {
        if (amount > 0 && amount <= balance) {
            balance -= amount;
            System.out.println("Withdrew: " + amount);
        } else {
            System.out.println("Invalid withdraw amount or insufficient balance");
        }
    }

    // get the account balance
    public double getBalance() {
        return balance;
    }
}