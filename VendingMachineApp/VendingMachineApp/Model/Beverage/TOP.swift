//
//  TOP.swift
//  VendingMachineApp
//
//  Created by 신한섭 on 2020/02/25.
//  Copyright © 2020 신한섭. All rights reserved.
//

import Foundation

class TOP: Coffee {
    enum BeanOrigin: String {
        case Colombia = "Colombia"
        case Congo = "Congo"
        case Cuba = "Cuba"
        case Ethiopia = "Ethiopia"
    }
    
    private var beanOrigin: BeanOrigin
    
    init(brand: Brand, capacity: Capacity, price: Price, name: Name, manufacturingDate: Date, expirationDate: Date, calorie: Calorie, temperature: Temperature, decaffeinated: Bool, beanOrigin: BeanOrigin) {
        self.beanOrigin = beanOrigin
        super.init(brand: brand, capacity: capacity, price: price, name: name, manufacturingDate: manufacturingDate, calorie: calorie, temperature: temperature, decaffeinated: decaffeinated)
    }
    
    func isSameBeanOrigin(as beanOrigin : BeanOrigin) -> Bool {
        return self.beanOrigin == beanOrigin
    }
}
