//
//  ViewController.swift
//  LoadingAssets
//
//  Created by CoderDream on 2019/7/14.
//  Copyright © 2019 CoderDream. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let imagesToLoad = ["Image1.jpg", "Image2.jpg", "Image3.jpg"]
        
        let imageLoadingQueue = OperationQueue()
        
        // We want the main queue to run at close to regular speed, so mark this
        // background queue as running in the background
        // (Note: this is actually the default value, but it's good to know about
        // the qualityOfService property.)
        imageLoadingQueue.qualityOfService = QualityOfService.background
        
        // Allow loading multiple images at once
        // 一次加载多张图片
        imageLoadingQueue.maxConcurrentOperationCount = 10
        
        // Create an operation that will run when all images are loaded - you may want to tweak this
        // 创建一个任务，用于在所有图片加载完成后执行，你可以根据需要进行修改
        let loadingComplete = BlockOperation { () -> Void in
            print("Loading complete!")
        }
        
        // Create an array for storing our loading operations
        // 创建一个数组，用于保存所有任务
        var loadingOperations : [Operation] = []
        
        // Add a load operation for each image
        // 为每张图片的加载添加一个加载任务
        for imageName in imagesToLoad {
            let loadOperation = BlockOperation { () -> Void in
                print("Loading \(imageName)")
            }
            
            loadingOperations.append(loadOperation)
            
            // Don't run the loading complete operation until this load (and all other loads) are done
            // 除非所有图片加载完成，否则不会执行这个任务
            loadingComplete.addDependency(loadOperation)
        }
        
        imageLoadingQueue.addOperations(loadingOperations, waitUntilFinished: false)
        imageLoadingQueue.addOperation(loadingComplete)
    }


}

