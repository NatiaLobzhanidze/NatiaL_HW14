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

public class Validation {
    
    func cheackMatching(between first: String?,  repeated: String?) -> Bool {
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
        // if contains Ints
        let findNumberOne = password.filter{Int(String($0)) != nil}.count >= 1
        if passwordCount && findUpperCasedCount && findNumberOne {
            return true
        } else {
            return false
        }
    }
    
    func checkAllFields(from username: User,  repeatedPassword: String?) -> Bool {
        guard let rePassword = repeatedPassword else { return false }
        if username.name.isEmpty || username.mail.isEmpty || username.password.isEmpty || rePassword.isEmpty {
            return false
        } else { return true }
    }
    func fullValPermission(for user: User, rePassword : String?) -> String {
        var result = ""
        if checkAllFields(from: user, repeatedPassword: rePassword) {
            if cheackMatching(between: user.password, repeated: rePassword) {
                if checksecure(of: user.password) {
                } else {
                    result = AlertMessages.secureFails.rawValue}
            } else {
                result = AlertMessages.matchingFails.rawValue }
        } else {
            result = AlertMessages.validityFails.rawValue }
        return result
    }
}



