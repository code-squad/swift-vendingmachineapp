//
//  Coke.swift
//  VendingMachineApp
//
//  Created by 박정하 on 2021/03/04.
//

import Foundation

class Coke : Soda{
    private let product : Product
    
    enum Product {
        case light, zero
    }
    
    init(product : Product, sugarContent: Int, brand: String, volume: Int, price: Int, name: String, manufactured: Date, temperature: Int, kcal: Int) {
        self.product = product
        super.init(sugarContent: sugarContent, brand: brand, volume: volume, price: price, name: name, manufactured: manufactured, temperature: temperature, kcal: kcal)
    }
    
    required convenience init(manufactured: Date) {
        self.init(product: .zero, sugarContent: 0, brand: "코카콜라", volume: 180, price: 3100, name: "코카콜라제로", manufactured: manufactured, temperature: 1, kcal: 210)
    }
    
    required init?(coder: NSCoder) {
        //self.product = coder.decodeObject(forKey: "product") as? Product ?? .light
        self.product = .light
        super.init(coder: coder)
    }
    
    override func encode(with coder: NSCoder) {
        //coder.encode(self.product, forKey: "product")
        super.encode(with: coder)
    }
    
}
