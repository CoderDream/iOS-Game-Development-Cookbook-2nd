//
//  ViewController.swift
//  MovingWithCoreAnimation
//
//  Created by CoderDream on 2019/7/15.
//  Copyright © 2019 CoderDream. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var ball: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // BEGIN core_animation
        UIView.animate(withDuration: 10.0, animations: { () -> Void in
            self.ball.center = CGPoint(x: 0, y: 0)
            self.ball.alpha = 0.5
        })
        // END core_animation
        
        // Try adding this code into the animation block above:
        /* */
         // BEGIN core_animation_alpha
        //self.ball.alpha = 0.0
         // END core_animation_alpha
 
    }


}

