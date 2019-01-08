//
//  AppDelegate.swift
//  VendingMachineApp
//
//  Created by 윤지영 on 24/12/2018.
//  Copyright © 2018 윤지영. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var vendingMachine: VendingMachine?
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        do {
            try vendingMachine = VendingMachineArchiver.load()
        } catch {
            vendingMachine = VendingMachineArchiver.setDefaultVendingMachine()
        }
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {}

    func applicationDidEnterBackground(_ application: UIApplication) {
        VendingMachineArchiver.archive(vendingMachine: vendingMachine)
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        VendingMachineArchiver.archive(vendingMachine: vendingMachine)
    }

}

struct VendingMachineArchiver {

    enum ArchivingError: Error {
        case noData
        case notLoaded
    }

    static func archive(vendingMachine: VendingMachine?) {
        guard let vendingMachine = vendingMachine else { return }
        let vendingMachineEncoded = try? NSKeyedArchiver.archivedData(
            withRootObject: vendingMachine,
            requiringSecureCoding: false)
        UserDefaults.standard.set(vendingMachineEncoded, forKey:"vendingMachine")
    }

    static func load() throws -> VendingMachine {
        guard let data = UserDefaults.standard.data(forKey: "vendingMachine") else { throw ArchivingError.noData }
        guard let vendingMachine = try NSKeyedUnarchiver
            .unarchiveTopLevelObjectWithData(data) as? VendingMachine else { throw ArchivingError.notLoaded }
        return vendingMachine
    }

    static func setDefaultVendingMachine() -> VendingMachine {
        let money = Money()
        let inventory = Inventory(list: [ObjectIdentifier: Pack]())
        return VendingMachine.init(initialBalance: money, initialInventory: inventory)
    }

}
