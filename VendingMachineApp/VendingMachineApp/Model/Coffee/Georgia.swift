//
//  Georgia.swift
//  VendingMachineApp
//
//  Created by Lia on 2021/03/03.
//

import Foundation

class Georgia: Coffee {

    enum CoffeeType: String {
        case original = "original"
        case cafeLatte = "cafeLatte"
        case americano = "americano"
        case theBlend = "theBlend"
    }
    
    private let type: CoffeeType
    
    init(brand: String, volume: Int, price: Int, name: String, createdAt: Date, expiredAt: Date, caffeine: Int, type: CoffeeType) {
        self.type = type
        super.init(brand: brand, volume: volume, price: price, name: name, createdAt: createdAt, expiredAt: expiredAt, caffeine: caffeine)
    }
    
    required init() {
        type = .original
        super.init(brand: "코카콜라", volume: 240, price: 1000, name: "조지아", createdAt: date, expiredAt: date, caffeine: 136)
    }
    
    required init?(coder decoder: NSCoder) {
        type = CoffeeType(rawValue: decoder.decodeObject(forKey: "type") as! String) ?? .original
        super.init(coder: decoder)
    }
    
    override func encode(with coder: NSCoder) {
        coder.encode(type.rawValue, forKey: "type")
        super.encode(with: coder)
    }
    
    
    //MARK:- method
    
    func isNewType() -> Bool {
        return type != .original
    }
}
