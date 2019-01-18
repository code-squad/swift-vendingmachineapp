//
//  Inventory.swift
//  VendingMachine
//
//  Created by 윤지영 on 14/12/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

class Inventory: NSObject {
    private var list: [ObjectIdentifier: Pack]

    init(list: [ObjectIdentifier: Pack]) {
        self.list = list
    }

    func packOf(type beverage: Beverage.Type) -> Pack? {
        let beverageType = ObjectIdentifier(beverage)
        guard let pack = list[beverageType] else { return nil }
        return pack
    }

    func willAppear() {
        postNotificationOfDataChanged()
    }

    private func postNotificationOfDataChanged(userInfo: [AnyHashable: Any]? = nil) {
        NotificationCenter.default.post(name: .inventoryDataChanged, object: self, userInfo: userInfo)
    }

    func postChange(of beverage: BeverageSubCategory) {
        let userInfo = [Notification.InfoKey.beverageQuantityChanged: beverage]
        postNotificationOfDataChanged(userInfo: userInfo)
    }

    func add(beverage: Beverage) {
        let beverageType = ObjectIdentifier(type(of: beverage))
        if let pack = list[beverageType] {
            pack.add(beverage: beverage)
        } else {
            list[beverageType] = Pack(beverages: [beverage])
        }
    }

    func getListOfHotBeverages() -> [Pack] {
        return list.values.filter { $0.hasHotBeverage() }
    }

    func removeExpiredBeverages() -> [Beverage] {
        var expiredBeverages: [Beverage] = []
        for pack in list.values {
            pack.removeExpiredBeverages().forEach { expiredBeverages.append($0) }
        }
        return expiredBeverages
    }

    private func findIdentifier(of pack: Pack) -> ObjectIdentifier? {
        for item in list where item.value == pack {
            return item.key
        }
        return nil
    }

    func remove(selected pack: Pack) -> Beverage? {
        guard let identifier = findIdentifier(of: pack) else { return nil }
        guard let removed = list[identifier]?.removeOne() else { return nil }
        return removed
    }

    func isEmpty() -> Bool {
        for item in list {
            guard item.value.isEmpty() else { return false }
        }
        return true
    }

    /* MARK: NSSecureCoding*/
    private struct Default {
        static let packs = [Pack]()
    }

    required init?(coder aDecoder: NSCoder) {
        let packs = aDecoder.decodeObject(forKey: Keys.packs) as? [Pack] ?? Default.packs
        var list = [ObjectIdentifier: Pack]()
        for pack in packs {
            guard let identifier = pack.identifier else { continue }
            list[identifier] = pack
        }
        self.list = list
    }

}

extension Inventory: NSSecureCoding {

    private enum Keys {
        static let packs = "packs"
    }

    static var supportsSecureCoding: Bool {
        return true
    }

    func encode(with aCoder: NSCoder) {
        let packs = list.values.map { $0 }
        aCoder.encode(packs, forKey: Keys.packs)
    }

}

extension Notification.Name {
    static let inventoryDataChanged = Notification.Name("inventoryDataChanged")
}

extension Notification.InfoKey {
    static let beverageQuantityChanged = "beverageQuantityChanged"
}
