//
//  HomeViewController.swift
//  SLP
//
//  Created by 나리강 on 2022/11/17.
//

import UIKit
import CoreLocation
import MapKit

class HomeViewController: BaseViewController, CLLocationManagerDelegate, MKMapViewDelegate {

    let mainView = HomeView()
    override func loadView() {
        self.view = mainView
    }
    
    let locationManager = CLLocationManager()
    var currentLocation : CLLocation!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.mainView.map.showsUserLocation = true
        self.mainView.map.setUserTrackingMode(.follow, animated: true)
        
        locationManager.delegate = self
        mainView.map.delegate = self
       
        configuration()
        self.currentLocation = locationManager.location
    }
    
    
    

    override func configuration() {
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        

    }
    

    

}
