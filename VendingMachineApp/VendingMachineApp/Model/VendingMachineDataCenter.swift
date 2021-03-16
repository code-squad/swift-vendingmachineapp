//
//  VendingMachineDataCenter.swift
//  VendingMachineApp
//
//  Created by Issac on 2021/03/15.
//

import Foundation

class VendingMachineDataCenter {
    static public func loadVendingMachineData() -> VendingMachine {
        guard let data = UserDefaults.standard.object(forKey: "vendingMachine") else { return VendingMachine.default }
        do {
            let vendingMachine = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data as! Data) as? VendingMachine
            return vendingMachine ?? VendingMachine.default
        } catch {
            print(error.localizedDescription)
        }
        return VendingMachine.default
    }

    static public func saveVendingMachineData(_ vendingMachine: VendingMachine) {
        var data: Data!
        do {
            data = try NSKeyedArchiver.archivedData(withRootObject: vendingMachine, requiringSecureCoding: false)
        } catch {
            print(error.localizedDescription)
            return
        }
        UserDefaults.standard.set(data, forKey: "vendingMachine")
    }

}

