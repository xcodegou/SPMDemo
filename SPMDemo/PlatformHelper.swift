//
//  PlatformHelper.swift
//  SPMDemo
//
//  Created by xcode on 2025/6/9.
//

import Foundation
import SystemConfiguration

class PlatformHelper {
    
    static let shared = PlatformHelper()
    
    private init() {}
    
    var isIOS: Bool {
        #if os(iOS)
        return true
        #else
        return false
        #endif
    }
    
    var isSimulator: Bool {
        #if targetEnvironment(simulator)
        return true
        #else
        return false
        #endif
    }
    
    func isMQQNetworkInfoAvailable() -> Bool {
        return NSClassFromString("MQQNetworkInfo") != nil
    }
    
    // 检查编译宏是否正确设置
    func checkCompileMacros() -> [String: Bool] {
        var macros: [String: Bool] = [:]
        
        #if TARGET_OS_IOS
        macros["TARGET_OS_IOS"] = true
        #else
        macros["TARGET_OS_IOS"] = false
        #endif
        
        #if TARGET_OS_IPHONE
        macros["TARGET_OS_IPHONE"] = true
        #else
        macros["TARGET_OS_IPHONE"] = false
        #endif
        
        #if TARGET_IPHONE_SIMULATOR
        macros["TARGET_IPHONE_SIMULATOR"] = true
        #else
        macros["TARGET_IPHONE_SIMULATOR"] = false
        #endif
        
        return macros
    }
} 
