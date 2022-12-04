//
//  NameTableViewCell.swift
//  SLP
//
//  Created by 나리강 on 2022/11/19.
//

import UIKit
import SnapKit

class NameTableViewCell: BaseTableViewCell {
    
    static var id = Reusable.tableID(cell: NameTableViewCell())
    
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
        view.spacing = 8
        view.distribution = .fill
        return view
    }()
    
    
    let iconImage : UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "sesac_face_1")
        return image
    }()
    
    let label : UILabel = {
        let label = UILabel()
        label.font = UIFont(name: FontName.fontRegular.rawValue, size: FontSize.large.rawValue)
        label.text = "name"
        label.textColor = colorCustom.shared.blackColor
        label.textAlignment = .left
        return label
    }()
    
    let button : UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "more_arrow"), for: .normal)
        return button
    }()
    
    override func configure() {
        
        [stackView,button].forEach {
            self.addSubview($0)
        }
        [iconImage,label].forEach {
            stackView.addSubview($0)
        }
    }
    
    override func setConstraints() {
        stackView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.centerY.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.5)
            make.width.equalToSuperview().multipliedBy(0.8)
        }
        
        iconImage.snp.makeConstraints { make in
            make.height.equalToSuperview()
            make.width.equalTo(iconImage.snp.height)
            make.leading.top.bottom.equalTo(stackView)
        }
        
        label.snp.makeConstraints { make in
            make.height.equalToSuperview()
            make.leading.equalTo(iconImage.snp.trailing).offset(8)
            make.trailing.equalToSuperview()
            
        }
        
        button.snp.makeConstraints { make in
            make.height.equalTo(stackView)
            make.width.equalTo(button.snp.height)
            make.trailing.equalToSuperview()
            make.centerY.equalToSuperview()
        }
    }
}
