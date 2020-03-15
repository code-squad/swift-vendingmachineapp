//
//  CodableVendingMachine.swift
//  VendingMachineApp
//
//  Created by Cory Kim on 2020/03/12.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import Foundation

class VendingMachineManager {
    private var vendingMachine = VendingMachine()
    let vendingMachineKey = "vendingMachine"
    
    func setVendingMachine(_ vendingMachine: VendingMachine) {
        self.vendingMachine = vendingMachine
    }
    
    func saveData() {
        do {
            let data = try NSKeyedArchiver.archivedData(withRootObject: vendingMachine, requiringSecureCoding: false)
            UserDefaults.standard.set(data, forKey: vendingMachineKey)
        } catch {
            print("Failed to save the data of vending machine:", error.localizedDescription)
        }
    }
    
    func loadData() -> VendingMachine {
        guard let data = UserDefaults.standard.object(forKey: vendingMachineKey) as? Data else { return self.vendingMachine }
        do {
            guard let vendingMachine = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? VendingMachine else { return self.vendingMachine }
            return vendingMachine
        } catch {
            print("Failed to load the data of vending machine:", error.localizedDescription)
        }
        return self.vendingMachine
    }
}
