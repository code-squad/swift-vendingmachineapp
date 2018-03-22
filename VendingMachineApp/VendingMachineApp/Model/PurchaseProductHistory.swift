//
//  PurchaseProductHistory.swift
//  VendingMachine
//
//  Created by Eunjin Kim on 2018. 1. 16..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class PurchaseProductHistory: NSObject, NSCoding {
    private var purchaseProducts: [PurchaseProduct]
    override init() {
        purchaseProducts = [PurchaseProduct]()
    }
    required init?(coder aDecoder: NSCoder) {
        purchaseProducts = (aDecoder.decodeObject(forKey: "purchaseProducts") as? [PurchaseProduct])!
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(purchaseProducts, forKey: "purchaseProducts")
    }
    
    func recordOfPurchaseHistory(purchaseProduct: PurchaseProduct) {
        purchaseProducts.append(purchaseProduct)
    }
    
    func historyOfPurchase() -> [PurchaseProduct] {
        return purchaseProducts
    }
}
