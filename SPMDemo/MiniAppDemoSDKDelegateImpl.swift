//
//  MiniAppDemoSDKDelegateImpl.swift
//  SPMDemo
//
//  Created by xcode on 2025/6/9.
//

import Foundation
import TCMPPSDK
import ZipArchive

class MiniAppDemoSDKDelegateImpl: NSObject, TMFMiniAppSDKDelegate {
    
    static let shared = MiniAppDemoSDKDelegateImpl()
    
    private override init() {
        super.init()
    }
    
    func log(_ level: MALogLevel, msg: String) {
        let strLevel: String
        switch level {
        case .error:
            strLevel = "Error"
        case .warn:
            strLevel = "Warn"
        case .info:
            strLevel = "Info"
        case .debug:
            strLevel = "Debug"
        @unknown default:
            strLevel = "Undef"
        }
        print("TMFMiniApp \(strLevel)|\(msg)")
    }
    
//    func unzipFile(fromPath sourcePath: String, toDstPath dstPath: String) throws {
//        var error: NSError?
//        let success = SSZipArchive.unzipFile(atPath: sourcePath, toDestination: dstPath, preserveAttributes:true, overwrite: true, password: nil, error: &error,delegate: nil)
//        if !success {
//            throw error ?? NSError(domain: "UnzipError", code: -1, userInfo: [NSLocalizedDescriptionKey: "Unknown unzip error"])
//        }
//    }
    
    
}
