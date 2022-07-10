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
    
    
    var forName: String?
    var forPassword: String?
    var forMail: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        signInBtn.layer.cornerRadius = 15
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    
    }
    
    @IBAction func createAccount(_ sender: Any) {
        guard let controller = storyboard?.instantiateViewController(withIdentifier: "RegistrationViewController") as? RegistrationViewController else { return }
            controller.delegate = self
            navigationController?.pushViewController(controller, animated: true)
    }
    
    @IBAction func SignInTapped(_ sender: Any) {
//        if forName == userName.text! && forPassword == userPassword.text! {
            
            let sb = UIStoryboard(name: "Details", bundle: nil)
            guard let vc = sb.instantiateViewController(withIdentifier: "DetailsViewController") as? DetailsViewController else {return}
    // properties
//            vc.nameText = forName ?? ""
//            vc.mailText = forMail ?? ""
            navigationController?.pushViewController(vc, animated: true)
//        } else {
//
//            self.presentAlert(withTitle: "Wrong", message: "incorrect credentials")
//        }
    }
    
  
}


extension ViewController: DataDelegate {
    func passData(name: String?, password: String?, mail: String?)  {
        guard  let savedname = name, let savedPassword = password, let savedMail = mail  else { return }
        
        self.forName = savedname
        self.forPassword = savedPassword
        self.forMail = savedMail
    }

}

