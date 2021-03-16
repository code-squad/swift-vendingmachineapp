//
//  PurchaseHistory.swift
//  VendingMachineApp
//
//  Created by 오킹 on 2021/03/02.
//

import Foundation

class PurchaseHistory: NSObject, NSCoding {

    private(set) var beverages: [Beverage]
    
    override init() {
        self.beverages = []
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(beverages, forKey: "historyBeverages")
    }
    
    required init?(coder: NSCoder) {
        beverages = coder.decodeObject(forKey: "historyBeverages") as! [Beverage]
    }
    
    public func append(item beverage: Beverage) {
        beverages.append(beverage)
    }
}
