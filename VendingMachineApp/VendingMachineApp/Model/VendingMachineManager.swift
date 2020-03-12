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
}
