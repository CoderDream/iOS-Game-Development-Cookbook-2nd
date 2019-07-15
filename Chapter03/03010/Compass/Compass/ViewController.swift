//
//  ViewController.swift
//  Compass
//
//  Created by CoderDream on 2019/7/15.
//  Copyright © 2019 CoderDream. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {
    
    @IBOutlet weak var directionLabel : UILabel!
    
    var motionManager = CMMotionManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let  mainQueue = OperationQueue.main
        
        motionManager.startDeviceMotionUpdates(
            using: CMAttitudeReferenceFrame.xTrueNorthZVertical,
            to: mainQueue) { (motion, error) in
                // Ensure that we have a CMDeviceMotion to work with
                guard let motion = motion else {
                    if let error = error {
                        print("Failed to get motion: \(error)")
                    }
                    return
                }
                let yaw = motion.attitude.yaw
                let yawDegrees = yaw * 180 / .pi
                self.directionLabel.text = String(format:"Direction: %.0f°", yawDegrees)
        }
    }


}

