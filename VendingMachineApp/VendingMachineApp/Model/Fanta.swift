//
//  Fanta.swift
//  VendingMachine
//
//  Created by TaeHyeonLee on 2017. 12. 8..
//  Copyright © 2017 ChocOZerO. All rights reserved.
//

import Foundation

class Fanta: Soda {
    private let taste: String = "환타"

    override init(brand: String, weight: Int, price: Int, name: String, dateOfManufacture: Date, lowCalorie: Bool) {
        super.init(brand: brand, weight: weight, price: price, name: name,
                   dateOfManufacture: dateOfManufacture, lowCalorie: lowCalorie)
    }

    override var description: String {
        return "\(taste)(\(String(describing: Fanta.self))) - " + super.description
    }

}
