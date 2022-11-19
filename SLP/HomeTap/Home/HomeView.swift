//
//  HomeView.swift
//  SLP
//
//  Created by 나리강 on 2022/11/17.
//

import UIKit
import SnapKit
import MapKit

class HomeView: BaseView {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    let map : MKMapView = {
        let map = MKMapView()
        map.showsUserLocation = true
        map.setUserTrackingMode(.follow, animated: true)
        return map
    }()
    
    let button : UIButton = {
       let button = UIButton()
        return button
    }()
    
    let segment : UISegmentedControl = {
        let segment = UISegmentedControl()
        
        return segment
    }()
    
    override func configuration() {
        self.addSubview(map)
        [button, segment].forEach {
            map.addSubview($0)
        }
    }
    
    override func setConstraints() {
        map.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        segment.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.width.height.equalTo(48)
        }
        
        
    }
}
