//
//  secondSectionCell.swift
//  SLP
//
//  Created by 나리강 on 2022/12/01.
//

import UIKit

class secondSectionCell: BaseCollectionViewCell {
    static var id = String(describing: secondSectionCell.self)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let stackView : UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.spacing = 0
        view.alignment = .center
        view.sizeToFit()
        return view
    }()
    
    
    let label : UILabel = {
        let label = UILabel()
        label.textColor = colorCustom.shared.greenBrandColor
        label.font = UIFont(name: FontName.fontRegular.rawValue, size: FontSize.medium.rawValue)
        label.textAlignment = .right
        label.sizeToFit()
        label.text = "test"
        return label
    }()
    
    let XButton : UIButton = {
        let button = UIButton()
        button.setTitleColor(colorCustom.shared.greenBrandColor, for: .normal)
        button.titleLabel?.font = UIFont(name: FontName.fontRegular.rawValue, size: FontSize.medium.rawValue)
        button.setImage(UIImage(named: "close_small"), for: .normal)
        return button
    }()
    
    let view : UIView = {
       let view = UIView()
        view.layer.cornerRadius = 8
        view.layer.borderColor = colorCustom.shared.greenBrandColor.cgColor
        return view
    }()
    
    override func configure() {
        contentView.addSubview(view)
        view.addSubview(stackView)
        [label, XButton].forEach {
            stackView.addSubview($0)
        }
    }
    
    override func setConstraints() {
        view.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.bottom.equalToSuperview()
        }
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        label.snp.makeConstraints { make in
            make.leading.top.bottom.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.8)
        }
        
        XButton.snp.makeConstraints { make in
            make.leading.equalTo(label.snp.trailing)
            make.trailing.top.bottom.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.2)
        }
        
        
        
        
    }
}
