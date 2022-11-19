//
//  ManageMyPageView.swift
//  SLP
//
//  Created by 나리강 on 2022/11/19.
//

import UIKit
import SnapKit

class ManageMyPageView: BaseView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    let tableView : UITableView = {
        let view = UITableView(frame: .zero, style: .plain)
        view.separatorEffect = .none
        
        return view
    }()
    
    
    override func configuration() {
        
        self.addSubview(tableView)
        
        
        
    }
    
    override func setConstraints() {
        
        tableView.snp.makeConstraints { make in
            make.leading.trailing.top.equalToSuperview().inset(16)
            make.bottom.equalToSuperview()
            
            
        }
        
        
    }
    
}






