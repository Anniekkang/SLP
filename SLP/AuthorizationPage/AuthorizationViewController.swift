//
//  AuthorizationViewController.swift
//  SLP
//
//  Created by 나리강 on 2022/11/09.
//

import UIKit
import FirebaseAuth



class AuthorizationViewController: BaseViewController {
    static let shared = AuthorizationViewController()
    let mainView = AuthorizationView()
    
    
    override func loadView() {
        self.view = mainView
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainView.backgroundColor = .white
        mainView.textField.delegate = self
        mainView.button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        AuthAPIManager.shared.getIDToken()
      
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.view.makeToast("인증번호를 보냈습니다.",duration: 1.0 ,position: .center)
    }
    
    @objc func buttonTapped() {
        guard let text = mainView.textField.text else { return }
        let textCount = text.count

        if textCount < 6 {
            self.view.makeToast("인증번호 6자리를 입력해주시기 바랍니다",duration: 1.0, position: .center)

        } else {
            guard let verificationID = UserDefaults.standard.string(forKey: Userdefaults.verificationID.rawValue) else { print("credential error")
                return }

            AuthAPIManager.shared.verifyCode(verificationID: verificationID)

            }

        }
    
    
    override func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        
        customTextField.customTextFieldView(view: mainView.view)
        return true
    }
    
    override func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = mainView.textField.text else { return false }
        let textCount = text.count
        
        
        if textCount == 5 {
            
            customButton.changedButton(view: mainView.view, button: mainView.button)
            
        }
        return true
    }
    
}

