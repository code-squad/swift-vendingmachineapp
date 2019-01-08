//
//  Pack.swift
//  VendingMachine
//
//  Created by 윤지영 on 17/12/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

class Pack: NSObject {
    private var beverages: [Beverage]
    private(set) var title: String

    init(beverages: [Beverage]) {
        self.beverages = beverages
        if let one = beverages.first {
            self.title = one.title
            return
        }
        self.title = ""
    }

    var identifier: ObjectIdentifier? {
        guard let one = beverages.first else { return nil }
        return ObjectIdentifier(type(of: one))
    }

    func add(beverage: Beverage) {
        beverages.append(beverage)
        guard title.isEmpty else { return }
        title = beverage.title
    }

    func isBuyable(with money: Int) -> Bool {
        guard let one = beverages.first else { return false }
        return one.isBuyable(for: money)
    }

    func removeOne() -> Beverage? {
        if beverages.isEmpty { return nil }
        return beverages.removeFirst()
    }

    var count: Int {
        return beverages.count
    }

    override var description: String {
        guard let one = beverages.first else { return "" }
        return one.description
    }

    func isEmpty() -> Bool {
        return beverages.isEmpty
    }

    func hasHotBeverage() -> Bool {
        for beverage in beverages {
            guard let coffee = beverage as? Coffee else { continue }
            if coffee.isHot() { return true }
        }
        return false
    }

    func removeExpiredBeverages() -> [Beverage] {
        var expiredBeverages: [Beverage] = []
        for (index, beverage) in beverages.enumerated() {
            guard let milk = beverage as? Milk else { continue }
            if milk.validate(when: Date()) { continue }
            beverages.remove(at: index)
            expiredBeverages.append(milk)
        }
        return expiredBeverages
    }

    /* MARK: NSSecureCoding */
    required init?(coder aDecoder: NSCoder) {
        guard let beverages = aDecoder
            .decodeObject(forKey: Keys.beverages.rawValue) as? [Beverage] else { return nil }
        guard let title = aDecoder
            .decodeObject(of: NSString.self, forKey: Keys.title.rawValue) else { return nil }
        self.beverages = beverages
        self.title = title as String
    }

}

extension Pack: NSSecureCoding {

    enum Keys: String {
        case beverages = "beverages"
        case title = "title"
    }

    static var supportsSecureCoding: Bool {
        return true
    }

    func encode(with aCoder: NSCoder) {
        aCoder.encode(beverages, forKey: Keys.beverages.rawValue)
        aCoder.encode(title as NSString, forKey: Keys.title.rawValue)
    }

}
