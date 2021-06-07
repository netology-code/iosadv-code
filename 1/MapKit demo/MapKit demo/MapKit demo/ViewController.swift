//
//  ViewController.swift
//  MapKit demo
//
//  Created by Никита Павлов on 25.05.2021.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    var locationManager = CLLocationManager()

    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.delegate = self
        locationManager.delegate = self
        
        // задаем точность определения геолокации
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        // запрашиваем разрешение пользователя на определение геолокации
        locationManager.requestWhenInUseAuthorization()
        // получаем местоположение пользователя
        locationManager.startUpdatingLocation()
        
    }
    
    // создаем функцию которая будет получать местоположение и наводить карту на него
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = CLLocationCoordinate2D(latitude: locations[0].coordinate.latitude, longitude: locations[0].coordinate.longitude)
        let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        let region = MKCoordinateRegion(center: location, span: span)
        mapView.setRegion(region, animated: true)
    }


}

