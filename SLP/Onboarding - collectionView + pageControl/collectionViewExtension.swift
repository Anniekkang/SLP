//
//  collectionViewExtension.swift
//  SLP
//
//  Created by 나리강 on 2022/11/13.
//

import UIKit


extension OnboardViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardCollectionViewCell.id, for: indexPath) as? OnboardCollectionViewCell else { return UICollectionViewCell() }
        cell.image.image = UIImage(named: OnboardData.onboardImage[indexPath.row])
        cell.label.text = OnboardData.onboardLabel[indexPath.row]
        return cell
    }
    
    
    
    
    
    
}
