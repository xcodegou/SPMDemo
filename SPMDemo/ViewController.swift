//
//  ViewController.swift
//  SPMDemo
//
//  Created by xcode on 2025/6/9.
//

import UIKit
import TCMPPSDK

class ViewController: UIViewController {
    
    private let backgroundImageView = UIImageView()
    private let enterFocusButton = UIButton(type: .system)
    private let scanButton = UIButton(type: .system)

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        loadMiniApp()
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        
        backgroundImageView.image = UIImage(named: "focus")
        backgroundImageView.contentMode = .scaleToFill
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(backgroundImageView)
        
        enterFocusButton.setTitle("Enter focus", for: .normal)
        enterFocusButton.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        enterFocusButton.backgroundColor = UIColor.systemBlue.withAlphaComponent(0.8)
        enterFocusButton.setTitleColor(.white, for: .normal)
        enterFocusButton.layer.cornerRadius = 8
        enterFocusButton.translatesAutoresizingMaskIntoConstraints = false
        enterFocusButton.addTarget(self, action: #selector(enterFocusButtonTapped), for: .touchUpInside)
        view.addSubview(enterFocusButton)
        
        scanButton.setTitle("scan", for: .normal)
        scanButton.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        scanButton.backgroundColor = UIColor.systemGreen.withAlphaComponent(0.8)
        scanButton.setTitleColor(.white, for: .normal)
        scanButton.layer.cornerRadius = 8
        scanButton.translatesAutoresizingMaskIntoConstraints = false
        scanButton.addTarget(self, action: #selector(scanButtonTapped), for: .touchUpInside)
        view.addSubview(scanButton)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            // 背景图片约束
            backgroundImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            // Enter Focus按钮约束
            enterFocusButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            enterFocusButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 76),
            enterFocusButton.widthAnchor.constraint(equalToConstant: 111),
            enterFocusButton.heightAnchor.constraint(equalToConstant: 35),
            
            // Scan按钮约束
            scanButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            scanButton.topAnchor.constraint(equalTo: enterFocusButton.bottomAnchor, constant: 20),
            scanButton.widthAnchor.constraint(equalToConstant: 60),
            scanButton.heightAnchor.constraint(equalToConstant: 35)
        ])
    }
    
    @objc private func enterFocusButtonTapped() {
        TMFMiniAppSDKManager.sharedInstance().startUpMiniApp(withAppID: "mpshrds4akifcjv0", parentVC: self) { error in
            if let error = error {
                print("启动小程序失败: \(error)")
            } else {
                print("启动小程序成功")
            }
        }
    }
    
    @objc private func scanButtonTapped() {
        TMFMiniAppSDKManager.sharedInstance().startUpMiniAppWithQRCode(withParentVC: self) { error in
            if let error = error {
                print("启动小程序失败: \(error)")
            } else {
                print("启动小程序成功")
            }
        }
    }
    
    private func loadMiniApp() {
        // 延迟加载小程序，模拟Focus项目的实现
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            let resourcePath = Bundle.main.resourcePath?.appending("/Resource") ?? ""
            TMFMiniAppSDKManager.sharedInstance().setOffLineApkgsPath(resourcePath)
            TMFMiniAppSDKManager.sharedInstance().startUpMiniApp(withAppID: "mpshrds4akifcjv0", parentVC: self) { error in
                if let error = error {
                    print("延迟启动小程序失败: \(error)")
                } else {
                    print("延迟启动小程序成功")
                }
            }
        }
    }
}

