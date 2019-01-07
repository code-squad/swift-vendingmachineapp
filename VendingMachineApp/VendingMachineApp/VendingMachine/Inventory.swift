//
//  Inventory.swift
//  VendingMachine
//
//  Created by 윤지영 on 14/12/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

class Inventory: Codable {
    private var list: [ObjectIdentifier: Pack]

    init(list: [ObjectIdentifier: Pack]) {
        self.list = list
    }

    enum CodingKeys: String, CodingKey {
        case packs
    }

    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        let packs = try values.decode([Pack].self, forKey: .packs) as [Pack]
        var listDecoded = [ObjectIdentifier: Pack]()
        for pack in packs {
            guard let identifier = pack.identifier else { continue }
            listDecoded[identifier] = pack
        }
        list = listDecoded
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(packs, forKey: .packs)
    }

    var packs: [Pack] {
        return list.values.map { $0 }
    }

    func hasNoBeverage(of beverage: Beverage.Type) -> Bool {
        let beverageType = ObjectIdentifier(beverage)
        return list.contains(where: { $0.key == beverageType && $0.value.isEmpty() })
    }

    func packOf(type beverage: Beverage.Type) -> Pack? {
        let beverageType = ObjectIdentifier(beverage)
        guard let pack = list[beverageType] else { return nil }
        return pack
    }

    func add(beverage: Beverage) {
        let beverageType = ObjectIdentifier(type(of: beverage))
        if let pack = list[beverageType] {
            pack.add(beverage: beverage)
            return
        }
        list[beverageType] = Pack(beverages: [beverage])
    }

    func getListOfAll() -> [Pack: Int] {
        var listOfAll: [Pack: Int] = [:]
        for pack in list.values {
            if pack.isEmpty() { continue }
            listOfAll[pack] = pack.count
        }
        return listOfAll
    }

    func getListBuyable(with money: Money) -> [Pack] {
        return list.values.filter { money.isEnoughToBuy(pack: $0) }
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
        return list[identifier]?.removeOne()
    }

    func isEmpty() -> Bool {
        for item in list {
            guard item.value.isEmpty() else { return false }
        }
        return true
    }

}
