//
//  MachineStore.swift
//  VendingMachineApp
//
//  Created by 권재욱 on 2018. 3. 7..
//  Copyright © 2018년 권재욱. All rights reserved.
//

import Foundation

class MachineStore {
    
    func saveChanges(_ machine : VendingMachine) {
        let encodedData = NSKeyedArchiver.archivedData(withRootObject: machine)
        UserDefaults.standard.set(encodedData, forKey : "vendingMachine")
    }
    
    func loadMachine() -> VendingMachine? {
        guard let encodedData = UserDefaults.standard.data(forKey: "vendingMachine") else { return nil }
        guard let archivedMachine = NSKeyedUnarchiver.unarchiveObject(with: encodedData) as? VendingMachine else { return nil }
            return archivedMachine
        }
    
}
