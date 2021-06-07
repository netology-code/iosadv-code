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
        
        let gestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(pinLocation(gestureRecognizer:)))
        gestureRecognizer.minimumPressDuration = 2 // тут указаны секунды, если поставить 1, то будет слишком быстро, если ставить дольше, то не юзерфрендли
        mapView.addGestureRecognizer(gestureRecognizer)
        
    }
    
    @objc func pinLocation(gestureRecognizer: UILongPressGestureRecognizer) {
//        1
        if gestureRecognizer.state == .began {
//        2
            let touchPoint = gestureRecognizer.location(in: self.mapView)
            let touchCoordinates = self.mapView.convert(touchPoint, toCoordinateFrom: self.mapView)
//        3
            let annotation = MKPointAnnotation()
            annotation.coordinate = touchCoordinates
            annotation.title = "Точка"
            annotation.subtitle = "Новая точка на карте"
//        4
            self.mapView.addAnnotation(annotation)
        }
    }
    
    // создаем функцию, которая будет получать местоположение и наводить карту на него
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = CLLocationCoordinate2D(latitude: locations[0].coordinate.latitude, longitude: locations[0].coordinate.longitude)
        let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        let region = MKCoordinateRegion(center: location, span: span)
        mapView.setRegion(region, animated: true)
    }


}

