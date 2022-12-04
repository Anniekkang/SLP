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
        print("studyArray2=====\(studyArray)")
        return studyArray.count < 9 ? studyArray.count : 8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.section == 0 {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: firstSectionCell.id, for: indexPath) as? firstSectionCell else { return UICollectionViewCell()}
            
            return cell
        } else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: secondSectionCell.id, for: indexPath) as? secondSectionCell else { return UICollectionViewCell()}
            print("indexPath ===\(indexPath)")
            print("studyArray3=====\(studyArray)")
            cell.label.text = studyArray[indexPath.item]
            self.searchBar.text = ""
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
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: firstSectionCell.id, for: indexPath) as? firstSectionCell else { return CGSize(width: 20, height: 32) }
            let cellWidth = cell.button.frame.width
            return CGSize(width: cellWidth, height: 32)
        }
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: secondSectionCell.id, for: indexPath) as? secondSectionCell else { return CGSize(width: 20, height: 32) }
        let cellWidth = cell.view.frame.width
        return CGSize(width: cellWidth, height: 32)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.section == 1 {
            studyArray.remove(at: indexPath.item)
            collectionView.reloadData()
        }
        
    }
}


//class CustomViewFlowLayout: UICollectionViewFlowLayout {
//    let cellSpacing: CGFloat = 10
//
//    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
//        self.minimumLineSpacing = 10.0
//        self.sectionInset = UIEdgeInsets(top: 16.0, left: 0.0, bottom: 16.0, right: 0.0)
//        let attributes = super.layoutAttributesForElements(in: rect)
//
//        var leftMargin = sectionInset.left
//        var maxY: CGFloat = -1.0
//        attributes?.forEach { layoutAttribute in
//            if layoutAttribute.frame.origin.y >= maxY {
//                leftMargin = sectionInset.left
//            }
//            layoutAttribute.frame.origin.x = leftMargin
//            leftMargin += layoutAttribute.frame.width + cellSpacing
//            maxY = max(layoutAttribute.frame.maxY, maxY)
//        }
//        return attributes
//    }
//}
