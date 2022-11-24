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
    
    let mainView = HomeView()
    override func loadView() {
        self.view = mainView
    }
    
    let locationManager = CLLocationManager()
    var currentLocation : CLLocation!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        mainView.map.delegate = self
        
        configuration()
        self.currentLocation = locationManager.location
        mainView.button.addTarget(self, action: #selector(locationButtonTapped), for: .touchUpInside)
        mainView.insideButton.addTarget(self, action: #selector(viewTapped), for: .touchUpInside)
        
    }
    
    @objc func viewTapped() {
        print(#function)
        let vc = SearchViewController()
        self.navigationController?.pushViewController(vc, animated: true)
        
        
    }
  
    @objc func locationButtonTapped(){
        mainView.map.showsUserLocation = true
    }
    
    
    
    override func configuration() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        locationManager.startMonitoringVisits()
        
        
        
    }
    
    
    
    
}
