//
//  AuthorizationViewController.swift
//  SLP
//
//  Created by 나리강 on 2022/11/09.
//

import UIKit
import FirebaseAuth


class AuthorizationViewController: BaseViewController {
    
    let mainView = AuthorizationView()
    var IDToken : String?
    
    override func loadView() {
        self.view = mainView
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainView.backgroundColor = .white
        mainView.textField.delegate = self
        mainView.button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
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
            
            //작성한 인증코드
            guard let verificationCode = mainView.textField.text else {
                print("verificationCode error")
                return }
            //문자로 보내진 인증코드
            guard let verificationID = UserDefaults.standard.string(forKey: "authVerificationID") else { print("credential error")
                return }
            
            let credential = PhoneAuthProvider.provider().credential(
                withVerificationID: verificationID,
                verificationCode: verificationCode
            )
            
            
            Auth.auth().signIn(with: credential) { authResult, error in
                if let error = error {
                    print("Unable to login with Phone : error:\(error)")
                    return
                }
                
                print("Able to login with Phone in \(String(describing: authResult?.user.uid))")
                
                let currentUser = Auth.auth().currentUser
                currentUser?.getIDTokenForcingRefresh(true) { idToken, error in
                    if error != nil {
                        // Handle error
                        print("IDToken error")
                        return
                    }
                    
                    // Send token to your backend via HTTPS
                    // ...
                    guard let idToken = idToken else {
                        print("optional idToken error")
                        return }
                    print("idToken : \(String(describing: idToken))")
                    
                    LoginAPIManager.shared.fetchloginData(query: idToken) { [weak self] success, error in
                       
                        
                        print("api success")
                        self?.navigationController?.pushViewController(nickNameViewController(), animated: true)
                    }
                }
                
                
            }
            
          
            
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
            
        } else {
            
            
            
            
        }
        
        return true
    }
    
}

