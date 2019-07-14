//
//  ViewController.swift
//  Refreshes
//
//  Created by CoderDream on 2019/7/14.
//  Copyright © 2019 CoderDream. All rights reserved.
//

import UIKit
import QuartzCore

class ViewController: UIViewController {
    
    var displayLink : CADisplayLink?
    
    @objc func screenUpdated(displayLink: CADisplayLink) {
        // Update the game.
        print("screenUpdated: \(displayLink)")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("viewDidLoad")
        
        // Get a reference to the method we want to run when the
        // display updates
        let screenUpdated = #selector(screenUpdated(displayLink:))
        // Create and schedule the display link
        displayLink = CADisplayLink(target: self, selector: screenUpdated)
        displayLink?.add(to: RunLoop.main, forMode: RunLoop.Mode.common)
        // When you want to pause receiving updates, set the paused property of the CADisplayLink to true:
        // Pause the display link
        displayLink?.isPaused = true
        
        // Remove the display link; once done, you need to
        // remove it from memory by setting all references to it to nil
//        displayLink?.invalidate()
//        displayLink = nil
    }


}

