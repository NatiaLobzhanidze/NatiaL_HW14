//
//  UsefulExtensions.swift
//  NatiaL_HW14
//
//  Created by Natia's Mac on 10.07.22.
//

import Foundation
import UIKit

extension UIViewController {

  func presentAlert(withTitle title: String, message : String) {
    let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let OKAction = UIAlertAction(title: "OK", style: .default)
      //{ action in
//       if title == "Wrong!"
//        {
//           print("")
//       } else {
//            self.navigationController?.popToRootViewController(animated: true)
//       }
  //  }
    alertController.addAction(OKAction)
    self.present(alertController, animated: true, completion: nil)
  }
}
