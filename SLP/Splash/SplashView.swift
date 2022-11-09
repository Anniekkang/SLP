//
//  SplashView.swift
//  SLP
//
//  Created by 나리강 on 2022/11/11.
//

import UIKit
import SnapKit

class SplashView: BaseView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configuration()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    let frameImage : UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "map_marker")
        return view
        
    }()
    
    let logoImage : UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "sesac_face_1")
        return view
        
    }()
    
    let label : UILabel = {
        let label = UILabel()
        label.text = "SeSAC Study"
        label.textColor = colorCustom.shared.greenBrandColor
        label.font = UIFont(name: "FontName.fontRegular", size: 72)
        return label
        
    }()
    
    
    override func configuration() {
        [frameImage,logoImage,label].forEach {
            self.addSubview($0)
        }
     
    }
    
    
    override func setConstraints() {
        frameImage.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(200)
            make.centerX.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(79)
        }
        
        logoImage.snp.makeConstraints { make in
            make.top.equalTo(frameImage.snp.top).inset(18)
            make.centerX.equalTo(frameImage)
            make.width.height.equalTo(180)
        }
        
        label.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(frameImage.snp.bottom).offset(36)
            make.leading.trailing.equalToSuperview().inset(42)
            make.width.equalTo(101)
        }
        
    }
    
    
}
