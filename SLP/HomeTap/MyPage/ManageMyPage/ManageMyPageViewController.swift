//
//  ManageMyPageViewController.swift
//  SLP
//
//  Created by 나리강 on 2022/11/19.
//

import UIKit

class ManageMyPageViewController: BaseViewController {

    let mainView = ManageMyPageView()
    var isOpen = [false,false,false,false,false,false]
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        mainView.backgroundColor = .white
        naviDesign()
       
        
    }
    
    func naviDesign() {
        self.navigationController?.navigationBar.backgroundColor = .white
        
        self.navigationItem.title = "정보 관리"
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.tintColor = .black
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "arrow"), style: .plain, target: self, action: #selector(backButtonTapped))
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "저장", style: .plain, target: self, action: #selector(saveButtonTapped))
        
        self.navigationItem.titleView?.tintColor = .black
    }
    
    @objc func backButtonTapped() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func saveButtonTapped() {
        
    }
    

    override func configuration() {
        mainView.tableView.delegate = self
        mainView.tableView.dataSource = self
        mainView.tableView.register(ManageMyPageTableViewCell.self, forCellReuseIdentifier: ManageMyPageTableViewCell.id)
        mainView.tableView.register(FirstHeaderCell.self, forHeaderFooterViewReuseIdentifier: "FirstHeaderCell")
        mainView.tableView.register(SecondHeaderCell.self, forHeaderFooterViewReuseIdentifier: "SecondHeaderCell")
        mainView.tableView.register(cellHeaderView.self, forHeaderFooterViewReuseIdentifier: "cellHeaderView")
        
        
    }
    
    
    
    

}

extension ManageMyPageViewController : HeaderViewDelegate {
    func didTouchSection(_ sectionIndex: Int) {
        self.isOpen[sectionIndex].toggle()
        mainView.tableView.reloadData()
    }
    
    
}
