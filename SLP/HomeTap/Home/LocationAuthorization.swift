//
//  LocationAuthorization.swift
//  SLP
//
//  Created by 나리강 on 2022/11/19.
//

import UIKit
import CoreLocation

extension HomeViewController : CLLocationManagerDelegate{
    
    // MARK : 위치받아오기 에러 처리
    override func viewDidAppear(_ animated: Bool) {
        let status : CLAuthorizationStatus = locationManager.authorizationStatus
        if CLLocationManager.locationServicesEnabled() {
            checkUserAuthorization(status)
            print(status)
        } else {
           print("위치서비스 꺼져있음")
        }
    }
   

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if locationManager.authorizationStatus == .authorizedWhenInUse {
            currentLocation = locations.first?.coordinate
            SearchAPIManager.shared.callSearchAPI(mainView: self.mainView)
        }
        
    }
    
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        let status : CLAuthorizationStatus = locationManager.authorizationStatus
        checkUserAuthorization(status)
        SearchAPIManager.shared.callSearchAPI(mainView: self.mainView)
    }
    
    
    func checkUserAuthorization(_ status : CLAuthorizationStatus) {
        switch status {
        case .authorizedAlways :
            locationManager.stopUpdatingLocation()
            print("When In Use")
        case .denied :
            print("denied")
            showRequestAlert()
        case .notDetermined, .restricted :
            print("Not Determined")
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.requestWhenInUseAuthorization()
        default :
            print("nothing")
        }
        Repository.locationAuthStatus = status.rawValue
        print("==========\(status.rawValue)")
    }
    
    func showRequestAlert() {
        let requestAlert = UIAlertController(title: "위치정보 이용", message: "위치 서비스 사용 불가.기기의 '설정 > 개인정보보호'에서 위치서비스를 켜주세요 ", preferredStyle: .alert)
        let goSetting = UIAlertAction(title: "설정으로 이동", style: .destructive) { _
            in
            if let appSetting = URL(string: UIApplication.openSettingsURLString) {
                UIApplication.shared.open(appSetting)
            }
            
        }
        
        requestAlert.addAction(goSetting)
        present(requestAlert, animated: true)
    }
    
   
}
