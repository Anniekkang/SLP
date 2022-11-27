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
    
    static var phoneNumber : String = ""
    static var FCMToken : String = ""
    static var nickName : String = ""
    static var Birth : Date = Date()
    static var Email : String = ""
    static var Gender : Int = 2
    static var lat : Double = 0.0
    static var long : Double = 0.0
    static var studylist : [String] = [""]
    static var locationAuthStatus : Int32?
    
    static func isFirstTime() -> Bool {
        let defaults = UserDefaults.standard
        if defaults.object(forKey: Repository.firstTime.rawValue) == nil {
            defaults.set("no", forKey: Repository.firstTime.rawValue)
            return true
        }
        return false
    }
    
    
}

