//
//  Organizer.swift
//  VendingMachineApp
//
//  Created by Song on 2021/02/26.
//

import Foundation

class BeverageManager: NSObject, FoodManagable, NSCoding {

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
    
    required init?(coder: NSCoder) {
        self.dateStandard = coder.decodeObject(forKey: "dateStandard") as! Date
        self.temperatureStandard = coder.decodeFloat(forKey: "temperatureStandard")
        self.sugarStandard = coder.decodeFloat(forKey: "sugarStandard")
        self.lactoStandard = coder.decodeFloat(forKey: "lactoStandard")
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(dateStandard, forKey: "dateStandard") //이 기준은 매일 업데이트 되어야 함
        coder.encode(temperatureStandard, forKey: "temperatureStandard")
        coder.encode(sugarStandard, forKey: "sugarStandard")
        coder.encode(lactoStandard, forKey: "lactoStandard")
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
