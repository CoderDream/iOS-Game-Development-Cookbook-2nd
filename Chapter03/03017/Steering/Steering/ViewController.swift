//
//  ViewController.swift
//  Steering
//
//  Created by CoderDream on 2019/7/16.
//  Copyright © 2019 CoderDream. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {
    
    var motionManager = CMMotionManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // BEGIN steer
        motionManager.startDeviceMotionUpdates(to: OperationQueue.main) {
            (motion, error) -> Void in
            
            // Ensure that we have a CMDeviceMotion to work with
            guard let motion = motion else {
                if let error = error {
                    print("Error: \(error)")
                }
                return
            }
            
            // Maximum steering left is -50 degrees, maximum steering right is 50 degrees
            // 
            let maximumSteerAngle = 50.0
            
            // When in landscape,
            let rotationAngle = motion.attitude.pitch * 180.0 / .pi
            
            // -1.0 = hard left, 1.0 = hard right
            var steering = 0.0
            
            let orientation = UIApplication.shared.statusBarOrientation
            
            if orientation == UIInterfaceOrientation.landscapeLeft  {
                steering = rotationAngle / -maximumSteerAngle
            } else if orientation == UIInterfaceOrientation.landscapeRight {
                steering = rotationAngle / maximumSteerAngle
            }
            
            // Limit the steering to between -1.0 and 1.0
            steering = fmin(steering, 1.0)
            steering = fmax(steering, -1.0)
            
            if steering != 0.0  {
                //print("Steering: \(steering)")
            }
            
            //if steering == -1.0 {
            if steering <= -0.5 {
                print("hard left")
            }
            
            if steering > 0.5 {
                print("hard right")
            }
        }
        // END steer
    }
}
