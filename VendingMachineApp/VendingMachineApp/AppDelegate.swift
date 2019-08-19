//
//  AppDelegate.swift
//  VendingMachineApp
//
//  Created by 김성현 on 16/07/2019.
//  Copyright © 2019 김성현. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    var machine: VendingMachine!
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // 저장된 자판기를 가져옵니다. 가져올 수 없으면 샘플을 로드합니다.
        if let savedMachine = loadVendingMachine() {
            machine = savedMachine
        } else {
            machine = VendingMachine()
            machine.loadSampleBeverages()
        }
        
        return true
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        // 자판기를 저장합니다.
        saveVendingMachine()
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
    }
    
    //MARK: 비공개 메소드
    
    private func saveVendingMachine() {
        do {
            let machineData = try NSKeyedArchiver.archivedData(withRootObject: machine!, requiringSecureCoding: false)
            UserDefaults.standard.set(machineData, forKey: VendingMachine.UserDefaultsKey)
        } catch {
            print(error)
            return
        }
    }
    
    private func loadVendingMachine() -> VendingMachine? {
        guard let data = UserDefaults.standard.data(forKey: VendingMachine.UserDefaultsKey) else {
            return nil
        }
        return try? NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? VendingMachine
    }
}

