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
