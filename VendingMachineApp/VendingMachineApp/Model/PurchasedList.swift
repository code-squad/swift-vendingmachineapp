//
//  PurchasedList.swift
//  VendingMachineApp
//
//  Created by 양준혁 on 2021/03/03.
//

import Foundation

class PurchasedList: NSObject, NSCoding {
    
    private var purchasedDrinks: [Beverage]
    
    func encode(with coder: NSCoder) {
        coder.encode(purchasedDrinks, forKey: "purchasedDrinks")
    }
    
    required init?(coder: NSCoder) {
        self.purchasedDrinks = coder.decodeObject(forKey: "purchasedDrinks") as! [Beverage]
    }
    
    init(_ purchasedDrinks: [Beverage]) {
        self.purchasedDrinks = purchasedDrinks
    }
    convenience override init() {
        self.init([])
    }
    
    func add(with beverage: Beverage) {
        self.purchasedDrinks.append(beverage)
    }
    
    func givePurchasedList() -> PurchasedList {
        return PurchasedList(purchasedDrinks)
    }
}



