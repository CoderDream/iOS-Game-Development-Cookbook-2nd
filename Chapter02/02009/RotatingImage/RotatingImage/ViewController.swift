//
//  ViewController.swift
//  RotatingImage
//
//  Created by CoderDream on 2019/7/15.
//  Copyright © 2019 CoderDream. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var transformedView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // BEGIN rotate
        
        self.transformedView.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi / 2))
        // END rotate
        
        // BEGIN transform
        var transform = CGAffineTransform.identity // <1> 从默认的变换 identity transform 开始
        transform = transform.translatedBy(x: 50, y: 0) // <2> 向右平移 50 像素
        transform = transform.rotated(by: CGFloat(Double.pi / 2)) // <3> 顺时针旋转 90 度
        transform = transform.scaledBy(x: 0.5, y: 2) // <4> x 轴缩放 50%， y 轴缩放 200%
        
        self.transformedView.transform = transform // <5> 应用变换
        // END transform
    }
}
