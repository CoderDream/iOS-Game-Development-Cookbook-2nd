//
//  ViewController.swift
//  UserLocation
//
//  Created by CoderDream on 2019/7/15.
//  Copyright © 2019 CoderDream. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    var locationManager = CLLocationManager()
    @IBOutlet weak var latitudeLabel : UILabel!
    @IBOutlet weak var longitudeLabel : UILabel!
    @IBOutlet weak var locationErrorLabel : UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        self.locationErrorLabel.isHidden = true
    }
    func locationManager(_ manager: CLLocationManager,
                         didUpdateLocations locations: [CLLocation]) {
        self.locationErrorLabel.isHidden = true
        let location = locations.last!
        let latitude = location.coordinate.latitude
        let longitude = location.coordinate.longitude
        self.latitudeLabel.text = String(format: "Latitude: %.4f", latitude)
        self.longitudeLabel.text = String(format: "Longitude: %.4f", longitude)
    }
    func locationManager(_ manager: CLLocationManager,
                         didFailWithError error: Error) {
        self.locationErrorLabel.isHidden = false
        self.locationErrorLabel.text = error.localizedDescription
    }
}
