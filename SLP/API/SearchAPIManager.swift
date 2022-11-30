//
//  searchAPIManager.swift
//  SLP
//
//  Created by 나리강 on 2022/11/27.
//

import UIKit
import Alamofire
import SwiftyJSON

class SearchAPIManager {
    static let shared = SearchAPIManager()
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
    
    func nearSesacSearch(query : String, completionHandler : @escaping completionHandler) {
        
        guard let url = URL(string: APIUrl.baseURL + APIUrl.search) else { return }
        let headers : HTTPHeaders = ["idtoken" : query, "Content-Type": "application/x-www-form-urlencoded" ]
        let parameters : [String : Any ] =
        [
            "lat": 37.517819364682694, //Repository.currentLocationlat,
            "long": 126.88647317074734 //Repository.currentLocationlong
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
        
    func requestSesacFind(query : String, completionHandler : @escaping completionHandler) {
        
        guard let url = URL(string: APIUrl.baseURL + APIUrl.findRequest) else { return }
        let headers : HTTPHeaders = ["idtoken" : query, "Content-Type": "application/x-www-form-urlencoded" ]
        let parameters : [String : Any ] =
        [
            "lat": 37.517819364682694, //Repository.currentLocationlat,
            "long": 126.88647317074734, //Repository.currentLocationlong,
            "studylist" : ["anything"]
        ]
        
        let encoder = URLEncoding(arrayEncoding: .noBrackets)
        
        AF.request(url, method: .post, parameters: parameters,encoding: encoder, headers: headers)
            .validate()
            .responseData { Response in
                guard let statusCode = Response.response?.statusCode else { return }
                switch Response.result {
                case .success(let data) :
                    
                    print("FindAPI success")
                    print("data============\(data)")
                    
                    
                    completionHandler(statusCode)
                    
                case .failure(let error):
                    print("errorcode : \(error)")
                    completionHandler(statusCode)
               
                }
                
            }
        
        
        
    }
        
    
    func callSearchAPI(mainView : UIView) {
        SearchAPIManager.shared.nearSesacSearch(query: TokenID.tokenID) { statusCode in
            
            switch statusCode {
            case 200 :
                print("success API")
                mainView.reloadInputViews()
            case 401 :
                print("FIrebaseTokenError")
                
                getID.shared.getIDToken { idToken in
                    UserDefaults.standard.set(idToken, forKey: Repository.tokenID.rawValue)
                }
                AuthAPIManager.shared.fetchloginData(query: TokenID.tokenID) { statusCode in
                    switch statusCode {
                    case 200 :
                        print("success API")
                        mainView.reloadInputViews()
                   
                    default :
                        print("error again : \(statusCode)")
                    }
                }
            case 406 :
                print("unregistered User")
            case 500 :
                print("server error")
            case 501 :
                print("client error")
            default :
                print("extra situation")
            }
            
            
        }
        

    }
    
        
    func fetchMyState(query : String, completionHandler : @escaping completionHandler) {
        guard let url = URL(string: APIUrl.baseURL + APIUrl.myQueueState) else { return }
        let headers : HTTPHeaders = ["idtoken" : query]
        
        AF.request(url, method: .get, headers: headers)
            .validate()
            .responseData { Response in
                guard let statusCode = Response.response?.statusCode else { return }
                switch Response.result {
                case .success(let data) :
                    let decoder = JSONDecoder()
                    do {
                        //decode : JSON data -> struct data
                        let decodeData = try decoder.decode(HomeTapData.myQueStatus.self, from: data)
                        let matchingData = decodeData.matched
                        Repository.myStatus = matchingData
                        print("decodeData- Matching=========\(matchingData)")
                        completionHandler(statusCode)
                        
                        
                    } catch {
                        print("decode error : \(error)")
                        
                    }
                case .failure(let error):
                    print("errorcode : \(error)")
                    completionHandler(statusCode)
                    
                    
                }
                
            }
        
    }
 
}


