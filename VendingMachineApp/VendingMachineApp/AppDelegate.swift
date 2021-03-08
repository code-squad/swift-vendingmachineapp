//
//  AppDelegate.swift
//  VendingMachineApp
//
//  Created by HOONHA CHOI on 2021/02/23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var vendingMachine = VendingMachine()
    //애플리케이션이 실행된 직후 사용자의 화면에 보여지기 직전에 호출
    func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool  {
        print("willFinishLaunchingWithOptions")
        return true
    }
    
    //애플리케이션이 최초 실행될 때 호출되는 메소드
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        print("didFinishLaunchingWithOptions")
        return true
    }

    //애플리케이션이 InActive 상태로 전환되기 직전에 호출
    func applicationWillResignActive(_ application: UIApplication) {
        print("applicationWillResignActive")
    }

    //애플리케이션이 백그라운드 상태로 전환된 직후 호출
    func applicationDidEnterBackground(_ application: UIApplication){
        print("applicationDidEnterBackground")
    }

    //애플리케이션이 Active 상태가 되기 직전, 화면에 보여지기 직전에 호출
    func applicationWillEnterForeground(_ application: UIApplication) {
        print("applicationWillEnterForeground")
    }

    //애플리케이션이 Active 상태로 전환된 직후 호출
    func applicationDidBecomeActive(_ application: UIApplication) {
        print("applicationDidBecomeActive")
    }

    //애플리케이션이 종료되기 직전에 호출
    func applicationWillTerminate(_ application: UIApplication) {
        print("applicationWillTerminate")
    }
}

