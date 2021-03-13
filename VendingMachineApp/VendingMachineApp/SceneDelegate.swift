//
//  SceneDelegate.swift
//  VendingMachineApp
//
//  Created by Song on 2021/02/23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    var vendingMachine: VendingMachine!
    
    private func initialSetupVendingMachine() {
        vendingMachine = VendingMachine(numberOfSlots: 5)
        let beverageFactoryList: [BeverageFactory] = [DenmarkStrawberryMilkFactory(), MaeilChocolateMilkFactory(), ZeroSugarCokeFactory(), GeorgiaMaxFactory(), RedBullFactory()]
        beverageFactoryList.forEach { factory in
            vendingMachine.bulkInsert(itemFrom: factory, quantity: 5, manufactured: Date().formattedDate(from: "20210222"), expiredAfter: Date().formattedDate(from: "20210302"))
        }
    }
}
