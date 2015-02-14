//
//  AppDelegate.swift
//  SwiftQiuShiBaiKe
//
//  Created by 邢现庆 on 15-2-11.
//  Copyright (c) 2015年 邢现庆. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    //当程序载入后执行
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
        
        self.window?.backgroundColor = UIColor.clearColor()

        var vc = MainTabBarController()
        
        
        self.window!.rootViewController = vc

        self.window!.makeKeyAndVisible()
        
        return true
    }
    //当应用程序将要进入非活动状态执行，在此期间，应用程序不接受消息或事件，比如来电
    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }
    //应用程序已经进入后台运行
    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }
    //应用程序将要进入活动状态执行
    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }
    //应用程序已经进入活动状态
    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }
    
    
    //应用程序将要退出，通常用于保存书架喝一些推出前的清理工作，
    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

