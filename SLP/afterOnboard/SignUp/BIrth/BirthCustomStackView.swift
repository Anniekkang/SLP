//
//  BirthCustomStackView.swift
//  SLP
//
//  Created by 나리강 on 2022/11/22.
//

import UIKit

class BirthCustomStackView : UIStackView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        
        axis = .horizontal
        spacing = 4
        distribution = .fill
        
    }
        
        
}
