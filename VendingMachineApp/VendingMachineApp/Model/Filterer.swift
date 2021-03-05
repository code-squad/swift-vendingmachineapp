//
//  Organizer.swift
//  VendingMachineApp
//
//  Created by Song on 2021/02/26.
//

import Foundation

class Filterer {

    private let dateStandard: Date
    private let temperatureStandard: Float
    private let sugarStandard: Float
    private let lactoStandard: Float
    
    init(dateStandard: Date, temperatureStandard: Float, sugarStandard: Float, lactoStandard: Float) {
        self.dateStandard = dateStandard
        self.temperatureStandard = temperatureStandard
        self.sugarStandard = sugarStandard
        self.lactoStandard = lactoStandard
    }
    
    func expiredItems(from list: BeverageStorage) -> [ObjectIdentifier: Int] {
        return list.listTypeCount(filter: expired(_:))
    }

    private func expired(_ beverages: [ObjectIdentifier: [Beverage]]) -> [ObjectIdentifier: Int] {
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
    
    func hotItems(from list: BeverageStorage) -> [ObjectIdentifier] {
        return list.listTypeOnly(filter: hot(_:))
    }

    private func hot(_ stockList: [ObjectIdentifier: [Beverage]]) -> [ObjectIdentifier] {
        var beverageList = [ObjectIdentifier]()

        stockList.forEach { (id, list) in
            if let beverage = list[0] as? Beverage & Hotable,
               beverage.isHot(basedOn: temperatureStandard){
                beverageList.append(id)
            }
        }
        return beverageList
    }
    
    func transportables(from list: BeverageStorage) -> [ObjectIdentifier] {
        return list.listTypeOnly(filter: transportable(_:))
    }

    private func transportable(_ stockList: [ObjectIdentifier: [Beverage]]) -> [ObjectIdentifier] {
        var beverageList = [ObjectIdentifier]()

        stockList.forEach { (id, list) in
            if let beverage = list[0] as? Beverage & Transportable,
               beverage.isTransportable() {
                beverageList.append(id)
            }
        }
        return beverageList
    }
    
    func healthyItems(from list: BeverageStorage) -> [ObjectIdentifier] {
        return list.listTypeOnly(filter: healthy(_:))
    }

    private func healthy(_ stockList: [ObjectIdentifier: [Beverage]]) -> [ObjectIdentifier] {
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
