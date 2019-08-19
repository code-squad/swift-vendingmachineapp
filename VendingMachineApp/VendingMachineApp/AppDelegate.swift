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
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
        
        
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
        saveVendingMachine()
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
    
    //MARK: 비공개 메소드
    
    private func saveVendingMachine() {
        do {
            let data = try PropertyListEncoder().encode(machine)
            UserDefaults.standard.set(data, forKey: VendingMachine.PropertyKey)
            print("저장성공")
        } catch {
            print("저장 실패")
        }
    }
    
    private func loadVendingMachine() -> VendingMachine? {
        guard let data = UserDefaults.standard.data(forKey: VendingMachine.PropertyKey) else {
            print("데이터를 찾을 수 없음")
            return nil
        }
        return try? PropertyListDecoder().decode(VendingMachine.self, from: data)
    }
}

