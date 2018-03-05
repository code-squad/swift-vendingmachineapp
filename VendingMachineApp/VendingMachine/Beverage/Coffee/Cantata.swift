//
//  Cantata.swift
//  VendingMachine
//
//  Created by jack on 2018. 1. 16..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class Cantata: Coffee {
    private var kind: String = "칸타타커피"

    init(_ brand: String, _ name: String, _ volume: Int, _ price: Int, _ manufacturedDate: Date, hot: Bool) {
        super.init(brand: brand, name: name, volume: volume, price: price,
                   manufacturedDate: manufacturedDate, hot: hot)
    }

    override var description: String {
        return "\(self.kind)(\(String(describing: Cantata.self)) - \(super.description)"
    }
}
