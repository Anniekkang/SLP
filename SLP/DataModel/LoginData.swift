//
//  LoginData.swift
//  SLP
//
//  Created by 나리강 on 2022/11/23.
//

import UIKit


struct requstBody : Codable {
    var phoneNumber: Int
    let FCMtoken: String
    var nick: String
    var birth: String
    var gender: Int
    var email: String
    
}

struct parameters : Codable {
    var _id : String = ""
    var __v : Int = 0
    var uid : String = ""
    var phoneNumber : String = ""
    var email : String = ""
    var FCMtoken : String = ""
    var nick: String = ""
    var birth : String = ""
    var gender: Int = 0
    var study: String = ""
    var comment : [String] = [""]
    var reputation: [Int] = [0]
    var sesac: Int = 0
    var sesacCollection : [Int] = [0]
    var background: Int = 0
    var backgroundCollection : [Int] = [0]
    var purchaseToken : [String] = [""]
    var transactionId : [String] = [""]
    var reviewedBefore : [String] = [""]
    var reportedNum : Int = 0
    var reportedUser : [String] = [""]
    var dodgepenalty : Int = 0
    var dodgeNum : Int = 0
    var ageMin: Int = 0
    var ageMax: Int = 0
    var searchable: Int = 0
    var createdAt : String = ""
    
    
}



