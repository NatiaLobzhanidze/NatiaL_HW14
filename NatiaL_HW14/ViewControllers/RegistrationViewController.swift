//
//  RegistrationViewController.swift
//  NatiaL_HW14
//
//  Created by Natia's Mac on 09.07.22.
//

import UIKit

protocol DataDelegate {
    func passData(name: String?,  password: String?, mail: String?)
}

class RegistrationViewController: UIViewController {
    @IBOutlet weak var signUpBtn: UIButton!
    @IBOutlet weak var backToLogin: UIButton!
    
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var userEmail: UITextField!
    @IBOutlet weak var userPassword: UITextField!
    @IBOutlet weak var repeatPassword: UITextField!
    
    var delegate: DataDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        signUpBtn.layer.cornerRadius = 15
        
        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func createAccount(_ sender: UIButton) {
        guard let userName = userName.text, let password = userPassword.text, let email = userEmail.text  else { return }
        
        switch fullValidityPermision(ofUser: userName, mail: userEmail.text, password: userPassword.text, repassword: repeatPassword.text) {
            case AlertMessages.validityFails.rawValue :
                self.presentAlert(withTitle: "Something Went Wrong", message: AlertMessages.validityFails.rawValue)
            case AlertMessages.secureFails.rawValue :
                self.presentAlert(withTitle: "Something Went Wrong", message: AlertMessages.secureFails.rawValue)
            case AlertMessages.matchingFails.rawValue :
                self.presentAlert(withTitle: "Something Went Wrong" , message: AlertMessages.matchingFails.rawValue)
        default:
              delegate?.passData(name: userName, password: password, mail: email)
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
