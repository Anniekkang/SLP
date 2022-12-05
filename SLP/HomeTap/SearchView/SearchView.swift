//
//  SearchView.swift
//  SLP
//
//  Created by 나리강 on 2022/12/06.
//

import UIKit

class SearchView: BaseView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let collectionView : UICollectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: flowLayout())
        view.showsHorizontalScrollIndicator = false
        return view
    }()
    
    override func configuration() {
        self.addSubview(collectionView)
    }
    
    override func setConstraints() {
        collectionView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalToSuperview()
            make.height.equalTo(safeAreaLayoutGuide).multipliedBy(0.07)
        }
    }
    
    static func flowLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        let deviceWidth: CGFloat = UIScreen.main.bounds.width
        let deviceHeight : CGFloat = UIScreen.main.bounds.height
        let itemWidth: CGFloat = deviceWidth / 2
        let itemHeight : CGFloat = deviceHeight * 0.06
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.itemSize = CGSize(width: itemWidth, height: itemHeight)
        layout.scrollDirection = .horizontal
        return layout
    }
}


