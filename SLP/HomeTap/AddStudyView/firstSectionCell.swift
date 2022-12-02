//
//  AddStudyCollectionViewCell.swift
//  SLP
//
//  Created by 나리강 on 2022/11/27.
//

import UIKit

class firstSectionCell: BaseCollectionViewCell {
    static var id = String(describing: firstSectionCell.self)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let button : UIButton = {
       let button = UIButton()
        button.setTitleColor(colorCustom.shared.blackColor, for: .normal)
        button.titleLabel?.font = UIFont(name: FontName.fontRegular.rawValue, size: FontSize.medium.rawValue)
        button.layer.cornerRadius = 8
        button.layer.borderColor = colorCustom.shared.buttonBorder.cgColor
        button.sizeToFit()
        button.setTitle("test", for: .normal)
        return button
    }()
    
    override func configure() {
        self.addSubview(button)
    }
    
    override func setConstraints() {
        button.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
