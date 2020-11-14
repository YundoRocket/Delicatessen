//
//  MapViewController.swift
//  Delicatessen
//
//  Created by Damien Rojo on 10.11.20.
//  Copyright © 2020 Chimere.io LTD. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

final class MapViewController: UIViewController {
    
    // MARK: - Properties

    var viewModel: MapViewModel!
    
    // MARK: - Privates Properties
    
    private let locationManager = CLLocationManager()
    
    // MARK: - Outlets
    
    @IBOutlet weak private var searchBar: UISearchBar!
    @IBOutlet weak private var mapView: MKMapView!
    
    // MARK: - View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        bind(to: viewModel)
        viewModel.viewDidLoad()
        checkUserLocactionService()

//        let carrefour = Shop(title: "Carrefour Contact", coordinate: CLLocationCoordinate2D(latitude: 46.268362, longitude: 6.367100), subtitle: nil)
//        let casino = Shop(title: "Casino", coordinate: CLLocationCoordinate2D(latitude: 46.265512, longitude: 6.372552), subtitle: nil)
//        let lemanGrocery = Shop(title: "Épicerie du léman", coordinate: CLLocationCoordinate2D(latitude: 46.263605, longitude: 6.368636), subtitle: nil)
//
//        mapView.addAnnotations([carrefour, casino, lemanGrocery])
    }

    // MARK: - Helpers

    private func bind(to viewModel: MapViewModel) {
        viewModel.searchBarPlaceholder = { [weak self] placeholder in
            DispatchQueue.main.async {
                self?.searchBar.placeholder = placeholder
            }
        }

        viewModel.shops = { [weak self] shops in
            DispatchQueue.main.async {
                print(shops)
                self?.mapView.addAnnotations(shops)
            }
        }
    }

    private func setUpLocationManager() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }

    private func centerViewOnUserLocation() {
        if let location = locationManager.location?.coordinate {
            mapView.mapType = MKMapType.standard
            let span = MKCoordinateSpan(latitudeDelta: 0.05,
                                        longitudeDelta: 0.05)
            let region = MKCoordinateRegion(center: location,
                                            span: span)
            mapView.setRegion(region,
                              animated: true)
        }
    }

    private func checkUserLocactionService() {
        if CLLocationManager.locationServicesEnabled() {
            setUpLocationManager()
            checkLocationAuthorization()
        } else {
            // show alert
        }
    }

    private func checkLocationAuthorization() {
        switch CLLocationManager.authorizationStatus() {
        case .authorizedWhenInUse:
            centerViewOnUserLocation()
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            // show alert letting them know wath's up
            break
        case .denied:
            // show alert instricting them how to turn on permission
            break
        case .authorizedAlways:
            centerViewOnUserLocation()
            break
        @unknown default:
            fatalError()
        }
    }

    // MARK: - Actions

}

extension MapViewController: CLLocationManagerDelegate {}

extension MapViewController: MKMapViewDelegate {
    func mapView(
        _ mapView: MKMapView,
        viewFor annotation: MKAnnotation
    ) -> MKAnnotationView? {
        guard annotation is Shop else { return nil }
        
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
        viewModel.didSelectShopDescription()
    }
}
