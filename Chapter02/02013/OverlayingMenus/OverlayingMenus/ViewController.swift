//
//  ViewController.swift
//  OverlayingMenus
//
//  Created by CoderDream on 2019/7/15.
//  Copyright © 2019 CoderDream. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func showPauseMenu(sender: AnyObject) {
        
        // BEGIN load_nib
        // Load the nib
        // 从文件中加载一个nib
        let nib = UINib(nibName: "PauseMenu", bundle: nil)
        
        // Instantiate a copy of the objects stored in the nib
        // 实例化这个nib中所包含的对象
        let loadedObjects = nib.instantiate(withOwner: self,
                                            options: nil)
        // END load_nib
        // BEGIN add_view
        // Try to get the first object, as a UIView
        /// 获取数组中的第一个对象，并转换为UIView
        if let pauseMenuView = loadedObjects[0] as? UIView {
            // Add it to the screen and center it
            // 放到屏幕中央
            self.view.addSubview(pauseMenuView)
            pauseMenuView.center = self.view.center
        }
        // END add_view
    }
}
