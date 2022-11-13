//
//  OnboardView.swift
//  SLP
//
//  Created by 나리강 on 2022/11/13.
//

import UIKit
import SnapKit

class OnboardView : BaseView {

    override init(frame: CGRect) {
        super.init(frame: frame)

        configuration()
        setConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    let collectionView : UICollectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: collectionViewFlowLayout())
        view.showsHorizontalScrollIndicator = false
        
      
        return view

    }()


    let startButton : UIButton = {
        let button = UIButton()
        button.setTitle("시작하기", for: .normal)
        button.setTitleColor(colorCustom.shared.whiteColor, for: .normal)
        button.backgroundColor = colorCustom.shared.greenBrandColor
        button.layer.cornerRadius = 8
        return button

    }()

    let pageControl : UIPageControl = {
        let page = UIPageControl(frame: CGRect(x: 0, y: 250, width: 40, height: 8))
        page.numberOfPages = OnboardData.onboardImage.count
        page.currentPage = 0
        page.pageIndicatorTintColor = colorCustom.shared.gray5
        page.currentPageIndicatorTintColor = colorCustom.shared.blackColor
        //page.allowsContinuousInteraction = true
        
        return page
    }()

   


    override func configuration() {

        [pageControl,collectionView,startButton].forEach {
            self.addSubview($0)
        }


    }

    override func setConstraints() {
        collectionView.snp.makeConstraints { make in
            make.leading.trailing.top.equalTo(self)
            make.height.equalToSuperview().multipliedBy(0.7)
        }

        pageControl.snp.makeConstraints { make in
            make.centerX.equalTo(self)
            make.top.equalTo(collectionView.snp.bottom).offset(70)
            make.width.equalTo(40)
            make.height.equalTo(8)
            

        }

        startButton.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(48)
            make.bottom.equalTo(safeAreaLayoutGuide).inset(16)
        }

    }


}

extension OnboardView {
    
    static func collectionViewFlowLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        let deviceWidth : CGFloat = UIScreen.main.bounds.width
        let deviceheight : CGFloat = UIScreen.main.bounds.height
        let itemWidth : CGFloat = deviceWidth
        let itemHeight : CGFloat = deviceheight * 0.7
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.itemSize = CGSize(width: itemWidth, height: itemHeight)
        layout.scrollDirection = .horizontal
        return layout
 
    }
    
}

