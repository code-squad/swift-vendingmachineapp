//
//  AppDelegate.swift
//  VendingMachineApp
//
//  Created by 조중윤 on 2021/02/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var machine: Machine?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        if let decodedData = MachineDataManager.loadData() {
            machine = decodedData
        } else {
            machine = Machine()
        }
        return true
    }

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
    }

    func applicationWillTerminate(_ application: UIApplication) {
        MachineDataManager.saveData(self.machine!)
    }
}

