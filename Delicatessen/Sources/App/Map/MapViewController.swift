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
    
    private let dataSource = MapDataSource()
    
    // MARK: - Outlets
    
    @IBOutlet weak private var searchBar: UISearchBar!
    @IBOutlet weak private var mapView: MKMapView!
    
    // MARK: - View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = dataSource
        bind(to: viewModel)
        viewModel.viewDidLoad()
        setUI()
        bind(to: dataSource)
    }

    // MARK: - Helpers
    
    private func setUI() {
        navigationItem.setRightBarButton(cartButtonitem(action: #selector(didPressCart)), animated: true)
        checkUserLocactionService()
    }

    private func bind(to viewModel: MapViewModel) {
        viewModel.searchBarPlaceholder = { [weak self] placeholder in
            DispatchQueue.main.async {
                self?.searchBar.placeholder = placeholder
            }
        }

        viewModel.shops = { [weak self] shops in
            DispatchQueue.main.async {
                var shopsAnnotations: [ShopAnnotation] = []
                shops.forEach { shopsAnnotations.append(ShopAnnotation(title: $0.name,
                                                                       coordinate: CLLocationCoordinate2D(latitude: $0.coordinates[0],
                                                                                                          longitude: $0.coordinates[1]),
                subtitle: nil))}
                self?.mapView.addAnnotations(shopsAnnotations)
            }
        }
    }
    
    private func bind(to dataSource: MapDataSource) {
        dataSource.didSelectAnnotation = { self.viewModel.didSelectShopDescription() }
            
    }

    private func setUpLocationManager() {
        dataSource.locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }

    private func centerViewOnUserLocation() {
        if let location = dataSource.locationManager.location?.coordinate {
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
            dataSource.locationManager.requestWhenInUseAuthorization()
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
    
    @objc private func didPressCart() {
        viewModel.didSelectCart()
    }
}
