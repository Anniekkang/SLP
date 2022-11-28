//
//  HeaderCollectionReusableView.swift
//  SLP
//
//  Created by 나리강 on 2022/11/27.
//

import UIKit

class HeaderCollectionReusableView: UICollectionReusableView {
    static var id = String(describing: HeaderCollectionReusableView.self)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(label)
        
        label.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    let label : UILabel = {
       let label = UILabel()
        label.font = UIFont(name: FontName.fontRegular.rawValue, size: FontSize.small.rawValue)
        label.textColor = colorCustom.shared.blackColor
        label.textAlignment = .left
        
        return label
    }()
}
