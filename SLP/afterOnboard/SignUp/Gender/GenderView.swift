//
//  GenderView.swift
//  SLP
//
//  Created by 나리강 on 2022/11/15.
//

import UIKit

class GenderView: BaseView {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    let label : UILabel = {
        let label = UILabel()
        label.text = "성별을 선택해 주세요"
        label.textColor = colorCustom.shared.blackColor
        label.textAlignment = .center
        label.numberOfLines = 1
        label.font = UIFont(name: FontName.fontRegular.rawValue, size: FontSize.extraLarge.rawValue)
        return label
    }()
    
    let secondLabel : UILabel = {
        let label = UILabel()
        label.text = "새싹 찾기 기능을 이용하기 위해서 필요해요!"
        label.textColor = colorCustom.shared.gray7
        label.textAlignment = .center
        label.numberOfLines = 1
        label.font = UIFont(name: FontName.fontRegular.rawValue, size: FontSize.large.rawValue)
        return label
    }()
    
    let stackView : UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.spacing = 10
        view.alignment = .fill
        view.distribution = .fillEqually
        return view
    }()
    
    let maleView : UIView = {
        let view = UIView()
        view.layer.cornerRadius = 8
        view.layer.borderColor = colorCustom.shared.gray3.cgColor
        view.layer.borderWidth = 1
        return view
    }()
    
    let femaleView : UIView = {
        let view = UIView()
        view.layer.cornerRadius = 8
        view.layer.borderColor = colorCustom.shared.gray3.cgColor
        view.layer.borderWidth = 1
        return view
    }()
    
    let maleImage : UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "man")
        return image
    }()
    
    let femaleImage : UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "woman")
        return image
    }()
    
    let maleLabel : UILabel = {
        let label = UILabel()
        label.text = "남자"
        label.textAlignment = .center
        label.font = UIFont(name: FontName.fontRegular.rawValue, size: FontSize.medium.rawValue)
        label.textColor = colorCustom.shared.blackColor
        return label
    }()
    
    let femaleLabel : UILabel = {
        let label = UILabel()
        label.text = "여자"
        label.textAlignment = .center
        label.font = UIFont(name: FontName.fontRegular.rawValue, size: FontSize.medium.rawValue)
        label.textColor = colorCustom.shared.blackColor
        return label
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
        [label,secondLabel,button,stackView].forEach {
            self.addSubview($0)
        }
        
        [maleView,femaleView].forEach {
            stackView.addSubview($0)
        }
        
        [maleLabel, maleImage].forEach {
            maleView.addSubview($0)
        }
        
        [femaleLabel, femaleImage].forEach {
            femaleView.addSubview($0)
        }
        
        
        
    }
    
    override func setConstraints() {
        
        label.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().multipliedBy(0.45)
            make.width.equalToSuperview()
            make.height.equalTo(32)
        }
        secondLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalToSuperview()
            make.top.equalTo(label.snp.bottom).offset(8)
            make.height.equalTo(25)
        }
        
        button.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().multipliedBy(1.1)
            make.height.equalTo(48)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        
        stackView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalTo(secondLabel.snp.bottom).offset(32)
            make.bottom.equalTo(button.snp.top).inset(-32)
        }
        
        maleView.snp.makeConstraints { make in
            make.height.equalToSuperview()
            make.leading.top.bottom.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.48)
            
        }
        
        femaleView.snp.makeConstraints { make in
            make.height.equalToSuperview()
            make.trailing.top.bottom.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.48)
        }
        
        maleImage.snp.makeConstraints { make in
            make.centerX.equalTo(maleView)
            make.centerY.equalTo(maleView).multipliedBy(0.8)
            make.height.equalTo(maleView).multipliedBy(0.5)
        }
        
        maleLabel.snp.makeConstraints { make in
            make.centerX.equalTo(maleView)
            make.top.equalTo(maleImage.snp.bottom).offset(10)
            make.height.equalTo(28)
            make.leading.trailing.equalToSuperview()
        }
        
        femaleImage.snp.makeConstraints { make in
            make.centerX.equalTo(femaleView)
            make.centerY.equalTo(femaleView).multipliedBy(0.8)
            make.height.equalTo(femaleView).multipliedBy(0.5)
        }
        
        femaleLabel.snp.makeConstraints { make in
            make.centerX.equalTo(femaleView)
            make.top.equalTo(femaleImage.snp.bottom).offset(10)
            make.height.equalTo(28)
            make.leading.trailing.equalToSuperview()
        }
        
        
        
        
       
        
    }
    
    
    
}
