//
//  AssetLoader.swift
//  AssetManagement
//
//  Created by CoderDream on 2019/7/16.
//  Copyright © 2019 CoderDream. All rights reserved.
//

import UIKit

class AssetLoader: NSObject {
    // For convenience, define a loading result as a tuple
    // containing the URL of the resource that was loaded,
    // and either the loaded data or an error
    // 为了方便，我们定义一个元祖，用于代表已加载的资源。
    // 元祖中包含已加载的资源的URL、数据和一个NSError对象。
    typealias LoadingResult = (url: URL, data: Data?, error: Error?)
    // Also define a loading result handler as a method that receives
    // a URL, and either a data or an error
    typealias LoadingResultHandler = (URL, Data?, Error?) -> Void
    class func loadAssets(at urls: [URL],
                          withEnumerationBlock loadingComplete: @escaping LoadingResultHandler) {
        // Create a queue
        // 创建线程队列
        let loadingQueue = OperationQueue()
        // Create an array of results
        // 创建一个数组对象，用于表示加载的结果
        var loadingResults : [LoadingResult] = []
        // The loading complete operation runs the loadingComplete block
        // when all loads are finished
        // 定义一个 loadingCompleteOperation 线程，当所有资源加载完，
        // 依次用每个装载结果来调用 loadingComplete 块
        let loadingCompleteOperation = BlockOperation { () -> Void in
            OperationQueue.main.addOperation { () -> Void in
                // Call the loadingComplete block for each result
                // 针对结果集中的每个结果，循环调用 loadingComplete 块
                for result in loadingResults {
                    loadingComplete(result.url, result.data, result.error)
                }
            }
        }
        // Start loading the data at each URL
        // 循环加载 URL
        for url in urls {
            // Create an operation that will load the data in the background
            // 创建一个线程，从后台装载数据
            let loadOperation = BlockOperation { () -> Void in
                // Attempt to load the data
                // 尝试加载数据
                let result: LoadingResult
                do {
                    let data = try Data(contentsOf: url, options: [])
                    // If we got it, result contains the data
                    // 如果加载成功，将数据放到 result 中
                    result = (url: url, data: data, error:nil)
                } catch let error {
                    // 否则将错误放到 result 中返回
                    result = (url: url, data: nil, error:error)
                }
                // On the main queue (to prevent conflicts), add this operation's result to the list
                // 通过主线程（防止冲突）将加载线程的结果添加到数组中
                OperationQueue.main.addOperation { () -> Void in
                    loadingResults.append(result)
                }
            }
            // Add a dependency to the loading complete operation,
            // so that it won't run until this load (and all others) have completed
            // 为加载完成线程添加一个依赖线程（加载线程）。
            // 这样，只有这个加载线程（以及其他加载线程）完成，才会执行加载完成线程
            loadingCompleteOperation.addDependency(loadOperation)
            // Add this load operation to the queue
            // 将加载线程加入到执行队列
            loadingQueue.addOperation(loadOperation)
        }
        // Add the loading complete operation to the queue.
        // Because it has dependencies on the load operations,
        // it won't run until all files have been loaded
        // 将加载完成线程也添加到执行队列
        // 由于我们指定加载完成线程依赖于加载线程，所以需要等所有文件都加载完，加载完成线程才会执行
        loadingQueue.addOperation(loadingCompleteOperation)
    }
}
