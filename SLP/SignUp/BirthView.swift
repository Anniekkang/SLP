//
//  birthView.swift
//  SLP
//
//  Created by 나리강 on 2022/11/15.
//

import UIKit

class BirthView: BaseView {
    
   // static let shared = BirthView()
    
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
    
    let button : UIButton = {
            let button = UIButton()
            button.backgroundColor = colorCustom.shared.gray6
            button.layer.cornerRadius = 8
            button.setTitle("다음", for: .normal)
            button.setTitleColor(colorCustom.shared.gray3, for: .normal)
            return button
        }()
    
    let datePicker : UIDatePicker = {
        let picker = UIDatePicker()
        picker.preferredDatePickerStyle = .wheels
        picker.contentHorizontalAlignment = .center
        picker.datePickerMode = .date
        picker.locale = Locale(identifier: "ko_KR")
        picker.backgroundColor = .clear
        return picker
    }()
    
    
    
    let yearTextField : UITextField = {
       let text = UITextField()
        BirthLabelCustom.textFieldCustom(textField: text, placeholder: "1990")
        return text
    }()
    
    let yearLabel : UILabel = {
        let label = UILabel()
        BirthLabelCustom.labelCustom(label: label, content: "년")
        return label
    }()
    
    let yearStackView : BirthCustomStackView = {
        let view = BirthCustomStackView()
        return view
    }()
    
    let monthTextField : UITextField = {
       let text = UITextField()
        BirthLabelCustom.textFieldCustom(textField: text, placeholder: "1")
        return text
    }()
    
    let monthLabel : UILabel = {
        let label = UILabel()
        BirthLabelCustom.labelCustom(label: label, content: "월")
        return label
    }()
    
    let monthStackView : BirthCustomStackView = {
        let view = BirthCustomStackView()
        return view
    }()
    
    let dayTextField : UITextField = {
       let text = UITextField()
        BirthLabelCustom.textFieldCustom(textField: text, placeholder: "1")
        return text
    }()
    
    let dayLabel : UILabel = {
        let label = UILabel()
        BirthLabelCustom.labelCustom(label: label, content: "일")
        return label
    }()
    
    let dayStackView : BirthCustomStackView = {
        let view = BirthCustomStackView()
        return view
    }()
    
    let wholeStackView : UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.alignment = .fill
        view.distribution = .fillEqually
        view.spacing = 20
        return view
    }()
    
    override func configuration() {
        [datePicker,label,button,wholeStackView].forEach {
            self.addSubview($0)
        }
        [yearStackView, monthStackView, dayStackView].forEach {
            wholeStackView.addArrangedSubview($0)
        }
        [yearLabel,yearTextField].forEach {
            yearStackView.addSubview($0)
        }
        [monthLabel,monthTextField].forEach {
            monthStackView.addSubview($0)
        }
        [dayLabel,dayTextField].forEach {
            dayStackView.addSubview($0)
        }
        
        
    }
    
    override func setConstraints() {
        datePicker.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.33)
            
        }
        
        
        label.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().multipliedBy(0.5)
            make.width.equalToSuperview().multipliedBy(0.5)
            make.height.equalTo(32)
        }
        
        
        button.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().multipliedBy(1.1)
            make.height.equalTo(48)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        
        wholeStackView.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(28)
            make.trailing.equalToSuperview().inset(16)
            make.centerY.equalToSuperview().multipliedBy(0.8)
            make.height.equalTo(40)
        }
        
        yearStackView.snp.makeConstraints { make in
            make.leading.top.bottom.equalToSuperview()
            make.height.equalTo(30)
          
            
        }
        monthStackView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.height.equalTo(30)
            make.leading.equalTo(yearStackView.snp.trailing).offset(20)
           
            
        }
        
        dayStackView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.trailing.equalToSuperview()
            make.leading.equalTo(monthStackView.snp.trailing).offset(20)
            make.height.equalTo(30)
          
        }
        
        
        
        
        yearTextField.snp.makeConstraints { make in
            make.leading.top.bottom.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.85)
        }
        yearLabel.snp.makeConstraints { make in
            make.trailing.top.bottom.equalToSuperview()
            make.leading.equalTo(yearTextField.snp.trailing)
        }
        
        monthTextField.snp.makeConstraints { make in
            make.leading.top.bottom.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.85)
        }
        monthLabel.snp.makeConstraints { make in
            make.trailing.top.bottom.equalToSuperview()
            make.leading.equalTo(monthTextField.snp.trailing)
        }
        
        dayTextField.snp.makeConstraints { make in
            make.leading.top.bottom.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.85)
        }
        dayLabel.snp.makeConstraints { make in
            make.trailing.top.bottom.equalToSuperview()
            make.leading.equalTo(dayTextField.snp.trailing)
        }
    }
   
    
}
