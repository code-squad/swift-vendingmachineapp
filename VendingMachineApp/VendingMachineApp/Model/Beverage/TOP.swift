//
//  TOP.swift
//  VendingMachineApp
//
//  Created by 신한섭 on 2020/02/25.
//  Copyright © 2020 신한섭. All rights reserved.
//

import Foundation

class TOP: Coffee {
    enum BeanOrigin: String, CaseIterable {
        case Colombia = "Colombia"
        case Congo = "Congo"
        case Cuba = "Cuba"
        case Ethiopia = "Ethiopia"
        
        init() {
            self = BeanOrigin.allCases[Int.random(in: 0..<BeanOrigin.allCases.count)]
        }
    }
    
    private var beanOrigin: BeanOrigin
    
    init(brand: String, capacity: Int, price: Price, name: String, manufacturingDate: Date, calorie: Double, temperature: Temperature, decaffeinated: Bool, beanOrigin: BeanOrigin) {
        self.beanOrigin = beanOrigin
        super.init(brand: brand, capacity: capacity, price: price, name: name, manufacturingDate: manufacturingDate, calorie: calorie, temperature: temperature, decaffeinated: decaffeinated)
    }
    
    enum Property: String, CustomStringConvertible {
        case beanOrigin
        
        var description: String {
            return self.rawValue
        }
    }
    
    override func encode(with coder: NSCoder) {
        coder.encode(beanOrigin, forKey: "\(Property.beanOrigin)")
    }
    
    required init?(coder decoder: NSCoder) {
        self.beanOrigin = decoder.decodeObject(forKey: "\(Property.beanOrigin)") as! BeanOrigin
        super.init(coder: decoder)
    }
    
    func isSameBeanOrigin(as beanOrigin : BeanOrigin) -> Bool {
        return self.beanOrigin == beanOrigin
    }
}
