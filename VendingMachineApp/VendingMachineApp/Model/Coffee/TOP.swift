//
//  TOP.swift
//  VendingMachineApp
//
//  Created by 양준혁 on 2021/02/24.
//

import Foundation

class TOP: Coffee{
    enum Flavor: String {
        case americano = "americano"
        case latte = "latte"
        case espresso = "espresso"
    }
    
    private var flavor: Flavor
    
    init(brand: String, capacity: Int, price: Int, name: String, manufacturedAt: Date, expirationAt: Date, temperature: Double, caffeineContent: Double, flavor: Flavor) {
        self.flavor = flavor
        super.init(brand: brand, capacity: capacity, price: price, name: name, manufacturedAt: manufacturedAt, expirationAt: expirationAt, temperature: temperature, caffeineContent: caffeineContent)
    }
    convenience init() {
        self.init(brand: "동서식품", capacity: 380, price: 2000, name: "TOP", manufacturedAt: Date.input("20210222"), expirationAt: Date.input("20210301"), temperature: 65, caffeineContent: 94, flavor: TOP.Flavor.americano)
    }
    
    required init?(coder: NSCoder) {
        flavor = Flavor(rawValue: coder.decodeObject(forKey: "flavor") as! String)!
        super.init(coder: coder)
    }
    
    override func encode(with coder: NSCoder) {
        coder.encode(flavor.rawValue, forKey: "flavor")
        super.encode(with: coder)
    }
    
    func isEspresso() -> Bool {
        return self.flavor == Flavor.espresso
    }
}
