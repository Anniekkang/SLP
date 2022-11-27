//
//  searchAPIManager.swift
//  SLP
//
//  Created by 나리강 on 2022/11/27.
//

import UIKit
import Alamofire
import SwiftyJSON

class SearhAPIManager {
    static let shared = SearhAPIManager()
    private init() {}
    
    typealias completionHandler = (Int) -> ()
    
    func fetchingMatchingStatus(query : String, completionHandler : @escaping completionHandler) {
        guard let url = URL(string: APIUrl.baseURL + APIUrl.myQueueState) else {
            print("url optionalbinding error")
            return }
        let headers : HTTPHeaders = ["idtoken" : query]
        
        AF.request(url, method: .get, headers: headers)
            .validate()
            .responseData { Response in
                guard let statusCode = Response.response?.statusCode else { return }
                switch Response.result {
                case .success(let data) :
                    let decoder = JSONDecoder()
                    do {
                        let decodeData = try decoder.decode(matchingData.self, from: data)
                        print("decodeData=========\(decodeData)")
                        completionHandler(statusCode)
                        
                    } catch {
                        print("decode error")
                    }
                case .failure(let error):
                    print("errorcode : \(error)")
                    completionHandler(statusCode)
                    
                    
                }
                
            }

    }

}
