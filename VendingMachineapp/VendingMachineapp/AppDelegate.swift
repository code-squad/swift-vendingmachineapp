//
//  AppDelegate.swift
//  VendingMachineapp
//
//  Created by 심영민 on 2021/02/24.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var vendingMachine = VendingMachine()
    var productList: [Beverage] = []
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        productList = self.vendingMachine.initializeProductList()
        guard let vendingMachine = ArchivingManager.unarchive(with: UserDefaults.standard.data(forKey: "vendingMachine") ?? Data()) else {
            print("여기")
            return true
        }
        self.vendingMachine = vendingMachine
        productList = self.vendingMachine.initializeProductList()
        return true
    }
    
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        let data = ArchivingManager.archive(with: vendingMachine)
        print(data)
        UserDefaults.standard.set(data, forKey: "vendingMachine")
    }
}

