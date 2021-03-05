//
//  Inventory.swift
//  VendingMachineApp
//
//  Created by 오킹 on 2021/03/01.
//

import Foundation

class Inventory {

    private var beverages: Beverages
    
    init() {
        self.beverages = Beverages()
    }
    
    public func append(_ beverage: Beverage) {
        beverages.append(beverage)
    }
    
    public func buyableBeverageList(buyer paymentManager: PaymentManager) -> [Beverage] {
        return beverages.buyableBeverageList(buyer: paymentManager)
    }

    public func take(out beverage: Beverage, for paymentManager: PaymentManager) -> Beverage? {
        return beverages.take(out: beverage, for: paymentManager)
    }
    
    public func showAllBeverageList() -> [ObjectIdentifier : [Beverage]] {

        return beverages.showAllBeverageList()
    }
    
    public func showExpiryDateBeverage() -> [SafeDateChecker] {
        
        return beverages.showExpiryDateBeverage()
    }
    
    public func showHotBeverage() -> [Hotable] {

        return beverages.showHotBeverage()
    }
}

