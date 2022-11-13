//
//  ScrollExtension.swift
//  SLP
//
//  Created by 나리강 on 2022/11/13.
//

import UIKit

extension OnboardViewController : UIScrollViewDelegate {
   //called repeatly when scroll collectionView
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let width = scrollView.bounds.size.width
        let x = scrollView.contentOffset.x
        let newPage = Int(x / round(width))
        self.mainView.pageControl.currentPage = newPage
    }

//    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
//
//        let width = scrollView.bounds.size.width
//               let x = scrollView.contentOffset.x
//               let newPage = Int(x / round(width))
//               self.mainView.pageControl.currentPage = newPage
//    }
//
}
