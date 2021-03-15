//
//  AppDelegate.swift
//  VendingMachineApp
//
//  Created by 양준혁 on 2021/02/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var vendingMachine = VendingMachine()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        print("hi")
        if let savedData = UserDefaults.standard.object(forKey: "vendingMachine") {
            do {
                let unarchivedData = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(savedData as! Data)
                vendingMachine = unarchivedData as! VendingMachine
                print("데이터가 언아카이빙되어서 불러드림")
            } catch {
                print(error)
            }
        }
        return true
    }
    
}

