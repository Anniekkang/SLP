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
    
    typealias completionHandler = () -> ()
    
    func getIDToken() {
        print(#function)
        let currentUser = Auth.auth().currentUser
        currentUser?.getIDTokenForcingRefresh(false) { idToken, error in
            print(idToken)
            guard let idToken = idToken else {
                print("optional error - id token")
                return }
            
            if error != nil {
                // Handle error
                print("IDToken error")
                return
            }
            UserDefaults.standard.set(idToken, forKey: Userdefaults.tokenID.rawValue)
            
            print("idToken : \(String(describing: idToken))")
            
        }
        
    }
    
    
    
    func verifyCode(verificationID: String) {
        //작성한 인증코드
        guard let verificationCode = AuthorizationViewController.shared.mainView.textField.text else {
            print("verificationCode error")
            return }
        let credential = PhoneAuthProvider.provider().credential(
            withVerificationID: verificationID,
            verificationCode: verificationCode
        )
        
        Auth.auth().signIn(with: credential) { authResult, error in
            if let error = error {
                print("Unable to login with Phone : error:\(error)")
                AuthorizationViewController.shared.mainView.makeToast("인증번호가 불일치합니다")
            }
            
            //인증번호 일치함 -> 로그인하기
            print("Able to login with Phone in \(String(describing: authResult?.user.uid))")
            self.fetchloginData(query: UserDefaults.standard.string(forKey: Userdefaults.tokenID.rawValue) ?? "") {
                
            }
        }
    }
    
    
    func fetchloginData(query : String, completionHandler : @escaping completionHandler) {
        let url = URL(string: "http://api.sesac.co.kr:1210/v1/user")
        
        let headers : HTTPHeaders = ["idtoken" : query]
        
        
        
        AF.request(url!, method: .get,encoding: JSONEncoding.default, headers: headers)
            .responseData { Response in
                switch Response.result {
                case .success :
                    guard let statusCode = Response.response?.statusCode else { return }
                    self.checkStatusCode(status: statusCode)
                    
                case .failure(let error):
                    completionHandler()
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
            AuthAPIManager.shared.getIDToken()
            let newID = UserDefaults.standard.string(forKey: "ID")
            print("=========\(newID)")
            // self.fetchloginData(query: UserDefaults.standard.string(forKey: "ID")) {
            //                print("networking error")
            //                }
            //
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
    
    let parameters : [String:Any] = [
        
        "_id": "61d9b05be83f1515ee3ce64e",
        "__v": 0,
        "uid": "NuK12cdVaDVcc9e4ctxsLMNCrHQ2",
        "phoneNumber": "+821012345678",
        "email": "test@gmail.com",
        "FCMtoken": "dzjnejNDh0d0u1aLzfS547:APA91bFvQSjDVFC4-2IA0QQ08KqsEKwIoK2hFBZIfdyNLPd22PvgLD6YM_kyQgv0BIK-1zjltbbKYQTGK50Pn21bctsuEC46qo7RDkcImbzyZBe0-ffMqhFhL4DO5tbP0Ri_Wn-vRVF5",
        "nick": "고래밥",
        "birth": "2021-01-30T08:30:20.000Z",
        "gender": 0,
        "study": "Coding",
        "comment": ["착합니다", "매너가 최고에요!!"],
        "reputation": [1,0,1,0,1,0,1,0,1],
        "sesac": 0,
        "sesacCollection": [0,1],
        "background": 0,
        "backgroundCollection": [0,1],
        "purchaseToken": ["purchaseToken", "purchaseToken"],
        "transactionId": ["transactionId", "transactionId"],
        "reviewedBefore": ["NuK12cdVaDVcc9e4ctxsLMNCrHQ2","x4r4tjQZ8Pf9mFYUgkfmC4REcvu2"],
        "reportedNum": 0,
        "reportedUser": ["NuK12cdVaDVcc9e4ctxsLMNCrHQ2","x4r4tjQZ8Pf9mFYUgkfmC4REcvu2"],
        "dodgepenalty": 0,
        "dodgeNum": 0,
        "ageMin": 20,
        "ageMax": 30,
        "searchable": 1,
        "createdAt": "2021-01-30T08:30:20.000Z"
    ]
    
    
}
