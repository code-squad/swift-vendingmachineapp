//
//  DataManager.swift
//  VendingMachineApp
//
//  Created by HOONHA CHOI on 2021/03/16.
//

import Foundation

class DataManager {
    
    func save() -> VendingMachine? {
        let loadData = UserDefaults.standard.data(forKey: "vendingMachine") ?? Data()
        let loadMachine =  ObjectArchive.load(with: loadData)
        return loadData.isEmpty ? VendingMachine() : loadMachine
    }
    
    func load(vendingMachine : VendingMachine) {
        UserDefaults.standard.setValue(ObjectArchive.save(with: vendingMachine), forKey: "vendingMachine")
    }
}
