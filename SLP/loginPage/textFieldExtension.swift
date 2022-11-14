//
//  textFieldExtension.swift
//  SLP
//
//  Created by 나리강 on 2022/11/13.
//

import UIKit
import AnyFormatKit

extension loginViewController : UITextFieldDelegate {
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        print("start")
        mainView.view.backgroundColor = colorCustom.shared.blackColor
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {

        guard let textCount = mainView.textField.text?.count else { return false }
        guard let text = mainView.textField.text else { return false }
        
        if textCount > 12 {
            let alert = UIAlertController(title: "경고", message: "형식에 맞지 않습니다", preferredStyle: .alert)
            let ok = UIAlertAction(title: "OK", style: .default) { [self] _ in
                mainView.textField.text = ""
            }
            let cancel = UIAlertAction(title: "Cancel", style: .cancel)
            
            alert.addAction(ok)
            alert.addAction(cancel)
            
            self.present(alert, animated: false)
            
            mainView.button.backgroundColor = colorCustom.shared.gray6
            mainView.button.setTitleColor(colorCustom.shared.gray3, for:.normal)
            return false
        } else if textCount ==  12 {
            
            mainView.view.backgroundColor = colorCustom.shared.gray3
            mainView.button.backgroundColor = colorCustom.shared.greenBrandColor
            mainView.button.setTitleColor(colorCustom.shared.whiteColor, for: .normal)
            
            
            
            
        }
        
        let characterSet = CharacterSet(charactersIn: string)
        if CharacterSet.decimalDigits.isSuperset(of: characterSet) == false {
            return false
        }
        
        let formatter = DefaultTextInputFormatter(textPattern: "###-####-####")
        let result = formatter.formatInput(currentText: text, range: range, replacementString: string)
        textField.text = result.formattedText
        guard let position = textField.position(from: textField.beginningOfDocument, offset: result.caretBeginOffset) else { return false}
        textField.selectedTextRange = textField.textRange(from: position, to: position)
        return false
     
    }
    
    
    
    
    
}
