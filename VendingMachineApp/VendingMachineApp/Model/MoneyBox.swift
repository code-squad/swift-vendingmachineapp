//
//  MoneyBox.swift
//  VendingMachineApp
//
//  Created by Song on 2021/02/25.
//

import Foundation

class MoneyBox: MoneyManagable {
    
    private var money: Int
    
    init() {
        money = 0
    }
    
    func balance() -> Int {
        return money
    }
    
    func update(amount: Int) {
        money += amount
    }
    
    func update(to money: Int) {
        self.money = money
    }
    
    func affordables(fromItemsIn storage: Storage) -> [ObjectIdentifier] {
        return storage.listTypeOnly(filter: affordable(_:))
    }
    
    private func affordable(_ beverages: [ObjectIdentifier: [Shopable]]) -> [ObjectIdentifier] {
        var purchashableList = [ObjectIdentifier]()
        
        beverages.forEach { (id, list) in
            if list[0].isPurchashable(with: money){
                purchashableList.append(id)
            }
        }
        return purchashableList
    }
}
