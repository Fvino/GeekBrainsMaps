//
//  ViewController.swift
//  GeekBrainsMaps
//
//  Created by Valeriy Fomin on 27/9/21.
//

import UIKit
import GoogleMaps
import CoreLocation

class ViewController: UIViewController {
    @IBOutlet weak var mapView: GMSMapView!
    var locationManager: CLLocationManager?

    var timer: Timer?
    var identifierTask: UIBackgroundTaskIdentifier?
    let time = Date(timeInterval: 10, since: Date())
    let timeOne = Date(timeInterval: 30, since: Date())// время завершения

    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.isTrafficEnabled = true
        mapView.delegate = self
        createMapLocation()
        configureLocation()
//        configureTimer()



//        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) {[weak self]_ in
//            print("timer play")
//        }
    }

    func configureLocation() {
        locationManager = CLLocationManager()
        locationManager?.requestWhenInUseAuthorization()
        locationManager?.delegate = self
        locationManager?.pausesLocationUpdatesAutomatically = false
        locationManager?.allowsBackgroundLocationUpdates = true
        locationManager?.startMonitoringSignificantLocationChanges()
        locationManager?.requestAlwaysAuthorization()


    }


    func createMapLocation() {
        let coordinate = CLLocationCoordinate2D(latitude: 36.491351, longitude: -4.980326)
        let camera = GMSCameraPosition.camera(withTarget: coordinate, zoom: 17)
        mapView.camera = camera
    }

    @IBAction func tap(_ sender: UIButton) {

//        let coordinate = CLLocationCoordinate2D(latitude: 36.47774881259678, longitude: -4.976065004874191)
//        mapView.animate(toLocation: coordinate)
        locationManager?.requestLocation()
        locationManager?.startUpdatingLocation()

    }
    
}

extension ViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print(locations.first)
        

        let geocoder = CLGeocoder()
        geocoder.reverseGeocodeLocation(locations.first!) { completePlace, error in
            
        }
    }

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        print(status)
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
}

extension ViewController: GMSMapViewDelegate { // добавление маркера по нажатию
    func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
        let marker = GMSMarker(position: coordinate)
//        marker.title = "Grand Zero" // делаем анотацию
//        marker.snippet = "San Pedro"
        marker.map = mapView
    }
}


