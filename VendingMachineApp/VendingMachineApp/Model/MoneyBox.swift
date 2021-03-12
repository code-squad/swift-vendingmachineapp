//
//  MoneyBox.swift
//  VendingMachineApp
//
//  Created by Song on 2021/02/25.
//

import Foundation

class MoneyBox: NSObject, MoneyManagable, NSCoding {
    
    private var money: Int
    
    override init() {
        money = 0
    }
    
    enum Keys {
        static let balance = "balance"
    }
    
    required init?(coder: NSCoder) {
        self.money = coder.decodeInteger(forKey: Keys.balance)
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(money, forKey: Keys.balance)
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
