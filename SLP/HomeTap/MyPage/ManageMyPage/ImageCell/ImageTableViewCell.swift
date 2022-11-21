//
//  ImageTableViewCell.swift
//  SLP
//
//  Created by 나리강 on 2022/11/20.
//

import UIKit

class ImageTableViewCell: BaseTableViewCell {

    static let id = Reusable.tableID(cell: ImageTableViewCell())
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
  
    let backgroundImage : UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "sesac_bg_01")
        view.layer.cornerRadius = 8
        view.clipsToBounds = true
        
        
        return view
    }()
    
    let sesacImage : UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "sesac_face_1")
        return view
    }()
    
    override func configure() {
        contentView.addSubview(backgroundImage)
        backgroundImage.addSubview(sesacImage)
    }
    
    override func setConstraints() {
        backgroundImage.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalTo(contentView)
            make.height.equalTo(backgroundImage.snp.width).multipliedBy(0.56)
           
        }
        
        sesacImage.snp.makeConstraints { make in
            make.centerX.equalTo(backgroundImage)
            make.centerY.equalTo(backgroundImage).multipliedBy(1.2)
            make.height.equalTo(backgroundImage).multipliedBy(0.9)
            make.width.equalTo(sesacImage.snp.height)
            
        }
        
    }

}
