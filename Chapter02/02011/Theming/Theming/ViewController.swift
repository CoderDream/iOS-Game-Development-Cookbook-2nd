//
//  ViewController.swift
//  Theming
//
//  Created by CoderDream on 2019/7/15.
//  Copyright © 2019 CoderDream. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var progressView: UIProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // BEGIN theming_button
        self.button.tintColor = UIColor.red
        
        let image = UIImage(named: "Ball")
        self.button.setBackgroundImage(image,
                                       for: UIControl.State.normal)
        // END theming_button
        
        // BEGIN theming_all_progressviews
        UIProgressView.appearance().progressTintColor = UIColor.purple
        // END theming_all_progressviews
        
        // BEGIN theming_progressview
        self.progressView.progressTintColor = UIColor.orange
        // END theming_progressview
        
        // BEGIN theming_navbar
        UINavigationBar.appearance()
            .setBackgroundImage(image,
                                for: UIBarMetrics.default)
        // END theming_navbar
    }
}
