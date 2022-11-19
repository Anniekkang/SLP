//
//  MyPageViewController.swift
//  SLP
//
//  Created by 나리강 on 2022/11/19.
//

import UIKit

class MyPageViewController: BaseViewController {

  
    
    let mainView = MyPageView()
    
    override func loadView() {
        self.view = mainView
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "내정보"
        configuration()
       
    }
 
    override func configuration() {
        mainView.tableView.delegate = self
        mainView.tableView.dataSource = self
        mainView.tableView.register(MyPageTableViewCell.self, forCellReuseIdentifier: MyPageTableViewCell.id)
        mainView.tableView.register(NameTableViewCell.self, forCellReuseIdentifier: NameTableViewCell.id)
        mainView.backgroundColor = .white
    }
}


