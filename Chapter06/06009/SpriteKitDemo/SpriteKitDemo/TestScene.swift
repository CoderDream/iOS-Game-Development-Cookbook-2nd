//
//  TestScene.swift
//  SpriteKitDemo
//
//  Created by CoderDream on 2019/7/18.
//  Copyright © 2019 CoderDream. All rights reserved.
//

import UIKit
import SpriteKit

class TestScene: SKScene {
    var contentCreated = false
    
    override func didMove(to view: SKView) {
        if self.contentCreated == false {
            self.createSceneContents()
            self.contentCreated = true
        }
    }
    
    func createSceneContents() {
        self.backgroundColor = SKColor.black
        // fill: Scene 将始终填充整个 SKView
        // aspectFill: 以缩放的方式填充，并保持 Scene 原始的纵横比。这样会导致 Scene 的某些部分被截去。
        // aspectFit: 以缩放的方式填充，并始终保持在 SKView 内部，这样会导致一些空边出现，例如在上下边距出现一些空白区域。
        // resizeFill: Scene 会被重新设置大小（注意不是缩放），以填充 SKView
        self.scaleMode = SKSceneScaleMode.aspectFit
        
        let myScene = self
        
        // BEGIN adding_sprite
        // BEGIN create_sprite 绿色方块，大小（64,64)
        let sprite = SKSpriteNode(color: UIColor.green,
                                  size: CGSize(width: 64, height: 64))
        // END create_sprite
        
        // BEGIN sprite_position 位置（100，100），左下角为原点
        sprite.position = CGPoint(x: 100, y: 100)
        // END sprite_position
        
        // BEGIN sprite_add_child 添加到场景中
        myScene.addChild(sprite)
        // END sprite_add_child
        // END adding_sprite
        
        // BEGIN textnode
        // BEGIN textnode_create
        let textNode = SKLabelNode(fontNamed: "Zapfino")
        // END textnode_create
        // BEGIN textnode_properties
        textNode.text = "Hello, world!"
        textNode.fontSize = 42
        textNode.position = CGPoint(x: myScene.frame.midX, y: myScene.frame.midY)
        textNode.verticalAlignmentMode = .baseline
        textNode.horizontalAlignmentMode = .center
        // END textnode_properties
        
        textNode.name = "helloNode"
        
        myScene.addChild(textNode)
        // END textnode
        
        // BEGIN list_fonts
//        for fontFamilyName in UIFont.familyNames {
//            for fontName in UIFont.fontNames(forFamilyName: fontFamilyName) {
//                print("Available font: \(fontName)")
//            }
//        }
        // END list_fonts
        
        // In this example, 'node' is any SKNode
        // Move 100 points up and 100 points to the right over 1 second
        // 这个动作向上移动100像素，向右移动100像素，用时 3 秒
        let moveUp = SKAction.move(by: CGVector(dx: 100, dy: 100), duration: 3.0)
        // Fade out over 0.5 seconds
        // 这个动作是淡出 0.5 秒
        let fadeOut = SKAction.fadeOut(withDuration: 5.5)
        // Run a block of code
        // 这个动作是淡出 0.5 秒
        let runBlock = SKAction.run {
            print("Hello!")
        }
        // Remove the node
        // 删除节点
        let remove = SKAction.removeFromParent()
        // Run the movement and fading blocks at the same time
        // 同步执行动作（组）：移动、淡出和代码块
        let moveAndFade = SKAction.group([moveUp, fadeOut])
        // Move and fade, then run the block, then remove the node
        // 按顺序执行动作（序列）：先移动并淡出，然后执行代码块，最后删除节点
        let sequence = SKAction.sequence([moveAndFade, runBlock, remove])
        // Run these actions on the node
        // 运行前面定义的所有 Action
        sprite.run(sequence)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // Transition to a new scene on touch
        let newScene = OtherScene()
        newScene.size = self.size
        
        /* Without transition
         // BEGIN show_no_transition
         // newScene is an SKScene object that you want to switch to
         self.view?.presentScene(newScene)
         // END show_no_transition
         */
        
        /* With transition */
        // BEGIN show_transition
        // BEGIN crossfade
        // 转场特效
        let crossFade = SKTransition.crossFade(withDuration: 0.5)
        // END crossfade
        // newScene 是要切换到的 SKScene 对象
        self.view?.presentScene(newScene, transition: crossFade)
        // END show_transition
    }
}

class OtherScene : SKScene {
    
    var contentCreated = false
    
    override func didMove(to view: SKView) {
        self.backgroundColor = SKColor.red
        self.scaleMode = SKSceneScaleMode.aspectFit
    }
}
