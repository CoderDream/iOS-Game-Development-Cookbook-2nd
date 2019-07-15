//
//  ViewController.swift
//  TapGestures
//
//  Created by CoderDream on 2019/7/15.
//  Copyright © 2019 CoderDream. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // BEGIN tap
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap = UITapGestureRecognizer(target: self,
                                         action: #selector(ViewController.tap(tapRecognizer:)))
        
        // In this case, we're adding it to the view controllers'
        // view, but you can add it to any view
        // 这里，可以将手势识别器添加到视图控制器view属性，或者任何别的视图
        self.view.addGestureRecognizer(tap)
        
        let tap2 = UITapGestureRecognizer(target: self,
                                         action: #selector(ViewController.tap2(tapRecognizer:)))
        tap2.numberOfTapsRequired = 2 // 双击
        
        self.view.addGestureRecognizer(tap2)
        
        
        let tap3 = UITapGestureRecognizer(target: self,
                                          action: #selector(ViewController.tap2finger(tapRecognizer:)))
        tap3.numberOfTouchesRequired = 2 // 使用两根手指
        self.view.addGestureRecognizer(tap3)
    }
    
    @objc func tap(tapRecognizer : UITapGestureRecognizer) {
        if tapRecognizer.state == UIGestureRecognizer.State.ended {
            print("View was tapped!")
        }
    }
    
    @objc func tap2(tapRecognizer : UITapGestureRecognizer) {
        if tapRecognizer.state == UIGestureRecognizer.State.ended {
            print("2 View was tapped!")
        }
    }
    
    @objc func tap2finger(tapRecognizer : UITapGestureRecognizer) {
        if tapRecognizer.state == UIGestureRecognizer.State.ended {
            print("tap2finger View was tapped!")
        }
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

