//
//  ViewController.swift
//  EnteringAndExiting
//
//  Created by CoderDream on 2019/7/14.
//  Copyright © 2019 CoderDream. All rights reserved.
// https://github.com/92pino/IOS_pino/blob/c770b3b89ffe80198a5729a028447ce7ac49e1f7/%EC%88%98%EC%97%85%EC%9E%90%EB%A3%8C/20190430/NotificationCenterExample%20-%20Starter/NotificationCenterExample/FirstViewController.swift
//

import UIKit

class ViewController: UIViewController {

//    override func viewDidLoad() {
//
//        super.viewDidLoad()
//        // Do any additional setup after loading the view, typically from a nib.
//        print("viewDidLoad")
//
//        let center = NotificationCenter.default
//
//        let didBecomeActive = #selector(
//           // UIApplicationDelegate.
//            applicationDidBecomeActive(_:)
//        )
//
//        let willEnterForeground = #selector(
//            //UIApplicationDelegate.
//            applicationWillEnterForeground(_:)
//        )
//
//        let willResignActive = #selector(
//            //UIApplicationDelegate.
//            applicationWillResignActive(_:)
//        )
//
//        let didEnterBackground = #selector(
//            //UIApplicationDelegate.
//            applicationDidEnterBackground(_:)
//        )
//
//        center.addObserver(self,
//                           selector: didBecomeActive,
//                           name: UIApplication.didBecomeActiveNotification,
//                           object: nil)
//
//        center.addObserver(self,
//                           selector: willEnterForeground,
//                           name: UIApplication.willEnterForegroundNotification,
//                           object: nil)
//
//        center.addObserver(self,
//                           selector: willResignActive,
//                           name: UIApplication.willResignActiveNotification,
//                           object: nil)
//
//        center.addObserver(self,
//                           selector: didEnterBackground,
//                           name: UIApplication.didEnterBackgroundNotification,
//                           object: nil)
//    }
//
//    @objc func applicationDidBecomeActive(_ notification : Notification) {
//        print("Application became active")
//    }
//
//    @objc func applicationDidEnterBackground(_ notification : Notification) {
//        print("Application entered background - unload textures!")
//    }
//
//    @objc func applicationWillEnterForeground(_ notification : Notification) {
//        print("Application will enter foreground - reload " +
//            "any textures that were unloaded")
//    }
//
//    @objc func applicationWillResignActive(_ notification : Notification) {
//        print("Application will resign active - pause the game now!")
//    }
//
//    deinit {
//        // Remove this object from the notification center
//        NotificationCenter.default.removeObserver(self)
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let center = NotificationCenter.default
        let didBecomeActive = #selector(
            ViewController.applicationDidBecomeActive(notification:)
        )
        let willEnterForeground = #selector(
            ViewController.applicationWillEnterForeground(notification:)
        )
        let willResignActive = #selector(
            ViewController.applicationWillResignActive(notification:)
        )
        let didEnterBackground = #selector(
            ViewController.applicationDidEnterBackground(notification:)
        )
        center.addObserver(self,
                           selector: didBecomeActive,
                           name: UIApplication.didBecomeActiveNotification,
                           object: nil)
        center.addObserver(self,
                           selector: willEnterForeground,
                           name: UIApplication.willEnterForegroundNotification,
                           object: nil)
        center.addObserver(self,
                           selector: willResignActive,
                           name: UIApplication.willResignActiveNotification,
                           object: nil)
        center.addObserver(self,
                           selector: didEnterBackground,
                           name: UIApplication.didEnterBackgroundNotification,
                           object: nil)
    }
    @objc func applicationDidBecomeActive(notification : Notification) {
        print("Application became active")
    }
    @objc func applicationDidEnterBackground(notification : Notification) {
        print("Application entered background - unload textures!")
    }
    @objc func applicationWillEnterForeground(notification : Notification) {
        print("Application will enter foreground - reload " +
            "any textures that were unloaded")
    }
    @objc func applicationWillResignActive(notification : Notification) {
        print("Application will resign active - pause the game now!")
    }
    deinit {
        // Remove this object from the notification center
        NotificationCenter.default.removeObserver(self)
    }
}
