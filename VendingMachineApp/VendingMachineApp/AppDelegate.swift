//
//  AppDelegate.swift
//  VendingMachineApp
//
//  Created by Song on 2021/02/23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var vendingMachine: VendingMachine!
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        /// 데이터 불러오기 - 없을 경우 새로 생성
        vendingMachine = VendingMachine(dateStandard: Date(),
                                            temperatureStandard: 36.5,
                                            sugarStandard: 1.0,
                                            lactoStandard: 0.5)
        return true
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        /// 데이터 저장
    }
}
