//
//  ViewController.swift
//  NatiaL_HW14
//
//  Created by Natia's Mac on 09.07.22.
//

import UIKit

protocol SendDataToDetailsPage {
    func sendData(name: String?, mail: String?)
}

class ViewController: UIViewController {
    
    @IBOutlet weak var signInBtn: UIButton!
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var userPassword: UITextField!
    var delegate: SendDataToDetailsPage!
    
    var forName = ""
    var forPassword = ""
    var forMail = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        signInBtn.layer.cornerRadius = 15
     
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "RegistrationViewController") as? RegistrationViewController
        vc?.delegate = self
    }
    
    
    @IBAction func SignInTapped(_ sender: Any) {
        
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "RegistrationViewController") as? RegistrationViewController
        vc?.delegate = self
        
        if forName == userName.text! && forPassword == userPassword.text! {
            
            let sb = UIStoryboard(name: "Details", bundle: nil)
            let vc = sb.instantiateViewController(withIdentifier: "DetailsViewController")
//            delegate?.sendData(name: name, mail: )
            self.present(vc, animated: true)
        } else {
            self.presentAlert(withTitle: "Wrong", message: "incorrect credentials")
        }
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

