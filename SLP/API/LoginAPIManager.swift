//
//  LoginAPIManager.swift
//  SLP
//
//  Created by 나리강 on 2022/11/17.
//

import UIKit
import Alamofire
import SwiftyJSON


class LoginAPIManager {
    static let shared = LoginAPIManager()
    private init() {}
    
    typealias completionHandler = (Int, [String]) -> ()
    
    func fetchloginData(query : String, completionHandler : @escaping completionHandler) {
        let url = APIUrl.baseURL + APIUrl.loginandSignUp
        
        let headers : HTTPHeaders = ["idtoken" : "\(query)"]
        
        AF.request(url, method: .get, encoding: URLEncoding.default, headers: headers)
            .validate(statusCode: 200...501)
            .responseData { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                print("JSON: \(json)")
               
                
            case .failure(let error):
                print("errorcode : \(error)")
            }
        }
        
    }
    
    
    
    
}
