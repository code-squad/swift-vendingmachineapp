//
//  AppDelegate.swift
//  VendingMachineApp
//
//  Created by 김수현 on 2018. 6. 28..
//  Copyright © 2018년 김수현. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var vendingmachine: Vendingmachine!
    var dataStorage = DataStorage()
    private var encodedData: Data!
    let beverages = BeverageFactory().setBeverage()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        guard let decodeData = dataStorage.roadData() else {
            vendingmachine = Vendingmachine(beverages)
            return true
        }
        vendingmachine = decodeData
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {

    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        dataStorage.saveData(vendingmachine)
    }

    func applicationWillEnterForeground(_ application: UIApplication) {

    }

    func applicationDidBecomeActive(_ application: UIApplication) {

    }

    func applicationWillTerminate(_ application: UIApplication) {

    }

}

