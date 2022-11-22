//
//  BirthLabelCustom.swift
//  SLP
//
//  Created by 나리강 on 2022/11/22.
//

import UIKit

class BirthLabelCustom {
    static func labelCustom(label : UILabel, content : String) {
        label.textColor = colorCustom.shared.blackColor
        label.font = UIFont(name: FontName.fontRegular.rawValue, size: FontSize.large.rawValue)
        label.text = content
        label.textAlignment = .left
    }
    static func textFieldCustom(textField : UITextField, placeholder : String) {
        textField.textAlignment = .left
        textField.placeholder = placeholder
        textField.isEnabled = false
        
       
        
    }
}

