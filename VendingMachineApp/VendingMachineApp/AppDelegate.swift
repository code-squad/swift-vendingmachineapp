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

