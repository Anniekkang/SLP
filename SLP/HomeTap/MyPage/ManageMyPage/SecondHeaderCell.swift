//
//  SecondHeaderCell.swift
//  SLP
//
//  Created by 나리강 on 2022/11/19.
//

import UIKit
import SnapKit

class SecondHeaderCell : BaseHeaderCell {
    
    var delegate : HeaderViewDelegate?
    var sectionIndex = 0
    let tapGestureRecognizer = UITapGestureRecognizer()
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        configuration()
        setConstraints()
        
        contentView.addGestureRecognizer(tapGestureRecognizer)
        tapGestureRecognizer.addTarget(self, action: #selector(didSelectSection))
        
    }
    @objc func didSelectSection() {
        delegate?.didTouchSection(self.sectionIndex)

    }
    let stackView : UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.distribution = .fill
        return view
    }()
    
    let label : UILabel = {
       let label = UILabel()
        label.text = "name"
        label.textColor = .black
        label.font = UIFont(name: FontName.fontRegular.rawValue, size: FontSize.large.rawValue)
        label.textAlignment = .left
        return label
    }()
    
    let button : UIButton = {
       let button = UIButton()
        button.setImage(UIImage(named: "Vector 49"), for: .normal)
        return button
    }()
    
    override func configuration() {
        self.addSubview(stackView)
        [label, button].forEach {
            stackView.addSubview($0)
        }
        
    }
    
    override func setConstraints() {
        stackView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(stackView.snp.width).multipliedBy(0.17)
            make.top.equalToSuperview()
        }
        
        label.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.4)
            make.leading.equalToSuperview().inset(16)
            make.width.equalTo(label.snp.height).multipliedBy(11)
        }
        
        button.snp.makeConstraints { make in
            make.leading.equalTo(label.snp.trailing).offset(10)
            make.centerY.equalToSuperview()
            make.width.equalTo(12)
            make.height.equalTo(6)
        }
        
    }
    
}
