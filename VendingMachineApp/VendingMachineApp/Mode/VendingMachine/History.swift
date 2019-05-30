//
//  History.swift
//  VendingMachine
//
//  Created by Elena on 02/04/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

//이력, 내역
class History: NSObject {
    private var purchases: [Beverage]

    init(purchases: [Beverage]) {
        self.purchases = purchases
    }

    convenience override init() {
        self.init(purchases: [])
    }

    func add(purchase beverage: Beverage) {
        purchases.append(beverage)
    }
    
    static func == (lhs: History, rhs: History) -> Bool {
        return lhs.purchases == rhs.purchases
    }
    
    // MARK: - NSCoding
    required init?(coder aDecoder: NSCoder) {
        let purchases = aDecoder
            .decodeObject(forKey: "purchases") as? [Beverage] ?? [Beverage]()
        self.purchases = purchases
    }
    
}

extension History: NSCoding {
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(purchases, forKey: "purchases")
    }
    
}
