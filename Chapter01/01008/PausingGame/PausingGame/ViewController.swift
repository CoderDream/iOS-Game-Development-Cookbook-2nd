//
//  ViewController.swift
//  PausingGame
//
//  Created by CoderDream on 2019/7/14.
//  Copyright © 2019 CoderDream. All rights reserved.
//

import UIKit

class GameObject {
    func update(deltaTime : Float) {
        
        // 'deltaTime' is the number of seconds since
        // this was last called.
        
        // This method is overriden by subclasses to update
        // the object's state - position, direction, and so on.
        print("update: \(deltaTime)")
    }
    
    var canPause = true
}

class ViewController: UIViewController {
    
    var gameObjects : [GameObject] = []
    
    var paused = true

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("viewDidLoad")
        
        let deltaTime: Float = 0.01
        
        // BEGIN pausing
        for gameObject in self.gameObjects {
            
            // Update it if we're not paused, or if this game object
            // ignores the paused state
            if self.paused == false || gameObject.canPause == false {
                gameObject.update(deltaTime: deltaTime)
            }
            
        }
    }


}

