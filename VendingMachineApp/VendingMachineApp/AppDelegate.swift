//
//  AppDelegate.swift
//  VendingMachineApp
//
//  Created by zombietux on 2021/02/26.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var vendingMachine: VendingMachine!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
}

