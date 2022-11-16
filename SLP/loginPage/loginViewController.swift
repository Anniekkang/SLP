//
//  loginViewController.swift
//  SLP
//
//  Created by 나리강 on 2022/11/08.
//

import UIKit
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
       
        PhoneAuthProvider.provider()
          .verifyPhoneNumber(text, uiDelegate: nil) { verificationID, error in
              if let error = error {
               print("phoneAuth error : \(error)")
                return
              }
              // Sign in using the verificationID and the code sent to the user
              print("verify phone")
              UserDefaults.standard.set(verificationID, forKey: "authVerificationID")
              
          }
        
        let vc = AuthorizationViewController()
        navigationController?.pushViewController(vc, animated: true)

        
    }
    
    
    
    override func configuration() {
        
        
    }
    
    override func setConstraints() {
        
        
    }
    
    
}

