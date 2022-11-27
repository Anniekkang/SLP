//
//  LocationExtension.swift
//  SLP
//
//  Created by 나리강 on 2022/11/27.
//

import UIKit
import MapKit
import CoreLocation

extension HomeViewController {
    
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
    
    func setAnnotation(latitude : CLLocationDegrees, longtitude : CLLocationDegrees, map : MKMapView) {
        
       
        annotation.coordinate = goLocation(latitude: latitude, longtitude: longtitude, delta: 0.00158, map: map)
       
    }
    
    
  
    
}


