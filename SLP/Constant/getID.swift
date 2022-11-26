//
//  getIDToken.swift
//  SLP
//
//  Created by 나리강 on 2022/11/26.
//

import UIKit
import FirebaseAuth

class getID {
    static let shared = getID()
    private init() {}
    
    typealias completionHandler = (String) -> ()
    
    func getIDToken(completion : @escaping completionHandler) {
        print(#function)
        let currentUser = Auth.auth().currentUser
        currentUser?.getIDTokenForcingRefresh(true) { idToken, error in
            guard let idToken = idToken else {
                print("optional error - id token")
                return }
            
            if error != nil {
                print("IDToken error")
                return
            }
            
            print("idToken : \(String(describing: idToken))")
            completion(idToken)
        }
        
    }
    
}
