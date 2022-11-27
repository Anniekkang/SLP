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
    
    let matchingView : UIView = {
       let view = UIView()
        view.layer.cornerRadius = 32
        view.backgroundColor = colorCustom.shared.blackColor
        return view
    }()
    
    let insideButton : UIButton = {
        let button = UIButton()
        let image = UIImage(named: "search")?.withRenderingMode(.alwaysTemplate)
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
        [button, segment, matchingView].forEach {
            map.addSubview($0)
        }
        matchingView.addSubview(insideButton)
    }
    
    override func setConstraints() {
        map.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
//        segment.snp.makeConstraints { make in
//            make.centerY.equalToSuperview()
//            make.width.height.equalTo(48)
//        }
//
        button.snp.makeConstraints { make in
            make.width.height.equalTo(48)
            make.centerY.equalToSuperview().multipliedBy(0.7)
            make.leading.equalToSuperview().inset(16)
        }
        
        matchingView.snp.makeConstraints { make in
            make.width.height.equalTo(64)
            make.trailing.equalToSuperview().inset(16)
            make.centerY.equalToSuperview().multipliedBy(1.7)
            
        }
        
        insideButton.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.centerX.centerY.equalToSuperview()
        }
        
    }
}
