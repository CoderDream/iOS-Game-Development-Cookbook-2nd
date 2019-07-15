//
//  ViewController.swift
//  UsingDynamics
//
//  Created by CoderDream on 2019/7/15.
//  Copyright © 2019 CoderDream. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var animatedView: UIView!
    
    // BEGIN animator_storage
    var animator : UIDynamicAnimator?
    // END animator_storage

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // BEGIN animator_create
        self.animator = UIDynamicAnimator(referenceView: self.view)
        // END animator_create
        // BEGIN gravity
        let gravity = UIGravityBehavior(items: [self.animatedView])
        // 为视图添加重力，视图从屏幕往下运动（直到完全掉出屏幕）
        self.animator?.addBehavior(gravity)
        // END gravity
        
        // BEGIN collision
        let collision = UICollisionBehavior(items: [self.animatedView])
        // 设置为有边界
        collision.translatesReferenceBoundsIntoBoundary = true
        // 添加碰撞，视图落到屏幕底部并停住
        self.animator?.addBehavior(collision)
        // END collision

        // BEGIN collision_inset_bounds
        // 设定碰撞边界
        collision.setTranslatesReferenceBoundsIntoBoundary(
            with: UIEdgeInsets(top: 30, left: 30, bottom: 30, right: 30))
        // END collision_inset_bounds

        // BEGIN attachment
        // 添加附着物
        // Anchor = top of the screen, centered
        // 锚点位于屏幕上端的中央
        let anchor = CGPoint(x: self.view.bounds.width / 2, y: 0)

        let attachment = UIAttachmentBehavior(item: self.animatedView,
                                              attachedToAnchor: anchor)
        // 视图将向下摆动并撞击到边界（屏幕的边沿）
        self.animator?.addBehavior(attachment)
        // END attachment
    }


}

