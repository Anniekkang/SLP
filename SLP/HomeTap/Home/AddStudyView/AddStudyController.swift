//
//  SearchViewController.swift
//  SLP
//
//  Created by 나리강 on 2022/11/24.
//

import UIKit

class AddStudyViewController: BaseViewController {

    let mainView = AddStudyView()
    let searchBar = UISearchBar()
    
    override func loadView() {
        self.view = mainView
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

    
        mainView.backgroundColor = colorCustom.shared.whiteColor
        mainView.button.addTarget(self, action: #selector(stopFindButtonTapped), for: .touchUpInside)
        tabBarController?.tabBar.isHidden = true
        navDesign(searchBar: searchBar)
        searchBarDesign(searchBar: searchBar)
        searchBar.delegate = self
        
    }
    
    @objc func stopFindButtonTapped() {
        self.navigationController?.pushViewController(SearchViewController(), animated: true)
    }
    
    func searchBarDesign(searchBar : UISearchBar) {
        searchBar.placeholder = "띄어쓰기로 복수 입력이 가능해요"
       // searchBar.searchBarStyle = .minimal
        searchBar.backgroundColor = colorCustom.shared.gray1
        
    }

    func navDesign(searchBar : UISearchBar) {
        
        self.navigationController?.navigationBar.tintColor = colorCustom.shared.blackColor
        self.navigationItem.titleView = searchBar
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "arrow"), style: .plain, target: self, action: #selector(backButtonTapped))
        self.navigationController?.navigationBar.isTranslucent = false //반투명도 제거
        self.navigationController?.navigationBar.barTintColor = colorCustom.shared.whiteColor
        self.navigationController?.navigationBar.setTitleVerticalPositionAdjustment(CGFloat(), for: .defaultPrompt)
        self.navigationController?.navigationBar.standardAppearance = setNavigationBarAppearance()
        self.navigationController?.navigationBar.scrollEdgeAppearance = setNavigationBarAppearance()

    }
    
    func setNavigationBarAppearance() -> UINavigationBarAppearance {
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = colorCustom.shared.whiteColor
      
        return appearance
    }
    
    
    
    @objc func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
   
}
