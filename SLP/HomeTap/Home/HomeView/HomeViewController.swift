//
//  HomeViewController.swift
//  SLP
//
//  Created by 나리강 on 2022/11/17.
//

import UIKit
import CoreLocation
import MapKit

class HomeViewController: BaseViewController, MKMapViewDelegate {
    
    var center : CLLocationCoordinate2D?
    let mainView = HomeView()
    
    override func loadView() {
        self.view = mainView
    }
    
    let locationManager = CLLocationManager()
    var currentLocation : CLLocation!
    
    override func viewWillAppear(_ animated: Bool) {
       
        
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
  
        mainView.map.delegate = self
        self.currentLocation = locationManager.location
        configuration()
        tabBarController?.tabBar.isHidden = false
        
        mainView.button.addTarget(self, action: #selector(locationButtonTapped), for: .touchUpInside)
        mainView.insideButton.addTarget(self, action: #selector(viewTapped), for: .touchUpInside)
    }
    
    @objc func viewTapped() {
        print(#function)
        let vc = AddStudyViewController()
        self.navigationController?.pushViewController(vc, animated: true)
        
        
    }
  
    @objc func locationButtonTapped(){
        mainView.map.showsUserLocation = true
    }
    
    
    
    override func configuration() {
        mainView.map.delegate = self
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest//정확도 올리기
        locationManager.requestWhenInUseAuthorization()//위치권한 요청
        locationManager.startUpdatingLocation()//위치 업데이트 시작
        locationManager.startMonitoringVisits()
    
    }
 
    
}
