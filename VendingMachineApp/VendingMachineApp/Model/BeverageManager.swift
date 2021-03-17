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
    
    enum Standards {
        static let temperature: Float = 36.5
        static let sugar: Float = 1.0
        static let lactose: Float = 3.5
    }
    
    init(temperatureStandard: Float, sugarStandard: Float, lactoStandard: Float) {
        dateStandard = Date()
        self.temperatureStandard = temperatureStandard
        self.sugarStandard = sugarStandard
        self.lactoStandard = lactoStandard
    }

    func expiredItems(fromItemsIn storage: Storage) -> [ObjectIdentifier: [Shopable]] {
        return storage.listTypeObjects(filter: expired(_:))
    }

    private func expired(_ beverages: [ObjectIdentifier: [Shopable]]) -> [ObjectIdentifier: [Shopable]] {
        var expiredList = [ObjectIdentifier: [Shopable]]()

        beverages.forEach { (id, list) in
            for item in list {
                if let beverage = item as? Beverage & Expirable,
                   beverage.isExpired(compareTo: dateStandard) {
                    
                    if expiredList[id] != nil {
                        expiredList[id]!.append(item)
                    } else {
                        expiredList[id] = [item]
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
