//
//  CustomButton.swift
//  SLP
//
//  Created by 나리강 on 2022/11/21.
//

import UIKit

class CustomButton {
    static func buttonCustom(label : UILabel) {
        label.layer.cornerRadius = 8
        label.layer.borderWidth = 1
        label.layer.borderColor = colorCustom.shared.gray2.cgColor
        label.clipsToBounds = true
        label.textColor = colorCustom.shared.blackColor
        label.textAlignment = .center
     
    }
}
