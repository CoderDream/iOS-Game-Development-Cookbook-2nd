//
//  ViewController.swift
//  OperationQueues
//
//  Created by CoderDream on 2019/7/14.
//  Copyright © 2019 CoderDream. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // BEGIN operationqueue_operations
        // Create a work queue to put tasks on
        // 创建一个任务队列，用于调度多个任务
        let concurrentQueue = OperationQueue()
        
        // This queue can run 10 operations at the same time, at most
        // 设置该队列可同时执行的任务数为 10
        concurrentQueue.maxConcurrentOperationCount = 10
        
        // Add some tasks
        // 把任务块加入队列
        concurrentQueue.addOperation {
            self.uploadHighScores()
        }
        
        concurrentQueue.addOperation {
            self.saveGame()
        }
        
        concurrentQueue.addOperation {
            self.downloadMaps()
        }
        // END operationqueue_operations
        // BEGIN operationqueue_mainqueue
        // 主队列
        let mainQueue = OperationQueue.main
        
        mainQueue.addOperation { () -> Void in
            self.processPlayerInput()
        }
        
        // END operationqueue_mainqueue
        // BEGIN operationqueue_queue_interaction
        // 后台队列
        let backgroundQueue = OperationQueue()
        
        backgroundQueue.addOperation { () -> Void in
            // Do work in the background
            OperationQueue.main.addOperation {
                // Once that's done, do work on the main queue
            }
        }
        // END operationqueue_queue_interaction
        
        // BEGIN run_after_delay
        // Place a bomb, but make it explode in 10 seconds
        // 放一个炸弹，让它在 10 秒钟后爆炸
        placeBomb()
        
        let deadline = DispatchTime.now() + 10
        // 1.13 延迟执行
        DispatchQueue.main.asyncAfter(deadline: deadline, execute: {
            // Time's up. Kaboom.
            // 时间到，嘣
            self.explodeBomb()
        })
        
        // END run_after_delay
        // BEGIN operation_dependencies
        let firstOperation = BlockOperation { () -> Void in
            print("First operation")
        }
        
        let secondOperation = BlockOperation { () -> Void in
            print("Second operation")
        }
        
        let thirdOperation = BlockOperation { () -> Void in
            print("Third operation")
        }
        
        // secondOperation will not run until firstOperation and
        // thirdOperation have finished
        // 1.14 串行执行
        // secondOperation 必须等 firstOperation 和 thirdOperation 完成之后才执行
        secondOperation.addDependency(firstOperation)
        secondOperation.addDependency(thirdOperation)
        
        let operations = [firstOperation, secondOperation, thirdOperation]
        
        backgroundQueue.addOperations(operations, waitUntilFinished: true)        
        // END operation_dependencies
        
        // BEGIN loading_assets
        let imagesToLoad = ["Image1.jpg", "Image2.jpg", "Image3.jpg"]
        
        let imageLoadingQueue = OperationQueue()
        
        // We want the main queue to run at close to regular speed, so mark this
        // background queue as running in the background
        // (Note: this is actually the default value, but it's good to know about
        // the qualityOfService property.)
        imageLoadingQueue.qualityOfService = QualityOfService.background
        
        // Allow loading multiple images at once
        imageLoadingQueue.maxConcurrentOperationCount = 10
        
        // Create an operation that will run when all images are loaded - you may want
        // to tweak this
        let loadingComplete = BlockOperation { () -> Void in
            print("Loading complete!")
        }
        
        // Create an array for storing our loading operations
        var loadingOperations : [Operation] = []
        
        // Add a load operation for each image
        for imageName in imagesToLoad {
            let loadOperation = BlockOperation { () -> Void in
                print("Loading \(imageName)")
            }
            
            loadingOperations.append(loadOperation)
            
            // Don't run the loading complete operation until
            // this load (and all other loads) are done
            loadingComplete.addDependency(loadOperation)
        }
        
        imageLoadingQueue.addOperations(loadingOperations, waitUntilFinished: false)
        imageLoadingQueue.addOperation(loadingComplete)
    }

    func uploadHighScores() {
        print("Uploading high scores!")
    }
    
    func saveGame() {
        print("Saving game!")
    }
    
    func downloadMaps() {
        print("Downloading maps!")
    }
    
    func processPlayerInput() {
        print("Processing player input!")
    }

    func placeBomb() {
        print("Bomb placed!")
    }
    
    func explodeBomb() {
        print("Boom!")
    }

}

//console:
//Uploading high scores!
//Bomb placed!
//Downloading maps!
//Saving game!
//First operation
//Third operation
//Second operation
//Processing player input!
//Loading Image3.jpg
//Loading Image1.jpg
//Loading Image2.jpg
//Loading complete!
//Boom!
