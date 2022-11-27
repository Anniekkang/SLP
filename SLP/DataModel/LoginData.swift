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



