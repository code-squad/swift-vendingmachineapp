//
//  Inventory.swift
//  VendingMachine
//
//  Created by Elena on 02/04/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class Inventory {

    private var list: [ObjectIdentifier: Packages]

    init(list: [ObjectIdentifier: Packages]) {
        self.list = list
    }

    func add(beverage: Beverage) {
        let beverageType = ObjectIdentifier(type(of: beverage))
        if let package = list[beverageType] {
            package.add(beverage: beverage)
            return
        }
        list[beverageType] = Packages(beverages: [beverage])
    }

    func getListOfAll() -> [Packages: Int] {
        var listOfAll: [Packages: Int] = [:]
        for pack in list.values {
            if pack.isEmpty() { continue }
            listOfAll[pack] = pack.count
        }
        return listOfAll
    }

    func buyAvailableList(money: Money) -> [Packages] {
        return list.values.filter { $0.isBuyable(with: money) }
    }

    func buyAvailableHotBeverages() -> [Packages] {
        return list.values.filter { $0.isHotBeverage() }
    }

    func removeGoBadBeverages() -> [Beverage] {
        var goBadGoods: [Beverage] = []
        for goods in list.values {
            goods.goBadBeverages().forEach { goBadGoods.append($0) }
        }
        return goBadGoods
    }

    private func findObjectIdentifier(package: Packages) -> ObjectIdentifier? {
        for pack in list where pack.value == package {
            return pack.key
        }
        return nil
    }

    func find(type: Beverage.Type) -> Packages? {
        let beverageType = ObjectIdentifier(type)
        guard let package = list[beverageType] else { return nil }
        return package
    }

    func haveNot(beverage: Beverage.Type) -> Bool {
        let beverageType = ObjectIdentifier(beverage)
        return list.contains(where: { $0.key == beverageType && $0.value.isEmpty() })
    }

    func remove(beverage: Packages) -> Beverage? {
        guard let removeId = findObjectIdentifier(package: beverage) else { return nil }
        return list[removeId]?.removeOne()
    }

    func isEmpty() -> Bool {
        for item in list {
            guard item.value.isEmpty() else { return false }
        }
        return true
    }

}
