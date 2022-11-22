//
//  DateFomatter.swift
//  SLP
//
//  Created by 나리강 on 2022/11/22.
//

import UIKit

class BirthDateFormatter {
    static func changeDatetoString(date : Date) {
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = "yyyy,MM,dd"
        let date = dateformatter.string(from: date)
        let dateArray : [String] = date.components(separatedBy: ",")
        
        BirthViewController.year = dateArray[0]
        BirthViewController.month = dateArray[1]
        BirthViewController.day = dateArray[2]
        
    }
    
    static func changeStringtoInt(string : String) -> Int {
        let result = Int(string) ?? 0
        return result
    }
    
    static func calDate(birthdate : Date) -> Bool {
        let today = Date() //today
        let afterseventeenDate = birthdate.addingTimeInterval(6205 * 86400) //birthday + 17 years
        let result = Calendar.current.compare(today, to: afterseventeenDate, toGranularity: .day)
        switch result {
        case .orderedAscending :
            return false
        case .orderedDescending :
            return true
        case .orderedSame :
            return true
            
        }
    }
}
