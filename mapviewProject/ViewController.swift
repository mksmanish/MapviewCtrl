//
//  ViewController.swift
//  mapviewProject
//
//  Created by manish on 03/07/21.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    let locationManager = CLLocationManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
    }


}
extension ViewController:CLLocationManagerDelegate{
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let span = MKCoordinateSpan(latitudeDelta:0.10, longitudeDelta: 0.10)
        let places = MKCoordinateRegion(center: locations[0].coordinate, span: span)
        mapView.setRegion(places, animated: true)
        mapView.showsUserLocation = true
        
        let pin = MKPointAnnotation()
        pin.coordinate = places.center
        mapView.addAnnotation(pin)
    }
    
    
}
