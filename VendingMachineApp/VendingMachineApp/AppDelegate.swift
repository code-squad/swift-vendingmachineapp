//
//  AppDelegate.swift
//  VendingMachineApp
//
//  Created by 이동건 on 29/10/2018.
//  Copyright © 2018 이동건. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var vendingMachine: VendingMachine!
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        load()
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        save()
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    private func save() {
        guard let vendingMachine = vendingMachine else { return }
        guard let data = try? NSKeyedArchiver.archivedData(withRootObject: vendingMachine, requiringSecureCoding: false) else { return }
        UserDefaults.standard.set(data, forKey: "vendingMachine")
    }
    
    private func load() {
        guard let data = UserDefaults.standard.object(forKey: "vendingMachine") as? Data else {
            vendingMachine = VendingMachine(Stocks(WareHouse.generateBeverages(10)))
            return
        }
        guard let vendingMachine = try? NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? VendingMachine else {
            self.vendingMachine = VendingMachine(Stocks(WareHouse.generateBeverages(10)))
            return
        }
        guard let machine = vendingMachine else {
            self.vendingMachine = VendingMachine(Stocks(WareHouse.generateBeverages(10)))
            return
        }

        self.vendingMachine = machine
    }
}

