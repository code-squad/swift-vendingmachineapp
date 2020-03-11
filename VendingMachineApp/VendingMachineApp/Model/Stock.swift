//
//  Stock.swift
//  VendingMachineApp
//
//  Created by TTOzzi on 2020/02/21.
//  Copyright © 2020 TTOzzi. All rights reserved.
//

import Foundation

class Stock: NSObject, NSCoding {
    private var beverages: [Beverage]
    
    override init() {
        self.beverages = [Beverage]()
    }
    
    func add(beverage: Beverage) {
        beverages.append(beverage)
    }
    
    func serve(beverage: Beverage) -> Beverage {
        return beverages.remove(at: beverages.firstIndex(of: beverage)!)
    }
        
    func getPurchasableList(money: Money) -> [Beverage] {
        return beverages.filter { money >= $0.price }
    }
    
    func sortOut() -> [Beverage:Int] {
        let list = beverages.reduce(into: [Beverage:Int]()) {
            if $0[$1] == nil {
                $0[$1] = 1
            } else {
                $0[$1]! += 1
            }
        }
        return list
    }
    
    func getDateExpiredBeverages() -> [Beverage] {
        return beverages.filter { !$0.validate(with: Date()) }
    }
    
    func getHotBeverages() -> [Beverage] {
        return beverages.filter { $0.isHot }
    }
    
    // MARK: - NSCoding
    
    required init?(coder: NSCoder) {
        guard let beverages = coder.decodeObject(forKey: "beverages") as? [Beverage] else { return nil }
        self.beverages = beverages
    }

    func encode(with coder: NSCoder) {
        coder.encode(beverages, forKey: "beverages")
    }
}
