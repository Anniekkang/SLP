//
//  textFieldExtension.swift
//  SLP
//
//  Created by 나리강 on 2022/11/13.
//

import UIKit
import AnyFormatKit
import Toast

extension loginViewController : UITextFieldDelegate {
    
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        
        customTextField.customTextFieldView(view: mainView.view)
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        var text = mainView.textField.text
        guard let textCount = mainView.textField.text?.count else { return }
        
        
        if textCount > 12 {
            self.view.makeToast("잘못된 전화번호 형식입니다.", duration: 1.0, position: .center)
            text = ""
   
        } else if textCount ==  12 {
            
            customButton.changedButton(view: mainView.view, button: mainView.button)
            
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {

        guard let text = mainView.textField.text else { return false }
        
        let characterSet = CharacterSet(charactersIn: string)
        if CharacterSet.decimalDigits.isSuperset(of: characterSet) == false {
            return false
        }
        
        let formatter = DefaultTextInputFormatter(textPattern: "###-####-####")
        let result = formatter.formatInput(currentText: text , range: range, replacementString: string)
        textField.text = result.formattedText
        guard let position = textField.position(from: textField.beginningOfDocument, offset: result.caretBeginOffset) else { return false}
        textField.selectedTextRange = textField.textRange(from: position, to: position)
        return false
     
    }
    
    
    
    
    
}
