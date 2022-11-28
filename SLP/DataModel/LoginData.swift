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
    static let background: Int = 0
    static let sesac: Int = 0
    static let nick: String = ""
    static let reputation: [Int] = [0]
    static let gender: Int = 0
    static let study: String = ""
    static let searchable: Int = 0
    static let ageMin: Int = 0
    static let ageMax: Int = 0
}



