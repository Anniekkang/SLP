//
//  OnboardCollectionViewCell.swift
//  SLP
//
//  Created by 나리강 on 2022/11/13.
//

import UIKit
import SnapKit

class OnboardCollectionViewCell: BaseCollectionViewCell {
    
    static var id = String(describing: OnboardCollectionViewCell.self)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    let label : UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.textAlignment = .center
        return label
    }()
    
    let image : UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    override func configure() {
        [label, image].forEach {
            contentView.addSubview($0)
        }
        
    }
    override func setConstraints() {
        label.snp.makeConstraints { make in
            make.top.equalTo(contentView).offset(116)
            make.centerX.equalToSuperview()
            make.height.equalTo(75)
        }
        
        image.snp.makeConstraints { make in
            make.bottom.equalTo(contentView)
            make.centerX.equalTo(contentView)
            make.leading.trailing.equalTo(contentView).inset(40)
            make.height.equalTo(image.snp.width)
        }
        
        
    }
    
    
}
