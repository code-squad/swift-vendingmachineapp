//
//  VendingMachineDataManager.swift
//  VendingMachineApp
//
//  Created by 지북 on 2021/03/16.
//

import Foundation

struct VendingMachineDataManager {
    static func load() -> VendingMachine? {
        guard let data = UserDefaults.standard.data(forKey: "vendingMachine") else { return nil }
        let vendingMachineData = try! NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data)
        guard let vendingMachine = vendingMachineData as? VendingMachine else { return nil }
        return vendingMachine
    }
    
    static func save(_ vendingMachine: VendingMachine) {
        do {
            let encodedData = try NSKeyedArchiver.archivedData(withRootObject: vendingMachine, requiringSecureCoding: false)
            UserDefaults.standard.set(encodedData, forKey: "vendingMachine")
        }
        catch {
            print(error)
        }
    }
}
