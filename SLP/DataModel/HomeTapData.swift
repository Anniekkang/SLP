//
//  SearchData.swift
//  SLP
//
//  Created by 나리강 on 2022/11/27.
//

import Foundation

class HomeTapData {
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
}
