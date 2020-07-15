//
//  MapViewController.swift
//  Weather
//
//  Created by Vladislav Horbenko on 15.07.2020.
//  Copyright © 2020 VH. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation


class MapViewController: UIViewController {
    
    private let mapView = MKMapView()
    private let dismissButton: UIButton = {
        let res = UIButton()
        res.setImage(UIImage(named: "ic_back"), for: .normal)
        res.addTarget(self, action: #selector(didPressedDismiss), for: .touchUpInside)
        return res
    }()
    var city: City! {
        didSet {
            update()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        configure()
    }

    private func configure() {
        view.setup(subView: mapView) { (make) in
            
            make.top.left.right.bottom.equalTo(view)
        }
        mapView.setup(subView: dismissButton) { (make) in
            make.width.height.equalTo(50)
            make.left.top.equalTo(mapView.safeAreaLayoutGuide)
        }
    }
    
    private func update() {
        let location = CLLocationCoordinate2D(latitude: city.coord.lat, longitude: city.coord.lon)
        let span = MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
        let region = MKCoordinateRegion(center: location, span: span)
        mapView.setRegion(region, animated: true)
        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title = city.name
        mapView.addAnnotation(annotation)
    }
    @objc private func didPressedDismiss () {
        dismiss(animated: true, completion: nil)
    }

}
