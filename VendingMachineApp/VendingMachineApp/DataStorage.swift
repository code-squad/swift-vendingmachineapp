//
//  DataStorage.swift
//  VendingMachineApp
//
//  Created by 김수현 on 2018. 7. 10..
//  Copyright © 2018년 김수현. All rights reserved.
//

import Foundation

class DataStorage {
    
    private static let keyProperty = "encodedData"

    static func roadData() -> Vendingmachine? {
        guard let data = UserDefaults.standard.data(forKey: keyProperty) else { return nil }
        guard let vendingmachine =  NSKeyedUnarchiver.unarchiveObject(with: data) else { return nil }
        guard let unarchiveData = vendingmachine as? Vendingmachine else { return nil }
        return unarchiveData
    }
    
    static func saveData(_ vendingmachine: Vendingmachine) {
        let encodedData = NSKeyedArchiver.archivedData(withRootObject: vendingmachine)
        UserDefaults.standard.set(encodedData, forKey: keyProperty)
    }
    
}
