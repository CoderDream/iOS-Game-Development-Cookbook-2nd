//
//  ViewController.swift
//  RotationGesture
//
//  Created by CoderDream on 2019/7/15.
//  Copyright © 2019 CoderDream. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var rotationView: UIView!
    @IBOutlet weak var rotationStatusLabel: UILabel!
    
    // The current angle of the rotation, in radians
    // 旋转的角度，以弧度为单位
    var angle : Float = 0.0
    
    // Converts self.angle from radians to degrees, and wrap around at 360 degrees
    // 将self.anger 转变为度°，然后用360度来整除
    var angleDegrees : Float {
        get {
            return (self.angle * 180.0 / .pi).truncatingRemainder(dividingBy: 360)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 设置调用的方法
        let rotated = #selector(ViewController.rotated(rotationGesture:))
        
        // Set up the rotation gesture
        // 创建一个旋转手势识别器
        let rotationGesture = UIRotationGestureRecognizer(target: self,
                                                          action: rotated)
        // 设置视图可交互
        self.rotationView.isUserInteractionEnabled = true
        // 将手势识别器添加到视图中
        self.rotationView.addGestureRecognizer(rotationGesture)
        // 将角度值显示在标签上
        self.rotationStatusLabel?.text = "\(self.angleDegrees)°"
    }
    
    // When the rotation changes, update self.angle and use that to rotate the view
    // 当旋转角度变化，修改self.angle， 同时旋转视图
    @objc func rotated(rotationGesture : UIRotationGestureRecognizer) {
        // begin,changed,ended,cancelled
        switch rotationGesture.state {
        // 当用户旋转过程中所旋转的角度发送变化时手势识别器处于此状态
        case .changed:
            // 修改角度，rotation 这个值表示从上一次被清零后又旋转了多少角度，单位是弧度
            self.angle += Float(rotationGesture.rotation)
            // 清零（重置）rotation
            rotationGesture.rotation = 0.0
            // 旋转视图
            self.rotationView.transform = CGAffineTransform(rotationAngle: CGFloat(self.angle))
        default: () // do nothing 做某些操作
        }
        
        // Display the rotation
        // 将角度值显示在标签上
        self.rotationStatusLabel?.text = "\(self.angleDegrees)°"
    }
}
