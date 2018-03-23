//
//  PurchaseProduct.swift
//  VendingMachineApp
//
//  Created by Eunjin Kim on 2018. 3. 22..
//  Copyright © 2018년 Eunjin Kim. All rights reserved.
//

import Foundation

class PurchaseProduct: NSObject, NSCoding {
    private(set) var purchaseDate: Date
    private(set) var purchaseBeverage: Beverage
    override init() {
        purchaseDate = Date()
        purchaseBeverage = Beverage()
    }
    convenience init(purchaseBeverage: Beverage) {
        self.init()
        self.purchaseDate = Date()
        self.purchaseBeverage = purchaseBeverage
    }
    required init?(coder aDecoder: NSCoder) {
        purchaseDate = aDecoder.decodeObject(forKey: "purchaseDate") as? Date ?? Date()
        purchaseBeverage = (aDecoder.decodeObject(forKey: "purchaseBeverage") as? Beverage)!
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(purchaseDate, forKey: "purchaseDate")
        aCoder.encode(purchaseBeverage, forKey: "purchaseBeverage")
    }
    
}
