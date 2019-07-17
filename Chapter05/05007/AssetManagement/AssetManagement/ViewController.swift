//
//  ViewController.swift
//  AssetManagement
//
//  Created by CoderDream on 2019/7/16.
//  Copyright © 2019 CoderDream. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("viewDidLoad")
        // Get the list of all .png files in the bundles, or the empty array
        // 从资源包中读取所有 .png 文件的列表
        let urls = Bundle.main.urls(forResourcesWithExtension: "png", subdirectory: nil) ?? []
        // Load all these images
        // 装载整个文件列表
        AssetLoader.loadAssets(at: urls) { (url, data, error) -> Void in
            // This block is called once for each URL
            // 遍历每个 URL 并依次执行这个块
            if let data = data {
                print("Loaded resource \(url.lastPathComponent) (\(data.count) bytes)")
            } else if let error = error {
                print("Failed to load resource \(url.lastPathComponent): \(error)")
            } else {
                fatalError("Didn't get data or an error; this should not happen!")
            }
        }
    }
}
