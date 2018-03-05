//
//  Georgia.swift
//  VendingMachine
//
//  Created by jack on 2018. 1. 16..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class Georgia: Coffee {
    private var kind: String = "지오지아커피"

    init(_ brand: String, _ name: String, _ volume: Int, _ price: Int, _ manufacturedDate: Date, hot: Bool) {
        super.init(brand: brand, name: name, volume: volume, price: price,
                   manufacturedDate: manufacturedDate, hot: hot)
    }

    init() {
        let form = DateFormatter()
        form.dateFormat = "yyyyMMdd"
        super.init(brand: "맥심", name: "조지아카페모카", volume: 450, price: 3500,
                   manufacturedDate: form.date(from: "20170119") ?? Date(), hot: true)
    }

    override var description: String {
        return "\(self.kind)(\(String(describing: Georgia.self)) - \(super.description)"
    }
}
