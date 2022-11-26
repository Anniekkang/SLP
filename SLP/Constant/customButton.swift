//
//  Button.swift
//  SLP
//
//  Created by 나리강 on 2022/11/15.
//

import UIKit

class customButton {
    
    
    static func changedButton(view : UIView?, button : UIButton) {
        
        view?.backgroundColor = colorCustom.shared.gray3
        button.backgroundColor = colorCustom.shared.greenBrandColor
        button.setTitleColor(colorCustom.shared.whiteColor, for: .normal)
        
        
    }
    
    static func genderVCchangedButton(view : UIView, button : UIButton) {
        
        view.backgroundColor = colorCustom.shared.whiteBrandColor
        button.backgroundColor = colorCustom.shared.greenBrandColor
        button.setTitleColor(colorCustom.shared.whiteColor, for: .normal)
        
        
    }
    
}
