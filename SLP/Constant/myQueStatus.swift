//
//  myQueStatus.swift
//  SLP
//
//  Created by 나리강 on 2022/12/01.
//

import UIKit

enum MyQueStatus {
    case WaitforMatching
    case Matched
    
    var myQueStatus : Int {
        switch self {
        case .WaitforMatching :
            return 0
        case .Matched :
            return 1
        }
    }
}
