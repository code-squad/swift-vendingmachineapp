//
//  PepciCoke.swift
//  VendingMachine
//
//  Created by TaeHyeonLee on 2017. 12. 8..
//  Copyright © 2017 ChocOZerO. All rights reserved.
//

import Foundation

class PepciCoke: Soda {
    private let taste: String = "펩시콜라"

    override init(brand: String, weight: Int, price: Int, name: String, dateOfManufacture: Date, lowCalorie: Bool) {
        super.init(brand: brand, weight: weight, price: price, name: name,
                   dateOfManufacture: dateOfManufacture, lowCalorie: lowCalorie)
    }

    override var description: String {
        return "\(taste)(\(String(describing: PepciCoke.self))) - " + super.description
    }

}
