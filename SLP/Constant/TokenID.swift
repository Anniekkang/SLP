//
//  TokenID.swift
//  SLP
//
//  Created by 나리강 on 2022/11/30.
//

import UIKit

class TokenID {
    static let tokenID : String = UserDefaults.standard.string(forKey: Repository.tokenID.rawValue) ?? ""
}
