//
//  ViewController.swift
//  DraggingImage
//
//  Created by CoderDream on 2019/7/15.
//  Copyright © 2019 CoderDream. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var draggedView: UIView!
    
    // BEGIN dragging_drag
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // BEGIN dragging_interaction
        // 启用视图的交互功能
        self.draggedView.isUserInteractionEnabled = true
        // END dragging_interaction
        
        // BEGIN dragging_setup
        // 设置被调用的方法
        let dragged = #selector(ViewController.dragged(dragGesture:))
        
        // 创建手势识别器并将它添加到视图中
        let drag = UIPanGestureRecognizer(target: self,
                                          action: dragged)
        self.draggedView.addGestureRecognizer(drag)
        // END dragging_setup
    }
    
    // BEGIN dragging_dragfunc
    @objc func dragged(dragGesture: UIPanGestureRecognizer) {
        
        // 拖拽开始，位置改变
        if dragGesture.state == .began ||
            dragGesture.state == .changed {
            // 获取视图当前在屏幕上的坐标
            var newPosition = dragGesture.translation(in: dragGesture.view!)
            // 计算视图应该移动到那个位置，即视图位置加上手指移动的距离
            newPosition.x += dragGesture.view!.center.x
            newPosition.y += dragGesture.view!.center.y
            // 将视图的位置设置为新位置
            dragGesture.view!.center = newPosition
            // 每次方法调用后，手动将 translation 重置为0，因为在手势识别器下次调用时，
            // 我们移动视图时都会从当前位置开始，而不是从拖拽一开始时候的位置开始。
            dragGesture.setTranslation(CGPoint.zero,
                                       in: dragGesture.view)
        }
        
    }
    // END dragging_dragfunc
    // END dragging_drag

}

