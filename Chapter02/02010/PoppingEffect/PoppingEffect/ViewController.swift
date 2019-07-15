//
//  ViewController.swift
//  PoppingEffect
//
//  Created by CoderDream on 2019/7/15.
//  Copyright © 2019 CoderDream. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var poppingView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // BEGIN pop
        let keyframeAnimation = CAKeyframeAnimation(keyPath: "transform.scale")
        // 动画一开始时，缩放值为0（即缩小到不可见），然后放大到视图原有大小的1.2倍，再恢复到视图原有大小（1.0倍）
        keyframeAnimation.values = [0.0, 1.2, 1.0]
        // 与values值一一对应，表示该值在整个动画进度的百分之几时进行修改，其取值范围为0~1，0表示动画开始，1表示动画结束
        keyframeAnimation.keyTimes = [0.0, 0.7, 1.0]
        // 整个动画时长
        keyframeAnimation.duration = 0.4
        // 定时器函数设置为 ease out，使动画在快结束的时候速度自然变慢。
        keyframeAnimation.timingFunction =
            CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
        // key 用于唯一标识一个动画对象，以便此后可以通过key来访问它
        self.poppingView.layer.add(keyframeAnimation, forKey: "pop")
        // END pop        
    }


}

