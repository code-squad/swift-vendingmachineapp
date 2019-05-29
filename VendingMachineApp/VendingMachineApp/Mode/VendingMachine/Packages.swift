//
//  Packages.swift
//  VendingMachine
//
//  Created by Elena on 02/04/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class Packages: NSObject {

    private var beverage: [Beverage]
    private(set) var title: String

    init(beverages: [Beverage]) {
        self.beverage = beverages
        self.title = ""
    }
    
    var pickID: ObjectIdentifier? {
        guard let pick = beverage.first else { return nil }
        return ObjectIdentifier(type(of: pick))
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

    // MARK: - NSCoding
    required init?(coder aDecoder: NSCoder) {
        let beverage = aDecoder
            .decodeObject(forKey: "beverage") as? [Beverage] ?? [Beverage]()
        let title = aDecoder
            .decodeObject(of: NSString.self, forKey: "title") ?? ""
        self.beverage = beverage
        self.title = title as String
    }
}

extension Packages: NSCoding {
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(beverage, forKey: "beverage")
        aCoder.encode(title as NSString, forKey: "title")
    }
    
}
