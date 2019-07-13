//
//  TimeKeeper.swift
//  CalculatingDeltaTimes
//
//  Created by CoderDream on 2019/7/14.
//  Copyright © 2019 CoderDream. All rights reserved.
//

import UIKit

// BEGIN deltatime_timekeeper
class TimeKeeper {
    var lastFrameTime: Double = 0.0
    
    var someMovingObject = MovingObject()
    
    // BEGIN deltatime_calculating
    func update(currentTime: Double) {
        // Calculate the time since this method was last called
        let deltaTime = currentTime - lastFrameTime
        
        // Move at 3 units per second
        let movementSpeed = 3.0
        
        // Multiply by deltaTime to work out how far
        // an object needs to move this frame
        someMovingObject.move(distance: movementSpeed * deltaTime)
        
        // Set last frame time to current time, so that
        // we can calculate the delta time when we're next
        // called
        lastFrameTime = currentTime
    }
    // END deltatime_calculating
    
    func currentTime() -> Void {
        // BEGIN deltatime_getting_current_time
        let currentTime = Date.timeIntervalSinceReferenceDate as Double
        print("currentTime: \(currentTime)")
        // END deltatime_getting_current_time
    }
}
