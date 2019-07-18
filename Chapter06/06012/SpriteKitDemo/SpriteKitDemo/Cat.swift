//
//  Cat.swift
//  SpriteKitDemo
//
//  Created by CoderDream on 2019/7/18.
//  Copyright © 2019 CoderDream. All rights reserved.
//

import UIKit
import SpriteKit

class Cat: SKSpriteNode{
    
    //神经猫的纹理集
    let dbAtlas = SKTextureAtlas(named: "Animation.atlas")
    //神经猫的纹理数组
    var dbFrames = [SKTexture]()
    
    init() {
        //获取纹理集的第一个纹理
        let texture = dbAtlas.textureNamed("frame-0001")
        //获取纹理的尺寸
        let size = texture.size()
        //执行父类的构造方法
        super.init(texture:texture, color:SKColor.white, size:size)
       
        var tempName: String
        //从纹理集中获取纹理加入数组
        for i in 1 ... dbAtlas.textureNames.count {
            //%.2d表示两位整数。下面格式化完毕后便是db_01，db_02，db_03等
            tempName = String(format:"frame-00%.2d", i)
            let dbTexture = dbAtlas.textureNamed(tempName)
            dbFrames.append( dbTexture )
        }
        //设置中心点
        self.anchorPoint = CGPoint(x: 0.5, y: 0.2)
        //播放动画
        db()
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func db(){
        //循环播放纹理动画
        self.run(SKAction.repeatForever(
            SKAction.animate(with: dbFrames, timePerFrame: 0.1)))
    }
}
