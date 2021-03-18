//
//  PurchaseHistory.swift
//  VendingMachineApp
//
//  Created by Issac on 2021/03/18.
//  Copyright © 2021 Tailor. All rights reserved.
//

import Foundation

class PurchaseHistory: NSObject, NSCoding, CheckableHistory {
    @Published private var purchaseHistory: [Drink]
    var historyPublisher: Published<[Drink]>.Publisher { $purchaseHistory }
    
    override init() {
        self.purchaseHistory = [Drink]()
    }
    
    required init?(coder: NSCoder) {
        self.purchaseHistory = (coder.decodeObject(forKey: "purchaseHistory") as? [Drink]) ?? [Drink]()
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(self.purchaseHistory, forKey: "purchaseHistory")
    }
    
    public func append(_ drink: Drink) {
        purchaseHistory.append(drink)
    }
    
    public func checkedPurchaseHistory(handle: (Drink) -> ()) {
        for drink in purchaseHistory {
            handle(drink)
        }
    }
    
    public func checkedLastPurchaseHistory() -> Drink? {
        guard let drink = purchaseHistory.last else { return nil }
        return drink
    }
}
