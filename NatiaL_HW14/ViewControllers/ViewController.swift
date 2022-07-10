//
//  ViewController.swift
//  NatiaL_HW14
//
//  Created by Natia's Mac on 09.07.22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var signInBtn: UIButton!
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var userPassword: UITextField!
    @IBOutlet weak var signUpBtn: UIButton!
    
    var userInfo: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        signInBtn.layer.cornerRadius = 15
    }
    
    @IBAction func createAccount(_ sender: Any) {
        guard let controller = storyboard?.instantiateViewController(withIdentifier: "RegistrationViewController") as? RegistrationViewController else { return }
            controller.delegate = self
            navigationController?.pushViewController(controller, animated: true)
    }
    
    @IBAction func SignInTapped(_ sender: Any) {
        if userInfo?.name == userName.text! && userInfo?.password == userPassword.text{
            
            let sb = UIStoryboard(name: "Details", bundle: nil)
            guard let vc = sb.instantiateViewController(withIdentifier: "DetailsViewController") as? DetailsViewController else {return}
            vc.nameText = userInfo?.name ?? ""
            vc.mailText = userInfo?.mail ?? ""
            navigationController?.pushViewController(vc, animated: true)
        } else {
            self.presentAlert(withTitle: "Something went wrong", message: "incorrect credentials")
        }
    }
}
extension ViewController: DataDelegate {
    func passUserData(by user: User) {
        self.userInfo = user
    }
}

