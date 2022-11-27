//
//  CustomAnnotationView.swift
//  SLP
//
//  Created by 나리강 on 2022/11/27.
//

import UIKit
import MapKit
import SnapKit


class CustomAnnotationView : MKAnnotationView {
    override init(annotation: MKAnnotation?, reuseIdentifier: String?) {
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
        
        self.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        self.frame = annotationFrame
        self.backgroundColor = .clear
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let annotationFrame = CGRect(x: 0, y: 0, width: 45, height: 45)
    
    let imageView : UIImageView = {
       let view = UIImageView()
        view.image = UIImage(named: "")
        return view
        
    }()

    
}


extension HomeViewController {
   
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard annotation is MKPointAnnotation else { return nil }
        
        let customAnnotationView = self.customAnnotationView(mapView: mapView, annotation: annotation)
        customAnnotationView.imageView.image = UIImage(named: "map_marker")
        
        return customAnnotationView
        
        
    }
    
    // customAnnotationView의 재활용성을 위해 사용
    private func customAnnotationView(mapView : MKMapView, annotation : MKAnnotation) -> CustomAnnotationView {
        let identifier = "CustomAnnotationViewID"

        if let annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? CustomAnnotationView {
            annotationView.annotation = annotation
            return annotationView
        } else {
            let customAnnotationView = CustomAnnotationView(annotation: annotation, reuseIdentifier: identifier)
           // customAnnotationView.canShowCallout = true
            return customAnnotationView
        }
    }

}
