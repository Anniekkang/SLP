//
//  LoginAPIManager.swift
//  SLP
//
//  Created by 나리강 on 2022/11/17.
//

import UIKit
import Alamofire
import SwiftyJSON
import FirebaseAuth


class AuthAPIManager {
    static let shared = AuthAPIManager()
    private init() {}
    
    typealias completionHandler = (Int) -> ()
    
    
    
    
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
          
                self.fetchloginData(query: UserDefaults.standard.string(forKey: Repository.tokenID.rawValue) ?? "") { statusCode in
                    self.checkStatusCode(status: statusCode)
                }
            }
        }
    }
    
    
    
    func fetchloginData(query : String, completionHandler : @escaping completionHandler) {
        guard let url = URL(string: APIUrl.baseURL + APIUrl.loginandSignUp) else { return }
        let headers : HTTPHeaders = ["idtoken" : query]
        
        AF.request(url, method: .get, headers: headers)
            .validate()
            .responseData { Response in
                switch Response.result {
                case .success(let data) :
                    let decoder = JSONDecoder()
                    do {
                        let decodeData = try decoder.decode(parameters.self, from: data)
                        print(decodeData.ageMax)
                        guard let statusCode = Response.response?.statusCode else { return }
                        completionHandler(statusCode)
                        
                    } catch {
                        print("decode error")
                    }
                case .failure(let error):
                    
                    print("errorcode : \(error)")
                }
                
            }
        
    }
    
    func checkStatusCode(status : Int) {
        switch status {
        case 200 :
            print("login Success")
            AuthorizationViewController.shared.navigationController?.pushViewController(TabBarController(), animated: true)
        case 401 :
            print("Firebase TokenError")
            getID.shared.getIDToken { idToken in
                UserDefaults.standard.set(idToken, forKey: Repository.tokenID.rawValue)
            }
            guard let newID = UserDefaults.standard.string(forKey: Repository.tokenID.rawValue) else { return }
            print("=========\(newID)")
            self.fetchloginData(query: newID) { _ in
                print("networking error")
            }
        case 406 :
            print("unregistered User")
            AuthorizationViewController.shared.navigationController?.pushViewController(nickNameViewController(), animated: true)
        case 500 :
            print("Server Error")
        case 501 :
            print("Client Error")
        default :
            return
        }
    }
    
    struct parameters : Codable {
        var background: Int
        var sesac:Int
        let nick: String
        let reputation: [Int]
        var gender: Int
        var study: String
        var searchable: Int
        var ageMin: Int
        var ageMax: Int
    }
    
}
