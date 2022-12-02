//
//  SearchView.swift
//  SLP
//
//  Created by 나리강 on 2022/11/24.
//

import UIKit

class AddStudyView: BaseView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configuration()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    let button : UIButton = {
        let button = UIButton()
        button.setTitle("새싹 찾기", for: .normal)
        button.setTitleColor(colorCustom.shared.whiteColor, for: .normal)
        button.backgroundColor = colorCustom.shared.greenBrandColor
        button.layer.cornerRadius = 8
        button.clipsToBounds = true
        button.sizeToFit()

        return button
    }()
    
    let collectionView : UICollectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout())
        view.sizeToFit()
        return view
    }()
    
    
    override func configuration() {
        [button,collectionView].forEach {
            self.addSubview($0)
        }
    }
    
    override func setConstraints() {
        collectionView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalToSuperview().inset(16)
            make.height.equalToSuperview().multipliedBy(0.8)
        }
        
        button.snp.makeConstraints { make in
            make.height.equalTo(48)
            make.leading.trailing.equalToSuperview().inset(16)
            make.bottom.equalToSuperview().inset(50)
        }


        
        
        
    }
    
}

extension AddStudyView {
    static func collectionViewLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        let itemWidth : CGFloat = 60
        let itemHeight : CGFloat = 22
        layout.sectionInset = UIEdgeInsets(top: 16, left: 0, bottom: 0, right: 0)
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        layout.estimatedItemSize = CGSize(width: itemWidth, height: itemHeight)
        layout.scrollDirection = .vertical
        return layout
        
    }
    
    
}
