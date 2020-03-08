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
        
        init(index: Int) {
            self = BeanOrigin.allCases[index]
        }
    }
    
    private var beanOrigin: BeanOrigin
    
    init(brand: String, capacity: Double, price: Price, name: String, manufacturingDate: Date, calorie: Double, temperature: Temperature, beverageIndex: VendingMachine.BeverageNumbers, decaffeinated: Bool, beanOrigin: BeanOrigin) {
        self.beanOrigin = beanOrigin
        super.init(brand: brand, capacity: capacity, price: price, name: name, manufacturingDate: manufacturingDate, calorie: calorie, temperature: temperature, beverageIndex: beverageIndex, decaffeinated: decaffeinated)
    }
    
    func isSameBeanOrigin(as beanOrigin : BeanOrigin) -> Bool {
        return self.beanOrigin == beanOrigin
    }
}
