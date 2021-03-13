//
//  AppDelegate.swift
//  VendingMachineApp
//
//  Created by 조중윤 on 2021/02/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var machine: Machine = Machine()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        guard let data = UserDefaults.standard.data(forKey: "machine") else { return false }
        do {
            let machineData = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data)
            guard let savedMachine = machineData as? Machine else { return false }
            machine = savedMachine
        } catch {
            print(error.localizedDescription)
        }
        return true
    }

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
    }

    func applicationWillTerminate(_ application: UIApplication) {
        do {
            let myEncodedObject = try NSKeyedArchiver.archivedData(withRootObject: machine, requiringSecureCoding: false)
            UserDefaults.standard.set(myEncodedObject, forKey: "machine")
        } catch {
            print(error.localizedDescription)
        }
    }
}

