//
//  ViewController.swift
//  DetectingTouches
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
    
    // BEGIN touch_funcs
    // 开始：手指刚刚触摸到屏幕上
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            print("A touch began at \(touch.location(in: self.view))")
        }
    }
    
    // 移动：手指从一个地方移动到另一个地方（在一个触摸过程中，移动方法会被调用多次）
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            print("A touch moved at \(touch.location(in: self.view))")
        }
    }
    
    // 结束：手指从屏幕上离开
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            print("A touch ended at \(touch.location(in: self.view))")
        }
    }
    
    // 取消：触摸由于某种原因被中断，比如被某个手势识别器拦截
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            print("A touch was cancelled at \(touch.location(in: self.view))")
        }
    }
    // END touch_funcs

}

