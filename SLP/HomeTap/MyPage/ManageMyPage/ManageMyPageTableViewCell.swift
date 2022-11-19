//
//  ManageMyPageTableViewCell.swift
//  SLP
//
//  Created by 나리강 on 2022/11/19.
//

import UIKit

class ManageMyPageTableViewCell: BaseTableViewCell {

    static var id = Reusable.tableID(cell: NameTableViewCell())
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configure()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
