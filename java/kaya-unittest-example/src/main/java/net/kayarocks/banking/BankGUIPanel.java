package net.kayarocks.banking;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class BankGUIPanel extends JPanel {
    private BankAccount account;
    private JLabel balanceLabel;
    private JTextField amountField;
    private JButton depositButton;
    private JButton withdrawButton;

    public BankGUIPanel() {
        account = new BankAccount();
        account.createAccount("John Doe");

        setLayout(new GridLayout(3, 2));

        balanceLabel = new JLabel("Balance: " + account.getBalance());
        amountField = new JTextField();
        depositButton = new JButton("Deposit");
        withdrawButton = new JButton("Withdraw");

        add(new JLabel("Amount:"));
        add(amountField);
        add(depositButton);
        add(withdrawButton);
        add(balanceLabel);

        depositButton.addActionListener(new ActionListener() {
            // this is a callback function
            // when the deposit button is clicked, this function is called
            @Override
            public void actionPerformed(ActionEvent e) {
                double amount = Double.parseDouble(amountField.getText());
                account.deposit(amount);
                updateBalance();
            }
        });

        withdrawButton.addActionListener(new ActionListener() {

            //this is a callback function
            // when the withdraw button is clicked, this function is called
            @Override
            public void actionPerformed(ActionEvent e) {
                double amount = Double.parseDouble(amountField.getText());
                account.withdraw(amount);
                updateBalance();
            }
        });
    }

    private void updateBalance() {
        balanceLabel.setText("Balance: " + account.getBalance());
    }

    public static void main(String[] args) {
        JFrame frame = new JFrame("Bank Account GUI");
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setSize(400, 200);
        frame.add(new BankGUIPanel());
        frame.setVisible(true);
    }
}