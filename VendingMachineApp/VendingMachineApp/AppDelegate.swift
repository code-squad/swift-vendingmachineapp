//
//  AppDelegate.swift
//  VendingMachineApp
//
//  Created by 조중윤 on 2021/02/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var machine: Machine?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        if let decodedData = MachineDataManager.loadData() {
            machine = decodedData
        } else {
            machine = Machine()
            
            let someBeverage = BeverageFactory.makeBeverageWithType(brand: "동아제약", price: .high, name: "박카스", packageTime: .fresh, beverageType: Beverage.self)
            let someStrawBerryMilk = BeverageFactory.makeBeverageWithType(brand: "남양유업", price: .high, name: "딸기에몽", packageTime: .fresh, beverageType: StrawBerryMilk.self)
            let someBananaMilk = BeverageFactory.makeBeverageWithType(brand: "빙그레", price: .high, name: "바나나맛우유", packageTime: .fresh, beverageType: BananaMilk.self)
            let someCola = BeverageFactory.makeBeverageWithType(brand: "코카콜라", price: .high, name: "코카콜라", packageTime: .fresh, beverageType: Cola.self)
            let someAmericano = BeverageFactory.makeBeverageWithType(brand: "스타벅스", price: .high, name: "아메리카노-톨", packageTime: .fresh, beverageType: Americano.self)
            let someAmericano2 = BeverageFactory.makeBeverageWithType(brand: "스타벅스", price: .high, name: "콜드브루블랙", packageTime: .fresh, beverageType: Americano.self)
            
            
            machine!.addStock(beverage: someBeverage, amount: 10)
            machine!.addStock(beverage: someStrawBerryMilk, amount: 20)
            machine!.addStock(beverage: someBananaMilk, amount: 30)
            machine!.addStock(beverage: someCola, amount: 40)
            machine!.addStock(beverage: someAmericano, amount: 50)
            machine!.addStock(beverage: someAmericano2, amount: 60)
        }
        return true
    }

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
    }
}

