//
//  MapDataSource.swift
//  Delicatessen
//
//  Created by Damien Rojo on 18.11.20.
//  Copyright © 2020 Chimere.io LTD. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
import DLCommons

final class MapDataSource: NSObject, MKMapViewDelegate, CLLocationManagerDelegate {
    
    // MARK: - Privates Properties
    
    var locationManager: CLLocationManager
    var didSelectAnnotation: VoidClosure?
    
    // MARK: - Init

    override init() {
        self.locationManager = CLLocationManager()
        super.init()
        self.locationManager.delegate = self
    }
     
    func mapView(
        _ mapView: MKMapView,
        viewFor annotation: MKAnnotation
    ) -> MKAnnotationView? {
        guard annotation is ShopAnnotation else { return nil }
        let identifier = "Shops"
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)

        if annotationView == nil {
           annotationView = MKPinAnnotationView(annotation: annotation,
                                                reuseIdentifier: identifier)
           annotationView?.canShowCallout = true
           
           let button = UIButton(type: .detailDisclosure)
           annotationView?.rightCalloutAccessoryView = button
        } else {
           annotationView?.annotation = annotation
        }

        return annotationView
    }
    
    func mapView(_ mapView: MKMapView,
                 annotationView view: MKAnnotationView,
                 calloutAccessoryControlTapped control: UIControl
    ) {
        didSelectAnnotation?()
    }
}
