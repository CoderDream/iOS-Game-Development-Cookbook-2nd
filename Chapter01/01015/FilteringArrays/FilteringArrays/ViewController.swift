//
//  ViewController.swift
//  FilteringArrays
//
//  Created by CoderDream on 2019/7/14.
//  Copyright © 2019 CoderDream. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let array = ["One", "Two", "Three", "Four", "Five"]
        print("Original array: \(array)")
        let filteredArray = array.filter { (element) -> Bool in
            if element.range(of: "e") != nil {
                return true
            } else {
                return false
            }
        }
        print("Filtered array: \(filteredArray)")
    }
}
