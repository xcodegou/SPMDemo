//
//  AppDelegate.swift
//  SPMDemo
//
//  Created by xcode on 2025/6/9.
//

import UIKit
import TCMPPSDK

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        // 先检测平台
        print("当前平台检测:")
        print("iOS: \(PlatformHelper.shared.isIOS)")
        print("模拟器: \(PlatformHelper.shared.isSimulator)")
        
        // 检查编译宏
        let macros = PlatformHelper.shared.checkCompileMacros()
        print("编译宏检测:")
        for (key, value) in macros {
            print("  \(key): \(value)")
        }
        
        // 检查MQQNetworkInfo是否可用
        print("MQQNetworkInfo可用: \(PlatformHelper.shared.isMQQNetworkInfoAvailable())")
        
        prepareApplet()
        return true
    }
    
    private func prepareApplet() {
        // 配置SDK
        if let filePath = Bundle.main.path(forResource: "tcmpp-ios-configurations", ofType: "json") {
            let config = TMAServerConfig(file: filePath)
            TMFMiniAppSDKManager.sharedInstance().setConfiguration(config)
        }
        
        // 设置代理
        TMFMiniAppSDKManager.sharedInstance().miniAppSdkDelegate = MiniAppDemoSDKDelegateImpl.shared
        
        // 设置离线包路径
        let resourcePath = Bundle.main.resourcePath?.appending("/Resource/apkgs") ?? ""
        TMFMiniAppSDKManager.sharedInstance().setOffLineApkgsPath(resourcePath)
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
        // Use this method to release any resources that were specific to the discarded scenes, they will not return.
    }
}

