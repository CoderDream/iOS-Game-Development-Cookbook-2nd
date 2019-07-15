//
//  DownUpGestureRecognizer.swift
//  CustomGestureRecognizer
//
//  Created by CoderDream on 2019/7/15.
//  Copyright © 2019 CoderDream. All rights reserved.
//

import UIKit

// BEGIN recognizer
import UIKit.UIGestureRecognizerSubclass

class DownUpGestureRecognizer: UIGestureRecognizer {
    
    // Represents the two phases that the gesture can be in: moving down, or moving up after having moved down
    // 这个手势可以被分成两个阶段：下移阶段，以及随后的上移阶段
    enum DownUpGesturePhase: CustomStringConvertible {
        case movingDown, movingUp
        
        // The 'CustomStringConvertible' protocol above means
        // that this type can be turned into a string.
        // This means you can say "\(somePhase)" and it will
        // turn into the correct string.
        // The following property adds support for this.
        // 'CustomStringConvertible'协议表明这个枚举类型可以转换成字符串
        // 需要声明下列属性
        var description: String {
            get {
                switch self {
                case .movingDown:
                    return "Moving Down"
                case .movingUp:
                    return "Moving Up"
                }
            }
        }
    }
    
    // 初始化
    var phase: DownUpGesturePhase = .movingDown
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent) {
        
        // The gesture begins in the moving down phase.
        self.phase = .movingDown
        
        if self.numberOfTouches > 1 {
            
            // If there's more than one touch, this is not the type of gesture
            // we're looking for, so fail immediately
            // 如果 touch 数大于1，说明不是我们需要识别的手势，因此标记为.failed
            self.state = .failed
            print("如果 touch 数大于1，说明不是我们需要识别的手势，因此标记为.failed")
        } else {
            // Else, this touch could possible turn into a down-up gesture
            // 否则有可能会是一个向下滑的动作，因此标记为.possible
            self.state = .possible
            print("否则有可能会是一个向下滑的动作，因此标记为.possible")
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent) {
        
        // We know we only have one touch, beacuse touchesBegan will stop
        // recognizing when more than one touch is detected
        // 我们只需要处理单点触碰的情况
        guard let touch = touches.first else {
            return
        }
        
        // Get the current and previous position of the touch
        // 获取触摸的当前位置和上一个位置
        let position = touch.location(in: touch.view)
        let lastPosition = touch.previousLocation(in: touch.view)
        
        // If the state is Possible, and the touch has moved down, the gesture has Begun
        // 当状态为 possible，同时手指正在向下滑，说明我们的侦测的手势开始了
        if self.state == .possible && position.y > lastPosition.y {
            self.state = .began
            print("当状态为 possible，同时手指正在向下滑，说明我们的侦测的手势开始了")
        }
            
        // If the state is Began or Changed, and the touch has moved, the gesture will change state
        // 当状态为开始或改变，同时触摸点也在变化中，标记状态为改变
        else if self.state == .began || self.state == .changed {
            // If the phase of the gesture is MovingDown, and the touch moved down, the gesture has Changed
            // 如果手势当前仍处于向下滑阶段，并且触摸位置改变。只需标记手势识别器的状态为 changed
            if self.phase == .movingDown && position.y >
                lastPosition.y {
                self.state = .changed
                //print("如果手势当前仍处于向下滑阶段，并且触摸位置改变。只需标记手势识别器的状态为 changed")
            }
            // If the phase of the gesture is MovingDown, and the touch moved
            // up, the gesture has Changed also, change the phase to MovingUp
            // 如果手势当前处于向下滑阶段，但触摸位置已经开始向上运动，则状态标记为 changed，阶段标记为向上
            else if self.phase == .movingDown && position.y < lastPosition.y {
                self.phase = .movingUp
                self.state = .changed
                print("如果手势当前处于向下滑阶段，但触摸位置已经开始向上运动，则状态标记为 changed，阶段标记为向上")
            }
            // If the phase of the gesture is MovingUp, and the touch moved
            // down, then the gesture has Failed
            // 如果在上移阶段，但触摸位置已经开始下移，则手势判定失败
            else if self.phase == .movingUp && position.y > lastPosition.y {
                self.state = .failed
                print("如果在上移阶段，但触摸位置已经开始下移，则手势判定失败")
            }
            
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent) {
        // If the touch ends while the phase is MovingDown, the gesture has Failed.
        // 仅识别单点触摸。触摸结束时应当处于上移阶段。
        // 如果触摸结束时处于下移阶段，则判定手势失败
        if self.phase == .movingDown {
            self.state = .failed
            print("如果触摸结束时处于下移阶段，则判定手势失败")
        }
        // If the touch ends while the phase is MovingUp, the gesture has Ended.
        // 如果触摸结束时处于上移阶段，则判定手势成功（结束）
        else if self.phase == .movingUp {
            self.state = .ended
            print("如果触摸结束时处于上移阶段，则判定手势成功（结束）")
        }
    }
    
}
