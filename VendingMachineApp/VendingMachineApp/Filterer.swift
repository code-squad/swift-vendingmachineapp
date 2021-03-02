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
    
    func expiredItems(from list: Beverages) -> [Beverage: Int] {
        return list.listTypeCount(filter: expired(_:))
    }

    private func expired(_ beverages: [Beverage]) -> [Beverage: Int] {
        var expiredList = [Beverage: Int]()

        beverages.forEach { (bev) in
            if let beverage = bev as? Beverage & Expirable,
               beverage.isExpired(compareTo: dateStandard) {
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
        return list.listTypeOnly(filter: hot(_:))
    }

    private func hot(_ stockList: [Beverage: Int]) -> [Beverage] {
        var beverageList = [Beverage]()

        stockList.forEach { (bev: Beverage, _: Int) in
            if let beverage = bev as? Beverage & Hotable,
               beverage.isHot(basedOn: temperatureStandard){
                beverageList.append(beverage)
            }
        }
        return beverageList
    }
    
    func transportables(from list: Beverages) -> [Beverage] {
        return list.listTypeOnly(filter: transportable(_:))
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
        return list.listTypeOnly(filter: healthy(_:))
    }

    private func healthy(_ stockList: [Beverage: Int]) -> [Beverage] {
        var beverageList = [Beverage]()

        stockList.forEach { (bev: Beverage, _: Int) in
            if let beverage = bev as? Beverage & SugarFreeable & LactoFreeable,
               beverage.isSugarFree(basedOn: sugarStandard),
               beverage.isLactoFree(basedOn: lactoStandard) {
                beverageList.append(beverage)
            }
        }
        return beverageList
    }
}
