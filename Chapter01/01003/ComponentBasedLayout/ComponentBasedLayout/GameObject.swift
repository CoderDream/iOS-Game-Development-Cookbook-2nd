//
//  GameObject.swift
//  ComponentBasedLayout
//
//  Created by CoderDream on 2019/7/13.
//  Copyright © 2019 CoderDream. All rights reserved.
//

import UIKit

// BEGIN componentbased_gameobject
class GameObject: NSObject {
    
    // The collection of Component objects attached to us
    // GameObject 对象所包含的 Component 集合
    var components: [Component] = []
    
    // Add a component to this gameobject
    // 向 GameObject 对象中添加 Component
    func add(component : Component) {
        components.append(component)
        component.gameObject = self
    }
    
    // Remove a component from this game object, if we have it
    // 从 GameObject 中删除一个 Component
    func remove(component : Component) {
        // Figure out the index at which this component exists
        // Note the use of the === (three equals) operator,
        // which checks to see if two variables refer to the same object
        // (as opposed to "==", which checks to see if two variables
        // have the same value, which means different things for
        // different types of data)
        if let index = components.index(where: { $0 === component}) {
            component.gameObject = nil
            components.remove(at: index)
        }
    }
    
    // Update this object by updating all components
    // 更新 对象所包含的 Component 集合
    func update(deltaTime : Float) {
        for component in self.components {
            component.update(deltaTime: deltaTime)
        }
    }
    
    // Returns the first component of type T attached to this game object
    // 返回第一个 Component 对象，类型为泛型 T
    func findComponent<T: Component>() -> T?{
        for component in self.components {
            if let theComponent = component as? T {
                return theComponent
            }
        }
        return nil;
    }
    
    // Returns an array of all components of type T
    // (this returned array might be empty)
    // 返回所有的 Component 对象
    func findComponents<T: Component>() -> [T] {
        var foundComponents: [T] = []
        for component in self.components {
            if let theComponent = component as? T {
                foundComponents.append(theComponent)
            }
        }
        return foundComponents
    }
}
// END componentbased_gameobject
