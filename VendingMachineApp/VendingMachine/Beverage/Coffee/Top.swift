//
//  Top.swift
//  VendingMachine
//
//  Created by jack on 2018. 1. 16..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class TOPCoffee: Coffee {
    private var kind: String = "TOP커피"

    init(_ brand: String, _ name: String, _ volume: Int, _ price: Int, _ manufacturedDate: Date, hot: Bool) {
        super.init(brand: brand, name: name, volume: volume, price: price,
                   manufacturedDate: manufacturedDate, hot: hot)
    }

    init() {
        let form = DateFormatter()
        form.dateFormat = "yyyyMMdd"
        super.init(brand: "맥심", name: "TOP아메리카노", volume: 400, price: 3000,
                   manufacturedDate: form.date(from: "20170117") ?? Date(), hot: false)
    }

    override var description: String {
        return "\(self.kind)(\(String(describing: TOPCoffee.self))) - \(super.description)"
    }
}
