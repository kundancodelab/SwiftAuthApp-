//
//  SIgnInViewController.swift
//  AuthApp
//
//  Created by User on 20/03/25.
//

import UIKit

class ForgotPasswordViewController: UIViewController, UITextFieldDelegate {

    // MARK: Outlets
    
    @IBOutlet weak var mainScrollView: UIScrollView!
    @IBOutlet weak var EmailTextField: UITextField!
   

    override func viewDidLoad() {
        super.viewDidLoad()

        // Set Delegates
        EmailTextField.delegate = self
      
        
        // Add Tap Gesture to Hide Keyboard
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGesture)
        
        // Listen for Keyboard Notifications
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    deinit {
        // Remove observers when the view controller is deallocated
        NotificationCenter.default.removeObserver(self)
    }

    // MARK: - Keyboard Handling

    @objc func keyboardWillShow(_ notification: Notification) {
        if let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect {
            let keyboardHeight = keyboardFrame.height
            mainScrollView.contentInset.bottom = keyboardHeight
            mainScrollView.scrollIndicatorInsets.bottom = keyboardHeight
        }
    }

    @objc func keyboardWillHide(_ notification: Notification) {
        mainScrollView.contentInset = .zero
        mainScrollView.scrollIndicatorInsets = .zero
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }

    // MARK: - UITextFieldDelegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder() // Hides the keyboard when return key is pressed
        return true
    }

    // MARK: - Button Actions

   
    
    @IBAction func sendPasswordResetLinkTapped(_ sender: UIButton) {
        
        
    }
    
    
    @IBAction func backToLoginButtonTapped(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
        
    }
    
    
}
