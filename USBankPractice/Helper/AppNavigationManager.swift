//
//  AppFlowManager.swift
//  USBankPractice
//
//  Created by Pramod Kumar on 25/11/19.
//  Copyright © 2019 Pramod Kumar. All rights reserved.
//

import CoreData
import Foundation
import UIKit

class AppNavigationManager: NSObject {
    static let `default` = AppNavigationManager()

    private override init() {
        super.init()
    }
    
    var safeAreaInsets: UIEdgeInsets {
        return AppNavigationManager.default.mainNavigationController.view.safeAreaInsets
    }
    
    var mainNavigationController: MainNavigationController!
    
    private var window: UIWindow {
        if let window = AppDelegate.shared.window {
            return window
        }
        else {
            AppDelegate.shared.window = UIWindow()
            return AppDelegate.shared.window!
        }
    }
    
    private func setupForLoginScreen() {
        let loginVC = LoginViewController.instantiate(fromAppStoryboard: .Main)
        let nvc = MainNavigationController(rootViewController: loginVC)
        
        self.mainNavigationController = nvc
        self.window.rootViewController = nvc
        self.window.becomeKey()
        self.window.backgroundColor = .white
        self.window.makeKeyAndVisible()
    }
    
    private func setupForHome() {
        let homeVC = HomeViewController.instantiate(fromAppStoryboard: .Main)
        let nvc = MainNavigationController(rootViewController: homeVC)
        
        self.mainNavigationController = nvc
        self.window.rootViewController = nvc
        self.window.becomeKey()
        self.window.backgroundColor = .white
        self.window.makeKeyAndVisible()
    }

    func setupInitialFlow() {
        if let isDone = AppUserDefaults.value(forKey: .isSignin) as? Bool, isDone {
            self.setupForHome()
        }
        else {
            self.setupForLoginScreen()
        }
    }
}

// MARK: - Public Navigation func
extension AppNavigationManager {
    
}
