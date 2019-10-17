//
//  Coffee.swift
//  VendingMachine
//
//  Created by CHOMINJI on 12/08/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class Coffee: Beverage {
    private let bean: Bean
    
    init(brand: String, capacity: Int, price: Int, name: String, dateOfManufactured: Date, temperature: Int, shelfLife: Double, bean: Bean) {
        self.bean = bean
        
        super.init(brand: brand, capacity: capacity, price: price, name: name, dateOfManufactured: dateOfManufactured, temperature: temperature, shelfLife: shelfLife)
    }
    
    enum Bean {
        case robusta
        case arabica
        case liberica
    }
    
    enum Keys: String {
        case bean = "Bean"
    }
    
    override func encode(with coder: NSCoder) {
        coder.encode(bean, forKey: Keys.bean.rawValue)
        
        super.encode(with: coder)
    }
    
    required init?(coder: NSCoder) {
        self.bean = coder.decodeObject(forKey: Keys.bean.rawValue) as! Bean
        
        super.init(coder: coder)
    }
}
