//
//  VendingMachine.swift
//  VendingMachineApp
//
//  Created by Cory Kim on 2020/02/20.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import Foundation

class VendingMachine {
    
    init() {
        
    }
    
    func informationOf(beverage: Beverage) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ko_KR")
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return "\(beverage.description), \(dateFormatter.string(from: beverage.dateOfManufacture))"
    }
}
