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
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        if #available(iOS 13.0, *) {
        } else {
            let window = UIWindow(frame: UIScreen.main.bounds)
            window.rootViewController = ViewController()
            self.window = window
            window.makeKeyAndVisible()
        }
        
        load()
        
        return true
    }
    
    @available(iOS 13.0, *)
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        save()
    }
    
    func save() {
        func archive() -> Data {
            do {
                let archived = try NSKeyedArchiver.archivedData(withRootObject: vendingMachine, requiringSecureCoding: false)
                return archived
            }
            catch {
                print(error)
            }
            return Data()
        }
        
        UserDefaults.standard.set(archive(), forKey: "model")
    }
    
    func load() {
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
        
        if let data: Data = UserDefaults.standard.object(forKey: "model") as? Data {
            if let vendingMachine = unarchive(with: data) {
                self.vendingMachine = vendingMachine
            }
        }
    }
}

