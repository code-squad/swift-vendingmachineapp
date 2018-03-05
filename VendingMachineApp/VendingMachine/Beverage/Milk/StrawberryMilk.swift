//
//  StrawberryMilk.swift
//  VendingMachine
//
//  Created by jack on 2018. 1. 16..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class StrawberryMilk: Milk {
    private var kind: String = "딸기우유"
    
    init(_ brand: String, _ name: String, _ volume: Int, _ price: Int, _ manufacturedDate: Date) {
        super.init(brand: brand, name: name, volume: volume, price: price, manufacturedDate: manufacturedDate)
    }

    init() {
        let form = DateFormatter()
        form.dateFormat = "yyyyMMdd"
        super.init(brand: "서울우유", name: "날마다딸기우유", volume: 200, price: 1000,
                   manufacturedDate: form.date(from: "20180117") ?? Date())
    }

    override var description: String {
        return "\(self.kind)(\(String(describing: StrawberryMilk.self))) - \(super.description)"
    }

}
