//
//  ViewController.swift
//  UserDefaults
//
//  Created by CoderDream on 2019/7/17.
//  Copyright © 2019 CoderDream. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // BEGIN getting_defaults
        let defaults = UserDefaults.standard
        // END getting_defaults
        
        
        // BEGIN using_defaults
        defaults.setValue("A string", forKey: "mySetting")
        
        let string = defaults.value(forKey: "mySetting") as? String
        print("string: \(String(describing: string))")
        // END using_defaults
        
        // BEGIN sync
        defaults.synchronize()
        // END sync
        
        if true {
            // BEGIN value_doesnt_exist
            let levelNumber = defaults.integer(forKey: "currentLevel")
            print("levelNumber1: \(String(describing: levelNumber))")
            // END value_doesnt_exist
        }
        
        // BEGIN register_defaults
        let defaultValues = ["currentLevel": 1]
        defaults.register(defaults: defaultValues)
        
        let levelNumber = defaults.integer(forKey: "currentLevel")
        print("levelNumber2: \(String(describing: levelNumber))")
        // levelNumber will be either 1, or whatever was last stored in NSUserDefaults.
        // END register_defaults
    }

    // 显示等级
    @IBOutlet weak var level: UILabel!
    
    // 升级
    @IBAction func levelUp(_ sender: Any) {
        let defaults = UserDefaults.standard
        // 先获取当前等级
        var levelNumber = defaults.integer(forKey: "currentLevel")
        levelNumber += 1
        // 设置新的等级
        let defaultValues = ["currentLevel": levelNumber]
        defaults.register(defaults: defaultValues)
        // 同步defaults
        defaults.synchronize()
    }
    
    @IBAction func getValue(_ sender: Any) {
        let defaults = UserDefaults.standard
        let levelNumber = defaults.integer(forKey: "currentLevel")
        level.text = "CurrentLevel：" + String(levelNumber)
    }
}

