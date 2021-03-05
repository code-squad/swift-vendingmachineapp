//
//  Beverages.swift
//  VendingMachineApp
//
//  Created by 오킹 on 2021/03/05.
//

import Foundation

class Beverages {
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
    
    public func showAllBeverageList() -> [ObjectIdentifier : [Beverage]] {
        var allList: [ObjectIdentifier : [Beverage]] = [:]

        beverages.forEach { (beverage) in
            if allList[ObjectIdentifier(type(of: beverage.self))] != nil {
                allList[ObjectIdentifier(type(of: beverage.self))]! += [beverage]
            }
            else {
                allList[ObjectIdentifier(type(of: beverage.self))] = [beverage]
            }
        }

        return allList
    }
    
    public func showExpiryDateBeverage() -> [SafeDateChecker] {
        var list = [SafeDateChecker]()
        
        beverages.forEach { (beverage) in
            if beverage.isExpired() {
                list.append(beverage)
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
