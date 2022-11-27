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
    let annotation = MKPointAnnotation()
    let sesacLocation = CLLocationCoordinate2D(latitude: 37.517819364682694, longitude: 126.88647317074734)
    
    override func loadView() {
        self.view = mainView
    }
    
    let locationManager = CLLocationManager()
    var currentLocation : CLLocation!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //if LocationAuthStatus == .denied
        if Repository.locationAuthStatus == 2 {
            
            annotation.coordinate = goLocation(latitude: sesacLocation.latitude, longtitude: sesacLocation.longitude, delta: 0.00158, map: mainView.map)
            
            
        } else {
            annotation.coordinate = goLocation(latitude: currentLocation.coordinate.latitude, longtitude: currentLocation.coordinate.longitude, delta: 0.00158, map: mainView.map)
            
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.mainView.map.addAnnotation(annotation)
        self.currentLocation = locationManager.location
        configuration()
        tabBarController?.tabBar.isHidden = false
        
        mainView.button.addTarget(self, action: #selector(locationButtonTapped), for: .touchUpInside)
        mainView.insideButton.addTarget(self, action: #selector(viewTapped), for: .touchUpInside)
    }
    
    @objc func viewTapped() {
        if Repository.locationAuthStatus == 2 {
            showRequestAlert()
        } else {
            let vc = AddStudyViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
    }
    
    @objc func locationButtonTapped(){
        
        if Repository.locationAuthStatus == 2 {
            showRequestAlert()
        } else {
           
            goLocation(latitude: currentLocation.coordinate.latitude, longtitude: currentLocation.coordinate.longitude, delta: 0.00158, map: mainView.map)
        }
        
    }
    
    
    
    override func configuration() {
        mainView.map.delegate = self
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest//정확도 올리기
        locationManager.requestWhenInUseAuthorization()//위치권한 요청
        locationManager.startUpdatingLocation()//위치 업데이트 시작
        locationManager.startMonitoringVisits()
        
    }
    
    //양옆이동 false 줌인 줌아웃 true
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        let currentLocation : CLLocationCoordinate2D = mapView.centerCoordinate
        annotation.coordinate = goLocation(latitude: currentLocation.latitude, longtitude: currentLocation.longitude, delta: 0.00158, map: mapView)
    }
    
    
    func goLocation(latitude : CLLocationDegrees, longtitude : CLLocationDegrees, delta : Double, map: MKMapView) -> CLLocationCoordinate2D {
        let location = CLLocationCoordinate2D(latitude: latitude, longitude: longtitude)//좌표 정보
        let spanValue = MKCoordinateSpan(latitudeDelta: delta, longitudeDelta: delta)//확대 비율
        let region = MKCoordinateRegion(center: location, span: spanValue)//지역 위치 정보
        map.setRegion(region, animated: true)//mapview에 설정정보 setting
        return location
    }
    
    
    
}
