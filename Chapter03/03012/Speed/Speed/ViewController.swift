//
//  ViewController.swift
//  Speed
//
//  Created by CoderDream on 2019/7/16.
//  Copyright © 2019 CoderDream. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    var locationManager = CLLocationManager()
    
    @IBOutlet weak var speedLabel : UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        
        locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation
        
        locationManager.requestWhenInUseAuthorization()
        
        locationManager.startUpdatingLocation()
    }
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let lastLocation = locations.last else {
            return
        }
        self.speedLabel.text = String(format: "Currently moving at %.0f master/second", lastLocation.speed)
        print("speed: \(lastLocation.speed)")
        if lastLocation.speed > 0 {
            self.speedLabel.text = String(format: "Currently moving at %.0f master/second", lastLocation.speed)
        }
    }
}
