//
//  verifyCodeExtension.swift
//  SLP
//
//  Created by 나리강 on 2022/11/26.
//

import UIKit
import FirebaseAuth

extension AuthorizationViewController {
    
    func verifyCode(verificationID: String, verificationCode : String) {
        //작성한 인증코드 & 인증ID와 일치여부 확인
        
        let credential = PhoneAuthProvider.provider().credential(
            withVerificationID: verificationID,
            verificationCode: verificationCode
        )
        
        Auth.auth().signIn(with: credential) { authResult, error in
            if let error = error {
                print("Unable to login with Phone : error:\(error)")
                AuthorizationViewController.shared.mainView.makeToast("인증번호가 불일치합니다")
            } else {
                
                //인증번호 일치함 -> 로그인하기
                print("Able to login with Phone in \(String(describing: authResult?.user.uid))")
                getID.shared.getIDToken { idToken in
                    UserDefaults.standard.set(idToken, forKey: Repository.tokenID.rawValue)
                }
                
                AuthAPIManager.shared.fetchloginData(query: UserDefaults.standard.string(forKey: Repository.tokenID.rawValue) ?? "") { statusCode in
                    switch statusCode {
                    case 200 :
                        print("Auth Success")
                        self.navigationController?.pushViewController(TabBarController(), animated: true)
                    case 401 :
                        print("Firebase TokenError")
                        getID.shared.getIDToken { idToken in
                            UserDefaults.standard.set(idToken, forKey: Repository.tokenID.rawValue)
                        }
                        guard let newID = UserDefaults.standard.string(forKey: Repository.tokenID.rawValue) else { return }
                        print("=========\(newID)")
                        AuthAPIManager.shared.fetchloginData(query: newID) { statusCode in
                            switch statusCode {
                            case 200 :
                                print("Auth Success")
                                self.navigationController?.pushViewController(TabBarController(), animated: true)
                            case 406 :
                                print("unregistered User")
                                DispatchQueue.main.async {
                                    print("dispatchqueue")
                                    
                                    self.navigationController?.pushViewController(nickNameViewController(), animated: true)
                                }
                                
                            default :
                                print("error again")
                            }
                        }
                    case 406 :
                        print("unregistered User")
                        DispatchQueue.main.async {
                            print("dispatchqueue")
                            
                            self.navigationController?.pushViewController(nickNameViewController(), animated: true)

                        }
                        
                    case 500 :
                        print("Server Error")
                    case 501 :
                        print("Client Error")
                    default :
                        return
                    }
                }
            }
        }
    }
    
}
