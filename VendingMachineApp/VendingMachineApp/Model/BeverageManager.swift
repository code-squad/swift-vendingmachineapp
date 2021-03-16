//
//  Organizer.swift
//  VendingMachineApp
//
//  Created by Song on 2021/02/26.
//

import Foundation

class BeverageManager: FoodManagable {

    private let dateStandard: Date
    private let temperatureStandard: Float
    private let sugarStandard: Float
    private let lactoStandard: Float
    
    init(temperatureStandard: Float, sugarStandard: Float, lactoStandard: Float) {
        dateStandard = Date()
        self.temperatureStandard = temperatureStandard
        self.sugarStandard = sugarStandard
        self.lactoStandard = lactoStandard
    }

    func expiredItems(fromItemsIn storage: Storage) -> [ObjectIdentifier: Int] {
        return storage.listTypeCount(filter: expired(_:))
    }

    private func expired(_ beverages: [ObjectIdentifier: [Shopable]]) -> [ObjectIdentifier: Int] {
        var expiredList = [ObjectIdentifier: Int]()

        beverages.forEach { (id, list) in
            for item in list {
                if let beverage = item as? Beverage & Expirable,
                   beverage.isExpired(compareTo: dateStandard) {
                    
                    if expiredList[id] != nil {
                        expiredList[id]! += 1
                    } else {
                        expiredList[id] = 1
                    }
                }
            }
        }
        return expiredList
    }
    
    func hotItems(fromItemsIn storage: Storage) -> [ObjectIdentifier] {
        return storage.listTypeOnly(filter: hot(_:))
    }

    private func hot(_ stockList: [ObjectIdentifier: [Shopable]]) -> [ObjectIdentifier] {
        var beverageList = [ObjectIdentifier]()

        stockList.forEach { (id, list) in
            if let beverage = list[0] as? Beverage & Hotable,
               beverage.isHot(basedOn: temperatureStandard){
                beverageList.append(id)
            }
        }
        return beverageList
    }
    
    func transportables(fromItemsIn storage: Storage) -> [ObjectIdentifier] {
        return storage.listTypeOnly(filter: transportable(_:))
    }

    private func transportable(_ stockList: [ObjectIdentifier: [Shopable]]) -> [ObjectIdentifier] {
        var beverageList = [ObjectIdentifier]()

        stockList.forEach { (id, list) in
            if let beverage = list[0] as? Beverage & Transportable,
               beverage.isTransportable() {
                beverageList.append(id)
            }
        }
        return beverageList
    }
    
    func healthyItems(fromItemsIn storage: Storage) -> [ObjectIdentifier] {
        return storage.listTypeOnly(filter: healthy(_:))
    }

    private func healthy(_ stockList: [ObjectIdentifier: [Shopable]]) -> [ObjectIdentifier] {
        var beverageList = [ObjectIdentifier]()

        stockList.forEach { (id, list) in
            if let beverage = list[0] as? Beverage & SugarFreeable & LactoFreeable,
               beverage.isSugarFree(basedOn: sugarStandard),
               beverage.isLactoFree(basedOn: lactoStandard) {
                beverageList.append(id)
            }
        }
        return beverageList
    }
}
