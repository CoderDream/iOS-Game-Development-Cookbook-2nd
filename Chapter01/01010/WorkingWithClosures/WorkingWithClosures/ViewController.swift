//
//  ViewController.swift
//  WorkingWithClosures
//
//  Created by CoderDream on 2019/7/14.
//  Copyright © 2019 CoderDream. All rights reserved.
//

import UIKit

class GameObject {
    // define a type of closure that takes a single GameObject
    // as a parameter and returns nothing
    // 定义一个闭包，该闭包有一个 GameObject 参数，返回值为空
    var onCollision: ((GameObject) -> Void)?
}


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("viewDidLoad")
        
        // Create two objects for this example
        // 创建两个 GameObject 对象
        let car = GameObject()
        let brickWall = GameObject()
        // Provide code to run when the car hits any another object
        // 用一段代码来赋值给 car 对象的 onCollision 属性，以便 car 对象与其他对象碰撞时能够知晓该段代码
        car.onCollision = { (objectWeHit) in
            print("Car collided with \(objectWeHit)")
        }
        // later, when a character collides:
        // 最后，当碰撞发生时：
        // 注意 ? 的用法，这表明只有 onCollision 不为空时该语句才会被执行
        car.onCollision?(brickWall) // note the ? - this means that
        // the code will only run if onCollision is not nil
    }
}
