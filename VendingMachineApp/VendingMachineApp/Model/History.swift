//
//  History.swift
//  VendingMachine
//
//  Created by 이동건 on 19/10/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

class History: CustomStringConvertible {
    typealias PurchaseHistory = (beverage: Beverage, date: Date)
    
    private var list: [PurchaseHistory] = []
    var description: String {
        var result = ""
        list.forEach {
            result += "상품 : \($0.beverage) / 구매날짜: \($0.date.readable)\n"
        }
        return result
    }
    var isEmpty: Bool {
        return list.isEmpty
    }
    
    func hasHistory(of beverage: Beverage) -> Bool {
        return list.contains(where: {$0.beverage.isEqual(to: beverage)})
    }
    
    func append(_ history: Beverage) {
        list.append((history, Date()))
    }
}
