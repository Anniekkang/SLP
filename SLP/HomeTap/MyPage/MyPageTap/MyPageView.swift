//
//  MyPageView.swift
//  SLP
//
//  Created by 나리강 on 2022/11/19.
//

import UIKit
import SnapKit

class MyPageView: BaseView {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let tableView : UITableView = {
        let view = UITableView(frame: .zero, style: .plain)
        view.rowHeight = 80
        view.allowsMultipleSelection = false
        return view
    }()
    
   
    override func configuration() {
        self.addSubview(tableView)
    }
    
    override func setConstraints() {
        tableView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.bottom.equalToSuperview()
           
        }
        
        
    }
    
}
