//
//  ViewController.swift
//  Blocks
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
    
    // BEGIN closure_as_parameter
    func moveToPosition(position : CGPoint, completion: (()->Void)?) {
        
        // Do the actual work of moving to the location, which
        // might take place over several frames
        
        // Call the completion handler, if it exists
        completion?()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Create two objects for this example
        let car = GameObject()
        let brickWall = GameObject()
        
        // Provide code to run when the car hits any another object
        car.onCollision = { (objectWeHit) in
            NSLog("Car collided with \(objectWeHit)")
        }
        
        // later, when a character collides:
        car.onCollision?(brickWall) // note the ? - this means that
        // the code will only run if onCollision
        // is not nil
        // END closure_example
        // BEGIN closure_explanation
        var multiplyNumber : (Int) -> Int // <1>
        multiplyNumber = { (number) -> Int in // <2>
            return number * 2
        }
        
        _ = multiplyNumber(2) // <3>
        // END closure_explanation
        // BEGIN closure_typealias
        typealias ErrorHandler = (NSError) -> Void
        
        let myErrorHandler: ErrorHandler
        
        myErrorHandler = { (theError) in
            // do work with theError
            print("i SPILL my DRINK! \(theError)")
        }
        print("\(myErrorHandler)")
        // END closure_typealias
        
        let destination = CGPoint(x: 5, y: 3)
        
        // Call the function and provide the closure as a parameter
        moveToPosition(position: destination) {
            print("Arrived!")
        }
    }
}
