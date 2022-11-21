//
//  ExpandableCardTableViewCell.swift
//  SLP
//
//  Created by 나리강 on 2022/11/20.
//

import UIKit

class ExpandableCardTableViewCell: BaseTableViewCell {

    static var id = Reusable.tableID(cell: ExpandableCardTableViewCell())
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let titleLabel : UILabel = {
        let label = UILabel()
        label.text = "새싹 타이틀"
        label.textColor = colorCustom.shared.blackColor
        label.font = UIFont(name: FontName.fontRegular.rawValue, size: FontSize.small.rawValue)
        label.textAlignment = .left
        return label
    }()
    
    let firstStackView : UIStackView = {
       let view = UIStackView()
        view.axis = .horizontal
        view.spacing  = 7
        view.distribution = .equalSpacing
        return view
    }()
    
    let secondStackView : UIStackView = {
       let view = UIStackView()
        view.axis = .horizontal
        view.spacing  = 7
        view.distribution = .equalSpacing
        return view
    }()
    
    let thirdStackView : UIStackView = {
       let view = UIStackView()
        view.axis = .horizontal
        view.spacing  = 7
        view.distribution = .equalSpacing
        return view
    }()
    
    let firstLabel : UILabel = {
        let label = UILabel()
        label.layer.cornerRadius = 8
        label.layer.borderWidth = 1
        label.layer.borderColor = colorCustom.shared.gray2.cgColor
        label.clipsToBounds = true
        return label
    }()
    
    let secondLabel : UILabel = {
        let label = UILabel()
        label.layer.cornerRadius = 8
        label.layer.borderWidth = 1
        label.layer.borderColor = colorCustom.shared.gray2.cgColor
        label.clipsToBounds = true
        return label
    }()
    
    let thirdLabel : UILabel = {
        let label = UILabel()
        label.layer.cornerRadius = 8
        label.layer.borderWidth = 1
        label.layer.borderColor = colorCustom.shared.gray2.cgColor
        label.clipsToBounds = true
        return label
    }()
    
    let fourthLabel : UILabel = {
        let label = UILabel()
        label.layer.cornerRadius = 8
        label.layer.borderWidth = 1
        label.layer.borderColor = colorCustom.shared.gray2.cgColor
        label.clipsToBounds = true
        return label
    }()
    
    let fifthLabel : UILabel = {
        let label = UILabel()
        label.layer.cornerRadius = 8
        label.layer.borderWidth = 1
        label.layer.borderColor = colorCustom.shared.gray2.cgColor
        label.clipsToBounds = true
        return label
    }()
    
    let sixthLabel : UILabel = {
        let label = UILabel()
        label.layer.cornerRadius = 8
        label.layer.borderWidth = 1
        label.layer.borderColor = colorCustom.shared.gray2.cgColor
        label.clipsToBounds = true
        return label
    }()
    
    
    let reviewLabel : UILabel = {
        let label = UILabel()
        label.text = "새싹 리뷰"
        label.textColor = colorCustom.shared.blackColor
        label.font = UIFont(name: FontName.fontRegular.rawValue, size: FontSize.small.rawValue)
        label.textAlignment = .left
        return label
    }()
    
    let reviewTextview : UITextView = {
        let view = UITextView()
        
        return view
        
    }()
    
    override func configure() {
        [titleLabel,reviewLabel,reviewTextview,firstStackView,secondStackView,thirdStackView].forEach {
            contentView.addSubview($0)
        }
        [firstLabel,secondLabel].forEach {
            firstStackView.addSubview($0)
        }
        [thirdLabel,fourthLabel].forEach {
            secondStackView.addSubview($0)
        }
        [fifthLabel,sixthLabel].forEach {
            thirdStackView.addSubview($0)
        }
    }
    
    override func setConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalToSuperview()
            make.height.equalTo(18)
        }
        
        firstStackView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(firstStackView.snp.width).multipliedBy(0.2)
            make.top.equalTo(titleLabel.snp.bottom).offset(30)
        }
        
        secondStackView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(secondStackView.snp.width).multipliedBy(0.2)
            make.top.equalTo(firstStackView.snp.bottom).offset(7)
        }
        
        thirdStackView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(thirdStackView.snp.width).multipliedBy(0.2)
            make.top.equalTo(secondStackView.snp.bottom).offset(7)
        }
        
        reviewLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(18)
            make.top.equalTo(thirdStackView.snp.bottom).offset(30)
        }
        
        reviewTextview.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(18)
            make.top.equalTo(reviewLabel.snp.bottom).offset(16)
            make.bottom.equalToSuperview().inset(16)
        }
        
        
        
        
    }
    
    
}
