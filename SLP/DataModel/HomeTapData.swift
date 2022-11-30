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
    
    var aroundArray : [String]?
    var wantArray : [String]?
    
    struct sesecSearchData : Codable {
        var fromQueueDB : [sesacSearchValueData]
        var fromQueueDBRequested : [sesacSearchValueData]
        var fromRecommend : [String]
   
    }
    
    struct sesacSearchValueData : Codable {
        var uid : String
        var nick : String
        var lat : Double
        var long : Double
        var reputation : [Int]
        var studylist : [String]
        var reviews : [String]
        var gender : Int
        var type : Int
        var sesac : Int
        var background : Int
      
    }
}
