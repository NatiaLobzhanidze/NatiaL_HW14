//
//  DetailsViewController.swift
//  NatiaL_HW14
//
//  Created by Natia's Mac on 10.07.22.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var mailLabel: UILabel!
    var nameText = ""
    var mailText = ""
    
    let myView = Bundle.main.loadNibNamed("ButtomSheet", owner: nil, options: nil)![0] as? ButtomSheetView
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userNameLabel.text = nameText
        mailLabel.text = mailText
    }
    @IBAction func signOut(_ sender: UIButton) {
        addView()
    }
    func addView(){
        
   
        myView?.frame = CGRect(x: 10, y: UIScreen.main.bounds.height - (UIScreen.main.bounds.height / 2.3 ), width: UIScreen.main.bounds.width - 20, height: UIScreen.main.bounds.height / 2.3
        )
        view.layer.cornerRadius = 10
        myView?.delegate = self
        view.addSubview(myView!)
        
    }
}
extension DetailsViewController : NextMoveDelegate {
    func getAnswer(_ answer: String) {
        if answer == "yes" {
            if self.navigationController == nil {
                self.dismiss(animated: true)
            } else {
                self.navigationController?.popViewController(animated: true)
            }
        } else {
            myView?.removeFromSuperview()
        }
    }
    
    
}
