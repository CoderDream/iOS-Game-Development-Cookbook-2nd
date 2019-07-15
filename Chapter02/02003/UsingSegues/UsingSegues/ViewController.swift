//
//  ViewController.swift
//  UsingSegues
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

    @IBAction func closePopup(_ segue: UIStoryboardSegue) {
        print("Second view controller was closed!")
    }
    
    @IBAction func showPopup(_ sender: AnyObject) {
        self.performSegue(withIdentifier: "showPopup", sender: self)
    }
    
}

