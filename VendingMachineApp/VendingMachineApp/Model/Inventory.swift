//
//  Inventory.swift
//  VendingMachineApp
//
//  Created by 오킹 on 2021/03/01.
//

import Foundation

class Inventory {

    private var beverages: [Beverage]
    
    init() {
        beverages = []
    }
    
    public func append(_ beverage: Beverage) {
        beverages.append(beverage)
    }
    
    public func buyableBeverageList(buyer paymentManager: PaymentManager) -> [Beverage] {
        var list = [Beverage]()
        
        beverages.forEach { (beverage) in
            if beverage.canSell(to: paymentManager) {
                list.append(beverage)
            }
        }
        
        return list
    }

    public func take(out beverage: Beverage, for paymentManager: PaymentManager) -> Beverage? {
        let pickedBeverage: Beverage?
      
        if let firstIndex = buyableBeverageList(buyer: paymentManager).firstIndex(where: { $0 === beverage }) {
            pickedBeverage = beverages.remove(at: firstIndex)
            paymentManager.decreaseMoney(by: beverage)
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
                if safeBeverage.isExpired() {
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
                if hotableBeverage.isHot() {
                    list.append(hotableBeverage)
                }
            }
        }

        return list
    }
}
