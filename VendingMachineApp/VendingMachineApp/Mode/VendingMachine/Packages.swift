//
//  Packages.swift
//  VendingMachine
//
//  Created by Elena on 02/04/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class Packages: NSObject , Codable{

    private var beverage: [Beverage]
    private(set) var title: String

    init(beverages: [Beverage]) {
        self.beverage = beverages
        self.title = ""
    }
    
    var pickID: KeyId? {
        guard let pick = beverage.first else { return nil }
        return KeyId(type(of: pick))
    }

    func add(beverage: Beverage) {
        self.beverage.append(beverage)
        title = beverage.title
    }

    var count: Int {
        return beverage.count
    }

    override var description: String {
        guard let goods = beverage.first else { return "" }
        return goods.description
    }

    func isEmpty() -> Bool {
        return beverage.isEmpty
    }

    func isBuyable(with money: Money) -> Bool {
        guard let one = beverage.first else { return false }
        return one.canBuy(money: money)
    }

    func isHotBeverage() -> Bool {
        for anyThing in beverage {
            guard let coffee = anyThing as? Coffee else { continue }
            if coffee.isHot() { return true }
        }
        return false
    }

    func goBadBeverages() -> [Beverage] {
        var badBeverages: [Beverage] = []
        for goods in beverage {
            if goods.isEqualExpirationDate() { continue }
            beverage.removeFirst()
            badBeverages.append(goods)
        }
        return badBeverages
    }

    func removeOne() -> Beverage? {
        if beverage.isEmpty { return nil }
        return beverage.removeFirst()
    }

    // MARK: - Codable
    enum PackagesCodingKeys : String, CodingKey{
        case beverages
        case title
    }
    
    init(form decoder: Decoder) throws {
        let value = try decoder.container(keyedBy: PackagesCodingKeys.self)
        beverage = try value.decode([Beverage].self, forKey: .beverages)
        title = try value.decode(String.self, forKey: .title)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: PackagesCodingKeys.self)
        try container.encode(beverage, forKey: .beverages)
        try container.encode(title, forKey: .title)
    }
}

