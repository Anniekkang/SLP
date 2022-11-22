//
//  nickNameView.swift
//  SLP
//
//  Created by 나리강 on 2022/11/15.
//

import UIKit

class nickNameView: BaseView {

    override init(frame: CGRect) {
        super.init(frame:frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let label : UILabel = {
        let label = UILabel()
        label.text = "닉네임을 입력해 주세요"
        label.textColor = colorCustom.shared.blackColor
        label.textAlignment = .center
        label.numberOfLines = 1
        label.font = UIFont(name: FontName.fontRegular.rawValue, size: FontSize.extraLarge.rawValue)
        return label
    }()
    
    let stackView : UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 12
        view.distribution = .fill
        return view
        
    }()
    
    let textField : UITextField = {
        let text = UITextField()
        text.placeholder = "10자 이내로 입력"
        text.minimumFontSize = FontSize.medium.rawValue
        text.keyboardType = .default
        text.keyboardType = .emailAddress
        text.becomeFirstResponder()
        return text
    }()
    
    let view : UIView = {
        let view = UIView()
        view.backgroundColor = colorCustom.shared.gray3
        return view
    }()
    
    let button : UIButton = {
        let button = UIButton()
        button.backgroundColor = colorCustom.shared.gray6
        button.layer.cornerRadius = 8
        button.setTitle("다음", for: .normal)
        button.setTitleColor(colorCustom.shared.gray3, for: .normal)
        return button
    }()
    
    override func configuration() {
        [label,stackView,button].forEach {
            self.addSubview($0)
        }
        [textField,view].forEach {
            stackView.addArrangedSubview($0)
        }
    }
    
    
    override func setConstraints() {
        label.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().multipliedBy(0.5)
            make.width.equalToSuperview().multipliedBy(0.5)
            make.height.equalTo(32)
        }
        
        stackView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().multipliedBy(0.8)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(40)
     
        }
        
        textField.snp.makeConstraints { make in
        
        }
        
        view.snp.makeConstraints { make in
            make.height.equalTo(1)
        
        }
        
        button.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().multipliedBy(1.1)
            make.height.equalTo(48)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        
    }
    
    

    
    
    
}
