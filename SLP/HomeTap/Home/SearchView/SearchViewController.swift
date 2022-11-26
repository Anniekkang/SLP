//
//  SearchViewController.swift
//  SLP
//
//  Created by 나리강 on 2022/11/24.
//

import UIKit

class SearchViewController: BaseViewController {

    let mainView = SearchView()
   
    override func loadView() {
        self.view = mainView
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        mainView.backgroundColor = colorCustom.shared.whiteColor
        tabBarController?.tabBar.isHidden = true
        navDesign()
        
    }
    

    func navDesign() {
        
        let searchBar = UISearchBar()
        searchBarDesign(searchBar: searchBar)
    
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "arrow"), style: .plain, target: self, action: #selector(backButtonTapped))
        navigationItem.leftBarButtonItem?.tintColor = colorCustom.shared.blackColor
        navigationItem.titleView = searchBar
        navigationController?.navigationBar.isTranslucent = true
        
        
        
    }
    
    @objc func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    func searchBarDesign(searchBar : UISearchBar) {
        searchBar.placeholder = "띄어쓰기로 복수 입력이 가능해요"
        searchBar.searchBarStyle = .minimal
        searchBar.backgroundColor = colorCustom.shared.gray1
        
    }
    
}
