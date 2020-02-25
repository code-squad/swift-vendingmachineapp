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
    
    init(brand: String, capacity: Int, price: Int, name: String, manufacturingDate: Date, expirationDate: Date, calorie: Double, hot: Bool, decaffeinated: Bool, beanOrigin: BeanOrigin) {
        self.beanOrigin = beanOrigin
        super.init(brand: brand, capacity: capacity, price: price, name: name, manufacturingDate: manufacturingDate, expirationDate: expirationDate, calorie: calorie, hot: hot, decaffeinated: decaffeinated)
    }
    
    func isSameBeanOrigin(as beanOrigin : BeanOrigin) -> Bool {
        return self.beanOrigin == beanOrigin
    }
}
