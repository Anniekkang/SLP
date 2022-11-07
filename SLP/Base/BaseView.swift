//
//  BaseView.swift
//  SLP
//
//  Created by 나리강 on 2022/11/07.
//

import UIKit

class BaseView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configuration()
        setConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configuration(){
        
    }
    
    func setConstraints(){
        
    }
    
}
