//
//  AppDelegate.swift
//  VendingMachineApp
//
//  Created by 신한섭 on 2020/02/24.
//  Copyright © 2020 신한섭. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var vendingMachine = VendingMachine()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        return true
    }

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
    func archive(with things: VendingMachine) -> Data {
        do {
            let archived = try NSKeyedArchiver.archivedData(withRootObject: things, requiringSecureCoding: false)
            return archived
        }
        catch {
            print(error)
        }
        return Data()
    }
    
    func unarchive(with text: Data) -> VendingMachine? {
        do {
            let object = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(text)
            return object as? VendingMachine
        }
        catch {
            print(error)
        }
        return nil
    }
}

