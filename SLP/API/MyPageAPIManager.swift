//
//  ManageMyInfoAPIManager.swift
//  SLP
//
//  Created by 나리강 on 2022/11/28.
//

import UIKit
import Alamofire
import SwiftyJSON

class MyPageAPIManager {
    static let shared = MyPageAPIManager()
    private init() {}
    
    typealias completionHandler = (Int) -> ()
    
    
    func updateMyPage(query : String, completionHandler : @escaping completionHandler) {
        
        guard let url = URL(string: APIUrl.baseURL + APIUrl.saveMyPage) else { return }
        let headers : HTTPHeaders = ["idtoken" : query, "Content-Type": "application/x-www-form-urlencoded" ]
        let parameters : [String : Any ] =
        [
            MyPageData.updateMyPage[0] : 0,
            MyPageData.updateMyPage[1] : 18,
            MyPageData.updateMyPage[2] : 65,
            MyPageData.updateMyPage[3] : 0,
            MyPageData.updateMyPage[4] : ""
           
            
        ]
        
        AF.request(url, method: .put, parameters: parameters ,headers: headers)
            .validate()
            .responseData { Response in
                guard let statusCode = Response.response?.statusCode else { return }
                switch Response.result {
                case .success(let data) :
                    print("UpdateMyPage Seccess")
                    print("data============\(data)")
                    
                    completionHandler(statusCode)
                case .failure(let error):
                    print("errorcode : \(error)")
                    completionHandler(statusCode)
               
                }
                
            }
        
        
        
    }

    
    
    
    
    
    
    
}
