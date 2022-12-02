//
//  CollectionViewExtension.swift
//  SLP
//
//  Created by 나리강 on 2022/11/27.
//

import UIKit

extension AddStudyViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return HomeTapData().addStudyArray.count
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return studyArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.section == 0 {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: firstSectionCell.id, for: indexPath) as? firstSectionCell else { return UICollectionViewCell()}
            
            return cell
        } else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: secondSectionCell.id, for: indexPath) as? secondSectionCell else { return UICollectionViewCell()}
            print("cell")
            cell.label.text = studyArray[indexPath.item]
            
            return cell
            
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "HeaderCollectionReusableView", for: indexPath) as? HeaderCollectionReusableView else { return UICollectionReusableView() }
            
            header.label.text = HomeTapData().addStudyArray[indexPath.section]
            
            return header
        }
        return UICollectionReusableView()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        let headerSize = CGSize(width: collectionView.frame.height, height: 18)
        return headerSize
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        if indexPath.section == 0 {
            return CGSize(width: 10, height: 32)
        }
        return CGSize(width: 20 , height: 32)
    }
}
