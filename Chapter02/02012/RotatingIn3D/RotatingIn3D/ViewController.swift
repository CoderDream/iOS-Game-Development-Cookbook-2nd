//
//  ViewController.swift
//  RotatingIn3D
//
//  Created by CoderDream on 2019/7/15.
//  Copyright © 2019 CoderDream. All rights reserved.
//

import UIKit
import QuartzCore

class ViewController: UIViewController {

    @IBOutlet weak var rotatingView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // BEGIN 3drotation_animation
        // BEGIN 3drotation_animation_create
        // 指定视图在Y轴方向上旋转
        let animation = CABasicAnimation(keyPath: "transform.rotation.y")
        // END 3drotation_animation_create
        
        // BEGIN 3drotation_animation_from_to
        // 动画从0角度开始旋转，然后旋转一个完整的圆周
        animation.fromValue = 0.0
        animation.toValue = .pi * 2.0
        // END 3drotation_animation_from_to
        
        // BEGIN 3drotation_animation_repeat
        // 设置动画的重复次数为无限循环，以及旋转一周所需要的时间
        animation.repeatCount = Float.infinity
        animation.duration = 2.0
        // END 3drotation_animation_repeat
        
        // BEGIN 3drotation_animation_add
        // 将动画对象放到视图的CALayer中
        self.rotatingView.layer.add(animation, forKey: "spin")
        // END 3drotation_animation_add
        
        // BEGIN 3drotation_animation_transform
        // 指定3D变换的m34属性，这个属性决定视角的尖锐度（当视图朝镜头运动或背离镜头运动时，
        // 物体沿Z轴向的消失点缩小或者从消失点向前放大的程度）
        var transform = CATransform3DIdentity
        transform.m34 = 1.0 / 500.0
        self.rotatingView.layer.transform = transform
        // END 3drotation_animation_transform
        // END 3drotation_animation
//
//        // BEGIN 3drotation_animation_stop
//        self.rotatingView.layer.removeAnimation(forKey: "spin")
//        // END 3drotation_animation_stop
    }

}

