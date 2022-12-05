//
//  SearchViewController.swift
//  SLP
//
//  Created by 나리강 on 2022/11/27.
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
       // mainView.refreshButton.addTarget(self, action: #selector(refreshButtonTapped), for: .touchUpInside)
        navDesign()
    }
    
    override func configuration() {
        mainView.collectionView.delegate = self
        mainView.collectionView.dataSource = self
        mainView.collectionView.register(SearchCollectionViewCell.self, forCellWithReuseIdentifier: SearchCollectionViewCell.id)
        
    }
    
    
    func navDesign() {

        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "arrow"), style: .plain, target: self, action: #selector(backButtonTapped))
        navigationItem.title = "새싹 찾기"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "찾기중단", style: .plain, target: self, action: #selector(sesacFindButtonTapped))
        navigationItem.leftBarButtonItem?.tintColor = colorCustom.shared.blackColor
        navigationItem.rightBarButtonItem?.tintColor = colorCustom.shared.blackColor

        
    }
    
    @objc func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func sesacFindButtonTapped() {
        
    }
    
    @objc func refreshButtonTapped() {
        SearchAPIManager.shared.callSearchAPI(mainView: mainView)
        
    }
   
}
