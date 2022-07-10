//
//  ButtomSheetView.swift
//  NatiaL_HW14
//
//  Created by Natia's Mac on 10.07.22.
//

import Foundation
import UIKit

protocol NextMoveDelegate {
    func getAnswer(_ answer: String)
}

class ButtomSheetView: UIView {
    
    @IBOutlet weak var yesBtn: UIButton!
    @IBOutlet weak var noBtn: UIButton!
    
    
    override func layoutSubviews() { setup() }
    func setup(){
        yesBtn.layer.borderWidth = 1
        yesBtn.layer.borderColor = UIColor.blue.cgColor
        yesBtn.layer.cornerRadius = 20
        noBtn.layer.cornerRadius = 20
        
    }
    var delegate: NextMoveDelegate!
    @IBAction func yes(_ sender: Any) {
        
        delegate?.getAnswer("yes")
    }
    @IBAction func no (_ sender: Any) {
        delegate?.getAnswer("no")
    }
}
