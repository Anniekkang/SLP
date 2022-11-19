//
//  FirstHeaderCell.swift
//  SLP
//
//  Created by 나리강 on 2022/11/19.
//

import UIKit
import SnapKit

class FirstHeaderCell : BaseHeaderCell {
    
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        configuration()
        setConstraints()
    }
    
    let backgroundImage : UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "sesac_bg_01")
        view.layer.cornerRadius = 8
        view.clipsToBounds = true
        
        return view
    }()
    
    let sesacImage : UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "sesac_face_1")
        return view
    }()
    
    override func configuration() {
        
        self.addSubview(backgroundImage)
        backgroundImage.addSubview(sesacImage)
    }
    
    
    override func setConstraints() {
        
        backgroundImage.snp.makeConstraints { make in
            make.leading.trailing.top.equalToSuperview().inset(16)
            make.height.equalTo(backgroundImage.snp.width).multipliedBy(0.56)
        }
        
        sesacImage.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().multipliedBy(1.2)
            make.height.equalToSuperview().multipliedBy(0.9)
            make.width.equalTo(sesacImage.snp.height)
            
        }
        
        
        
        
        
    }
}
