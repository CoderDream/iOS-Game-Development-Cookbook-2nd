//
//  ViewController.swift
//  Grid
//
//  Created by CoderDream on 2019/7/14.
//  Copyright © 2019 CoderDream. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let grid = Grid()
        
        grid.addObject(object: "Hello" as NSObject, atPosition: GridPoint(x: 0, y: 0))
        
        _ = grid.objectsAtPosition(position: GridPoint(x: 0, y: 0))
        
        // Do any additional setup after loading the view, typically from a nib.
    }

}
