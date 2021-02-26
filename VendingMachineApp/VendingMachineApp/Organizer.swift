//
//  Organizer.swift
//  VendingMachineApp
//
//  Created by Song on 2021/02/26.
//

import Foundation

class Organizer {
    
    private var moneyBox: MoneyBox
    
    init(with moneyBox: MoneyBox) {
        self.moneyBox = moneyBox
    }
    
    func affordables(from list: Beverages) -> [Beverage] {
        return list.listByTime(filter: affordable(_:))
    }
    
    private func affordable(_ beverages: [Beverage: Int]) -> [Beverage] {
        var purchashableList = [Beverage]()
        
        beverages.forEach { (beverage: Beverage, _: Int) in
            if beverage.isPurchashable(with: moneyBox.balance()){
                purchashableList.append(beverage)
            }
        }
        return purchashableList
    }
    
    func expiredItems(from list: Beverages) -> [Beverage: Int] {
        return list.listByType(filter: expired(_:))
    }

    private func expired(_ beverages: [Beverage]) -> [Beverage: Int] {
        var expiredList = [Beverage: Int]()

        beverages.forEach { (bev) in
            if let beverage = bev as? Beverage & Expirable,
               beverage.isExpired() {
                if expiredList[beverage] != nil {
                    expiredList[beverage]! += 1
                } else {
                    expiredList[beverage] = 1
                }
            }
        }
        return expiredList
    }
    
    func hotItems(from list: Beverages) -> [Beverage] {
        return list.listByTime(filter: hot(_:))
    }

    private func hot(_ stockList: [Beverage: Int]) -> [Beverage] {
        var beverageList = [Beverage]()

        stockList.forEach { (bev: Beverage, _: Int) in
            if let beverage = bev as? Beverage & Hotable,
               beverage.isHotable() {
                beverageList.append(beverage)
            }
        }
        return beverageList
    }
    
    func transportables(from list: Beverages) -> [Beverage] {
        return list.listByTime(filter: transportable(_:))
    }

    private func transportable(_ stockList: [Beverage: Int]) -> [Beverage] {
        var beverageList = [Beverage]()

        stockList.forEach { (bev: Beverage, _: Int) in
            if let beverage = bev as? Beverage & Transportable,
               beverage.isTransportable() {
                beverageList.append(beverage)
            }
        }
        return beverageList
    }
    
    func healthyItems(from list: Beverages) -> [Beverage] {
        return list.listByTime(filter: healthy(_:))
    }

    private func healthy(_ stockList: [Beverage: Int]) -> [Beverage] {
        var beverageList = [Beverage]()

        stockList.forEach { (bev: Beverage, _: Int) in
            if let beverage = bev as? Beverage & SugarFreeable & LactoFreeable,
               beverage.isSugarFree(), beverage.isLactoFree() {
                beverageList.append(beverage)
            }
        }
        return beverageList
    }
}
