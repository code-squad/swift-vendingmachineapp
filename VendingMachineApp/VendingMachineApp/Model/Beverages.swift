//
//  Beverages.swift
//  VendingMachineApp
//
//  Created by 오킹 on 2021/03/05.
//

import Foundation

class Beverages: NSObject, NSCoding {
    private var beverages: [Beverage]
    
    override init() {
        beverages = []
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(beverages, forKey: "beverages")
    }
    
    required init?(coder: NSCoder) {
        beverages = coder.decodeObject(forKey: "beverages") as! [Beverage]
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
    
    public func take(out beverageType: Beverage.Type, for paymentManager: PaymentManager) -> Beverage? {
        let pickedBeverage: Beverage?
      
        if let firstIndex = buyableBeverageList(buyer: paymentManager).firstIndex(where: { type(of: $0) == beverageType }) {
            pickedBeverage = beverages.remove(at: firstIndex)
            paymentManager.decreaseMoney(by: pickedBeverage!)
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
    
    public func showExpiryDateBeverage(over standard: Date) -> [SafeDateChecker] {
        var list = [SafeDateChecker]()
        
        beverages.forEach { (beverage) in
            if beverage.isExpired(over: standard) {
                list.append(beverage)
            }
        }
        
        return list
    }
    
    public func showHotBeverage(over standard: Int) -> [Hotable] {
        var list = [Hotable]()

        beverages.forEach { (beverage) in
            if let hotableBeverage = beverage as? Hotable {
                if hotableBeverage.isHot(over: standard) {
                    list.append(hotableBeverage)
                }
            }
        }

        return list
    }
}
