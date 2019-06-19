//
//  Inventory.swift
//  VendingMachine
//
//  Created by Elena on 02/04/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class Inventory: Codable {

    private var list: [KeyId: Packages]

    init(list: [KeyId: Packages]) {
        self.list = list
    }

    func add(beverage: Beverage) {
        let beverageType = KeyId(type(of: beverage))
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

    private func findObjectIdentifier(package: Packages) -> KeyId? {
        for pack in list where pack.value == package {
            return pack.key
        }
        return nil
    }

    func find(type: Beverage.Type) -> Packages? {
        let beverageType = KeyId(type)
        guard let package = list[beverageType] else { return nil }
        return package
    }

    func haveNot(beverage: Beverage.Type) -> Bool {
        let beverageType = KeyId(beverage)
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
    
    // MARK: - Codable
    enum InventoryCodingKey: String, CodingKey{
        case list
    }
    
    init(form decoder: Decoder) throws {
        let value = try decoder.container(keyedBy: InventoryCodingKey.self)

        list = try value.decode([KeyId: Packages].self, forKey: .list)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: InventoryCodingKey.self)
        try container.encode(list, forKey: .list)
    }
    
}
// MARK: - Class KeyId : ObjectIdentifier가 Hashable, Codable을 따르기 위해
class KeyId: Hashable, Codable {
    
    let string: String
    
    init(_ x: Any){
        self.string = "\(x)"
    }
    
    
    static func == (lhs: KeyId, rhs: KeyId) -> Bool {
        return lhs.string == rhs.string
    }
    
    func hash(into hasher: inout Hasher){
        hasher.combine(self.string)
    }
    
    //MARK: - Codable
    required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        string = try container.decode(String.self)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(string)
    }
}

