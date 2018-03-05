//
//  ChocolateMilk.swift
//  VendingMachine
//
//  Created by jack on 2018. 1. 16..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class ChocolateMilk: Milk {
    private var kind: String = "초코우유"

    init(_ brand: String, _ name: String, _ volume: Int, _ price: Int, _ manufacturedDate: Date) {
        super.init(brand: brand, name: name, volume: volume, price: price, manufacturedDate: manufacturedDate)
    }

    override var description: String {
        return "\(self.kind)(\(String(describing: ChocolateMilk.self))) - \(super.description)"
    }
}
