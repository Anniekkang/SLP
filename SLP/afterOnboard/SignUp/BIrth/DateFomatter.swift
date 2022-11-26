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
    
    static func calDate(year : Int, month : Int, day : Int) {
        let calYear = 365 * year
        let calDay = day
        
        
    }
}
