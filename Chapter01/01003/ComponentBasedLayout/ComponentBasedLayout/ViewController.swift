//
//  ViewController.swift
//  ComponentBasedLayout
//
//  Created by CoderDream on 2019/7/13.
//  Copyright © 2019 CoderDream. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // Make an object - no need to subclass GameObject,
        // because its behavior is determined by which components it has
        // 直接实例化一个由 GameObject 对象，而不是从 GameObject 继承。
        // 因为对象的行为将由它所具有的组件来决定
        let monster = GameObject()
        // Add a new Damageable component
        // 为游戏对象增加一个 DamageTaking 组件
        monster.add(component: DamageTaking())
        // Get a reference to the first Damageable component
        // 获得第一个 DamageTaking 组件的引用
        let damage: DamageTaking? = monster.findComponent()
        // 设置伤害数减 5
        damage?.takeDamage(amount: 5)
        print("\(String(describing: damage?.hitpoints))")
        // When the game needs to update, send all game objects the "update" message.
        // This makes all components run their
        // 当游戏需要刷新时，调用所有游戏对象的 update 方法。
        // 这将触发所有组件的更新逻辑
        monster.update(deltaTime: 0.33)
    }

}

// Define a type of component
// 定义组件类
class DamageTaking: Component {
    var hitpoints: Int = 10
    // 伤害
    func takeDamage(amount : Int) {
        hitpoints -= amount
    }
}

