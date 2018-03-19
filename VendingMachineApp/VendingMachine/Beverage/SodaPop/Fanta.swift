//
//  Fanta.swift
//  VendingMachine
//
//  Created by jack on 2018. 1. 16..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class Fanta: SodaPop {
    private var kind: String = "환타"

    init(_ brand: String, _ name: String, _ volume: Int, _ price: Int, _ manufacturedDate: Date, lowCalorie: Bool) {
        super.init(brand: brand, name: name, volume: volume, price: price,
                   manufacturedDate: manufacturedDate, lowCalorie: lowCalorie)
    }
    init() {
        let form = DateFormatter()
        form.dateFormat = "yyyyMMdd"
        super.init(brand: "환타", name: "환타오렌지", volume: 350, price: 2000,
                   manufacturedDate: form.date(from: "20170109") ?? Date(), lowCalorie: false)
    }
    
    override func encode(with aCoder: NSCoder) {
        aCoder.encode(self.kind, forKey: "kind")
        super.encode(with: aCoder)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        guard let kind = aDecoder.decodeObject(forKey: "kind") as? String else {
            return
        }
        self.kind = kind
    }
    
    override var description: String {
        return "\(self.kind)"
    }
}
