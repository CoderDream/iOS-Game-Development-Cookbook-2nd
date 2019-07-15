//
//  ViewController.swift
//  CustomGestureRecognizer
//
//  Created by CoderDream on 2019/7/15.
//  Copyright © 2019 CoderDream. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var customGestureView : UIView!
    @IBOutlet weak var customGestureStatusLabel : UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let downUp = #selector(ViewController.downUp(downUpGesture:))
        
        let downUpGesture = DownUpGestureRecognizer(target:self, action:downUp)
        
        self.customGestureView.addGestureRecognizer(downUpGesture)
    }
    
    @objc func downUp(downUpGesture: DownUpGestureRecognizer) {
        
        switch downUpGesture.state {
        case .began:
            self.customGestureStatusLabel.text = "Gesture began"
            
        case .changed:
            self.customGestureStatusLabel.text = "Gesture changed, phase = " +
            "\(downUpGesture.phase)"
            
        case .ended:
            self.customGestureStatusLabel.text = "Gesture ended"
            
        case .cancelled:
            self.customGestureStatusLabel.text = "Gesture cancelled"
            
        case .possible:
            self.customGestureStatusLabel.text = "Gesture possible"
            
        case .failed:
            self.customGestureStatusLabel.text = "Gesture failed"
    
        }
    }
}
