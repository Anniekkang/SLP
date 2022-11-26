//
//  SignInAPIManager.swift
//  SLP
//
//  Created by 나리강 on 2022/11/17.
//

import UIKit
import Alamofire
import SwiftyJSON

class SignUpAPIManager {
    static let shared = SignUpAPIManager()
    private init() {}
    
    typealias completionHandler = (Int) -> ()
    
    func sendSignUpData(query : String, completionHandler : @escaping completionHandler) {
        
        guard let url = URL(string: APIUrl.baseURL + APIUrl.loginandSignUp) else { return }
        let headers : HTTPHeaders = ["idtoken" : query, "Content-Type": "application/x-www-form-urlencoded" ]
        let parameters : [String : Any ] =
        [
            "phoneNumber" : Repository.phoneNumber,
            "FCMtoken" : Repository.FCMToken,
            "nick": Repository.nickName,
            "birth": Repository.Birth,
            "email": Repository.Email,
            "gender" : Repository.Gender
            
        ]
        
        AF.request(url, method: .post, parameters: parameters ,headers: headers)
            .validate()
            .responseData { Response in
                guard let statusCode = Response.response?.statusCode else { return }
                switch Response.result {
                case .success(let data) :
                    print("SignUp Seccess")
                    completionHandler(statusCode)
                case .failure(let error):
                    print("errorcode : \(error)")
                    completionHandler(statusCode)
               
                }
                
            }
        
        
        
    }
}
