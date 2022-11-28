//
//  ManageMyPageViewController.swift
//  SLP
//
//  Created by 나리강 on 2022/11/19.
//

import UIKit

class ManageMyInfoViewController: BaseViewController {

    let mainView = ManageMyInfoView()
    var isOpen : Bool = false //접혀있는 상태
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        mainView.backgroundColor = .white
      
        naviDesign()
        configuration()
       
    }
    

    func naviDesign() {
        self.navigationController?.navigationBar.backgroundColor = .white
        
        self.navigationItem.title = "정보 관리"
        //self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.tintColor = .black
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "arrow"), style: .plain, target: self, action: #selector(backButtonTapped))
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "저장", style: .plain, target: self, action: #selector(saveButtonTapped))
        
        self.navigationItem.titleView?.tintColor = .black
        
        self.navigationController?.navigationBar.scrollEdgeAppearance = setNavigationBarAppearance()
        self.navigationController?.navigationBar.standardAppearance = setNavigationBarAppearance()
    }

    func setNavigationBarAppearance() -> UINavigationBarAppearance {
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = colorCustom.shared.whiteColor
        return appearance
    }
    
    
    @objc func backButtonTapped() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func saveButtonTapped() {
        
    }
    

    override func configuration() {
        mainView.tableView.delegate = self
        mainView.tableView.dataSource = self
        // MARK : tableviewCell
        mainView.tableView.register(ImageTableViewCell.self, forCellReuseIdentifier: ImageTableViewCell.id)
        mainView.tableView.register(ExpandableCardTableViewCell.self, forCellReuseIdentifier: ExpandableCardTableViewCell.id)
        mainView.tableView.register(ManageMyPageCell.self, forCellReuseIdentifier: ManageMyPageCell.id)
        
        // MARK : tableviewHeaderView
        mainView.tableView.register(HeaderCell.self, forHeaderFooterViewReuseIdentifier: "HeaderCell")
        
       
        
        
    }


}

extension ManageMyInfoViewController : HeaderViewDelegate {
    func didTouchSection() {
        isOpen.toggle()
        mainView.tableView.reloadData()
    }
    
   
    
}
