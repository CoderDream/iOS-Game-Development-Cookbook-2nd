//
//  ViewController.swift
//  WorkingWithClosures
//
//  Created by CoderDream on 2019/7/14.
//  Copyright © 2019 CoderDream. All rights reserved.
//

import UIKit

class GameObject {
    // define a type of closure that takes a single GameObject
    // as a parameter and returns nothing
    var onCollision: ((GameObject) -> Void)?
}


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("viewDidLoad")
        
        // Create two objects for this example
        let car = GameObject()
        let brickWall = GameObject()
        // Provide code to run when the car hits any another object
        car.onCollision = { (objectWeHit) in
            print("Car collided with \(objectWeHit)")
        }
        // later, when a character collides:
        car.onCollision?(brickWall) // note the ? - this means that
        // the code will only run if onCollision is not nil
    }
}
