//
//  cellHeaderView.swift
//  SLP
//
//  Created by 나리강 on 2022/11/19.
//

import UIKit
import SnapKit

class ManageMyPageCell : BaseTableViewCell {
    
    static var id = Reusable.tableID(cell: ManageMyPageCell())
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    let label : UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = colorCustom.shared.blackColor
        label.text = "gender"
        return label
    }()
    
    let stackView : UIStackView = {
       let view = UIStackView()
        view.axis = .horizontal
        view.distribution = .fillProportionally
        return view
    }()
    
    
    override func configure() {
        self.addSubview(stackView)
        [label].forEach {
            stackView.addSubview($0)
        }
    }
    
    
    override func setConstraints() {
        
        stackView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.bottom.equalToSuperview()
        }
        label.snp.makeConstraints { make in
            make.leading.equalTo(stackView).inset(16)
            make.centerY.equalTo(stackView)
            make.width.equalTo(100)
            make.height.equalTo(22)
            
        }
        
    }
}
