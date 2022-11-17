//
//  loginViewController.swift
//  SLP
//
//  Created by 나리강 on 2022/11/08.
//

import UIKit
import AnyFormatKit
import FirebaseAuth
import FirebaseCore


class loginViewController: BaseViewController {
    
   
    let mainView = loginView()
    
    override func loadView() {
        self.view = mainView
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.backgroundColor = colorCustom.shared.whiteColor
        mainView.textField.delegate = self
        mainView.button.addTarget(self, action: #selector(tappedButton), for: .touchUpInside)
        
    }
    

    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.mainView.endEditing(true)
    }
    
    
    
    @objc func tappedButton(_ sender : UIButton){
       
        guard let text = mainView.textField.text else { return }
        
       //전화번호 전달
        PhoneAuthProvider.provider()
          .verifyPhoneNumber("+82" + text, uiDelegate: nil) { verificationID, error in
              if let error = error {
               print("phoneAuth error : \(error)")
                return
              }
              // Sign in using the verificationID and the code sent to the user
              print("verify phone")
              //인증번호 userDefaults에 저장
              UserDefaults.standard.set(verificationID, forKey: "authVerificationID")
              
          }
        
        
        
        let vc = AuthorizationViewController()
        navigationController?.pushViewController(vc, animated: true)

        
    }
    
    
    override func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        customTextField.customTextFieldView(view: mainView.view)
        
        return true
        
    }
    
    //textfield에서 text가 변화될 때
    override func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {

        guard let text = mainView.textField.text else { return false }
        let textCount = text.count
        
        let characterSet = CharacterSet(charactersIn: string)
        if CharacterSet.decimalDigits.isSuperset(of: characterSet) == false {
            return false
        }
        
        let formatter = DefaultTextInputFormatter(textPattern: "###-####-####")
        let result = formatter.formatInput(currentText: text , range: range, replacementString: string)
        textField.text = result.formattedText
        guard let position = textField.position(from: textField.beginningOfDocument, offset: result.caretBeginOffset) else { return false}
        textField.selectedTextRange = textField.textRange(from: position, to: position)
        
        if textCount > 12 {
            self.view.makeToast("잘못된 전화번호 형식입니다.", duration: 1.0, position: .center)
            
   
        } else if textCount ==  12 {
            
            customButton.changedButton(view: mainView.view, button: mainView.button)
            
        }
        
        return false
     
    }
    
    
    
    
}

