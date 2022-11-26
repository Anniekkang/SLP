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
                        print("login success")
                        
                        DispatchQueue.main.async {
                            AuthorizationViewController.shared.navigationController?.pushViewController(TabBarController(), animated: true)
                        }
                     
                    } catch {
                        print("decode error")
                    }
                case .failure(let error):
                    print("errorcode : \(error)")
                    guard let statusCode = Response.response?.statusCode else { return }
                    completionHandler(statusCode)
                    
                    
                }
                
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
