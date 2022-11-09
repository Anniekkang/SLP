//
//  OnboardingViewController.swift
//  SLP
//
//  Created by 나리강 on 2022/11/07.
//

import UIKit

class OnboardingViewController: BaseViewController {

    
    let mainView = OnboardingView()
    override func loadView() {
        self.view = mainView
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

       configuration()
    }
    

    override func configuration() {
     
        mainView.backgroundColor = colorCustom.shared.whiteColor
        mainView.collectionView.delegate = self
        mainView.collectionView.dataSource = self
        
        
    }

}

extension OnboardingViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCollectionViewCell.id, for: indexPath) as? OnboardingCollectionViewCell else { return UICollectionViewCell() }
        
        return cell
    }
    
    
    
    
    
    
}
