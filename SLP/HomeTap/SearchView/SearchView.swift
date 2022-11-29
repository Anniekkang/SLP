//
//  SearchView.swift
//  SLP
//
//  Created by 나리강 on 2022/11/27.
//

import UIKit

class SearchView: BaseView {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let firstStackView : UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 0
        return view
    }()
    
    let secondStackView : UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 0
        return view
    }()
    
    let aroundLabel : UILabel = {
        let label = UILabel()
        label.text = "주변 새싹"
        label.textAlignment = .center
        label.textColor = colorCustom.shared.greenBrandColor
        label.font = UIFont(name: FontName.fontRegular.rawValue, size: FontSize.medium.rawValue)
        return label
    }()
    
    let aroundView : UIView = {
       let view = UIView()
        view.backgroundColor = colorCustom.shared.greenBrandColor
        return view
    }()
    
    let requestLabel : UILabel = {
        let label = UILabel()
        label.text = "받은 요청"
        label.textAlignment = .center
        label.textColor = colorCustom.shared.gray6
        label.font = UIFont(name: FontName.fontRegular.rawValue, size: FontSize.medium.rawValue)
        return label
    }()
    
    let requestView : UIView = {
       let view = UIView()
        view.backgroundColor = colorCustom.shared.gray6
        return view
    }()
    
    let button : UIButton = {
       let button = UIButton()
        customButton.changedButton(view: nil, button: button)
        button.setTitle("스터디 변경하기", for: .normal)
        button.titleLabel?.textAlignment = .center
        button.layer.cornerRadius = 8
        return button
    }()
    
    let refreshButton : UIButton = {
       let button = UIButton()
        button.setImage(UIImage(named: "Vector"), for: .normal)
        button.tintColor = colorCustom.shared.greenBrandColor
        button.layer.cornerRadius = 8
        button.layer.borderWidth = 1
        button.layer.borderColor = colorCustom.shared.greenBrandColor.cgColor
        return button
    }()
    
    let logoView : UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "sprout 1")
        return view
    }()
    
    let mentLabel : UILabel = {
        let label = UILabel()
        label.text = "아쉽게도 주변에 새싹이 없어요ㅠ"
        label.textColor = colorCustom.shared.blackColor
        label.font = UIFont(name: FontName.fontRegular.rawValue, size: FontSize.extraLarge.rawValue)
        label.textAlignment = .center
        return label
    }()
    
    let submentLabel : UILabel = {
        let label = UILabel()
        label.text = "스터디를 변경하거나 조금만 더 기다려 주세요!"
        label.textColor = colorCustom.shared.gray7
        label.font = UIFont(name: FontName.fontRegular.rawValue, size: FontSize.medium.rawValue)
        label.textAlignment = .center
        return label
    }()
    
    override func configuration() {
        [firstStackView,secondStackView,logoView,mentLabel,submentLabel,button,refreshButton].forEach {
            self.addSubview($0)
        }
        [aroundView,aroundLabel].forEach {
            firstStackView.addSubview($0)
        }
        [requestView,requestLabel].forEach {
            secondStackView.addSubview($0)
        }
     
    }
    override func setConstraints() {
        firstStackView.snp.makeConstraints { make in
            make.leading.top.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.08)
            make.width.equalToSuperview().multipliedBy(0.5)
            
        }
        
        aroundLabel.snp.makeConstraints { make in
            make.leading.trailing.top.equalToSuperview()
            make.height.equalTo(firstStackView.snp.height).multipliedBy(0.98)
        }
        
        aroundView.snp.makeConstraints { make in
            make.height.equalTo(firstStackView.snp.height).multipliedBy(0.02)
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(aroundLabel.snp.bottom)
        }
        secondStackView.snp.makeConstraints { make in
            make.trailing.top.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.08)
            make.width.equalToSuperview().multipliedBy(0.5)
        }
        
        requestLabel.snp.makeConstraints { make in
            make.leading.trailing.top.equalToSuperview()
            make.height.equalTo(firstStackView.snp.height).multipliedBy(0.98)
        }
        
        requestView.snp.makeConstraints { make in
            make.height.equalTo(firstStackView.snp.height).multipliedBy(0.02)
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(requestLabel.snp.bottom)
        }
        
        logoView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().multipliedBy(0.8)
            make.width.equalToSuperview().multipliedBy(0.2)
            make.height.equalTo(logoView.snp.width).multipliedBy(0.75)
        }
        
        mentLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().multipliedBy(1.01)
            make.width.equalToSuperview()
            make.height.equalTo(32)
        }
        
        submentLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(mentLabel.snp.bottom)
            make.width.equalToSuperview()
            make.height.equalTo(22)
        }
        
        button.snp.makeConstraints { make in
            make.height.equalTo(48)
            make.leading.equalToSuperview().inset(16)
            make.bottom.equalToSuperview().inset(50)
            make.width.equalToSuperview().multipliedBy(0.76)
        }
        refreshButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(16)
            make.height.width.equalTo(48)
            make.bottom.equalToSuperview().inset(50)
        }
    }
    

}
