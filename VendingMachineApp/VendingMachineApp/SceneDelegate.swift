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
    let defaults = UserDefaults.standard
    
    func sceneDidEnterBackground(_ scene: UIScene) {
        do {
            guard let vendingMachine = vendingMachine else { return }
            let archived = try NSKeyedArchiver.archivedData(withRootObject: vendingMachine, requiringSecureCoding: false)
            defaults.set(archived, forKey: "vendingMachine")
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
        if let archivedData = defaults.object(forKey: "vendingMachine") {
            do {
                vendingMachine = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(archivedData as! Data) as? VendingMachine
            } catch {
                print(error.localizedDescription)
            }
        } else {
            initialSetupVendingMachine()
        }
    }
    
    private func initialSetupVendingMachine() {
        vendingMachine = VendingMachine(numberOfSlots: 5)
        let beverageFactoryList: [BeverageFactory] = [DenmarkStrawberryMilkFactory(), MaeilChocolateMilkFactory(), ZeroSugarCokeFactory(), GeorgiaMaxFactory(), RedBullFactory()]
        beverageFactoryList.forEach { factory in
            vendingMachine.bulkInsert(itemFrom: factory, quantity: 5, manufactured: Date().formattedDate(from: "20210222"), expiredAfter: Date().formattedDate(from: "20210302"))
        }
    }
}
