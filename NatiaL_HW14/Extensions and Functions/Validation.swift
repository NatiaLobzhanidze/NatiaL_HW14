//
//  Validation.swift
//  NatiaL_HW14
//
//  Created by Natia's Mac on 10.07.22.
//

import Foundation
import UIKit

enum AlertMessages: String {
    case matchingFails = "passwords doesn't match"
    case secureFails = "This password is not secure"
    case validityFails = "Please make sure all fields are filled in correctly"
}



func cheackMatching(bitween first: String?,  repeated: String?) -> Bool {
    guard let userPassword = first, let rePassword = repeated else { return false }
    if userPassword == rePassword {
        return true
    } else {
        return false
    }
}

func checksecure (of givenPassword: String? ) -> Bool {
    guard let password = givenPassword else { return false }
    // min length = 8
    let passwordCount = password.count >= 8
    // min 1 char is upercased
    let findUpperCasedCount = password.map{String($0)}.filter{$0 == $0.uppercased()}.count >= 1
    // if contains number 1
    let findNumberOne = password.contains("1")
    if passwordCount && findUpperCasedCount && findNumberOne {
        return true
    } else {
        return false
    }
}

func checkAllFields(from username: String?, usermail: String?, userPassword: String?, repeatedPassword: String?) -> Bool {
    guard let  name = username, let mail = usermail, let password = userPassword, let rePassword = repeatedPassword else { return false }
    
    if name.isEmpty || mail.isEmpty || password.isEmpty || rePassword.isEmpty {
        return false
    } else { return true }
}

func fullValidityPermision(ofUser name: String?, mail: String?, password: String?, repassword: String?) -> String {
    var result = ""
    
    if checkAllFields(from: name, usermail: mail, userPassword: password, repeatedPassword: repassword) {
        
        if cheackMatching(bitween: password, repeated: repassword) {
            
            if checksecure(of: password) {
                
            } else {
                result = AlertMessages.secureFails.rawValue}
        } else {
            result = AlertMessages.matchingFails.rawValue }
        
    } else {
        result = AlertMessages.validityFails.rawValue }
    
   return result
}

