package net.henrypost.swingdemo;

import java.awt.EventQueue;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.Random;

import javax.swing.JButton;
import javax.swing.JDialog;
import javax.swing.JFrame;
import javax.swing.JLabel;

/*
 * You'll want to install https://www.eclipse.org/windowbuilder/
 */

public class TestWindow {

	public static final int gimmeRandXY() {
		return new Random().nextInt(300);
	}

	private JFrame frame;

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					TestWindow window = new TestWindow();
					window.frame.setVisible(true);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
	}

	/**
	 * Create the application.
	 */
	public TestWindow() {
		initialize();
	}

	/**
	 * Initialize the contents of the frame.
	 */
	private void initialize() {
		frame = new JFrame();
		frame.setBounds(100, 100, 450, 300);
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

		JButton button = new JButton();
		button.setLabel("click me!");

		button.addActionListener(new ActionListener() {

			public void actionPerformed(ActionEvent arg0) {
				JDialog popup = new JDialog();
				popup.setTitle("Wow! You clicked me!");
				popup.setBounds(gimmeRandXY(), gimmeRandXY(), gimmeRandXY(), gimmeRandXY());

				JLabel label = new JLabel();
				label.setText("nice clicking :)");
				popup.add(label);

				popup.show();
			}
		});
		frame.add(button);
	}

}
