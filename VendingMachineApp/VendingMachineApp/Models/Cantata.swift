//
//  Cantata.swift
//  VendingMachineApp
//
//  Created by Ador on 2021/02/24.
//

import Foundation

class Cantata: Coffee {
    enum Flavor: String {
        case sweetAmericano = "sweetAmericano"
        case latte = "latte"
        case mocha = "mocha"
    }
    
    private let flavor: Flavor
    
    init(manufacturer: String, volume: Int, name: String, manufacturedAt: Date, price: Int, caffeineContent: Int, temperature: Int, calorie: Int, flavor: Flavor, expiredAt: Date) {
        self.flavor = flavor
        super.init(manufacturer: manufacturer, volume: volume, name: name, manufacturedAt: manufacturedAt, price: price, caffeineContent: caffeineContent, temperature: temperature, calorie: calorie, expiredAt: expiredAt)
    }
    
    required init?(coder: NSCoder) {
        self.flavor = Flavor(rawValue: coder.decodeObject(forKey: "flavor") as! String)!
        super.init(coder: coder)
    }
    
    override func encode(with coder: NSCoder) {
        coder.encode(flavor.rawValue, forKey: "flavor")
        super.encode(with: coder)
    }
}
