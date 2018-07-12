//
//  DataStorage.swift
//  VendingMachineApp
//
//  Created by 김수현 on 2018. 7. 10..
//  Copyright © 2018년 김수현. All rights reserved.
//

import Foundation

class DataStorage {
    
    private let keyProperty: String = "encodedData"

    func roadData() -> Vendingmachine? {
        guard let data = UserDefaults.standard.data(forKey: keyProperty) else { return nil }
        guard let vendingmachine = try? PropertyListDecoder().decode(Vendingmachine.self, from: data) else { return nil }
        return vendingmachine
    }
    
    func saveData(_ vendingmachine: Vendingmachine) {
        let encodedData = try? PropertyListEncoder().encode(vendingmachine)
        UserDefaults.standard.set(encodedData, forKey: keyProperty)
    }
    
}
