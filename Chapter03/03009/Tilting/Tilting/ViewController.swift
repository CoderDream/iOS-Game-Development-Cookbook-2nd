//
//  ViewController.swift
//  Tilting
//
//  Created by CoderDream on 2019/7/15.
//  Copyright © 2019 CoderDream. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {
    
    // BEGIN tilt
    @IBOutlet weak var pitchLabel : UILabel!    // 俯仰
    @IBOutlet weak var yawLabel : UILabel!      // 偏航
    @IBOutlet weak var rollLabel : UILabel!     //
    
    var motionManager = CMMotionManager()
    override func viewDidLoad() {
        let mainQueue = OperationQueue.main
        motionManager.startDeviceMotionUpdates(to: mainQueue) {
            (motion, error) in
            // Ensure that we have a CMDeviceMotion to work with
            guard let motion = motion else {
                if let error = error {
                    print("Failed to get device motion: \(error)")
                }
                return
            }
            let roll = motion.attitude.roll
            let rollDegrees = roll * 180 / .pi
            let yaw = motion.attitude.yaw
            let yawDegrees = yaw * 180 / .pi
            let pitch = motion.attitude.pitch
            let pitchDegrees = pitch * 180 / .pi
            
            self.rollLabel.text = String(format:"Roll: %.2f°", rollDegrees)
            self.yawLabel.text = String(format: "Yaw: %.2f°", yawDegrees)
            self.pitchLabel.text = String(format: "Pitch: %.2f°", pitchDegrees)
        }        
    }
}

