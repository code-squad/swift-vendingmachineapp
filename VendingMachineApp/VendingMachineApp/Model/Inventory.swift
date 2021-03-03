//
//  Inventory.swift
//  VendingMachineApp
//
//  Created by 오킹 on 2021/03/01.
//

import Foundation

class Inventory: CustomStringConvertible {
    
    var description: String {
        return "\(beverages)"
    }

    private var beverages: [Beverage]
    
    init() {
        beverages = []
    }
    
    public func appendBeverage(_ beverage: Beverage) {
        beverages.append(beverage)
    }
    
    public func buyableBeverageList(buyer paymentManager: PaymentManager) -> [Beverage] {
        var list = [Beverage]()
        
        beverages.forEach { (beverage) in
            if beverage.price <= paymentManager.money {
                list.append(beverage)
            }
        }
        
        return list
    }

    public func takeOutBeverage(_ beverage: Beverage, paymentManager: PaymentManager) -> Beverage? {
        let pickedBeverage: Beverage?
      
        if let firstIndex = buyableBeverageList(buyer: paymentManager).firstIndex(where: { $0 === beverage }) {
            pickedBeverage = beverages.remove(at: firstIndex)
            paymentManager.minusMoney(beverage: beverage)
            return pickedBeverage
        }

        return nil
    }
    
    public func showAllBeverageList() -> [Beverage: Int] {
        var allList = [Beverage: Int]()
        
        beverages.forEach { (beverage) in
            if allList[beverage] != nil {
                allList[beverage]! += 1
            } else {
                allList[beverage] = 1
            }
        }

        return allList
    }
    
    public func showExpiryDateBeverage() -> [SafeDateChecker] {
        var list = [SafeDateChecker]()
        
        beverages.forEach { (beverage) in
            if let safeBeverage = beverage as? SafeDateChecker {
                if safeBeverage.expirationValidate() {
                    list.append(safeBeverage)
                }
            }
        }
        
        return list
    }
    
    public func showHotBeverage() -> [Hotable] {
        var list = [Hotable]()

        beverages.forEach { (beverage) in
            if let hotableBeverage = beverage as? Hotable {
                if hotableBeverage.checkHot() {
                    list.append(hotableBeverage)
                }
            }
        }

        return list
    }
}
