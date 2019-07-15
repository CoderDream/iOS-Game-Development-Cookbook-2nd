//
//  ViewController.swift
//  Pinching
//
//  Created by CoderDream on 2019/7/15.
//  Copyright © 2019 CoderDream. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scalingView: UIView!
    @IBOutlet weak var scalingStatusLabel: UILabel!
    
    // The current scale of the view (1.0 = normal scale)
    // 视图当前的缩放系数（1.0 = 正常，无缩放）
    var scale : Float = 1.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let pinched = #selector(ViewController.pinched(pinchGesture:))
        
        // Set up the rotation gesture
        // 创建 UIPinchGestureRecognizer
        let rotationGesture = UIPinchGestureRecognizer(target: self, action: pinched)
        
        self.scalingView.isUserInteractionEnabled = true
        self.scalingView.addGestureRecognizer(rotationGesture)
        // 显示当前缩放系数
        self.scalingStatusLabel?.text = "\(self.scale)x"
    }
    
    // When the rotation changes, update self.angle and use that to rotate the view
    // 当 scale 值改变时，修改 self.scale，同时缩放视图
    @objc func pinched(pinchGesture : UIPinchGestureRecognizer) {
        
        switch pinchGesture.state {
            
        case .changed:
            self.scale *= Float(pinchGesture.scale)
            
            // BEGIN reset
            pinchGesture.scale = 1.0
            // END reset
            
            self.scalingView.transform =
                CGAffineTransform(scaleX: CGFloat(self.scale),
                                  y: CGFloat(self.scale))
            
        default: () // do nothing
            
        }
        
        // Display the current scale factor
        // 显示当前缩放系数
        self.scalingStatusLabel?.text = "\(self.scale)x"
    }

}

