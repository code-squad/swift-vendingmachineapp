//
//  AppDelegate.swift
//  VendingMachineApp
//
//  Created by TaeHyeonLee on 2017. 12. 28..
//  Copyright © 2017년 ChocOZerO. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    private var encodedData: Data!
    private let userDefaults = UserDefaults.standard

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        VendingMachine.setInstance()
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {

    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        encodedData = try? PropertyListEncoder().encode(VendingMachine.sharedInstance)
        userDefaults.set(encodedData, forKey: "encodedData")
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        let data = userDefaults.data(forKey: "encodedData")!
        VendingMachine.sharedInstance = try? PropertyListDecoder().decode(VendingMachine.self, from: data)
    }

    func applicationDidBecomeActive(_ application: UIApplication) {

    }

    func applicationWillTerminate(_ application: UIApplication) {

    }

}
