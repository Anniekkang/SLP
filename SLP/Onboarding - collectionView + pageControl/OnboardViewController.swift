//
//  OnboardViewController.swift
//  SLP
//
//  Created by 나리강 on 2022/11/13.
//

import UIKit

class OnboardViewController : BaseViewController {
    
    
    let mainView = OnboardView()
    override func loadView() {
        self.view = mainView
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configuration()
        mainView.pageControl.addTarget(self, action: #selector(pageChanged), for: .touchUpInside)
        mainView.startButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    @objc func pageChanged(_ sender : UIPageControl ){
        let indexPath = IndexPath(item: sender.currentPage, section: 0)
        mainView.collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
  
    }
    
    @objc func buttonTapped(_ sender : UIButton) {
        let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
        let sceneDelegate = windowScene?.delegate as? SceneDelegate
        let vc = loginViewController()
        let nav = UINavigationController(rootViewController: vc)
        sceneDelegate?.window?.rootViewController = nav
    }
    
    
    override func configuration() {
        
        mainView.backgroundColor = colorCustom.shared.whiteColor
        mainView.collectionView.delegate = self
        mainView.collectionView.dataSource = self
        mainView.collectionView.register(OnboardCollectionViewCell.self, forCellWithReuseIdentifier: OnboardCollectionViewCell.id)
        
    }
    
}

