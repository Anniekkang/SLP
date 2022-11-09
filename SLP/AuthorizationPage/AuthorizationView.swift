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
        label.font = UIFont(name: FontName.fontName.rawValue, size: FontSize.large.rawValue)
        return label
        
    }()
    
    let stackView : UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 12
        view.distribution = .fill
        return view
        
    }()
    
    let textfield : UITextField = {
        let text = UITextField()
        text.placeholder = "인증번호 입력"
        text.textColor = colorCustom.shared.gray7
        return text
    }()
    
    let timeLabel : UILabel = {
        let label = UILabel()
        label.text = "05:00"
        label.textColor = colorCustom.shared.greenBrandColor
        return label
    }()
    
    let sendButton : UIButton = {
        let button = UIButton()
        button.setTitle("재전송", for: .normal)
        button.setTitleColor(colorCustom.shared.whiteColor, for: .normal)
        button.backgroundColor = colorCustom.shared.greenBrandColor
        return button
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
        button.setTitle("인증하고 시작하기", for: .normal)
        button.setTitleColor(colorCustom.shared.gray3, for: .normal)
        return button
    }()
    
    
    override func configuration() {
        [label,stackView,sendButton,button].forEach {
            self.addSubview($0)
        }
        [textfield, view].forEach {
            stackView.addArrangedSubview($0)
        }
        textfield.addSubview(timeLabel)
    }
    
    override func setConstraints() {
        
    }
    

}
