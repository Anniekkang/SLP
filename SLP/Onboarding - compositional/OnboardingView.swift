////
////  Onboarding.swift
////  SLP
////
////  Created by 나리강 on 2022/11/07.
////
//
//import UIKit
//import SnapKit
//import SwiftUI
//
//
//class OnboardingView : BaseView {
//
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        
//        configuration()
//        setConstraints()
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    
//    let collectionView : UICollectionView = {
//        let layout = generateLayout()
//        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
//        //view.setCollectionViewLayout(layout, animated: false)
//        view.register(OnboardingCollectionViewCell.self, forCellWithReuseIdentifier: OnboardingCollectionViewCell.id)
//        view.alwaysBounceVertical = false
//        return view
//        
//    }()
//    
//    
//    let startButton : UIButton = {
//        let button = UIButton()
//        button.setTitle("시작하기", for: .normal)
//        button.setTitleColor(colorCustom.shared.whiteColor, for: .normal)
//        button.backgroundColor = colorCustom.shared.greenBrandColor
//        button.layer.cornerRadius = 8
//        return button
//        
//    }()
//    
//    static let pageControl : UIPageControl = {
//        let page = UIPageControl()
//        page.numberOfPages = 3
//        page.currentPage = 0
//        page.pageIndicatorTintColor = colorCustom.shared.gray5
//        page.currentPageIndicatorTintColor = colorCustom.shared.blackColor
//        return page
//    }()
//    
//    
//    override func configuration() {
//        
//        [OnboardingView.pageControl,collectionView,startButton].forEach {
//            self.addSubview($0)
//        }
//        
//        
//    }
//    
//    override func setConstraints() {
//        collectionView.snp.makeConstraints { make in
//            make.leading.trailing.top.equalToSuperview()
//            make.height.equalToSuperview().multipliedBy(0.7)
//        }
//        
//        OnboardingView.pageControl.snp.makeConstraints { make in
//            make.centerX.equalToSuperview()
//            make.top.equalToSuperview().offset(665)
//            make.height.width.equalTo(8)
//            
//        }
//        
//        startButton.snp.makeConstraints { make in
//            make.leading.trailing.equalToSuperview().inset(16)
//            make.height.equalTo(48)
//            make.bottom.equalTo(safeAreaLayoutGuide).inset(16)
//        }
//        
//    }
//    
//
//}
//
//extension OnboardingView {
//    
//    static func generateLayout() -> UICollectionViewCompositionalLayout {
//      //1
//      let itemSize = NSCollectionLayoutSize(
//        widthDimension: .fractionalWidth(1.0),
//        heightDimension: .fractionalHeight(1.0))
//      let item = NSCollectionLayoutItem(layoutSize: itemSize)
//      //2
//      let groupSize = NSCollectionLayoutSize(
//        widthDimension: .fractionalWidth(1.0),
//        heightDimension: .fractionalWidth(1.0))
//      let group = NSCollectionLayoutGroup.horizontal(
//        layoutSize: groupSize,
//        subitem: item,
//        count: 1)
//      //3
//      let section = NSCollectionLayoutSection(group: group)
//        
//        section.visibleItemsInvalidationHandler = {items, contentOffset, environment in
//            let contentSizeWidth = environment.container.contentSize.width
//            let contentOffsetX = contentOffset.x
//            let currentPage = Int(max(0, round(contentOffsetX / contentSizeWidth)))
//           // let contentsize = environment.container.contentSize.width
//            
//            
//            self.pageControl.currentPage = currentPage
//     
//        }
//        section.orthogonalScrollingBehavior = .continuous
//        section.orthogonalScrollingBehavior = .groupPaging
//        section.orthogonalScrollingBehavior = .groupPagingCentered
//      let layout = UICollectionViewCompositionalLayout(section: section)
//      return layout
//    }
//
//    
//    
//}
//
//
