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
    
    typealias completionHandler = (String) -> ()
    
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
        print(#function)
        guard let text = mainView.textField.text else { return }
        let mobileNumber = "+82" + text
       
        
        verifyNumber(phoneNumber: mobileNumber) { verificationID in
            print("verify phone")
            UserDefaults.standard.set(verificationID, forKey: Repository.verificationID.rawValue)
            
            let vc = AuthorizationViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
        
    }
    
    
    override func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        customTextField.customTextFieldView(view: mainView.view)
        
        return true
    }
    
    //textfield에서 text가 변화될 때
    override func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {

        guard let text = mainView.textField.text else { return false }
        let textCount = text.count
        
        addHyphen(textField: textField, text: text, range: range, string: string)
        
        
        if textCount > 12  {
            
            self.view.makeToast("잘못된 전화번호 형식입니다.", duration: 1.0, position: .center)
   
        } else if textCount ==  12 {
            
            customButton.changedButton(view: mainView.view, button: mainView.button)
            
        }
        return false
    }
    
    
    
    
}

