//
//  EmailValidation.swift
//  SLP
//
//  Created by 나리강 on 2022/11/22.
//

import UIKit

extension EmailViewController {
    
    func isValidEmail(text :String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: text)
    }
}
