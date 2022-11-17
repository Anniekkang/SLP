//
//  birthView.swift
//  SLP
//
//  Created by 나리강 on 2022/11/15.
//

import UIKit

class BirthView: BaseView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    let label : UILabel = {
        let label = UILabel()
        label.text = "생년월일을 알려주세요"
        label.textColor = colorCustom.shared.blackColor
        label.textAlignment = .center
        label.numberOfLines = 1
        label.font = UIFont(name: FontName.fontRegular.rawValue, size: FontSize.extraLarge.rawValue)
        return label
    }()
    
    let dateLabel : UILabel = {
        let label = UILabel()
        
        return label
    }()
    
    let datePicker : UIDatePicker = {
        let picker = UIDatePicker()
        picker.preferredDatePickerStyle = .wheels
        picker.contentHorizontalAlignment = .center
        picker.datePickerMode = .date
        picker.locale = Locale(identifier: "ko_KR")
        
        return picker
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
        [label,dateLabel,button].forEach {
            self.addSubview($0)
        }
    }
    
    override func setConstraints() {
        
        label.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().multipliedBy(0.5)
            make.width.equalToSuperview().multipliedBy(0.5)
            make.height.equalTo(32)
        }
        
        dateLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().multipliedBy(0.8)
            make.leading.trailing.equalToSuperview().inset(28)
            
            
            
        }
        
        button.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().multipliedBy(1.1)
            make.height.equalTo(48)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        
    }
    
    
}
