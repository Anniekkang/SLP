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
                        let decodeData = try decoder.decode(HomeTapData.matchingData.self, from: data)
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
    
    func sendLocation(query : String, completionHandler : @escaping completionHandler) {
        
        guard let url = URL(string: APIUrl.baseURL + APIUrl.search) else { return }
        let headers : HTTPHeaders = ["idtoken" : query, "Content-Type": "application/x-www-form-urlencoded" ]
        let parameters : [String : Any ] =
        [
            "lat": Repository.currentLocationlat,
            "long": Repository.currentLocationlong
        ]
        
        AF.request(url, method: .post, parameters: parameters ,headers: headers)
            .validate()
            .responseData { Response in
                guard let statusCode = Response.response?.statusCode else { return }
                switch Response.result {
                case .success(let data) :
                    
                    print("SearchAPI success")
                    print("data============\(data)")
                    
                    let decoder = JSONDecoder()
                    do {
                        let decodeData = try decoder.decode(HomeTapData.sesecSearchData.self, from: data)
                        print("decodedata============\(decodeData)")
                    } catch {
                        print("decodeError====\(error)")
                    }
                    
                    
                    completionHandler(statusCode)
                case .failure(let error):
                    print("errorcode : \(error)")
                    completionHandler(statusCode)
               
                }
                
            }
        
        
        
    }
        
        
        
    }


