//
//  ViewController.swift
//  SpriteKitDemo
//
//  Created by CoderDream on 2019/7/18.
//  Copyright © 2019 CoderDream. All rights reserved.
//

import UIKit
import SpriteKit

class ViewController: UIViewController {
        
    override func loadView() {
        print("loadView")
        self.view = SKView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("viewDidLoad")
        if let spriteView = self.view as? SKView {
            print("SKView")
            spriteView.showsDrawCount = true
            spriteView.showsFPS = true
            spriteView.showsNodeCount = true
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let scene = TestScene()
        scene.size = self.view.bounds.size
        if let spriteView = self.view as? SKView {
            spriteView.presentScene(scene)
        }
    }

}

