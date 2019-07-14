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
        // 计算从上次帧刷新到本次帧刷新之间的时间差
        let deltaTime = currentTime - lastFrameTime
        
        // Move at 3 units per second
        // 移动速度为：每秒三个单位
        let movementSpeed = 3.0
        
        // Multiply by deltaTime to work out how far
        // an object needs to move this frame
        // 用 deltaTime 乘以移动速度即可得到这一帧应该移动多少距离
        // 即公式：时间×速度=运动距离
        someMovingObject.move(distance: movementSpeed * deltaTime)
        
        // Set last frame time to current time, so that
        // we can calculate the delta time when we're next called
        // 将当前时间保存到 lastFrameTime，以便下次刷新时计算每帧耗时
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
