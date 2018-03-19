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
