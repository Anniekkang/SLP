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
        view.distribution = .fillEqually
        view.alignment = .fill
        return view
    }()
    
    let secondStackView : UIStackView = {
       let view = UIStackView()
        view.axis = .horizontal
        view.spacing  = 7
        view.distribution = .fillEqually
        view.alignment = .fill
        return view
    }()
    
    let thirdStackView : UIStackView = {
       let view = UIStackView()
        view.axis = .horizontal
        view.spacing  = 7
        view.distribution = .fillEqually
        view.alignment = .fill
        return view
    }()
    
    let firstLabel : UILabel = {
        let label = UILabel()
        CustomButton.buttonCustom(label: label)
        label.text = MyPageData.buttonArray[0]
        return label
    }()
    
    let secondLabel : UILabel = {
        let label = UILabel()
        CustomButton.buttonCustom(label: label)
        label.text = MyPageData.buttonArray[1]
        return label
    }()
    
    let thirdLabel : UILabel = {
        let label = UILabel()
        CustomButton.buttonCustom(label: label)
        label.text = MyPageData.buttonArray[2]
        return label
    }()
    
    let fourthLabel : UILabel = {
        let label = UILabel()
        CustomButton.buttonCustom(label: label)
        label.text = MyPageData.buttonArray[3]
        return label
    }()
    
    let fifthLabel : UILabel = {
        let label = UILabel()
        CustomButton.buttonCustom(label: label)
        label.text = MyPageData.buttonArray[4]
        return label
    }()
    
    let sixthLabel : UILabel = {
        let label = UILabel()
        CustomButton.buttonCustom(label: label)
        label.text = MyPageData.buttonArray[5]
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
            make.height.equalTo(firstStackView.snp.width).multipliedBy(0.1)
            make.top.equalTo(titleLabel.snp.bottom).offset(30)
        }
        
        secondStackView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(secondStackView.snp.width).multipliedBy(0.1)
            make.top.equalTo(firstStackView.snp.bottom).offset(7)
        }
        
        thirdStackView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(thirdStackView.snp.width).multipliedBy(0.1)
            make.top.equalTo(secondStackView.snp.bottom).offset(7)
        }
        
        
        firstLabel.snp.makeConstraints { make in
            make.leading.top.bottom.equalTo(firstStackView)
        }

        secondLabel.snp.makeConstraints { make in
            make.leading.equalTo(firstLabel.snp.trailing).offset(7)
            make.top.trailing.bottom.equalTo(firstStackView)
            make.width.equalTo(firstLabel.snp.width)
        }
        
        thirdLabel.snp.makeConstraints { make in
            make.leading.top.bottom.equalTo(secondStackView)
        }

        fourthLabel.snp.makeConstraints { make in
            make.leading.equalTo(thirdLabel.snp.trailing).offset(7)
            make.top.trailing.bottom.equalTo(secondStackView)
            make.width.equalTo(thirdLabel.snp.width)
        }
        
        fifthLabel.snp.makeConstraints { make in
            make.leading.top.bottom.equalTo(thirdStackView)
        }

        sixthLabel.snp.makeConstraints { make in
            make.leading.equalTo(fifthLabel.snp.trailing).offset(7)
            make.top.trailing.bottom.equalTo(thirdStackView)
            make.width.equalTo(fifthLabel.snp.width)
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
