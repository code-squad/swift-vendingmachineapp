//
//  Fanta.swift
//  VendingMachineApp
//
//  Created by TTOzzi on 2020/02/24.
//  Copyright © 2020 TTOzzi. All rights reserved.
//

import Foundation

class Fanta: Soda {
    private let flavor: String
    
    init(brand: String, amount: Int, price: Money, name: String, calorie: Double, saleablePeriod: Int, sugarContent: Double, flavor: String) {
        self.flavor = flavor
        super.init(brand: brand, amount: amount, price: price, name: name, calorie: calorie, saleablePeriod: saleablePeriod, sugarContent: sugarContent)
    }
    
    // MARK: - NSCoding
    
    required init?(coder: NSCoder) {
        guard let flavor = coder.decodeObject(forKey: "flavor") as? String else { return nil }
        self.flavor = flavor
        super.init(coder: coder)
    }
    
    override func encode(with coder: NSCoder) {
        super.encode(with: coder)
        coder.encode(flavor, forKey: "flavor")
    }
}
