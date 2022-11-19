//
//  cellHeaderView.swift
//  SLP
//
//  Created by 나리강 on 2022/11/19.
//

import UIKit

protocol HeaderViewDelegate : AnyObject {
    func didTouchSection(_ sectionIndex : Int)
}


class cellHeaderView : UITableViewHeaderFooterView {
    var delegate : HeaderViewDelegate?
    var sectionIndex = 0
    
    let tapGestureRecognizer = UITapGestureRecognizer()
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        contentView.addGestureRecognizer(tapGestureRecognizer)
        tapGestureRecognizer.addTarget(self, action: #selector(didSelectSection))
        
    }
    
    @objc func didSelectSection() {
        delegate?.didTouchSection(self.sectionIndex)

    }
    
    
    
    
}
