//
//  MyPageTableViewCell.swift
//  SLP
//
//  Created by 나리강 on 2022/11/19.
//

import UIKit

class MyPageTableViewCell: BaseTableViewCell {
    

    static var id = Reusable.tableID(cell: MyPageTableViewCell())
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configure()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let stackView : UIStackView = {
       let view = UIStackView()
        view.axis = .horizontal
        view.spacing = 10
        view.distribution = .fillProportionally
        return view
    }()
  
    let iconImage : UIImageView = {
       let image = UIImageView()
        return image
    }()
    
    let label : UILabel = {
       let label = UILabel()
        label.font = UIFont(name: FontName.fontRegular.rawValue, size: FontSize.large.rawValue)
        label.textColor = colorCustom.shared.blackColor
        label.textAlignment = .left
        return label
    }()
    
   
    override func configure() {
        self.addSubview(stackView)
        [iconImage,label].forEach {
            stackView.addSubview($0)
        }
    }
    
    override func setConstraints() {
        
        stackView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.centerY.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.33)
        }
        
        iconImage.snp.makeConstraints { make in
            make.height.equalTo(stackView)
            make.width.equalTo(iconImage.snp.height)
            make.leading.top.bottom.equalTo(stackView)
        }
        
        label.snp.makeConstraints { make in
            make.height.equalTo(stackView)
            make.leading.equalTo(iconImage.snp.trailing).offset(10)
            make.top.bottom.trailing.equalTo(stackView)
        }
    }
}
