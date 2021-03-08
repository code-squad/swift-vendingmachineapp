//
//  purchasedList.swift
//  VendingMachineApp
//
//  Created by HOONHA CHOI on 2021/02/25.
//

import Foundation

class PurchasedList : NSObject, NSCoding {
    private(set) var beverages : [Beverage]
    
    override init() {
        self.beverages = []
        super.init()
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(beverages, forKey: "beverages")
    }
    
    required init?(coder: NSCoder) {
        self.beverages = coder.decodeObject(forKey: "beverages") as! [Beverage]
    }
    
    func add(beverage : Beverage) {
        beverages.append(beverage)
    }
}
