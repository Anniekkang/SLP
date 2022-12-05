//
//  SearchCollectionViewCell.swift
//  SLP
//
//  Created by 나리강 on 2022/12/06.
//

import UIKit

class SearchCollectionViewCell: BaseCollectionViewCell {
    
    static let id = String(describing: SearchCollectionViewCell())
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    let stackView : UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 0
        return view
    }()
    
    let label : UILabel = {
        let label = UILabel()
        label.text = "주변 새싹"
        label.textAlignment = .center
        label.textColor = colorCustom.shared.gray6
        label.font = UIFont(name: FontName.fontRegular.rawValue, size: FontSize.medium.rawValue)
        return label
    }()
    
    let view : UIView = {
       let view = UIView()
        view.backgroundColor = colorCustom.shared.gray6
        return view
    }()
    
    override func configure() {
        self.addSubview(stackView)
        [label, view].forEach {
            stackView.addSubview($0)
        }
    }
    
    override func setConstraints() {
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        label.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.96)
        }
        
        view.snp.makeConstraints { make in
            make.top.equalTo(label.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.04)
        }
        
    }
    
}
