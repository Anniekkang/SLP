//
//  HomeView.swift
//  SLP
//
//  Created by 나리강 on 2022/11/17.
//

import UIKit
import SnapKit
import MapKit
import CoreLocation

class HomeView: BaseView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    let map : MKMapView = {
        let map = MKMapView()
        
       
        map.setUserTrackingMode(.none, animated: true)
        map.isZoomEnabled = true
        return map
    }()
    
    let button : UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 8
        button.setImage(UIImage(named: "place"), for: .normal)
        button.backgroundColor = colorCustom.shared.whiteColor
        return button
    }()
    
 
    let matchingButton : UIButton = {
        let button = UIButton()
        let image = UIImage(named: "Property 1=default")
        button.setImage(image, for: .normal)
        button.tintColor = colorCustom.shared.whiteColor
        return button
    }()
    
    let segment : UISegmentedControl = {
        let segment = UISegmentedControl()
        
        return segment
    }()
    
    override func configuration() {
        self.addSubview(map)
        [button, segment, matchingButton].forEach {
            map.addSubview($0)
        }
    }
    
    override func setConstraints() {
        map.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        button.snp.makeConstraints { make in
            make.width.height.equalTo(48)
            make.centerY.equalToSuperview().multipliedBy(0.7)
            make.leading.equalToSuperview().inset(16)
        }
        
        matchingButton.snp.makeConstraints { make in
            make.width.height.equalTo(64)
            make.trailing.equalToSuperview().inset(16)
            make.centerY.equalToSuperview().multipliedBy(1.7)
            
        }
        
       
    }
}
