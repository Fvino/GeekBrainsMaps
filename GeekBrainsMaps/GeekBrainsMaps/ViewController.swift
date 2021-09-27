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

    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.isTrafficEnabled = true
        mapView.settings.zoomGestures = false
        mapView.delegate = self
        createMapLocation()
        configureLocation()
//        setupStyle()
//        addMarker()
    }
//    36.47774881259678, -4.976065004874191

//    func setupStyle() {
//        do {
//            if let styleURL = Bundle.main.url(forResource: "style", withExtension: "json") {
//                mapView.mapStyle = try GMSMapStyle(contentsOfFileURL: styleURL)
//            } else {
//                NSLog("Unable to find style.json")
//            }
//        } catch  {
//            NSLog("One or more of the map styles failed to load. \(error)")
//        }
//    }

//    func addMarker() {
//        let marker = GMSMarker(position: CLLocationCoordinate2D(latitude: 36.491351, longitude: -4.980326))
////        let view = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
////        view.backgroundColor = .black
////        marker.icon = GMSMarker.markerImage(with: .gray) //цвет маркера
////        marker.iconView = view
//        marker.title = "Grand Zero" // делаем анотацию
//        marker.snippet = "San Pedro"
//        marker.map = mapView


//    }

    func configureLocation() {
        locationManager = CLLocationManager()
        locationManager?.requestWhenInUseAuthorization()
        locationManager?.delegate = self
        locationManager?.requestLocation()
        locationManager?.startUpdatingLocation()
    }


    func createMapLocation() {
        let coordinate = CLLocationCoordinate2D(latitude: 36.491351, longitude: -4.980326)
        let camera = GMSCameraPosition.camera(withTarget: coordinate, zoom: 17)
        mapView.camera = camera
    }

    @IBAction func tap(_ sender: UIButton) {


//        36.47774881259678, -4.976065004874191
        let coordinate = CLLocationCoordinate2D(latitude: 36.47774881259678, longitude: -4.976065004874191)
        mapView.animate(toLocation: coordinate)

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


