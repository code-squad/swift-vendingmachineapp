//
//  VendingMachineManager.swift
//  VendingMachineApp
//
//  Created by delma on 2020/03/12.
//  Copyright © 2020 delma. All rights reserved.
//

import Foundation
class VendingMachineManager {
    var vendingMachine = VendingMachine()
    
    func saveData() {
        do {
            let encodedData = try NSKeyedArchiver.archivedData(withRootObject: vendingMachine, requiringSecureCoding: false)
            UserDefaults.standard.set(encodedData, forKey: "vendingMachine")
        }catch {
            print(error.localizedDescription)
        }
        
    }
    
    func loadData() {
        guard let encodedData = UserDefaults.standard.value(forKey: "vendingMachine") as? Data else { return }
        do {
            guard let unarchivedData = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(encodedData) as? VendingMachine else { return }
            vendingMachine = unarchivedData
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func loadSavedBeverageCount(_ vendingMachine: VendingMachine) {
        let stockCount = vendingMachine.reportTotalStock()
        for (key, value) in stockCount {
            if value != 0 {
                let index = vendingMachine.reportProductIndex(key)
                NotificationCenter.default.post(name: .updateBeverageCountLabel, object: (index, value))
            }
        }
    }
    
    func loadSavedBalance(_ vendingMachine: VendingMachine) {
        NotificationCenter.default.post(name: .updateBalanceLabel, object: vendingMachine.balance.description)

    }
    
    
}
