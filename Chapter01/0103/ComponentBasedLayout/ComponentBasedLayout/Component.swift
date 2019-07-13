//
//  Component.swift
//  ComponentBasedLayout
//
//  Created by CoderDream on 2019/7/13.
//  Copyright © 2019 CoderDream. All rights reserved.
//

import UIKit

// BEGIN componentbased_component
class Component: NSObject {
    
    // The game object this component is attached to
    // 该组件属于哪个 GameObject 对象
    var gameObject: GameObject?
    
    func update(deltaTime : Float) {
        // Update this component 处理 Component 对象的刷新
        print("update.deltaTime: \(deltaTime)")
    }
    
}
// END componentbased_component
