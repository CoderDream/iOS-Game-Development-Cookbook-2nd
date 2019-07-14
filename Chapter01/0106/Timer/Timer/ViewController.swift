//
//  ViewController.swift
//  Timer
//
//  Created by CoderDream on 2019/7/14.
//  Copyright © 2019 CoderDream. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var timer : Timer?
    
    @objc
    func updateWithTimer(timer: Timer) {
        // Timer went off; update the game
        // 到达指定的时间，游戏刷新
        print("Timer went off!")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("viewDidLoad")
        
        // Start a timer
        self.timer = Timer.scheduledTimer(timeInterval: 0.5,
                                          target: self,
                                          selector: #selector(ViewController.updateWithTimer(timer:)),
                                          userInfo: nil,
                                          repeats: true)
       
        // Stop a timer
        // self.timer?.invalidate()
        // self.timer = nil
    }

}
