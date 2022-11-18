//
//  AuthorizationView.swift
//  SLP
//
//  Created by 나리강 on 2022/11/09.
//

import UIKit

class AuthorizationView: BaseView {

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
        label.text = "인증번호가 문자로 전송되었어요"
        label.textAlignment = .center
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
        text.placeholder = "인증번호 입력"
        text.textColor = colorCustom.shared.gray7
        text.keyboardType = .asciiCapableNumberPad
        return text
    }()
    
    let view : UIView = {
        let view = UIView()
        view.backgroundColor = colorCustom.shared.gray3
        return view
    }()
    
//    let timerLabel : UILabel = {
//        let label = UILabel()
//        let timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(startTimer), userInfo: nil, repeats: false)
//
//        label.textColor = colorCustom.shared.greenBrandColor
//
//        return label
//    }()
//
//    @objc func startTimer() {
//
//
//
//    }

   
    
    let sendButton : UIButton = {
        let button = UIButton()
        button.setTitle("재전송", for: .normal)
        button.setTitleColor(colorCustom.shared.whiteColor, for: .normal)
        button.backgroundColor = colorCustom.shared.greenBrandColor
        button.layer.cornerRadius = 8
        return button
    }()
    
   
    
    
    let button : UIButton = {
        let button = UIButton()
        button.backgroundColor = colorCustom.shared.gray6
        button.layer.cornerRadius = 8
        button.setTitle("인증하고 시작하기", for: .normal)
        button.setTitleColor(colorCustom.shared.gray3, for: .normal)
        return button
    }()
    
    
    override func configuration() {
        [label,stackView,sendButton,button].forEach {
            self.addSubview($0)
        }
        [textField, view].forEach {
            stackView.addArrangedSubview($0)
        }

    }
    
    override func setConstraints() {
        label.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().multipliedBy(0.5)
            make.width.equalToSuperview()
            make.height.equalTo(32)
        }
        
        stackView.snp.makeConstraints { make in
            make.centerY.equalToSuperview().multipliedBy(0.8)
            make.leading.equalToSuperview().inset(16)
            make.height.equalTo(40)
            make.width.equalToSuperview().multipliedBy(0.63)
            
            
        }
        
        textField.snp.makeConstraints { make in
        
        }
        
        view.snp.makeConstraints { make in
            make.height.equalTo(1)
        
        }
        
        sendButton.snp.makeConstraints { make in

            make.centerY.equalToSuperview().multipliedBy(0.8)
            make.trailing.equalToSuperview().inset(16)
            make.height.equalTo(40)
            make.width.equalTo(textField.snp.width).multipliedBy(0.35)
            
            
        }
        
        button.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().multipliedBy(1.1)
            make.height.equalTo(48)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
      
        
    }
    

}
