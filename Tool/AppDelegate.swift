//
//  AppDelegate.swift
//  Tool
//
//  Created by zhengsw on 2025/8/29.
//

import UIKit
import Flutter

@main


class AppDelegate: UIResponder, UIApplicationDelegate {

    // 手动添加 FlutterEngineGroup
    lazy var engineGroup: FlutterEngineGroup = {
        return FlutterEngineGroup(name: "multiple-flutters", project: nil)
    }()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        // Override point for customization after application launch.
        // 创建默认引擎（用于主页面）
//        let defaultEngine = engineGroup.makeEngine(withEntrypoint: nil, libraryURI: nil)
        
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

