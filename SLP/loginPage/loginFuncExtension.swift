//
//  loginFuncExtension.swift
//  SLP
//
//  Created by 나리강 on 2022/11/25.
//

import UIKit
import FirebaseAuth
import AnyFormatKit

extension loginViewController {
    //전화번호가 인증 할 수 있는지 확인
    func verifyNumber(phoneNumber: String, completion : @escaping completionHandler) {
        PhoneAuthProvider.provider()
            .verifyPhoneNumber(phoneNumber, uiDelegate: nil) { verificationID, error in
    
                if let error = error {
                    print("unable to verify - error : \(error)")
                    return
                }
                guard let verificationID = verificationID else {
                    print("optionalBinding Error - verificationID")
                    return }
                completion(verificationID)
            }
        
        
    }
    
    func addHyphen(textField : UITextField, text: String, range: NSRange, string: String) {
        let characterSet = CharacterSet(charactersIn: string)
        if CharacterSet.decimalDigits.isSuperset(of: characterSet) == false {
            return
        }
        let formatter = DefaultTextInputFormatter(textPattern: "###-####-####")
        let result = formatter.formatInput(currentText: text , range: range, replacementString: string)
        textField.text = result.formattedText
        guard let position = textField.position(from: textField.beginningOfDocument, offset: result.caretBeginOffset) else { return }
        textField.selectedTextRange = textField.textRange(from: position, to: position)
       
    }
    
}
