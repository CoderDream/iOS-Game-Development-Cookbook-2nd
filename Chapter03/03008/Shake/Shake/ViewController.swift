//
//  ViewController.swift
//  Shake
//
//  Created by CoderDream on 2019/7/15.
//  Copyright © 2019 CoderDream. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBOutlet weak var shakingLabel : UILabel!
    
    // BEGIN shaking
    // BEGIN motion_methods
    override func motionBegan(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        // 摇晃开始，显示一个 Label
        self.shakingLabel.isHidden = false
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        // Hide the label 1 second after shaking ends
        // 摇晃结束后一秒，隐藏 Label
        let delayInSeconds : Double = 1.0
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + delayInSeconds) {
            self.shakingLabel.isHidden = true
        }
    }
    
//    // END motion_methods
//
//    // BEGIN responder
    // 告诉系统，某个视图控制器能够成为“first responder”，能够接收类似摇晃这样的动作手势
    override var canBecomeFirstResponder: Bool {
        return true
    }
    // END responder
    // END shaking
}
