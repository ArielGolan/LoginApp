//
//  LoginViewController.swift
//  LoginApp
//
//  Created by Ariel Golan on 29.07.2022.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet var userNameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    private let user = "User"
    private let password = "Password"
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as? WelcomeViewController else
        { return }
        welcomeVC.user = user
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    @IBAction func loginPressed() {
        guard userNameTextField.text == user, passwordTextField.text == password else {
            showAlert(title: "Invalid login or password",
                      message: "Please, enter correct login and password",
                      textField: passwordTextField
            )
            return
    }
        performSegue(withIdentifier: "showWelcomeVC", sender: nil)
}

    @IBAction func forgotRegisterData(_ sender: UIButton) {
        sender.tag == 0
        ? showAlert(title: "Oops", message: "Your name is \(user) 😉")
        : showAlert(title: "Oops", message: "Your password is \(password) 😉")
    }
    
    @IBAction func unwindSegue(segue: UIStoryboardSegue) {
        userNameTextField.text = ""
        passwordTextField.text = ""
    }
    
    
    
// MARK: - Private functions

private func showAlert(title: String, message: String, textField: UITextField? = nil) {
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let okAction = UIAlertAction(title: "Ok", style: .default) { _ in textField?.text = ""
    }
    alert.addAction(okAction)
    present(alert, animated: true)
}
}