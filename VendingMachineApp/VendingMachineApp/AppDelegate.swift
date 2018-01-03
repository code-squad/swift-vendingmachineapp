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
    var vendingMachine: VendingMachine!
    private var encodedData: Data!

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        vendingMachine = VendingMachine()
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {

    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        encodedData = try? JSONEncoder().encode(vendingMachine)
    }

    func applicationWillEnterForeground(_ application: UIApplication) {

    }

    func applicationDidBecomeActive(_ application: UIApplication) {

    }

    func applicationWillTerminate(_ application: UIApplication) {

    }

}
