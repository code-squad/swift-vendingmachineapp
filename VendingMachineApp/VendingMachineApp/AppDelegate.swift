//
//  AppDelegate.swift
//  VendingMachineApp
//
//  Created by YOUTH on 2018. 3. 20..
//  Copyright © 2018년 JINiOS. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var vending = VendingMachine.sharedInstance

    // 기존에 저장된 값에서 불러와서 VendingMachine 객체 인스턴스를 생성하기
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        guard let roadedData = DataStorage().loadVendingMachine() else {
            return true
        }
            self.vending = roadedData
            return true
        }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

        //  VendingMachine 객체 인스턴스 속성을 저장하기. 저장할 때는 VendingMachine을 아카이브해서 하나의 데이터 값으로 변형한다
    func applicationDidEnterBackground(_ application: UIApplication) {
        DataStorage().saveVendingMachine(data: self.vending)
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    //  VendingMachine 객체 인스턴스 속성을 저장하기. 저장할 때는 VendingMachine을 아카이브해서 하나의 데이터 값으로 변형한다
    func applicationWillTerminate(_ application: UIApplication) {
        DataStorage().saveVendingMachine(data: self.vending)
    }

}

