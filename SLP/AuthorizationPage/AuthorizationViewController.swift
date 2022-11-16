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
    override func loadView() {
        self.view = mainView
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        mainView.backgroundColor = .white
        mainView.button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    @objc func buttonTapped() {
       
        guard let verificationCode = mainView.textField.text else {
            print("verificationCode error")
            return }
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
            // User is signed in
            // ...
            
            print("Able to login with Phone")
        }
        
        
        
        
    }
   

}
