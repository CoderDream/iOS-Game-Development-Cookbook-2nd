//
//  ViewController.swift
//  TouchRegion
//
//  Created by CoderDream on 2019/7/15.
//  Copyright © 2019 CoderDream. All rights reserved.
//

import UIKit

/// 在 Main.storyboard中添加一个 Tap Gesture Recognizer，然后设置它的 Send Actions
class ViewController: UIViewController {

    @IBAction func tapped(_ sender: UITapGestureRecognizer) {
        if sender.state == UIGestureRecognizer.State.ended {
            print("Tapped!")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("viewDidLoad")
    }
}
