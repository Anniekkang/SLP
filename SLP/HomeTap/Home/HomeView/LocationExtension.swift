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
    
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        
    }
    
    func setAnnotatation(latitude : CLLocationDegrees, longtitude : CLLocationDegrees) {
       
        let annotation = MKPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longtitude)
        mainView.map.addAnnotation(annotation)
    }
    
}
