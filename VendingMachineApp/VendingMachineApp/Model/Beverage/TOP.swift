//
//  TOP.swift
//  VendingMachineApp
//
//  Created by 신한섭 on 2020/02/25.
//  Copyright © 2020 신한섭. All rights reserved.
//

import Foundation

class TOP: Coffee {
    enum BeanOrigin: String, CaseIterable, CustomStringConvertible {
        case Colombia = "Colombia"
        case Congo = "Congo"
        case Cuba = "Cuba"
        case Ethiopia = "Ethiopia"
        
        init() {
            self = BeanOrigin.allCases[Int.random(in: 0..<BeanOrigin.allCases.count)]
        }
        
        var description: String {
            return self.rawValue
        }
    }
    
    private var beanOrigin: BeanOrigin
    
    init(brand: String, capacity: Int, price: Price, name: String, manufacturingDate: Date, calorie: Double, temperature: Temperature, decaffeinated: Bool, beanOrigin: BeanOrigin) {
        self.beanOrigin = beanOrigin
        super.init(brand: brand, capacity: capacity, price: price, name: name, manufacturingDate: manufacturingDate, calorie: calorie, temperature: temperature, decaffeinated: decaffeinated)
    }
 
    override func encode(with coder: NSCoder) {
        coder.encode("\(beanOrigin)", forKey: Property.beanOrigin)
        super.encode(with: coder)
    }
    
    required init?(coder decoder: NSCoder) {
        let material = decoder.decodeObject(forKey: Property.beanOrigin) as? String ?? "Colombia"
        self.beanOrigin = BeanOrigin.init(rawValue: material) ?? BeanOrigin.Colombia
        super.init(coder: decoder)
    }
    
    func isSameBeanOrigin(as beanOrigin : BeanOrigin) -> Bool {
        return self.beanOrigin == beanOrigin
    }
}
