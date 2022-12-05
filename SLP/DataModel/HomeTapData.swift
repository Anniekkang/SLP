//
//  SearchData.swift
//  SLP
//
//  Created by 나리강 on 2022/11/27.
//

import Foundation

class HomeTapData {
    
    static let shared = HomeTapData()
    
    struct matchingData : Codable {
        var dodged : Int
        var matched : Int
        var reviewed : Int
        var matchedNick : String
        var matchedUid : String
    }
    
    var addStudyArray = ["지금 주변에는","내가 하고 싶은"]
    var searchArray = ["주변 새싹", "받은 요청"]
    var aroundArray : [String]?
    var wantArray : [String]?
    
   
    }
    
    struct myQueStatus : Codable {
        static var shared = myQueStatus()
        var dodged : Int = 0
        var matched : Int = 0
        var reviewed : Int = 0
        var matchedNick : String = ""
        var matchedUid : String = ""
      
    }


struct sesecSearchData : Codable {
    static var shared = sesecSearchData()
    
    var fromQueueDB : [sesacSearchValueData] = []
    var fromQueueDBRequested : [sesacSearchValueData] = []
    var fromRecommend : [String] = []

}

struct sesacSearchValueData : Codable {
    static var shared = sesacSearchValueData()
    
    var uid : String = ""
    var nick : String = ""
    var lat : Double = 0
    var long : Double = 0
    var reputation : [Int] = []
    var studylist : [String] = []
    var reviews : [String] = []
    var gender : Int = 0
    var type : Int = 0
    var sesac : Int = 0
    var background : Int = 0
    
}
