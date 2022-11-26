//
//  SearchView.swift
//  SLP
//
//  Created by 나리강 on 2022/11/24.
//

import UIKit

class AddStudyView: BaseView {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    let button : UIButton = {
       let button = UIButton()
        button.setTitle("새싹 찾기", for: .normal)
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.textColor = colorCustom.shared.whiteColor
        button.backgroundColor = colorCustom.shared.greenBrandColor
        button.layer.cornerRadius = 8
        return button
    }()
    
    let aroundLabel : UILabel = {
       let label = UILabel()
        label.text = "지금 주변에는"
        label.textColor = colorCustom.shared.blackColor
        label.font = UIFont(name: FontName.fontRegular.rawValue, size: FontSize.small.rawValue)
        label.textAlignment = .left
        return label
    }()
    
    let wantLabel : UILabel = {
        let label = UILabel()
         label.text = "내가 하고 싶은"
         label.textColor = colorCustom.shared.blackColor
         label.font = UIFont(name: FontName.fontRegular.rawValue, size: FontSize.small.rawValue)
         label.textAlignment = .left
         return label
    }()
    
    
    override func configuration() {
        [button,aroundLabel,wantLabel].forEach {
            self.addSubview($0)
        }
    }
    
    override func setConstraints() {
        button.snp.makeConstraints { make in
            make.height.equalTo(48)
            make.leading.trailing.equalToSuperview().inset(16)
            make.bottom.equalToSuperview().inset(50)
        }
        
        aroundLabel.snp.makeConstraints { make in
            make.height.equalTo(18)
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalToSuperview().offset(120)
        }
        
        wantLabel.snp.makeConstraints { make in
            make.height.equalTo(18)
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalTo(aroundLabel.snp.bottom).offset(20)
        }
        
    }
}
