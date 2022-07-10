//
//  RegistrationViewController.swift
//  NatiaL_HW14
//
//  Created by Natia's Mac on 09.07.22.
//

import UIKit

protocol DataDelegate {
    func passUserData(by user: User)
}

class RegistrationViewController: UIViewController {
    @IBOutlet weak var signUpBtn: UIButton!
    @IBOutlet weak var backToLogin: UIButton!
    
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var userEmail: UITextField!
    @IBOutlet weak var userPassword: UITextField!
    @IBOutlet weak var repeatPassword: UITextField!
    
    var delegate: DataDelegate?
    let validation = Validation()
    override func viewDidLoad() {
        super.viewDidLoad()
        signUpBtn.layer.cornerRadius = 15
    }
    
    @IBAction func createAccount(_ sender: UIButton) {
        guard let userName = userName.text, let password = userPassword.text, let email = userEmail.text  else { return }
        switch validation.fullValPermission(for: User(name: userName, mail: email, password: password), rePassword: repeatPassword.text) {
        case AlertMessages.validityFails.rawValue :
            self.presentAlert(withTitle: "Something Went Wrong", message: AlertMessages.validityFails.rawValue)
        case AlertMessages.secureFails.rawValue :
            self.presentAlert(withTitle: "Something Went Wrong", message: AlertMessages.secureFails.rawValue)
        case AlertMessages.matchingFails.rawValue :
            self.presentAlert(withTitle: "Something Went Wrong" , message: AlertMessages.matchingFails.rawValue)
        default:
            delegate?.passUserData(by: User(name: userName, mail: email, password: password))
            self.navigationController?.popToRootViewController(animated: true)
        }
    }
    
    @IBAction func dismissLoginBtn(_ sender: UIButton) {
        print("done")
        if self.navigationController == nil {
            self.dismiss(animated: true)
        } else {
            self.navigationController?.popViewController(animated: true)
        }
    }
    
}
