//
//  Userdefaults.swift
//  SLP
//
//  Created by 나리강 on 2022/11/23.
//

import UIKit

enum Repository : String {
    case verificationID = "verificationID"
    case tokenID = "tokenID"
    case firstTime = "isFirstTime"
    
    static func isFirstTime() -> Bool {
        let defaults = UserDefaults.standard
        if defaults.object(forKey: Repository.firstTime.rawValue) == nil {
            defaults.set("no", forKey: Repository.firstTime.rawValue)
            return true
        }
        return false
    }
    
    
}

