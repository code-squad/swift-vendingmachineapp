//
//  PepciCoke.swift
//  VendingMachine
//
//  Created by jack on 2018. 1. 16..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class PepciCoke: SodaPop {
    private var kind: String = "팹시콜라"

    init(_ brand: String, _ name: String, _ volume: Int, _ price: Int, _ manufacturedDate: Date, lowCalorie: Bool) {
        super.init(brand: brand, name: name, volume: volume, price: price,
                   manufacturedDate: manufacturedDate, lowCalorie: lowCalorie)
    }
    init() {
        let form = DateFormatter()
        form.dateFormat = "yyyyMMdd"
        super.init(brand: "코카콜라", name: "다이어트콜라", volume: 350, price: 2000,
                   manufacturedDate: form.date(from: "20170110") ?? Date(), lowCalorie: true)
    }

    override var description: String {
        return "\(self.kind)(\(String(describing: PepciCoke.self))) - \(super.description)"
    }
}
