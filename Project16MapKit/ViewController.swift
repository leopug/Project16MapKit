//
//  ViewController.swift
//  Project16MapKit
//
//  Created by Ana Caroline de Souza on 11/02/20.
//  Copyright © 2020 Ana e Leo Corp. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let london = Capital( title: "London",coordinate: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), info: "Home to the 2012 summer olympics")
        let oslo = Capital( title: "Oslo", coordinate: CLLocationCoordinate2D(latitude: 59.95, longitude: 10.75), info: "Founded over thousand years ago")
        let paris = Capital( title: "Paris",coordinate: CLLocationCoordinate2D(latitude: 48.8567, longitude: 2.3508), info: "Often called the city of Light")
        let rome = Capital( title: "Rome",coordinate: CLLocationCoordinate2D(latitude: 41.9, longitude: 12.5), info: "Has a whole country inside of it")
        let washington = Capital( title: "Washington",coordinate: CLLocationCoordinate2D(latitude: 38.895111, longitude: -77.036667), info: "Named after George himself")
        
        mapView.addAnnotations([london,oslo,paris,rome,washington])
        
        let ac = UIAlertController(title: "Map Type", message: "Select one above:", preferredStyle: .actionSheet)
        ac.addAction(UIAlertAction(title: "Satelite", style: .default, handler: mapTypeMode))
        ac.addAction(UIAlertAction(title: "Hybrid", style: .default, handler: mapTypeMode))
        ac.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        present(ac,animated: true)
        
    }

    func mapTypeMode(_ sender : UIAlertAction) {
        
        if sender.title == "Satelite" {
            mapView.mapType = .satellite
        } else if sender.title == "Hybrid" {
            mapView.mapType = .hybrid
        }
        
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard annotation is Capital else { return nil}
        
        let identifier = "Capital"
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKPinAnnotationView
        
        if annotationView == nil {
            annotationView?.pinTintColor = .darkGray
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView?.canShowCallout = true
            let btn = UIButton(type: .detailDisclosure)
            annotationView?.rightCalloutAccessoryView = btn
        } else {
            annotationView?.pinTintColor = .darkGray
            annotationView?.annotation = annotation
        }
        
        return annotationView
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        guard let capital = view.annotation as? Capital else { return }
        
//        let placeName = capital.title
//        let placeInfo = capital.info
        
//        let ac = UIAlertController(title: placeName, message: placeInfo, preferredStyle: .alert)
//        ac.addAction(UIAlertAction(title: "Ok", style: .default))
//        present(ac,animated: true)
        
        let vc = WikipediaViewController()
        vc.capital = capital.title
        navigationController?.pushViewController(vc, animated: true)
        
    }

}

