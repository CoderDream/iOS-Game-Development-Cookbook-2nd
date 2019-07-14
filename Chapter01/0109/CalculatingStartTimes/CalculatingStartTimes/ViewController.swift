//
//  ViewController.swift
//  CalculatingStartTimes
//
//  Created by CoderDream on 2019/7/14.
//  Copyright © 2019 CoderDream. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // Store the time when the game started as a property
    // 声明一个属性，用于游戏启动时记录时间
    var gameStartDate: Date?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("viewDidLoad")
        
        // When the game actually begins, store the current date
        // 游戏一旦启动，保存当前时间到该属性
        self.gameStartDate = Date()
        
        let now = Date()
        let timeSinceGameStart = now.timeIntervalSince(self.gameStartDate!)
        print("The game started \(timeSinceGameStart) seconds ago")
        
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.hour, .minute, .second]
        formatter.unitsStyle = .positional
        let formattedString = formatter.string(from: timeSinceGameStart) ?? ""
        print("Time elapsed: \(formattedString)")
    }


}

