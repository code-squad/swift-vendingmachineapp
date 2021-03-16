//
//  AppDelegate.swift
//  VendingMachineApp
//
//  Created by Ador on 2021/02/23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        if let data = UserDefaults.standard.object(forKey: "vm") as? Data, let vm = ArchivingManager.unarchive(with: data) as? VendingMachine {
            VendingMachine.shared = vm
        }
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

}

