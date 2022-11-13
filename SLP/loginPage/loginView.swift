//
//  loginView.swift
//  SLP
//
//  Created by 나리강 on 2022/11/08.
//

import UIKit
import SnapKit

class loginView: BaseView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configuration()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    let label : UILabel = {
        let label = UILabel()
        label.text = "새싹 서비스 이용을 위해\n휴대폰 번호를 입력해 주세요"
        label.textColor = colorCustom.shared.blackColor
        label.textAlignment = .center
        label.numberOfLines = 2
        label.font = UIFont(name: FontName.fontRegular.rawValue, size: FontSize.large.rawValue)
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
        text.placeholder = "휴대폰 번호(-없이 숫자만 입력)"
        text.minimumFontSize = FontSize.small.rawValue
        text.keyboardType = .asciiCapableNumberPad
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
        button.setTitle("인증 문자 받기", for: .normal)
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
            make.top.equalTo(safeAreaLayoutGuide).offset(169)
            make.leading.trailing.equalToSuperview().inset(73)
            make.height.equalTo(65)
        }
        
        stackView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(label.snp.bottom).offset(77)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(40)
            
            
        }
        
        textField.snp.makeConstraints { make in
        
        }
        
        view.snp.makeConstraints { make in
            make.height.equalTo(1)
        
        }
        
        button.snp.makeConstraints { make in
            make.top.equalTo(stackView.snp.bottom).offset(77)
            make.height.equalTo(48)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        
    }
    
}
